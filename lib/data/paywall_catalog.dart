import 'package:luxora_ai/data/city_pack_ui_catalog.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';

/// Bundled city-pack offers â€” swap JSON/admin pipeline later without UI changes.
abstract final class PaywallCatalog {
  static const defaultPriceUsd = 9.99;

  static const offers = <String, PaywallCityOffer>{
    'orlando': PaywallCityOffer(
      cityId: 'orlando',
      cityName: 'Orlando',
      regionLabel: 'Florida',
      heroUnsplashId: 'xEaAoizNFV8',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 2000,
      vacationCostMaxUsd: 5000,
      couplesHeroUnsplashId: 'RE1uPSyVuls',
      familyHeroUnsplashId: 'M4RVCkMpb1I',
      luxuryHeroUnsplashId: 'xEaAoizNFV8',
      adventureHeroUnsplashId: 'AK2vwEobto4',
      foodieHeroUnsplashId: 'p0vZplFhKYI',
    ),
    'miami': PaywallCityOffer(
      cityId: 'miami',
      cityName: 'Miami',
      regionLabel: 'Florida',
      heroUnsplashId: 'JZYQ_P94T-Q',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 2500,
      vacationCostMaxUsd: 6000,
      couplesHeroUnsplashId: 'RE1uPSyVuls',
      familyHeroUnsplashId: 'M4RVCkMpb1I',
      luxuryHeroUnsplashId: 'xEaAoizNFV8',
      adventureHeroUnsplashId: 'AK2vwEobto4',
      foodieHeroUnsplashId: 'p0vZplFhKYI',
    ),
    'tampa-bay': PaywallCityOffer(
      cityId: 'tampa-bay',
      cityName: 'Tampa Bay',
      regionLabel: 'Florida',
      heroUnsplashId: 'sWK9wki5zHU',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 1800,
      vacationCostMaxUsd: 4500,
      couplesHeroUnsplashId: 'RE1uPSyVuls',
      familyHeroUnsplashId: 'X_LNSoZ7xeM',
      adventureHeroUnsplashId: 'AK2vwEobto4',
      foodieHeroUnsplashId: 'p0vZplFhKYI',
    ),
    'st-augustine': PaywallCityOffer(
      cityId: 'st-augustine',
      cityName: 'St. Augustine',
      regionLabel: 'Florida',
      heroUnsplashId: 'RE1uPSyVuls',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 1600,
      vacationCostMaxUsd: 4200,
      couplesHeroUnsplashId: 'RE1uPSyVuls',
    ),
    'naples': PaywallCityOffer(
      cityId: 'naples',
      cityName: 'Naples',
      regionLabel: 'Florida',
      heroUnsplashId: 'X_LNSoZ7xeM',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 2400,
      vacationCostMaxUsd: 6500,
      luxuryHeroUnsplashId: 'X_LNSoZ7xeM',
      couplesHeroUnsplashId: 'RE1uPSyVuls',
    ),
    'destin-30a': PaywallCityOffer(
      cityId: 'destin-30a',
      cityName: 'Destin & 30A',
      regionLabel: 'Florida',
      heroUnsplashId: 'JZYQ_P94T-Q',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 1900,
      vacationCostMaxUsd: 4800,
      familyHeroUnsplashId: 'X_LNSoZ7xeM',
      adventureHeroUnsplashId: 'AK2vwEobto4',
    ),
    'florida-keys': PaywallCityOffer(
      cityId: 'florida-keys',
      cityName: 'Florida Keys',
      regionLabel: 'Florida',
      heroUnsplashId: 'AK2vwEobto4',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 2200,
      vacationCostMaxUsd: 5500,
      adventureHeroUnsplashId: 'AK2vwEobto4',
      couplesHeroUnsplashId: 'AK2vwEobto4',
    ),
    'nashville': PaywallCityOffer(
      cityId: 'nashville',
      cityName: 'Nashville',
      regionLabel: 'Tennessee',
      heroUnsplashId: 'X_LNSoZ7xeM',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 1500,
      vacationCostMaxUsd: 4000,
      foodieHeroUnsplashId: 'p0vZplFhKYI',
    ),
    'vegas': PaywallCityOffer(
      cityId: 'vegas',
      cityName: 'Las Vegas',
      regionLabel: 'Nevada',
      heroUnsplashId: 'eQ2ElhooTjc',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 2000,
      vacationCostMaxUsd: 6000,
      luxuryHeroUnsplashId: 'eQ2ElhooTjc',
      couplesHeroUnsplashId: 'RE1uPSyVuls',
    ),
    'nyc': PaywallCityOffer(
      cityId: 'nyc',
      cityName: 'New York City',
      regionLabel: 'New York',
      heroUnsplashId: 'xMMA_mtJ8xM',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 3000,
      vacationCostMaxUsd: 8000,
      luxuryHeroUnsplashId: 'xMMA_mtJ8xM',
      foodieHeroUnsplashId: 'p0vZplFhKYI',
    ),
    'paris': PaywallCityOffer(
      cityId: 'paris',
      cityName: 'Paris',
      regionLabel: 'France',
      heroUnsplashId: 'xMMA_mtJ8xM',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 2800,
      vacationCostMaxUsd: 7000,
      couplesHeroUnsplashId: 'xMMA_mtJ8xM',
      luxuryHeroUnsplashId: 'xMMA_mtJ8xM',
      foodieHeroUnsplashId: 'p0vZplFhKYI',
    ),
  };

  static PaywallCityOffer offerFor(String cityId) =>
      offers[cityId] ?? offers['orlando']!;

  static bool isSupported(String cityId) => offers.containsKey(cityId);

  /// Destinations travelers can pick in the UI (subset of [offers]).
  static List<PaywallCityOffer> get uiSelectableOffers {
    final list = offers.values
        .where((o) => CityPackUiCatalog.isVisibleInUi(o.cityId))
        .toList()
      ..sort((a, b) {
        final byRegion = a.regionLabel.compareTo(b.regionLabel);
        if (byRegion != 0) return byRegion;
        return a.cityName.compareTo(b.cityName);
      });
    return list;
  }

  /// All unlockable destinations — sorted by region, then city name.
  static List<PaywallCityOffer> get selectableOffers => uiSelectableOffers;

  /// Every registered offer (including UI-hidden packs).
  static List<PaywallCityOffer> get allOffers {
    final list = offers.values.toList()
      ..sort((a, b) {
        final byRegion = a.regionLabel.compareTo(b.regionLabel);
        if (byRegion != 0) return byRegion;
        return a.cityName.compareTo(b.cityName);
      });
    return list;
  }
}

