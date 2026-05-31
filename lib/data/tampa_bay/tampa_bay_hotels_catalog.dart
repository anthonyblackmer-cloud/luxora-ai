import 'package:luxora_ai/data/tampa_bay/tampa_bay_curated_places.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_hub.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// Tampa Bay stays — waterfront, beach, boutique, and family intelligence.
abstract final class TampaBayHotelsCatalog {
  static const cityId = TampaBayCuratedPlaces.cityId;

  static const _photos = [
    'qQFzQyt2ur0',
    'V8YLE7LEjOY',
    'JZYQ_P94T-Q',
    'X_LNSoZ7xeM',
    'sWK9wki5zHU',
    'xEaAoizNFV8',
    'RE1uPSyVuls',
    'AK2vwEobto4',
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
    ('tampa-bay-downtown-tampa', 'Downtown Tampa', 27.947, -82.458),
    ('tampa-bay-channelside', 'Channelside', 27.944, -82.445),
    ('tampa-bay-hyde-park', 'Hyde Park', 27.938, -82.482),
    ('tampa-bay-ybor', 'Ybor City', 27.963, -82.436),
    ('tampa-bay-riverwalk', 'Riverwalk', 27.945, -82.458),
    ('tampa-bay-seminole-heights', 'Seminole Heights', 27.992, -82.458),
    ('tampa-bay-downtown-st-pete', 'Downtown St. Pete', 27.771, -82.638),
    ('tampa-bay-central-arts', 'Central Arts District', 27.768, -82.645),
    ('tampa-bay-vinoy', 'Vinoy Area', 27.775, -82.628),
    ('tampa-bay-beach-drive', 'Beach Drive', 27.772, -82.631),
    ('tampa-bay-clearwater-beach', 'Clearwater Beach', 27.979, -82.831),
    ('tampa-bay-sand-key', 'Sand Key', 27.959, -82.828),
    ('tampa-bay-downtown-dunedin', 'Downtown Dunedin', 28.020, -82.772),
    ('tampa-bay-dunedin-waterfront', 'Dunedin Waterfront', 28.018, -82.780),
    ('tampa-bay-sponge-docks', 'Sponge Docks', 28.146, -82.755),
    ('tampa-bay-tarpon-historic', 'Tarpon Historic', 28.150, -82.760),
    ('tampa-bay-safety-harbor-downtown', 'Safety Harbor', 27.990, -82.693),
    ('tampa-bay-safety-harbor-waterfront', 'Safety Harbor Waterfront', 27.988, -82.688),
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
        final id = 'tampa-bay-hotel-intel-${district.$1}-$slot';
        final placeId = 'hotel-tampa-bay-${district.$1}-$slot';
        out.add(
          LuxHotel(
            id: id,
            placeId: placeId,
            name: '${district.$2} ${cat.$1} $slot',
            neighborhood: '${district.$2} · Tampa Bay',
            unsplashPhotoId: _photos[photoIdx++ % _photos.length],
            priceRange: cat.$2,
            luxuryScore: cat.$4,
            familyScore: cat.$5,
            romanceScore: cat.$4 - 4,
            walkabilityScore: cat.$6,
            nightlifeScore: district.$1.contains('ybor') ? 88 : 55,
            beachAccessScore: district.$1.contains('clearwater') ||
                    district.$1.contains('sand-key')
                ? 96
                : 45,
            foodAccessScore: 75 + (c * 3) % 20,
            attractionDistances: {
              'Riverwalk': '${12 + c} min',
              'Clearwater Beach': '${25 + d} min',
              'St. Pete Pier': '${18 + d} min',
            },
            bestForTags: cat.$3,
            emotionalDescription:
                '${cat.$1} in ${district.$2} — waterfront calm, local food access, and concierge-timed beach windows.',
            hotelWebsiteUrl: 'https://example.com/tampa-bay/$placeId',
            checkRatesUrl: 'https://example.com/tampa-bay/$placeId/rates',
            bookingPartner: 'direct',
            externalId: placeId,
            lastUpdated: DateTime(2026, 5, 29),
            cityPackId: cityId,
            districtId: district.$1,
            nearbyDiningPlaceIds: const ['place-sparkman-wharf', 'place-armature-works'],
            plannedAttractionTags: ['waterfront', 'local', 'foodie'],
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
            moodTags: ['hotel', 'tampa-bay', ...h.plannedAttractionTags],
            cityPackId: cityId,
            source: LuxPlaceSource.curated,
          ),
      ];

  static (double, double) _coordsFor(String districtId) {
    for (final s in _districtSeeds) {
      if (s.$1 == districtId) return (s.$3, s.$4);
    }
    return (TampaBayHub.latitude, TampaBayHub.longitude);
  }

  static LuxHotel? byId(String id) {
    for (final h in all) {
      if (h.id == id) return h;
    }
    return null;
  }
}
