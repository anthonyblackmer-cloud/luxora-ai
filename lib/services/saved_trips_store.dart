import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/cloud_trips_sync_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/util/trip_date_format.dart';
import 'package:shared_preferences/shared_preferences.dart';
const _key = 'luxora_saved_trips_v1';
const _seededFlagKey = 'luxora_saved_trips_seeded_v1';

/// Persists the user's saved trips and exposes them as a [ValueListenable] so
/// the Trips screen reflects additions/removals immediately.
///
/// On first run it seeds the showcase trips from [savedTripSummaries]; after
/// that the list is fully user-controlled (trips can be created and deleted).
class SavedTripsStore {
  SavedTripsStore._();

  static final SavedTripsStore instance = SavedTripsStore._();

  final ValueNotifier<List<SavedTripSummary>> trips =
      ValueNotifier<List<SavedTripSummary>>(const []);
  bool _loaded = false;
  Future<void>? _loadFuture;

  Future<void> load() async {
    if (_loaded) return;
    _loadFuture ??= _loadOnce();
    await _loadFuture;
  }

  Future<void> _loadOnce() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) {
      final seeded = prefs.getBool(_seededFlagKey) ?? false;
      if (seeded) {
        trips.value = const [];
      } else {
        trips.value = _dedupe(List<SavedTripSummary>.from(savedTripSummaries));
        await _persist(prefs);
        await prefs.setBool(_seededFlagKey, true);
      }
    } else {
      final decoded = _decode(raw);
      final deduped = _dedupe(decoded);
      trips.value = deduped;
      if (deduped.length != decoded.length) {
        await _persist(prefs);
      }
    }
    _loaded = true;
  }

  /// Adds a trip unless an equivalent one is already saved.
  Future<void> add(SavedTripSummary trip) async {
    await upsert(trip);
  }

  /// Inserts or replaces a trip with the same [SavedTripSummary.dedupeKey].
  Future<void> upsert(SavedTripSummary trip) async {
    await load();
    final stamped = trip.copyWith(
      updatedAtMs: DateTime.now().millisecondsSinceEpoch,
    );
    final filtered = trips.value
        .where((t) => t.dedupeKey != stamped.dedupeKey && t.id != stamped.id)
        .toList();
    trips.value = [stamped, ...filtered];
    await _persist();
    unawaited(CloudTripsSyncService.instance.pushTripIfEnabled(stamped));
  }

  /// Saves or refreshes the onboarding trip card without creating duplicates.
  Future<void> upsertFromProfile(
    TripProfile profile, {
    String localeName = 'en',
    String flexibleDateLabel = 'Dates flexible',
  }) async {
    await upsert(
      SavedTripSummary.fromProfile(
        profile,
        localeName: localeName,
        flexibleDateLabel: flexibleDateLabel,
      ),
    );
  }

  /// Updates trip dates and keeps the active profile in sync when applicable.
  Future<void> updateTripDates(
    String tripId, {
    required String startIso,
    required String endIso,
    String localeName = 'en',
    String flexibleDateLabel = 'Dates flexible',
  }) async {
    await load();
    final index = trips.value.indexWhere((t) => t.id == tripId);
    if (index < 0) return;

    final existing = trips.value[index];
    final dateRange = TripDateFormat.displayRange(
      startIso: startIso,
      endIso: endIso,
      localeName: localeName,
      flexibleLabel: flexibleDateLabel,
    );

    TripProfile profilePatch(TripProfile base) => base.copyWith(
          startDate: startIso,
          endDate: endIso,
        );

    var profileForId = TripProfile(
      cityId: existing.cityId,
      destination: existing.title.replaceAll(RegExp(r'\s+Escape$'), ''),
      startDate: startIso,
      endDate: endIso,
    );
    final active = TripProfileStore.instance.profile.value;
    if (active != null && active.cityId == existing.cityId) {
      profileForId = profilePatch(active);
      await TripProfileStore.instance.save(profileForId);
    }

    final updated = existing.copyWith(
      startDate: startIso,
      endDate: endIso,
      dateRange: dateRange,
      id: existing.userCreated
          ? SavedTripSummary.idForProfile(profileForId)
          : existing.id,
      updatedAtMs: DateTime.now().millisecondsSinceEpoch,
    );

    final withoutOld = trips.value.where((t) => t.id != tripId).toList();
    final withoutDupes = withoutOld
        .where((t) => t.dedupeKey != updated.dedupeKey && t.id != updated.id)
        .toList();
    trips.value = [updated, ...withoutDupes];
    await _persist();
    unawaited(CloudTripsSyncService.instance.pushTripIfEnabled(updated));
  }

  /// Merges remote cloud trips into the local list (newer [updatedAtMs] wins).
  Future<void> mergeFromCloud(List<SavedTripSummary> remote) async {
    await load();
    if (remote.isEmpty) return;

    final showcase =
        trips.value.where((trip) => !trip.userCreated).toList();
    final localUser =
        trips.value.where((trip) => trip.userCreated).toList();
    final mergedByDedupe = <String, SavedTripSummary>{};

    for (final trip in [...localUser, ...remote]) {
      final existing = mergedByDedupe[trip.dedupeKey];
      if (existing == null || trip.updatedAtMs >= existing.updatedAtMs) {
        mergedByDedupe[trip.dedupeKey] = trip;
      }
    }

    trips.value = _dedupe([...showcase, ...mergedByDedupe.values]);
    await _persist();
  }

  Future<void> remove(String id) async {
    await load();
    trips.value = trips.value.where((t) => t.id != id).toList();
    await _persist();
    unawaited(CloudTripsSyncService.instance.deleteTripIfEnabled(id));
  }

  List<SavedTripSummary> _decode(String raw) {
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => SavedTripSummary.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return const [];
    }
  }

  static List<SavedTripSummary> _dedupe(List<SavedTripSummary> list) {
    final seen = <String>{};
    final out = <SavedTripSummary>[];
    for (final trip in list) {
      if (seen.add(trip.dedupeKey)) {
        out.add(trip);
      }
    }
    return out;
  }

  Future<void> _persist([SharedPreferences? prefsArg]) async {
    final prefs = prefsArg ?? await SharedPreferences.getInstance();
    final encoded = jsonEncode(trips.value.map((t) => t.toJson()).toList());
    await prefs.setString(_key, encoded);
  }
}
