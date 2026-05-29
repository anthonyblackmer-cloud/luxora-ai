import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:luxora_ai/data/saved_trips.dart';
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

  Future<void> load() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) {
      final seeded = prefs.getBool(_seededFlagKey) ?? false;
      if (seeded) {
        trips.value = const [];
      } else {
        trips.value = List<SavedTripSummary>.from(savedTripSummaries);
        await _persist(prefs);
        await prefs.setBool(_seededFlagKey, true);
      }
    } else {
      trips.value = _decode(raw);
    }
    _loaded = true;
  }

  Future<void> add(SavedTripSummary trip) async {
    await load();
    trips.value = [trip, ...trips.value];
    await _persist();
  }

  Future<void> remove(String id) async {
    await load();
    trips.value = trips.value.where((t) => t.id != id).toList();
    await _persist();
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

  Future<void> _persist([SharedPreferences? prefsArg]) async {
    final prefs = prefsArg ?? await SharedPreferences.getInstance();
    final encoded = jsonEncode(trips.value.map((t) => t.toJson()).toList());
    await prefs.setString(_key, encoded);
  }
}
