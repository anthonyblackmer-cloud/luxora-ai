import 'package:luxora_ai/data/florida_keys/florida_keys_curated_places.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// Florida Keys stays — waterfront resorts, boutiques, and fishing lodges.
abstract final class FloridaKeysHotelsCatalog {
  static const cityId = FloridaKeysCuratedPlaces.cityId;

  static const _photos = [
    'AK2vwEobto4',
    'X_LNSoZ7xeM',
    'eQ2ElhooTjc',
    'sWK9wki5zHU',
    'JZYQ_P94T-Q',
    'xEaAoizNFV8',
    'RibghBxKlKc',
    'p0vZplFhKYI',
  ];

  static const _flagship = [
    (
      'keys-hotel-intel-baker-s',
      'hotel-bakers-cay-key-largo',
      'Baker\'s Cay Resort Key Largo',
      'Key Largo · Curated Collection',
      'keys-key-largo',
      HotelPriceRange.luxury,
      92,
      85,
      88,
      45,
      55,
      90,
      82,
      ['fishing', 'water', 'romantic', 'luxury'],
    ),
    (
      'keys-hotel-intel-playa-largo',
      'hotel-playa-largo-key-largo',
      'Playa Largo Resort & Spa',
      'Key Largo · Autograph Collection',
      'keys-key-largo',
      HotelPriceRange.luxury,
      94,
      80,
      90,
      40,
      50,
      88,
      85,
      ['luxury', 'wellness', 'romantic', 'water'],
    ),
    (
      'keys-hotel-intel-chesapeake',
      'hotel-chesapeake-islamorada',
      'Chesapeake Resort & Spa',
      'Islamorada, FL',
      'keys-islamorada',
      HotelPriceRange.luxury,
      90,
      72,
      92,
      35,
      45,
      85,
      80,
      ['romantic', 'waterfront', 'wellness', 'luxury'],
    ),
    (
      'keys-hotel-intel-amara',
      'hotel-amara-cay-islamorada',
      'Amara Cay Resort',
      'Islamorada, FL',
      'keys-islamorada',
      HotelPriceRange.upscale,
      86,
      78,
      88,
      38,
      42,
      82,
      78,
      ['family', 'water', 'relaxing', 'beach'],
    ),
    (
      'keys-hotel-intel-isla-bella',
      'hotel-isla-bella-marathon',
      'Isla Bella Beach Resort',
      'Marathon, FL · Seven Mile Bridge',
      'keys-marathon',
      HotelPriceRange.luxury,
      96,
      82,
      94,
      42,
      48,
      95,
      88,
      ['luxury', 'beach', 'romantic', 'family'],
    ),
    (
      'keys-hotel-intel-hawks-cay',
      'hotel-hawks-cay-duck-key',
      'Hawks Cay Resort',
      'Duck Key · Marathon area',
      'keys-marathon',
      HotelPriceRange.luxury,
      93,
      88,
      85,
      40,
      52,
      92,
      84,
      ['family', 'water', 'resort', 'adventure'],
    ),
    (
      'keys-hotel-intel-parmer-place',
      'hotel-parmer-place-marathon',
      'Parmer\'s Resort',
      'Marathon, FL',
      'keys-marathon',
      HotelPriceRange.upscale,
      84,
      75,
      86,
      45,
      40,
      80,
      76,
      ['family', 'fishing', 'local', 'waterfront'],
    ),
    (
      'keys-hotel-intel-little-palm',
      'hotel-little-palm-island',
      'Little Palm Island Resort & Spa',
      'Little Torch Key · private island',
      'keys-big-pine',
      HotelPriceRange.luxury,
      99,
      55,
      98,
      20,
      25,
      95,
      90,
      ['luxury', 'romantic', 'quiet', 'water'],
    ),
    (
      'keys-hotel-intel-sunset-key',
      'hotel-sunset-key-cottages',
      'Sunset Key Cottages',
      'Sunset Key, Key West',
      'keys-key-west',
      HotelPriceRange.luxury,
      97,
      70,
      96,
      30,
      35,
      92,
      94,
      ['luxury', 'romantic', 'beach', 'sunset'],
    ),
    (
      'keys-hotel-intel-reach',
      'hotel-the-reach-key-west',
      'The Reach Key West, Curio Collection',
      'Key West, FL',
      'keys-key-west',
      HotelPriceRange.luxury,
      91,
      76,
      89,
      72,
      68,
      88,
      86,
      ['beach', 'walkable', 'luxury', 'romantic'],
    ),
    (
      'keys-hotel-intel-casa-marina',
      'hotel-casa-marina-key-west',
      'Casa Marina Key West, Curio Collection',
      'Key West, FL',
      'keys-key-west',
      HotelPriceRange.luxury,
      90,
      74,
      87,
      68,
      70,
      90,
      85,
      ['beach', 'historic', 'luxury', 'walkable'],
    ),
    (
      'keys-hotel-intel-pier-house',
      'hotel-pier-house-key-west',
      'Pier House Resort & Spa',
      'Key West, FL · Old Town',
      'keys-key-west',
      HotelPriceRange.upscale,
      85,
      65,
      84,
      88,
      82,
      75,
      88,
      ['nightlife', 'walkable', 'social', 'waterfront'],
    ),
  ];

