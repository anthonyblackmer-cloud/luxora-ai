import 'package:luxora_ai/data/naples/naples_curated_places.dart';
import 'package:luxora_ai/data/naples/naples_hub.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// Naples stays — beach, boutique, luxury, and family intelligence.
abstract final class NaplesHotelsCatalog {
  static const cityId = NaplesCuratedPlaces.cityId;

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
    ('naples-downtown-naples', 'Downtown Naples', 26.144, -81.79679999999999),
    ('naples-fifth-avenue-south', 'Fifth Avenue South', 26.143, -81.7978),
    ('naples-third-street-south', 'Third Street South', 26.141, -81.7988),
    ('naples-vanderbilt-beach', 'Vanderbilt Beach', 26.177, -81.8098),
    ('naples-mercato', 'Mercato', 26.166999999999998, -81.80279999999999),
    ('naples-naples-pier-area', 'Naples Pier Area', 26.134, -81.8008),
    ('naples-old-naples', 'Old Naples', 26.137999999999998, -81.79979999999999),
    ('naples-park-shore', 'Park Shore', 26.154, -81.8048),
    ('naples-pelican-bay', 'Pelican Bay', 26.16, -81.8068),
    ('naples-marco-island', 'Marco Island', 26.022, -81.7448),
    ('naples-bonita-springs', 'Bonita Springs', 26.221999999999998, -81.81479999999999),
    ('naples-estero-bay', 'Estero Bay', 26.201999999999998, -81.8198),
    ('naples-north-naples', 'North Naples', 26.187, -81.8128),
    ('naples-gulf-shore', 'Gulf Shore', 26.136, -81.80279999999999),
    ('naples-waterside', 'Waterside', 26.145, -81.7928),
    ('naples-tin-city', 'Tin City', 26.147, -81.79079999999999),
    ('naples-crayton-cove', 'Crayton Cove', 26.14, -81.7918),
    ('naples-royal-poinciana', 'Royal Poinciana', 26.141, -81.79679999999999),
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
        final id = 'naples-hotel-intel-${district.$1}-$slot';
        final placeId = 'hotel-naples-${district.$1}-$slot';
        out.add(
          LuxHotel(
            id: id,
            placeId: placeId,
            name: '${district.$2} ${cat.$1} $slot',
            neighborhood: '${district.$2} · Naples',
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
            hotelWebsiteUrl: 'https://example.com/naples/$placeId',
            checkRatesUrl: 'https://example.com/naples/$placeId/rates',
            bookingPartner: 'direct',
            externalId: placeId,
            lastUpdated: DateTime(2026, 5, 31),
            cityPackId: cityId,
            districtId: district.$1,
            nearbyDiningPlaceIds: const ['place-naples-pier', 'place-fifth-avenue-naples'],
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
            moodTags: ['hotel', 'naples', ...h.plannedAttractionTags],
            cityPackId: cityId,
            source: LuxPlaceSource.curated,
          ),
      ];

  static (double, double) _coordsFor(String districtId) {
    for (final s in _districtSeeds) {
      if (s.$1 == districtId) return (s.$3, s.$4);
    }
    return (NaplesHub.latitude, NaplesHub.longitude);
  }

  static LuxHotel? byId(String id) {
    for (final h in all) {
      if (h.id == id) return h;
    }
    return null;
  }
}
