/// Store product IDs — must match App Store Connect & Google Play Console.
///
/// Bundle id: `com.luxora.luxoraAi`
abstract final class IapProductCatalog {
  static const _prefix = 'com.luxora.luxoraAi';

  /// Launch city packs (Phase 1 — do not add new cities here until validated).
  static const launchCityIds = {'orlando', 'miami', 'florida-keys'};

  static const cityProducts = <String, String>{
    'orlando': '$_prefix.city.orlando',
    'miami': '$_prefix.city.miami',
    'florida-keys': '$_prefix.city.florida_keys',
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