  static const _expandedStyles = [
    ('Waterfront boutique', HotelPriceRange.upscale, 'keys-key-largo', 82, 78, 86),
    ('Fishing lodge', HotelPriceRange.moderate, 'keys-islamorada', 70, 72, 88),
    ('Island resort', HotelPriceRange.luxury, 'keys-marathon', 92, 80, 90),
    ('Beach cottage cluster', HotelPriceRange.moderate, 'keys-big-pine', 75, 85, 82),
    ('Historic inn', HotelPriceRange.upscale, 'keys-key-west', 80, 68, 70),
    ('Marina hotel', HotelPriceRange.moderate, 'keys-islamorada', 72, 70, 92),
    ('Eco-lodge', HotelPriceRange.upscale, 'keys-key-largo', 78, 82, 80),
    ('Romantic escape', HotelPriceRange.luxury, 'keys-key-west', 94, 60, 85),
  ];

  static List<LuxHotel> get all => _all ??= _buildAll();
  static List<LuxHotel>? _all;

  static List<LuxHotel> _buildAll() {
    final out = <LuxHotel>[];
    for (final f in _flagship) {
      out.add(_hotel(
        id: f.$1,
        placeId: f.$2,
        name: f.$3,
        neighborhood: f.$4,
        districtId: f.$5,
        priceRange: f.$6,
        luxuryScore: f.$7,
        familyScore: f.$8,
        romanceScore: f.$9,
        walkabilityScore: f.$10,
        nightlifeScore: f.$11,
        beachAccessScore: f.$12,
        foodAccessScore: f.$13,
        tags: f.$14,
        photo: _photos[out.length % _photos.length],
      ));
    }

    var n = 0;
    while (out.length < 65) {
      final style = _expandedStyles[n % _expandedStyles.length];
      final district = style.$3;
      final districtLabel = _districtLabel(district);
      out.add(_hotel(
        id: 'keys-hotel-intel-gen-$n',
        placeId: 'hotel-keys-gen-$n',
        name: '$districtLabel ${style.$1} ${n + 1}',
        neighborhood: '$districtLabel · US-1 corridor',
        districtId: district,
        priceRange: style.$2,
        luxuryScore: style.$4,
        familyScore: style.$5,
        romanceScore: style.$6,
        walkabilityScore: 35 + (n * 3) % 40,
        nightlifeScore: 30 + (n * 5) % 50,
        beachAccessScore: 60 + (n * 4) % 35,
        foodAccessScore: 65 + (n * 6) % 30,
        tags: ['waterfront', 'keys', 'island'],
        photo: _photos[n % _photos.length],
      ));
      n++;
    }
    return out;
  }

