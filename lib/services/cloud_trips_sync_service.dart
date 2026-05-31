import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/services/cloud_trips_auth_service.dart';
import 'package:luxora_ai/services/cloud_trips_entitlement.dart';
import 'package:luxora_ai/services/saved_trips_store.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum CloudSyncStatus { idle, syncing, success, error }

/// Pull/push saved trips for signed-in premium users.
class CloudTripsSyncService extends ChangeNotifier {
  CloudTripsSyncService._();

  static final CloudTripsSyncService instance = CloudTripsSyncService._();

  CloudSyncStatus status = CloudSyncStatus.idle;
  DateTime? lastSyncedAt;
  String? lastError;

  bool get canSync =>
      CloudTripsEntitlement.canUseCloud &&
      CloudTripsAuthService.instance.isSignedIn;

  Future<void> syncAll() async {
    if (!canSync) return;

    status = CloudSyncStatus.syncing;
    lastError = null;
    notifyListeners();

    try {
      final client = Supabase.instance.client;
      final userId = client.auth.currentUser!.id;

      final rows = await client
          .from('user_saved_trips')
          .select('trip_id, dedupe_key, payload, updated_at')
          .eq('user_id', userId);

      final remoteTrips = _parseRemoteRows(rows as List<dynamic>);
      final remoteByTripId = {
        for (final trip in remoteTrips) trip.id: trip,
      };

      await SavedTripsStore.instance.mergeFromCloud(remoteTrips);

      final localUserTrips = SavedTripsStore.instance.trips.value
          .where((trip) => trip.userCreated)
          .toList();

      for (final trip in localUserTrips) {
        final remote = remoteByTripId[trip.id];
        if (remote == null || trip.updatedAtMs > remote.updatedAtMs) {
          await _upsertTrip(client, userId, trip);
        }
      }

      lastSyncedAt = DateTime.now();
      status = CloudSyncStatus.success;
      notifyListeners();
    } catch (e, st) {
      lastError = e.toString();
      status = CloudSyncStatus.error;
      if (kDebugMode) {
        debugPrint('CloudTripsSyncService: $e\n$st');
      }
      notifyListeners();
    }
  }

  Future<void> pushTripIfEnabled(SavedTripSummary trip) async {
    if (!canSync || !trip.userCreated) return;
    try {
      final client = Supabase.instance.client;
      final userId = client.auth.currentUser!.id;
      await _upsertTrip(client, userId, trip);
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('CloudTripsSyncService.push: $e\n$st');
      }
    }
  }

  Future<void> deleteTripIfEnabled(String tripId) async {
    if (!canSync) return;
    try {
      await Supabase.instance.client
          .from('user_saved_trips')
          .delete()
          .eq('trip_id', tripId);
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('CloudTripsSyncService.delete: $e\n$st');
      }
    }
  }

  List<SavedTripSummary> _parseRemoteRows(List<dynamic> rows) {
    final out = <SavedTripSummary>[];
    for (final row in rows) {
      final map = row as Map<String, dynamic>;
      final payload = map['payload'];
      if (payload is! Map<String, dynamic>) continue;
      final updatedAt = map['updated_at'] as String?;
      final updatedAtMs = updatedAt == null
          ? 0
          : DateTime.parse(updatedAt).millisecondsSinceEpoch;
      out.add(
        SavedTripSummary.fromJson(payload).copyWith(updatedAtMs: updatedAtMs),
      );
    }
    return out;
  }

  Future<void> _upsertTrip(
    SupabaseClient client,
    String userId,
    SavedTripSummary trip,
  ) async {
    await client.from('user_saved_trips').upsert(
      {
        'user_id': userId,
        'trip_id': trip.id,
        'dedupe_key': trip.dedupeKey,
        'payload': trip.toJson(),
        'updated_at':
            DateTime.fromMillisecondsSinceEpoch(trip.updatedAtMs).toUtc().toIso8601String(),
      },
      onConflict: 'user_id,trip_id',
    );
  }
}
