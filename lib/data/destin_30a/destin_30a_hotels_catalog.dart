import 'package:luxora_ai/data/destin_30a/destin_30a_curated_places.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_hub.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// Destin & 30A stays — beach, boutique, luxury, and family intelligence.
abstract final class Destin30aHotelsCatalog {
  static const cityId = Destin30aCuratedPlaces.cityId;

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
    ('destin-30a-destin-harbor', 'Destin Harbor', 30.3955, -86.4988),
    ('destin-30a-henderson-beach', 'Henderson Beach', 30.3785, -86.5038),
    ('destin-30a-miramar-beach', 'Miramar Beach', 30.3685, -86.5078),
    ('destin-30a-sandestin', 'Sandestin', 30.3585, -86.5138),
    ('destin-30a-rosemary-beach', 'Rosemary Beach', 30.3385, -86.52080000000001),
    ('destin-30a-seaside', 'Seaside', 30.3355, -86.52380000000001),
    ('destin-30a-grayton-beach', 'Grayton Beach', 30.3285, -86.5278),
    ('destin-30a-watercolor', 'WaterColor', 30.3375, -86.5258),
    ('destin-30a-alys-beach', 'Alys Beach', 30.3415, -86.5218),
    ('destin-30a-santa-rosa-beach', 'Santa Rosa Beach', 30.3455, -86.5198),
    ('destin-30a-30a-east', '30A East', 30.3535, -86.5108),
    ('destin-30a-blue-mountain-beach', 'Blue Mountain Beach', 30.3235, -86.5308),
    ('destin-30a-dune-allen', 'Dune Allen', 30.348499999999998, -86.5158),
    ('destin-30a-destin-commons', 'Destin Commons', 30.4015, -86.5008),
    ('destin-30a-crab-island', 'Crab Island', 30.3985, -86.5078),
    ('destin-30a-okaloosa-island', 'Okaloosa Island', 30.4055, -86.4808),
    ('destin-30a-fort-walton-edge', 'Fort Walton Edge', 30.418499999999998, -86.4758),
    ('destin-30a-inlet-beach', 'Inlet Beach', 30.3185, -86.5338),
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
        final id = 'destin-30a-hotel-intel-${district.$1}-$slot';
        final placeId = 'hotel-destin-30a-${district.$1}-$slot';
        out.add(
          LuxHotel(
            id: id,
            placeId: placeId,
            name: '${district.$2} ${cat.$1} $slot',
            neighborhood: '${district.$2} · Destin & 30A',
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
            hotelWebsiteUrl: 'https://example.com/destin-30a/$placeId',
            checkRatesUrl: 'https://example.com/destin-30a/$placeId/rates',
            bookingPartner: 'direct',
            externalId: placeId,
            lastUpdated: DateTime(2026, 5, 31),
            cityPackId: cityId,
            districtId: district.$1,
            nearbyDiningPlaceIds: const ['place-destin-harborwalk', 'place-henderson-beach-state-park'],
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
            moodTags: ['hotel', 'destin-30a', ...h.plannedAttractionTags],
            cityPackId: cityId,
            source: LuxPlaceSource.curated,
          ),
      ];

  static (double, double) _coordsFor(String districtId) {
    for (final s in _districtSeeds) {
      if (s.$1 == districtId) return (s.$3, s.$4);
    }
    return (Destin30aHub.latitude, Destin30aHub.longitude);
  }

  static LuxHotel? byId(String id) {
    for (final h in all) {
      if (h.id == id) return h;
    }
    return null;
  }
}
