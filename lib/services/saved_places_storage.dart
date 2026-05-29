import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _key = 'luxora_saved_place_ids';

/// Persists the set of place ids the user has saved to their itinerary.
///
/// Exposes a [ValueListenable] so cards/sheets across the app can reflect the
/// saved state immediately without re-reading from disk.
class SavedPlacesStorage {
  SavedPlacesStorage._();

  static final SavedPlacesStorage instance = SavedPlacesStorage._();

  final ValueNotifier<Set<String>> savedIds = ValueNotifier<Set<String>>({});
  bool _loaded = false;

  Future<void> load() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    savedIds.value = prefs.getStringList(_key)?.toSet() ?? <String>{};
    _loaded = true;
  }

  bool isSaved(String placeId) => savedIds.value.contains(placeId);

  /// Toggles saved state and returns the new state (`true` = now saved).
  Future<bool> toggle(String placeId) async {
    await load();
    final next = Set<String>.from(savedIds.value);
    final nowSaved = !next.contains(placeId);
    if (nowSaved) {
      next.add(placeId);
    } else {
      next.remove(placeId);
    }
    savedIds.value = next;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, next.toList());
    return nowSaved;
  }
}
