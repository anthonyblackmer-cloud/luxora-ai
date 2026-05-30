import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _unlockedCitiesKey = 'luxora_unlocked_city_pack_ids';

/// Tracks one-time city pack unlocks — IAP will call [unlockCity] on purchase.
class CityPackEntitlementStore extends ChangeNotifier {
  CityPackEntitlementStore._();

  static final CityPackEntitlementStore instance =
      CityPackEntitlementStore._();

  final Set<String> _unlocked = {};
  bool _loaded = false;

  Set<String> get unlockedCityIds => Set.unmodifiable(_unlocked);

  bool isUnlocked(String cityId) => _unlocked.contains(cityId);

  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getStringList(_unlockedCitiesKey);
      if (stored != null) {
        _unlocked.addAll(stored);
      }
    } catch (_) {
      // Unit tests / web without plugin — keep empty set.
    }
  }

  Future<void> unlockCity(String cityId) async {
    if (_unlocked.contains(cityId)) return;
    _unlocked.add(cityId);
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_unlockedCitiesKey, _unlocked.toList());
    } catch (_) {}
  }

  /// Dev / preview reset — not exposed in UI.
  @visibleForTesting
  Future<void> clearAll() async {
    _unlocked.clear();
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_unlockedCitiesKey);
    } catch (_) {}
  }
}
