import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _key = 'luxora_home_base_place_id';

/// Persists the single place id the user has chosen as their trip "home base"
/// (typically a hotel). When set, route optimization departs from this place
/// instead of the generic Orlando hub.
///
/// Exposes a [ValueListenable] so the map and detail sheets update immediately.
class HomeBaseStore {
  HomeBaseStore._();

  static final HomeBaseStore instance = HomeBaseStore._();

  final ValueNotifier<String?> placeId = ValueNotifier<String?>(null);
  bool _loaded = false;

  Future<void> load() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    placeId.value = prefs.getString(_key);
    _loaded = true;
  }

  bool isHomeBase(String id) => placeId.value == id;

  /// Sets [id] as the home base, or clears it when [id] is already the base.
  /// Returns the new state (`true` = this id is now the home base).
  Future<bool> toggle(String id) async {
    await load();
    final nowSet = placeId.value != id;
    placeId.value = nowSet ? id : null;
    final prefs = await SharedPreferences.getInstance();
    if (nowSet) {
      await prefs.setString(_key, id);
    } else {
      await prefs.remove(_key);
    }
    return nowSet;
  }

  Future<void> clear() async {
    await load();
    placeId.value = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