  static String _districtLabel(String districtId) => switch (districtId) {
        'keys-key-largo' => 'Key Largo',
        'keys-islamorada' => 'Islamorada',
        'keys-marathon' => 'Marathon',
        'keys-big-pine' => 'Big Pine Key',
        _ => 'Key West',
      };

  static LuxHotel _hotel({
    required String id,
    required String placeId,
    required String name,
    required String neighborhood,
    required String districtId,
    required HotelPriceRange priceRange,
    required int luxuryScore,
    required int familyScore,
    required int romanceScore,
    required int walkabilityScore,
    required int nightlifeScore,
    required int beachAccessScore,
    required int foodAccessScore,
    required List<String> tags,
    required String photo,
  }) {
    return LuxHotel(
      id: id,
      placeId: placeId,
      name: name,
      neighborhood: neighborhood,
      unsplashPhotoId: photo,
      priceRange: priceRange,
      luxuryScore: luxuryScore,
      familyScore: familyScore,
      romanceScore: romanceScore,
      walkabilityScore: walkabilityScore,
      nightlifeScore: nightlifeScore,
      beachAccessScore: beachAccessScore,
      foodAccessScore: foodAccessScore,
      attractionDistances: {
        'Snorkel reef': '${15 + luxuryScore % 20} min',
        'Sunset spot': '${10 + romanceScore % 25} min',
      },
      bestForTags: [
        if (romanceScore > 85) HotelBestForTag.bestForCouples,
        if (familyScore > 80) HotelBestForTag.familyFriendly,
        if (luxuryScore > 90) HotelBestForTag.luxuryStaycation,
        if (walkabilityScore > 70) HotelBestForTag.walkableDining,
      ],
      emotionalDescription:
          'Island-calibrated stay — ${tags.take(2).join(' & ')} pacing with Keys concierge intelligence.',
      hotelWebsiteUrl: 'https://example.com/$placeId',
      checkRatesUrl: 'https://example.com/$placeId/rates',
      bookingPartner: 'direct',
      externalId: placeId,
      lastUpdated: DateTime(2026, 5, 29),
      cityPackId: cityId,
      districtId: districtId,
      nearbyDiningPlaceIds: ['place-keys-hogfish-bar', 'place-keys-louies-backyard'],
      plannedAttractionTags: tags,
    );
  }

  static List<LuxPlace> get hotelPlaces => [
        for (var i = 0; i < all.length; i++)
          LuxPlace(
            id: all[i].placeId,
            slug: all[i].placeId,
            title: all[i].name,
            category: LuxPlaceCategory.hotel,
            unsplashPhotoId: all[i].unsplashPhotoId,
            location: all[i].neighborhood,
            latitude: _coordsFor(all[i].districtId ?? 'keys-key-west', i).$1,
            longitude: _coordsFor(all[i].districtId ?? 'keys-key-west', i).$2,
            description: all[i].emotionalDescription,
            moodTags: ['hotel', 'keys', 'waterfront', ...all[i].plannedAttractionTags],
            cityPackId: cityId,
            source: LuxPlaceSource.curated,
          ),
      ];

  static (double, double) _coordsFor(String districtId, int i) {
    final base = switch (districtId) {
      'keys-key-largo' => (25.086, -80.447),
      'keys-islamorada' => (24.924, -80.628),
      'keys-marathon' => (24.714, -81.078),
      'keys-big-pine' => (24.671, -81.365),
      _ => (24.555, -81.782),
    };
    final offset = (i % 7) * 0.003;
    return (base.$1 + offset, base.$2 - offset);
  }

  static LuxHotel? byId(String id) {
    for (final h in all) {
      if (h.id == id) return h;
    }
    return null;
  }
}
