/// Which city packs appear in destination pickers and new unlock flows.
///
/// Pack code and IAP products stay registered — flip [uiVisibleCityIds]
/// when ready to launch additional markets.
abstract final class CityPackUiCatalog {
  /// Shown in onboarding, landing, paywall, and More destination pickers.
  static const uiVisibleCityIds = {
    'orlando',
    'miami',
    'florida-keys',
  };

  /// Built packs held back until core Florida launch metrics validate.
  static const uiHiddenCityIds = {
    'tampa-bay',
    'st-augustine',
    'naples',
    'destin-30a',
    'vegas',
    'nyc',
  };

  static bool isVisibleInUi(String cityId) => uiVisibleCityIds.contains(cityId);
}
