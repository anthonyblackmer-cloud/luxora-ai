import 'package:flutter/foundation.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/trip_profile_storage.dart';

/// In-memory, listenable cache of the active [TripProfile] so synchronous UI
/// (e.g. the map's mood-based suggestions) can react to onboarding changes
/// without re-reading SharedPreferences on every build.
class TripProfileStore {
  TripProfileStore._();

  static final TripProfileStore instance = TripProfileStore._();

  final ValueNotifier<TripProfile?> profile = ValueNotifier<TripProfile?>(null);
  final TripProfileStorage _storage = TripProfileStorage();

  Future<void> load() async {
    profile.value = await _storage.load();
  }

  /// Persists and broadcasts an updated profile.
  Future<void> save(TripProfile next) async {
    await _storage.save(next);
    profile.value = next;
  }
}
