import 'package:flutter/foundation.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _unlockedCitiesKey = 'luxora_unlocked_city_pack_ids';
const _unlockedAddonsKey = 'luxora_unlocked_orlando_addon_ids';

/// Tracks one-time city pack unlocks — IAP will call [unlockCity] on purchase.
class CityPackEntitlementStore extends ChangeNotifier {
  CityPackEntitlementStore._();

  static final CityPackEntitlementStore instance =
      CityPackEntitlementStore._();

  final Set<String> _unlocked = {};
  final Set<String> _unlockedAddons = {};
  bool _loaded = false;

  Set<String> get unlockedCityIds => Set.unmodifiable(_unlocked);
  Set<String> get unlockedAddonIds => Set.unmodifiable(_unlockedAddons);

  bool isUnlocked(String cityId) => _unlocked.contains(cityId);

  bool isAddonUnlocked(String addonId) {
    if (_unlockedAddons.contains(OrlandoAddonCatalog.themeParks)) {
      return true;
    }
    if (OrlandoAddonCatalog.isThemeParksAddon(addonId)) {
      return _hasLegacyThemeParkUnlock();
    }
    return _unlockedAddons.contains(addonId);
  }

  bool _hasLegacyThemeParkUnlock() =>
      _unlockedAddons.contains(OrlandoAddonCatalog.legacyDisneyWorld) ||
      _unlockedAddons.contains(OrlandoAddonCatalog.legacyUniversalOrlando);

  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getStringList(_unlockedCitiesKey);
      if (stored != null) {
        _unlocked.addAll(stored);
      }
      final storedAddons = prefs.getStringList(_unlockedAddonsKey);
      if (storedAddons != null) {
        _unlockedAddons.addAll(storedAddons);
        _migrateLegacyThemeParkAddons();
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

  Future<void> unlockAddon(String addonId) async {
    final id = OrlandoAddonCatalog.isThemeParksAddon(addonId)
        ? OrlandoAddonCatalog.themeParks
        : addonId;
    if (_unlockedAddons.contains(id)) return;
    _unlockedAddons
      ..remove(OrlandoAddonCatalog.legacyDisneyWorld)
      ..remove(OrlandoAddonCatalog.legacyUniversalOrlando)
      ..add(id);
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_unlockedAddonsKey, _unlockedAddons.toList());
    } catch (_) {}
  }

  void _migrateLegacyThemeParkAddons() {
    if (!_hasLegacyThemeParkUnlock()) return;
    if (_unlockedAddons.contains(OrlandoAddonCatalog.themeParks)) return;
    _unlockedAddons
      ..remove(OrlandoAddonCatalog.legacyDisneyWorld)
      ..remove(OrlandoAddonCatalog.legacyUniversalOrlando)
      ..add(OrlandoAddonCatalog.themeParks);
  }

  /// Dev / preview reset — not exposed in UI.
  @visibleForTesting
  Future<void> clearAll() async {
    _unlocked.clear();
    _unlockedAddons.clear();
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_unlockedCitiesKey);
      await prefs.remove(_unlockedAddonsKey);
    } catch (_) {}
  }
}
