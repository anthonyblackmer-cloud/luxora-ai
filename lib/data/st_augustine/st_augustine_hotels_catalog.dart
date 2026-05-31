import 'package:luxora_ai/data/st_augustine/st_augustine_curated_places.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_hub.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// St. Augustine stays — beach, boutique, luxury, and family intelligence.
abstract final class StAugustineHotelsCatalog {
  static const cityId = StAugustineCuratedPlaces.cityId;

  static const _photos = [
    'qQFzQyt2ur0', 'V8YLE7LEjOY', 'JZYQ_P94T-Q', 'X_LNSoZ7xeM',
    'sWK9wki5zHU', 'xEaAoizNFV8', 'RE1uPSyVuls', 'AK2vwEobto4',
  ];

  static const _categories = [
    ('Luxury Waterfront', HotelPriceRange.luxury, [HotelBestForTag.bestForCouples, HotelBestForTag.luxuryStaycation], 94, 88, 90),
    ('Beach Resort', HotelPriceRange.luxury, [HotelBestForTag.resortFeel, HotelBestForTag.familyFriendly], 90, 85, 95),
    ('Boutique Hotel', HotelPriceRange.upscale, [HotelBestForTag.walkableDining, HotelBestForTag.quietEscape], 82, 78, 70),
    ('Family Resort', HotelPriceRange.upscale, [HotelBestForTag.familyFriendly, HotelBestForTag.resortFeel], 78, 92, 80),
    ('Downtown Hotel', HotelPriceRange.upscale, [HotelBestForTag.walkableDining, HotelBestForTag.quietEscape], 80, 70, 55),
    ('Romantic Escape', HotelPriceRange.luxury, [HotelBestForTag.bestForCouples, HotelBestForTag.quietEscape], 92, 75, 85),
    ('Budget Friendly', HotelPriceRange.moderate, [HotelBestForTag.budgetFriendly, HotelBestForTag.familyFriendly], 55, 80, 60),
    ('Spa Resort', HotelPriceRange.luxury, [HotelBestForTag.luxuryStaycation, HotelBestForTag.quietEscape], 95, 65, 75),
  ];

  static const _districtSeeds = [
    ('st-augustine-historic-district', 'Historic District', 29.898600000000002, -81.3175),
    ('st-augustine-st-george-street', 'St. George Street', 29.8966, -81.3155),
    ('st-augustine-anastasia-island', 'Anastasia Island', 29.8766, -81.3025),
    ('st-augustine-vilano-beach', 'Vilano Beach', 29.9166, -81.3065),
    ('st-augustine-downtown-waterfront', 'Downtown Waterfront', 29.8956, -81.31049999999999),
    ('st-augustine-lincolnville', 'Lincolnville', 29.8886, -81.32249999999999),
    ('st-augustine-castillo-district', 'Castillo District', 29.8996, -81.3125),
    ('st-augustine-lighthouse-area', 'Lighthouse Area', 29.8826, -81.2995),
    ('st-augustine-uptown-antique', 'Uptown Antique', 29.9066, -81.3205),
    ('st-augustine-st-augustine-beach', 'St Augustine Beach', 29.869600000000002, -81.2965),
    ('st-augustine-aviles-street', 'Aviles Street', 29.8976, -81.31649999999999),
    ('st-augustine-spanish-quarter', 'Spanish Quarter', 29.898600000000002, -81.31349999999999),
    ('st-augustine-flagler-legacy', 'Flagler Legacy', 29.9006, -81.3185),
    ('st-augustine-san-marco-avenue', 'San Marco Avenue', 29.9036, -81.31949999999999),
    ('st-augustine-matanzas-inlet', 'Matanzas Inlet', 29.9226, -81.29249999999999),
    ('st-augustine-cathedral-quarter', 'Cathedral Quarter', 29.8976, -81.3175),
    ('st-augustine-mission-district', 'Mission District', 29.9026, -81.3085),
    ('st-augustine-ponte-vedra-edge', 'Ponte Vedra Edge', 29.8496, -81.2795),
  ];

  static List<LuxHotel>? _all;

  static List<LuxHotel> get all => _all ??= _buildHotels();

  static List<LuxHotel> _buildHotels() {
    final out = <LuxHotel>[];
    var photoIdx = 0;

    for (var d = 0; d < _districtSeeds.length; d++) {
      final district = _districtSeeds[d];
      for (var c = 0; c < _categories.length; c++) {
        if (out.length >= 52) break;
        final cat = _categories[c];
        final slot = c + 1;
        final id = 'st-augustine-hotel-intel-${district.$1}-$slot';
        final placeId = 'hotel-st-augustine-${district.$1}-$slot';
        out.add(
          LuxHotel(
            id: id,
            placeId: placeId,
            name: '${district.$2} ${cat.$1} $slot',
            neighborhood: '${district.$2} · St. Augustine',
            unsplashPhotoId: _photos[photoIdx++ % _photos.length],
            priceRange: cat.$2,
            luxuryScore: cat.$4,
            familyScore: cat.$5,
            romanceScore: cat.$4 - 4,
            walkabilityScore: cat.$6,
            nightlifeScore: district.$1.contains('night') ? 88 : 55,
            beachAccessScore: district.$1.contains('beach') ? 96 : 45,
            foodAccessScore: 75 + (c * 3) % 20,
            attractionDistances: {
              'Downtown': '${12 + c} min',
              'Beach': '${18 + d} min',
              'Harbor': '${15 + d} min',
            },
            bestForTags: cat.$3,
            emotionalDescription:
                '${cat.$1} in ${district.$2} — local food access and concierge-timed beach windows.',
            hotelWebsiteUrl: 'https://example.com/st-augustine/$placeId',
            checkRatesUrl: 'https://example.com/st-augustine/$placeId/rates',
            bookingPartner: 'direct',
            externalId: placeId,
            lastUpdated: DateTime(2026, 5, 31),
            cityPackId: cityId,
            districtId: district.$1,
            nearbyDiningPlaceIds: const ['place-castillo-san-marcos', 'place-st-george-street'],
            plannedAttractionTags: ['local', 'foodie', 'beach'],
          ),
        );
      }
    }
    return out;
  }

  static List<LuxPlace> get hotelPlaces => [
        for (final h in all)
          LuxPlace(
            id: h.placeId,
            slug: h.placeId,
            title: h.name,
            category: LuxPlaceCategory.hotel,
            unsplashPhotoId: h.unsplashPhotoId,
            location: h.neighborhood,
            latitude: _coordsFor(h.districtId!).$1,
            longitude: _coordsFor(h.districtId!).$2,
            description: h.emotionalDescription,
            moodTags: ['hotel', 'st-augustine', ...h.plannedAttractionTags],
            cityPackId: cityId,
            source: LuxPlaceSource.curated,
          ),
      ];

  static (double, double) _coordsFor(String districtId) {
    for (final s in _districtSeeds) {
      if (s.$1 == districtId) return (s.$3, s.$4);
    }
    return (StAugustineHub.latitude, StAugustineHub.longitude);
  }

  static LuxHotel? byId(String id) {
    for (final h in all) {
      if (h.id == id) return h;
    }
    return null;
  }
}
