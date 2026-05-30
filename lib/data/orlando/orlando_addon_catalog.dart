import 'package:luxora_ai/models/paywall/paywall_addon_offer.dart';

/// Orlando theme-park add-on — content ids and paywall metadata.
abstract final class OrlandoAddonCatalog {
  static const parentCityId = 'orlando';

  /// Single bundled unlock for Walt Disney World + Universal Orlando.
  static const themeParks = 'theme-parks';

  /// Legacy ids — merged into [themeParks] for stored entitlements.
  static const legacyDisneyWorld = 'disney-world';
  static const legacyUniversalOrlando = 'universal-orlando';

  static const defaultAddonPriceUsd = 9.99;

  static const themeParkPlaceIds = {
    ...disneyPlaceIds,
    ...universalPlaceIds,
  };

  static const disneyPlaceIds = {
    'place-magic-kingdom',
    'place-epcot',
    'place-hollywood-studios',
    'place-animal-kingdom',
    'place-disney-springs',
    'place-disney-night',
    'place-typhoon-lagoon',
    'place-blizzard-beach',
  };

  static const universalPlaceIds = {
    'place-universal-studios',
    'place-islands-of-adventure',
    'place-volcano-bay',
    'place-epic-universe',
  };

  static const themeParkDealIds = {
    ...disneyDealIds,
    ...universalDealIds,
  };

  static const disneyDealIds = {
    'deal-disney-magic-kingdom-1d',
    'deal-disney-3day-pass',
    'deal-typhoon-lagoon',
  };

  static const universalDealIds = {
    'deal-universal-2park',
    'deal-universal-express',
    'deal-volcano-bay',
    'deal-epic-universe-preview',
  };

  static const themeParkFeedItemIds = {
    ...disneyFeedItemIds,
    ...universalFeedItemIds,
  };

  static const disneyFeedItemIds = {
    'feed-disney-after-dark',
    'feed-disney-springs-date',
  };

  static const universalFeedItemIds = {
    'feed-universal-hype',
  };

  static const themeParkDistrictIds = {
    'orlando-disney',
    'orlando-universal',
  };

  static const offer = PaywallAddonOffer(
    addonId: themeParks,
    parentCityId: parentCityId,
    packName: 'Disney & Universal',
    subtitle:
        'Walt Disney World and Universal Orlando — parks, deals, routes, and crowd intel.',
    heroUnsplashId: 'uPQiTOzYoo0',
    priceUsd: defaultAddonPriceUsd,
  );

  static PaywallAddonOffer offerFor(String addonId) {
    if (isThemeParksAddon(addonId)) return offer;
    return offer;
  }

  static bool isThemeParksAddon(String? addonId) =>
      addonId == themeParks ||
      addonId == legacyDisneyWorld ||
      addonId == legacyUniversalOrlando;

  static String? addonForPlaceId(String placeId) =>
      themeParkPlaceIds.contains(placeId) ? themeParks : null;

  static String? addonForDealId(String dealId) =>
      themeParkDealIds.contains(dealId) ? themeParks : null;

  static String? addonForFeedItemId(String feedItemId) =>
      themeParkFeedItemIds.contains(feedItemId) ? themeParks : null;

  static bool isThemeParkHotelTags(List<String> tags) =>
      isDisneyHotelTags(tags) || isUniversalHotelTags(tags);

  static bool isDisneyHotelTags(List<String> tags) =>
      tags.any((t) => t.toLowerCase() == 'disney');

  static bool isUniversalHotelTags(List<String> tags) =>
      tags.any((t) => t.toLowerCase() == 'universal');
}
