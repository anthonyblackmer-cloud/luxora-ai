import 'package:luxora_ai/data/city_pack_ui_catalog.dart';

/// Store product IDs — must match App Store Connect & Google Play Console.
///
/// Bundle id: `com.luxora.luxoraAi`
abstract final class IapProductCatalog {
  static const _prefix = 'com.luxora.luxoraAi';

  /// City packs offered for new purchase in the UI (Phase 1 growth markets).
  static const launchCityIds = CityPackUiCatalog.uiVisibleCityIds;

  static const cityProducts = <String, String>{
    'orlando': '$_prefix.city.orlando',
    'miami': '$_prefix.city.miami',
    'florida-keys': '$_prefix.city.florida_keys',
    'tampa-bay': '$_prefix.city.tampa_bay',
    'st-augustine': '$_prefix.city.st_augustine',
    'naples': '$_prefix.city.naples',
    'destin-30a': '$_prefix.city.destin_30a',
    'vegas': '$_prefix.city.vegas',
    'nyc': '$_prefix.city.nyc',
  };

  static const addonProducts = <String, String>{
    'theme-parks': '$_prefix.addon.orlando_theme_parks',
  };

  static Set<String> get allProductIds => {
        ...cityProducts.values,
        ...addonProducts.values,
      };

  static bool hasStoreProductForCity(String cityId) =>
      launchCityIds.contains(cityId) && cityProducts.containsKey(cityId);

  static String? productIdForCity(String cityId) => cityProducts[cityId];

  static String? productIdForAddon(String addonId) => addonProducts[addonId];

  static String? cityIdForProduct(String productId) {
    for (final entry in cityProducts.entries) {
      if (entry.value == productId) return entry.key;
    }
    return null;
  }

  static String? addonIdForProduct(String productId) {
    for (final entry in addonProducts.entries) {
      if (entry.value == productId) return entry.key;
    }
    return null;
  }
}
