import 'package:luxora_ai/data/miami/miami_curated_places.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// Miami MVP stays — curated for concierge intelligence, not OTA inventory.
abstract final class MiamiHotelsCatalog {
  static const cityId = MiamiCuratedPlaces.cityId;

  static final List<LuxHotel> all = [
    LuxHotel(
      id: 'miami-hotel-intel-fontainebleau',
      placeId: 'hotel-fontainebleau-miami',
      name: 'Fontainebleau Miami Beach',
      neighborhood: 'Mid-Beach · Collins Ave',
      unsplashPhotoId: 'qQFzQyt2ur0',
      priceRange: HotelPriceRange.luxury,
      luxuryScore: 96,
      familyScore: 72,
      romanceScore: 88,
      walkabilityScore: 55,
      nightlifeScore: 95,
      beachAccessScore: 92,
      foodAccessScore: 90,
      attractionDistances: {
        'South Beach': '8 min',
        'Wynwood': '18 min',
        'Brickell': '15 min',
      },
      bestForTags: [
        HotelBestForTag.bestForCouples,
        HotelBestForTag.luxuryStaycation,
        HotelBestForTag.resortFeel,
      ],
      emotionalDescription:
          'Iconic curved tower on Collins — pool decks, LIV nights, and the Miami Beach fantasy at full volume.',
      hotelWebsiteUrl: 'https://www.fontainebleau.com/',
      checkRatesUrl: 'https://www.fontainebleau.com/stay',
      bookingPartner: 'direct',
      externalId: 'fontainebleau-miami-beach',
      lastUpdated: DateTime(2026, 5, 29),
      cityPackId: cityId,
      districtId: 'miami-south-beach',
      nearbyDiningPlaceIds: ['dining-miami-joes-stone-crab', 'dining-miami-komodo'],
      plannedAttractionTags: ['luxury', 'nightlife', 'beach', 'social'],
    ),
    LuxHotel(
      id: 'miami-hotel-intel-1-hotel',
      placeId: 'hotel-1-hotel-south-beach',
      name: '1 Hotel South Beach',
      neighborhood: 'South Beach · Collins Ave',
      unsplashPhotoId: 'V8YLE7LEjOY',
      priceRange: HotelPriceRange.luxury,
      luxuryScore: 94,
      familyScore: 78,
      romanceScore: 90,
      walkabilityScore: 70,
      nightlifeScore: 75,
      beachAccessScore: 98,
      foodAccessScore: 85,
      attractionDistances: {
        'Ocean Drive': '5 min walk',
        'Wynwood': '20 min',
        'Design District': '22 min',
      },
      bestForTags: [
        HotelBestForTag.bestForCouples,
        HotelBestForTag.luxuryStaycation,
        HotelBestForTag.walkableDining,
      ],
      emotionalDescription:
          'Reclaimed-wood calm steps from the sand — wellness mornings, rooftop sunsets, and eco-luxury without the flash.',
      hotelWebsiteUrl: 'https://www.1hotels.com/south-beach',
      checkRatesUrl: 'https://www.1hotels.com/south-beach/rooms',
      bookingPartner: 'direct',
      externalId: '1-hotel-south-beach',
      lastUpdated: DateTime(2026, 5, 29),
      cityPackId: cityId,
      districtId: 'miami-south-beach',
      nearbyDiningPlaceIds: ['dining-miami-joes-stone-crab', 'place-miami-espanolola-way'],
      plannedAttractionTags: ['beach', 'wellness', 'romantic', 'luxury'],
    ),
    LuxHotel(
      id: 'miami-hotel-intel-faena',
      placeId: 'hotel-faena-miami-beach',
      name: 'Faena Hotel Miami Beach',
      neighborhood: 'Mid-Beach · Collins Ave',
      unsplashPhotoId: 'xEaAoizNFV8',
      priceRange: HotelPriceRange.luxury,
      luxuryScore: 98,
      familyScore: 55,
      romanceScore: 96,
      walkabilityScore: 50,
      nightlifeScore: 82,
      beachAccessScore: 88,
      foodAccessScore: 95,
      attractionDistances: {
        'South Beach': '10 min',
        'Design District': '18 min',
        'Brickell': '16 min',
      },
      bestForTags: [
        HotelBestForTag.bestForCouples,
        HotelBestForTag.luxuryStaycation,
        HotelBestForTag.quietEscape,
      ],
      emotionalDescription:
          'Gilded maximalism on the beach — Damien Hirst in the lobby, candlelit dinners, and unapologetic glamour.',
      hotelWebsiteUrl: 'https://www.faena.com/miami-beach',
      checkRatesUrl: 'https://www.faena.com/miami-beach/hotel',
      bookingPartner: 'direct',
      externalId: 'faena-miami-beach',
      lastUpdated: DateTime(2026, 5, 29),
      cityPackId: cityId,
      districtId: 'miami-south-beach',
      nearbyDiningPlaceIds: ['dining-miami-joes-stone-crab'],
      plannedAttractionTags: ['luxury', 'romantic', 'foodie', 'arts'],
    ),
    LuxHotel(
      id: 'miami-hotel-intel-w-south-beach',
      placeId: 'hotel-w-south-beach',
      name: 'W South Beach',
      neighborhood: 'South Beach · Collins Ave',
      unsplashPhotoId: 'kHP6Lfd8e_0',
      priceRange: HotelPriceRange.luxury,
      luxuryScore: 90,
      familyScore: 58,
      romanceScore: 82,
      walkabilityScore: 88,
      nightlifeScore: 92,
      beachAccessScore: 95,
      foodAccessScore: 80,
      attractionDistances: {
        'Ocean Drive': '3 min walk',
        'Wynwood': '18 min',
        'Brickell': '14 min',
      },
      bestForTags: [
        HotelBestForTag.bestForCouples,
        HotelBestForTag.walkableDining,
        HotelBestForTag.resortFeel,
      ],
      emotionalDescription:
          'Design-forward energy on the sand — pool scene by day, Collins Ave nights, and South Beach at your doorstep.',
      hotelWebsiteUrl: 'https://www.marriott.com/en-us/hotels/miaws-w-south-beach/overview/',
      checkRatesUrl:
          'https://www.marriott.com/en-us/hotels/miaws-w-south-beach/rooms/',
      bookingPartner: 'marriott',
      externalId: 'w-south-beach',
      lastUpdated: DateTime(2026, 5, 29),
      cityPackId: cityId,
      districtId: 'miami-south-beach',
      nearbyDiningPlaceIds: ['place-miami-espanolola-way', 'dining-miami-joes-stone-crab'],
      plannedAttractionTags: ['nightlife', 'beach', 'social', 'luxury'],
    ),
    LuxHotel(
      id: 'miami-hotel-intel-four-seasons-surf-club',
      placeId: 'hotel-four-seasons-surf-club',
      name: 'Four Seasons at The Surf Club',
      neighborhood: 'Surfside · Collins Ave',
      unsplashPhotoId: 'AK2vwEobto4',
      priceRange: HotelPriceRange.luxury,
      luxuryScore: 97,
      familyScore: 80,
      romanceScore: 94,
      walkabilityScore: 45,
      nightlifeScore: 60,
      beachAccessScore: 90,
      foodAccessScore: 88,
      attractionDistances: {
        'South Beach': '15 min',
        'Design District': '20 min',
        'Bal Harbour': '5 min',
      },
      bestForTags: [
        HotelBestForTag.bestForCouples,
        HotelBestForTag.quietEscape,
        HotelBestForTag.luxuryStaycation,
      ],
      emotionalDescription:
          'Restored 1930s surf club elegance — hushed pool days, Michelin-adjacent dining, and Miami without the noise.',
      hotelWebsiteUrl: 'https://www.fourseasons.com/surfside/',
      checkRatesUrl: 'https://www.fourseasons.com/surfside/',
      bookingPartner: 'direct',
      externalId: 'four-seasons-surf-club',
      lastUpdated: DateTime(2026, 5, 29),
      cityPackId: cityId,
      districtId: 'miami-south-beach',
      nearbyDiningPlaceIds: ['dining-miami-mandolin'],
      plannedAttractionTags: ['luxury', 'romantic', 'beach', 'wellness'],
    ),
    LuxHotel(
      id: 'miami-hotel-intel-betsy',
      placeId: 'hotel-betsy-south-beach',
      name: 'The Betsy South Beach',
      neighborhood: 'South Beach · Ocean Drive',
      unsplashPhotoId: 'RibghBxKlKc',
      priceRange: HotelPriceRange.upscale,
      luxuryScore: 84,
      romanceScore: 92,
      familyScore: 62,
      walkabilityScore: 95,
      nightlifeScore: 70,
      beachAccessScore: 85,
      foodAccessScore: 82,
      attractionDistances: {
        'Ocean Drive': '1 min walk',
        'Lummus Park': '3 min walk',
        'Wynwood': '20 min',
      },
      bestForTags: [
        HotelBestForTag.bestForCouples,
        HotelBestForTag.walkableDining,
        HotelBestForTag.quietEscape,
      ],
      emotionalDescription:
          'Boutique colonnade on Ocean Drive — rooftop poetry readings, beach across the street, and cultured calm.',
      hotelWebsiteUrl: 'https://www.thebetsyhotel.com/',
      checkRatesUrl: 'https://www.thebetsyhotel.com/stay',
      bookingPartner: 'direct',
      externalId: 'betsy-south-beach',
      lastUpdated: DateTime(2026, 5, 29),
      cityPackId: cityId,
      districtId: 'miami-south-beach',
      nearbyDiningPlaceIds: ['place-miami-espanolola-way', 'dining-miami-joes-stone-crab'],
      plannedAttractionTags: ['romantic', 'culture', 'beach', 'walkable'],
    ),
  ];

  /// Map pins for hotel intelligence — one per catalog entry.
  static List<LuxPlace> hotelPlaces = [
    for (final h in all)
      LuxPlace(
        id: h.placeId,
        slug: h.placeId,
        title: h.name,
        category: LuxPlaceCategory.hotel,
        unsplashPhotoId: h.unsplashPhotoId,
        location: h.neighborhood,
        latitude: _coordsFor(h.placeId).$1,
        longitude: _coordsFor(h.placeId).$2,
        description: h.emotionalDescription,
        moodTags: ['hotel', 'luxury', 'miami', ...h.plannedAttractionTags],
        cityPackId: cityId,
        source: LuxPlaceSource.curated,
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

  static (double, double) _coordsFor(String placeId) => switch (placeId) {
        'hotel-fontainebleau-miami' => (25.8167, -80.1225),
        'hotel-1-hotel-south-beach' => (25.7920, -80.1290),
        'hotel-faena-miami-beach' => (25.8145, -80.1220),
        'hotel-w-south-beach' => (25.7905, -80.1305),
        'hotel-four-seasons-surf-club' => (25.8785, -80.1210),
        'hotel-betsy-south-beach' => (25.7810, -80.1295),
        _ => (25.7617, -80.1918),
      };
}
