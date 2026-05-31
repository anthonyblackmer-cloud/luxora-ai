import 'package:luxora_ai/data/vegas/vegas_curated_places.dart';
import 'package:luxora_ai/data/vegas/vegas_hub.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// Las Vegas stays — Strip, pool, and suite intelligence.
abstract final class VegasHotelsCatalog {
  static const cityId = VegasCuratedPlaces.cityId;

  static const _photos = [
    'qQFzQyt2ur0', 'V8YLE7LEjOY', 'JZYQ_P94T-Q', 'X_LNSoZ7xeM',
    'sWK9wki5zHU', 'xEaAoizNFV8', 'RE1uPSyVuls', 'AK2vwEobto4',
  ];

  static const _categories = [
    ('Strip Luxury Tower', HotelPriceRange.luxury, [HotelBestForTag.luxuryStaycation, HotelBestForTag.bestForCouples], 96, 75, 92),
    ('Boutique Casino Hotel', HotelPriceRange.luxury, [HotelBestForTag.walkableDining, HotelBestForTag.quietEscape], 90, 70, 88),
    ('Pool & Dayclub Resort', HotelPriceRange.luxury, [HotelBestForTag.resortFeel, HotelBestForTag.luxuryStaycation], 94, 65, 85),
    ('Family Mega Resort', HotelPriceRange.upscale, [HotelBestForTag.familyFriendly, HotelBestForTag.resortFeel], 82, 92, 70),
    ('Downtown Classic', HotelPriceRange.upscale, [HotelBestForTag.budgetFriendly, HotelBestForTag.walkableDining], 78, 80, 60),
    ('Off-Strip Value', HotelPriceRange.moderate, [HotelBestForTag.budgetFriendly, HotelBestForTag.quietEscape], 68, 75, 55),
    ('Spa & Wellness Tower', HotelPriceRange.luxury, [HotelBestForTag.luxuryStaycation, HotelBestForTag.quietEscape], 95, 60, 90),
    ('High-Roller Suite', HotelPriceRange.luxury, [HotelBestForTag.bestForCouples, HotelBestForTag.luxuryStaycation], 98, 55, 94),
  ];

  static const _districtSeeds = [
    ('vegas-las-vegas-strip', 'Las Vegas Strip', 36.1147, -115.1728),
    ('vegas-downtown-las-vegas', 'Downtown Las Vegas', 36.1673, -115.1484),
    ('vegas-fremont-street', 'Fremont Street', 36.1705, -115.1435),
    ('vegas-arts-district', 'Arts District', 36.155, -115.152),
    ('vegas-summerlin', 'Summerlin', 36.149, -115.333),
    ('vegas-red-rock-area', 'Red Rock Area', 36.135, -115.428),
    ('vegas-henderson', 'Henderson', 36.0395, -115.035),
    ('vegas-venetian-area', 'Venetian Area', 36.1212, -115.1697),
    ('vegas-bellagio-corridor', 'Bellagio Corridor', 36.1126, -115.1767),
    ('vegas-caesars-corridor', 'Caesars Corridor', 36.1162, -115.1745),
  ];

  static List<LuxHotel>? _all;

  static List<LuxHotel> get all => _all ??= _buildHotels();

  static List<LuxHotel> _buildHotels() {
    final out = <LuxHotel>[];
    var photoIdx = 0;

    for (var d = 0; d < _districtSeeds.length; d++) {
      final district = _districtSeeds[d];
      for (var c = 0; c < _categories.length; c++) {
        if (out.length >= 80) break;
        final cat = _categories[c];
        final slot = c + 1;
        final id = 'vegas-hotel-intel-${district.$1}-$slot';
        final placeId = 'hotel-vegas-${district.$1}-$slot';
        out.add(
          LuxHotel(
            id: id,
            placeId: placeId,
            name: '${district.$2} ${cat.$1} $slot',
            neighborhood: '${district.$2} · Las Vegas',
            unsplashPhotoId: _photos[photoIdx++ % _photos.length],
            priceRange: cat.$2,
            luxuryScore: cat.$4,
            familyScore: cat.$5,
            romanceScore: cat.$4 - 4,
            walkabilityScore: cat.$6,
            nightlifeScore: 88 + (c * 2) % 10,
            beachAccessScore: 25 + (c * 3) % 15,
            foodAccessScore: 75 + (c * 3) % 20,
            attractionDistances: {
              'Strip': '${8 + c} min',
              'Downtown': '${15 + d} min',
              'Red Rock': '${25 + d} min',
            },
            bestForTags: cat.$3,
            emotionalDescription: '\${cat.\$1} in \${district.\$2} — Strip access, pool timing, and show-night logistics.',
            hotelWebsiteUrl: 'https://example.com/vegas/$placeId',
            checkRatesUrl: 'https://example.com/vegas/$placeId/rates',
            bookingPartner: 'direct',
            externalId: placeId,
            lastUpdated: DateTime(2026, 5, 31),
            cityPackId: cityId,
            districtId: district.$1,
            nearbyDiningPlaceIds: const ['place-bellagio-fountains', 'place-fremont-street'],
            plannedAttractionTags: ['show', 'nightlife', 'foodie'],
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
            moodTags: ['hotel', 'vegas', ...h.plannedAttractionTags],
            cityPackId: cityId,
            source: LuxPlaceSource.curated,
          ),
      ];

  static (double, double) _coordsFor(String districtId) {
    for (final s in _districtSeeds) {
      if (s.$1 == districtId) return (s.$3, s.$4);
    }
    return (VegasHub.latitude, VegasHub.longitude);
  }

  static LuxHotel? byId(String id) {
    for (final h in all) {
      if (h.id == id) return h;
    }
    return null;
  }
}
