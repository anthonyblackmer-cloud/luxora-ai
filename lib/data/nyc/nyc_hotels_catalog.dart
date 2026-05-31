import 'package:luxora_ai/data/nyc/nyc_curated_places.dart';
import 'package:luxora_ai/data/nyc/nyc_hub.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// New York City stays — walkable, subway-smart, and neighborhood-clustered stays.
abstract final class NycHotelsCatalog {
  static const cityId = NycCuratedPlaces.cityId;

  static const _photos = [
    'qQFzQyt2ur0', 'V8YLE7LEjOY', 'JZYQ_P94T-Q', 'X_LNSoZ7xeM',
    'sWK9wki5zHU', 'xEaAoizNFV8', 'RE1uPSyVuls', 'AK2vwEobto4',
  ];

  static const _categories = [
    ('Midtown Luxury Tower', HotelPriceRange.luxury, [HotelBestForTag.luxuryStaycation, HotelBestForTag.walkableDining], 95, 70, 90),
    ('Boutique Townhouse', HotelPriceRange.luxury, [HotelBestForTag.quietEscape, HotelBestForTag.bestForCouples], 92, 55, 88),
    ('Classic NYC Hotel', HotelPriceRange.luxury, [HotelBestForTag.luxuryStaycation, HotelBestForTag.walkableDining], 94, 65, 85),
    ('Family Suite Hotel', HotelPriceRange.upscale, [HotelBestForTag.familyFriendly, HotelBestForTag.walkableDining], 82, 88, 70),
    ('Downtown Value Stay', HotelPriceRange.upscale, [HotelBestForTag.budgetFriendly, HotelBestForTag.walkableDining], 78, 75, 80),
    ('Brooklyn Loft Hotel', HotelPriceRange.upscale, [HotelBestForTag.quietEscape, HotelBestForTag.walkableDining], 80, 70, 72),
    ('Riverside Retreat', HotelPriceRange.luxury, [HotelBestForTag.bestForCouples, HotelBestForTag.quietEscape], 90, 60, 88),
    ('Extended Stay Studio', HotelPriceRange.moderate, [HotelBestForTag.budgetFriendly, HotelBestForTag.familyFriendly], 68, 80, 55),
  ];

  static const _districtSeeds = [
    ('nyc-midtown', 'Midtown', 40.7549, -73.984),
    ('nyc-times-square', 'Times Square', 40.758, -73.9855),
    ('nyc-upper-east-side', 'Upper East Side', 40.7736, -73.9566),
    ('nyc-upper-west-side', 'Upper West Side', 40.787, -73.9754),
    ('nyc-soho', 'SoHo', 40.7233, -73.9989),
    ('nyc-greenwich-village', 'Greenwich Village', 40.7336, -73.9967),
    ('nyc-chelsea', 'Chelsea', 40.7465, -74.0014),
    ('nyc-financial-district', 'Financial District', 40.7075, -74.0113),
    ('nyc-tribeca', 'Tribeca', 40.7163, -74.0086),
    ('nyc-harlem', 'Harlem', 40.8116, -73.9465),
    ('nyc-williamsburg', 'Williamsburg', 40.7081, -73.9571),
    ('nyc-dumbo', 'DUMBO', 40.7033, -73.9896),
    ('nyc-brooklyn-heights', 'Brooklyn Heights', 40.696, -73.9936),
    ('nyc-park-slope', 'Park Slope', 40.671, -73.9814),
    ('nyc-long-island-city', 'Long Island City', 40.7447, -73.9485),
    ('nyc-astoria', 'Astoria', 40.772, -73.9301),
    ('nyc-yankee-stadium', 'Yankee Stadium Area', 40.8296, -73.9262),
    ('nyc-ferry-district', 'Ferry District', 40.6437, -74.0737),
  ];

  static List<LuxHotel>? _all;

  static List<LuxHotel> get all => _all ??= _buildHotels();

  static List<LuxHotel> _buildHotels() {
    final out = <LuxHotel>[];
    var photoIdx = 0;

    for (var d = 0; d < _districtSeeds.length; d++) {
      final district = _districtSeeds[d];
      for (var c = 0; c < _categories.length; c++) {
        if (out.length >= 100) break;
        final cat = _categories[c];
        final slot = c + 1;
        final id = 'nyc-hotel-intel-${district.$1}-$slot';
        final placeId = 'hotel-nyc-${district.$1}-$slot';
        out.add(
          LuxHotel(
            id: id,
            placeId: placeId,
            name: '${district.$2} ${cat.$1} $slot',
            neighborhood: '${district.$2} · New York City',
            unsplashPhotoId: _photos[photoIdx++ % _photos.length],
            priceRange: cat.$2,
            luxuryScore: cat.$4,
            familyScore: cat.$5,
            romanceScore: cat.$4 - 4,
            walkabilityScore: cat.$6,
            nightlifeScore: 60 + (c * 2) % 25,
            beachAccessScore: 15 + (c * 2) % 10,
            foodAccessScore: 75 + (c * 3) % 20,
            attractionDistances: {
              'Subway': '${4 + c} min',
              'Midtown': '${10 + d} min',
              'Brooklyn': '${18 + d} min',
            },
            bestForTags: cat.$3,
            emotionalDescription: '\${cat.\$1} in \${district.\$2} — subway-adjacent, walkable clusters, and crowd-smart timing.',
            hotelWebsiteUrl: 'https://example.com/nyc/$placeId',
            checkRatesUrl: 'https://example.com/nyc/$placeId/rates',
            bookingPartner: 'direct',
            externalId: placeId,
            lastUpdated: DateTime(2026, 5, 31),
            cityPackId: cityId,
            districtId: district.$1,
            nearbyDiningPlaceIds: const ['place-statue-of-liberty', 'place-empire-state'],
            plannedAttractionTags: ['walkable', 'subway', 'foodie'],
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
            moodTags: ['hotel', 'nyc', ...h.plannedAttractionTags],
            cityPackId: cityId,
            source: LuxPlaceSource.curated,
          ),
      ];

  static (double, double) _coordsFor(String districtId) {
    for (final s in _districtSeeds) {
      if (s.$1 == districtId) return (s.$3, s.$4);
    }
    return (NycHub.latitude, NycHub.longitude);
  }

  static LuxHotel? byId(String id) {
    for (final h in all) {
      if (h.id == id) return h;
    }
    return null;
  }
}
