import 'package:luxora_ai/models/lux_hotel.dart';

/// Orlando MVP stays — curated for concierge intelligence, not OTA inventory.
abstract final class HotelsCatalog {
  static final List<LuxHotel> all = [
    LuxHotel(
      id: 'hotel-intel-four-seasons',
      placeId: 'hotel-four-seasons-orlando',
      name: 'Four Seasons Resort Orlando',
      neighborhood: 'Golden Oak · Disney area',
      unsplashPhotoId: 'xEaAoizNFV8',
      priceRange: HotelPriceRange.luxury,
      luxuryScore: 98,
      familyScore: 88,
      romanceScore: 92,
      walkabilityScore: 35,
      attractionDistances: {
        'Disney': '12 min',
        'Universal': '22 min',
        'Disney Springs': '14 min',
      },
      bestForTags: [
        HotelBestForTag.bestForCouples,
        HotelBestForTag.bestForDisney,
        HotelBestForTag.luxuryStaycation,
        HotelBestForTag.resortFeel,
      ],
      emotionalDescription:
          'A hushed, golden-oak retreat where rooftop dinners and pool days feel effortlessly elevated — your Disney days start calm.',
      hotelWebsiteUrl: 'https://www.fourseasons.com/orlando/',
      checkRatesUrl: 'https://www.fourseasons.com/orlando/',
      bookingPartner: 'direct',
      externalId: 'four-seasons-orlando-walt-disney',
      lastUpdated: DateTime(2026, 5, 29),
      nearbyExperiencePlaceIds: [],
      nearbyDiningPlaceIds: ['dining-capa-four-seasons', 'dining-the-boathouse'],
      plannedAttractionTags: ['disney', 'luxury', 'romantic', 'family'],
    ),
    LuxHotel(
      id: 'hotel-intel-almanac-winter-park',
      placeId: 'hotel-almanac-winter-park',
      name: 'The Alfond Inn',
      neighborhood: 'Winter Park',
      unsplashPhotoId: 'RibghBxKlKc',
      priceRange: HotelPriceRange.upscale,
      luxuryScore: 82,
      familyScore: 58,
      romanceScore: 90,
      walkabilityScore: 92,
      attractionDistances: {
        'Park Avenue': '3 min walk',
        'Disney': '35 min',
        'Universal': '32 min',
      },
      bestForTags: [
        HotelBestForTag.bestForCouples,
        HotelBestForTag.quietEscape,
        HotelBestForTag.walkableDining,
        HotelBestForTag.luxuryStaycation,
      ],
      emotionalDescription:
          'Boutique art-hotel energy on a tree-lined avenue — slow mornings, gallery walks, and candlelit dinners without theme-park noise.',
      hotelWebsiteUrl: 'https://www.thealfondinn.com/',
      checkRatesUrl: 'https://www.thealfondinn.com/stay/',
      bookingPartner: 'direct',
      externalId: 'alfond-inn-winter-park',
      lastUpdated: DateTime(2026, 5, 29),
      nearbyDiningPlaceIds: ['dining-prato', 'dining-the-ravenous-pig'],
      plannedAttractionTags: ['winter_park', 'romantic', 'culture', 'foodie'],
    ),
    LuxHotel(
      id: 'hotel-intel-gaylord-palms',
      placeId: 'hotel-gaylord-palms',
      name: 'Gaylord Palms Resort',
      neighborhood: 'Kissimmee · near Disney',
      unsplashPhotoId: 'z78FxiNCA5w',
      priceRange: HotelPriceRange.upscale,
      luxuryScore: 78,
      familyScore: 96,
      romanceScore: 62,
      walkabilityScore: 28,
      attractionDistances: {
        'Disney': '15 min',
        'Universal': '28 min',
        'Water park': 'On-site',
      },
      bestForTags: [
        HotelBestForTag.familyFriendly,
        HotelBestForTag.bestForDisney,
        HotelBestForTag.resortFeel,
      ],
      emotionalDescription:
          'Glass-atrium wonder and a sprawling water park — the kind of place kids remember for decades while parents actually relax.',
      hotelWebsiteUrl: 'https://www.marriott.com/en-us/hotels/mcogp-gaylord-palms-resort-and-convention-center/',
      checkRatesUrl:
          'https://www.marriott.com/en-us/hotels/mcogp-gaylord-palms-resort-and-convention-center/overview/',
      bookingPartner: 'marriott',
      externalId: 'gaylord-palms-kissimmee',
      lastUpdated: DateTime(2026, 5, 29),
      plannedAttractionTags: ['disney', 'family', 'resort'],
    ),
    LuxHotel(
      id: 'hotel-intel-lake-nona-wave',
      placeId: 'hotel-lake-nona-wave',
      name: 'The Wave Hotel at Lake Nona',
      neighborhood: 'Lake Nona',
      unsplashPhotoId: 'p0vZplFhKYI',
      priceRange: HotelPriceRange.luxury,
      luxuryScore: 90,
      familyScore: 70,
      romanceScore: 85,
      walkabilityScore: 55,
      attractionDistances: {
        'Airport (MCO)': '8 min',
        'Disney': '28 min',
        'Medical City': '5 min',
      },
      bestForTags: [
        HotelBestForTag.luxuryStaycation,
        HotelBestForTag.quietEscape,
        HotelBestForTag.resortFeel,
      ],
      emotionalDescription:
          'Sculptural modern luxury in Orlando\'s design district — rooftop pool, art installations, and a calmer pace away from park crowds.',
      hotelWebsiteUrl: 'https://www.thewavehotel.com/',
      checkRatesUrl: 'https://www.thewavehotel.com/rooms/',
      bookingPartner: 'direct',
      externalId: 'wave-hotel-lake-nona',
      lastUpdated: DateTime(2026, 5, 29),
      plannedAttractionTags: ['luxury', 'wellness', 'modern'],
    ),
    LuxHotel(
      id: 'hotel-intel-idrive-value',
      placeId: 'hotel-idrive-clarion',
      name: 'Clarion Hotel International Drive',
      neighborhood: 'International Drive',
      unsplashPhotoId: 'JZYQ_P94T-Q',
      priceRange: HotelPriceRange.budget,
      luxuryScore: 42,
      familyScore: 72,
      romanceScore: 38,
      walkabilityScore: 68,
      attractionDistances: {
        'I-Drive dining': '5 min walk',
        'Universal': '12 min',
        'Disney': '22 min',
      },
      bestForTags: [
        HotelBestForTag.budgetFriendly,
        HotelBestForTag.walkableDining,
        HotelBestForTag.bestForUniversal,
      ],
      emotionalDescription:
          'Smart value on the I-Drive corridor — less resort splurge, more budget for experiences, with Universal and dining close by.',
      hotelWebsiteUrl: 'https://www.choicehotels.com/florida/orlando/clarion-hotels',
      checkRatesUrl: 'https://www.choicehotels.com/florida/orlando/clarion-hotels',
      bookingPartner: 'choice',
      externalId: 'clarion-idrive-orlando',
      lastUpdated: DateTime(2026, 5, 29),
      nearbyDiningPlaceIds: [],
      plannedAttractionTags: ['universal', 'budget', 'idrive'],
    ),
    LuxHotel(
      id: 'hotel-intel-portofino-bay',
      placeId: 'hotel-loews-portofino-bay',
      name: 'Loews Portofino Bay Hotel',
      neighborhood: 'Universal Orlando Resort',
      unsplashPhotoId: 'z78FxiNCA5w',
      priceRange: HotelPriceRange.upscale,
      luxuryScore: 85,
      familyScore: 90,
      romanceScore: 78,
      walkabilityScore: 45,
      attractionDistances: {
        'Universal Studios': 'Water taxi',
        'Islands of Adventure': 'Water taxi',
        'CityWalk': '10 min walk',
      },
      bestForTags: [
        HotelBestForTag.bestForUniversal,
        HotelBestForTag.familyFriendly,
        HotelBestForTag.resortFeel,
      ],
      emotionalDescription:
          'Mediterranean harbor vibes with Express Unlimited perks — roll out of bed and onto the rides without parking stress.',
      hotelWebsiteUrl: 'https://www.universalorlando.com/web/en/us/places-to-stay/portofino-bay-hotel',
      checkRatesUrl:
          'https://www.universalorlando.com/web/en/us/places-to-stay/portofino-bay-hotel',
      bookingPartner: 'universal',
      externalId: 'loews-portofino-bay',
      lastUpdated: DateTime(2026, 5, 29),
      nearbyDiningPlaceIds: ['dining-toothsome-chocolate'],
      plannedAttractionTags: ['universal', 'family', 'resort'],
    ),
  ];

  static LuxHotel? byId(String id) {
    for (final h in all) {
      if (h.id == id) return h;
    }
    return null;
  }

  static LuxHotel? byPlaceId(String placeId) {
    for (final h in all) {
      if (h.placeId == placeId) return h;
    }
    return null;
  }
}
