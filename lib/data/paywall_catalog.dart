import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';

/// Bundled city-pack offers — swap JSON/admin pipeline later without UI changes.
abstract final class PaywallCatalog {
  static const defaultPriceUsd = 29;

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
    'tampa': PaywallCityOffer(
      cityId: 'tampa',
      cityName: 'Tampa',
      regionLabel: 'Florida',
      heroUnsplashId: 'sWK9wki5zHU',
      priceUsd: defaultPriceUsd,
      vacationCostMinUsd: 1800,
      vacationCostMaxUsd: 4500,
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
  };

  static PaywallCityOffer offerFor(String cityId) =>
      offers[cityId] ?? offers['orlando']!;

  static List<PaywallCityOffer> get allOffers => offers.values.toList();
}
