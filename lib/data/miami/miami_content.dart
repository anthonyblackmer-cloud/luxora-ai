import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/data/miami/miami_curated_places.dart';
import 'package:luxora_ai/data/miami/miami_feed_items.dart';
import 'package:luxora_ai/data/miami/miami_gem_discoveries.dart';
import 'package:luxora_ai/data/miami/miami_hotels_catalog.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/miami/miami_mood_route.dart';
import 'package:luxora_ai/models/miami/nightlife_venue.dart';

/// Miami city pack — luxury/lifestyle/beach/nightlife/food content plug-in.
abstract final class MiamiContent {
  static const cityId = 'miami';

  static const _photos = [
    'JZYQ_P94T-Q',
    'X_LNSoZ7xeM',
    'eQ2ElhooTjc',
    'AK2vwEobto4',
    'sWK9wki5zHU',
    'xMMA_mtJ8xM',
    'RE1uPSyVuls',
    'RibghBxKlKc',
    'pXe2PzLwVgA',
    'M4RVCkMpb1I',
    'p0vZplFhKYI',
    'z78FxiNCA5w',
    'xEaAoizNFV8',
  ];

  static const _restaurantStyles = [
    ('Cuban classics', ['foodie', 'local', 'culture']),
    ('Waterfront seafood', ['foodie', 'romantic', 'sunset']),
    ('Rooftop dining', ['luxury', 'nightlife', 'sunset']),
    ('Brunch spot', ['social', 'weekend', 'foodie']),
    ('Date-night tasting', ['romantic', 'luxury', 'dining']),
    ('Late-night bites', ['nightlife', 'foodie', 'social']),
    ('Hidden local favorite', ['hidden', 'foodie', 'local']),
    ('Michelin-style tasting', ['luxury', 'foodie', 'iconic']),
  ];

  static const _attractionKinds = [
    ('Beachfront park', LuxPlaceCategory.beach, ['beach', 'relaxing']),
    ('Art & culture stop', LuxPlaceCategory.adventure, ['culture', 'arts']),
    ('Waterfront walk', LuxPlaceCategory.nature, ['scenic', 'walkable']),
    ('Museum gallery', LuxPlaceCategory.adventure, ['culture', 'arts']),
    ('Shopping district', LuxPlaceCategory.adventure, ['luxury', 'social']),
  ];

  static const _experienceKinds = [
    ('Yacht charter', ['luxury', 'adventure', 'water']),
    ('Boat tour', ['adventure', 'scenic', 'water']),
    ('Food tour', ['foodie', 'culture', 'local']),
    ('Spa day', ['wellness', 'luxury', 'relaxing']),
    ('Beach club pass', ['beach', 'luxury', 'social']),
    ('Art walk', ['arts', 'culture', 'walkable']),
    ('Everglades airboat', ['adventure', 'nature', 'day-trip']),
    ('Jet ski rental', ['adventure', 'water', 'social']),
  ];

  static List<DistrictPack>? _districts;
  static List<LuxPlace>? _places;
  static List<LuxHotel>? _hotels;
  static List<HiddenGem>? _gems;
  static List<FeedItem>? _feed;
  static List<NightlifeVenue>? _nightlife;
  static List<BeachIntelligence>? _beachIntel;
  static List<MiamiMoodRoute>? _routes;

  static List<HiddenGem> get gems => _gems ??= miamiHiddenGemsCatalog;

  static List<DistrictPack> get districts => _districts ??= _buildDistricts();
  static List<LuxPlace> get places => _places ??= _buildAllPlaces();
  static List<LuxHotel> get hotels => _hotels ??= MiamiHotelsCatalog.all;
  static List<FeedItem> get feedItems => _feed ??= miamiDiscoveryFeed;
  static List<NightlifeVenue> get nightlife => _nightlife ??= _buildNightlife();
  static List<BeachIntelligence> get beachIntelligence =>
      _beachIntel ??= _buildBeachIntel();
  static List<MiamiMoodRoute> get moodRoutes => _routes ??= _buildMoodRoutes();

  static Map<String, String> get feedItemPlaceIds => kMiamiFeedItemPlaceIds;

  static Map<String, String> get gemPlaceIds => kMiamiGemPlaceIds;

  static Map<String, String> get itineraryMomentPlaceIds =>
      kMiamiItineraryMomentPlaceIds;

  static String _photo(int i) => _photos[i % _photos.length];

  static List<DistrictPack> _buildDistricts() {
    const seeds = [
      (
        'miami-south-beach',
        'South Beach',
        DistrictType.beach,
        'Art deco, Ocean Drive, and sunrise swims.',
        ['luxury', 'beach', 'nightlife', 'social'],
        ['couples', 'nightlife', 'influencers', 'weekend'],
        25.782,
        -80.134,
      ),
      (
        'miami-brickell',
        'Brickell',
        DistrictType.downtown,
        'Skyline towers, bay views, and power dining.',
        ['luxury', 'business', 'nightlife', 'foodie'],
        ['luxury', 'couples', 'friend-groups'],
        25.758,
        -80.193,
      ),
      (
        'miami-wynwood',
        'Wynwood',
        DistrictType.arts,
        'Murals, galleries, and late-night tacos.',
        ['arts', 'foodie', 'social', 'trending'],
        ['foodies', 'friend-groups', 'influencers'],
        25.801,
        -80.199,
      ),
      (
        'miami-design-district',
        'Design District',
        DistrictType.arts,
        'Luxury retail, design galleries, and chef-driven dining.',
        ['luxury', 'shopping', 'arts', 'foodie'],
        ['luxury', 'couples', 'foodies'],
        25.813,
        -80.192,
      ),
      (
        'miami-coconut-grove',
        'Coconut Grove',
        DistrictType.suburban,
        'Banyan shade, sailboats, and relaxed romance.',
        ['romantic', 'waterfront', 'relaxing', 'culture'],
        ['couples', 'luxury', 'weekend'],
        25.727,
        -80.242,
      ),
      (
        'miami-little-havana',
        'Little Havana',
        DistrictType.other,
        'Cuban culture, live music, and cafecito mornings.',
        ['culture', 'foodie', 'local', 'music'],
        ['foodies', 'culture', 'friend-groups'],
        25.765,
        -80.220,
      ),
      (
        'miami-downtown',
        'Downtown Miami',
        DistrictType.downtown,
        'Bayfront energy, museums, and urban waterfront.',
        ['culture', 'waterfront', 'social'],
        ['friend-groups', 'weekend', 'culture'],
        25.775,
        -80.197,
      ),
      (
        'miami-key-biscayne',
        'Key Biscayne',
        DistrictType.beach,
        'Quiet beaches, bike paths, and island calm.',
        ['beach', 'relaxing', 'family', 'nature'],
        ['families', 'couples', 'beach'],
        25.692,
        -80.162,
      ),
      (
        'miami-bal-harbour',
        'Bal Harbour',
        DistrictType.resort,
        'Ultra-luxury shopping and pristine sands.',
        ['luxury', 'beach', 'shopping'],
        ['luxury', 'couples'],
        25.891,
        -80.127,
      ),
      (
        'miami-coral-gables',
        'Coral Gables',
        DistrictType.suburban,
        'Mediterranean elegance and hidden courtyards.',
        ['luxury', 'romantic', 'culture', 'foodie'],
        ['couples', 'luxury', 'foodies'],
        25.721,
        -80.268,
      ),
      (
        'miami-beach',
        'Miami Beach',
        DistrictType.beach,
        'Broad beaches, boardwalks, and resort life.',
        ['beach', 'family', 'social', 'luxury'],
        ['families', 'beach', 'weekend'],
        25.790,
        -80.130,
      ),
      (
        'miami-edgewater',
        'Edgewater',
        DistrictType.downtown,
        'Bay views, modern towers, and local cafés.',
        ['waterfront', 'walkable', 'foodie'],
        ['couples', 'foodies', 'weekend'],
        25.805,
        -80.185,
      ),
      (
        'miami-midtown',
        'Midtown',
        DistrictType.downtown,
        'Walkable dining, design shops, and social brunches.',
        ['foodie', 'social', 'walkable'],
        ['foodies', 'friend-groups'],
        25.807,
        -80.194,
      ),
      (
        'miami-espanola-way',
        'Española Way',
        DistrictType.nightlife,
        'Pedestrian village — European charm and al fresco dinners.',
        ['romantic', 'dining', 'nightlife', 'walkable'],
        ['couples', 'foodies', 'weekend'],
        25.787,
        -80.132,
      ),
      (
        'miami-bayside',
        'Bayside / Bayfront',
        DistrictType.downtown,
        'Harbor views, boat departures, and tourist energy.',
        ['waterfront', 'social', 'family'],
        ['families', 'friend-groups', 'weekend'],
        25.778,
        -80.186,
      ),
    ];

    return [
      for (final s in seeds)
        DistrictPack(
          districtId: s.$1,
          cityId: cityId,
          districtName: s.$2,
          districtType: s.$3,
          description: s.$4,
          vibeTags: s.$5,
          bestFor: s.$6,
          mapBounds: DistrictBounds(
            north: s.$7 + 0.025,
            south: s.$7 - 0.025,
            east: s.$8 + 0.025,
            west: s.$8 - 0.025,
          ),
        ),
    ];
  }

  static List<LuxPlace> _buildAllPlaces() {
    return [
      ...MiamiCuratedPlaces.flagship,
      ...MiamiHotelsCatalog.hotelPlaces,
    ];
  }

  static List<NightlifeVenue> _buildNightlife() {
    final nlPlaces =
        places.where((p) => p.category == LuxPlaceCategory.nightlife).take(25).toList();
    return [
      for (var i = 0; i < nlPlaces.length; i++)
        NightlifeVenue(
          id: 'miami-nightlife-$i',
          name: nlPlaces[i].title,
          neighborhood: nlPlaces[i].location,
          districtId: districts[i % districts.length].districtId,
          placeId: nlPlaces[i].id,
          dressCode: i.isEven ? 'Smart casual — no flip-flops' : 'Upscale chic',
          bestArrivalTime: i % 3 == 0 ? '10:30 PM' : '11:00 PM',
          reservationRecommended: i % 2 == 0,
          priceLevel: 2 + (i % 3),
          vibeTags: ['social', 'music', 'nightlife'],
          musicTags: i.isEven ? ['house', 'latin'] : ['hip-hop', 'open-format'],
          transportNote: 'Rideshare recommended after midnight — limited parking.',
          lateNightFoodPlaceIds: places
              .where((p) => p.moodTags.contains('nightlife') && p.category == LuxPlaceCategory.dining)
              .take(1)
              .map((p) => p.id)
              .toList(),
          websiteUrl: nlPlaces[i].website,
        ),
    ];
  }

  static List<BeachIntelligence> _buildBeachIntel() {
    final beaches = places.where((p) => p.category == LuxPlaceCategory.beach).toList();
    return [
      for (var i = 0; i < beaches.length; i++)
        BeachIntelligence(
          placeId: beaches[i].id,
          bestTimeToVisit: i.isEven ? '8–10 AM weekdays' : 'Sunset golden hour',
          familyFriendlyScore: 50 + (i * 7) % 45,
          crowdScore: 40 + (i * 11) % 55,
          photoScore: 70 + (i * 5) % 28,
          romanceScore: 55 + (i * 9) % 40,
          walkabilityScore: 60 + (i * 6) % 35,
          windSensitivity: 30 + (i * 8) % 50,
          sunsetValue: 75 + (i * 4) % 24,
          sunriseValue: 65 + (i * 3) % 30,
          parkingDifficulty: i.isEven ? 'Difficult' : 'Moderate',
          nearbyRestaurantPlaceIds: places
              .where((p) => p.category == LuxPlaceCategory.dining)
              .skip(i)
              .take(2)
              .map((p) => p.id)
              .toList(),
        ),
    ];
  }

  static List<MiamiMoodRoute> _buildMoodRoutes() {
    final dining = places.where((p) => p.category == LuxPlaceCategory.dining).toList();
    final beaches = places.where((p) => p.category == LuxPlaceCategory.beach).toList();
    final nightlife = places.where((p) => p.category == LuxPlaceCategory.nightlife).toList();
    final culture = places.where((p) => p.moodTags.contains('culture')).toList();

    String pick(List<LuxPlace> list, int i) => list[i % list.length].id;

    const routes = [
      ('Romantic Miami Escape', ['romantic', 'couples', 'luxury']),
      ('Luxury Miami Weekend', ['luxury', 'weekend', 'foodie']),
      ('South Beach Social Day', ['social', 'beach', 'nightlife']),
      ('Wynwood Art + Food Route', ['arts', 'foodie', 'culture']),
      ('Little Havana Culture Route', ['culture', 'local', 'foodie']),
      ('Hidden Local Miami', ['hidden', 'local', 'gem']),
      ('Beach + Brunch Day', ['beach', 'brunch', 'relaxing']),
      ('Rooftop Sunset Night', ['sunset', 'nightlife', 'luxury']),
      ('Girls Weekend Miami', ['social', 'weekend', 'nightlife']),
      ('Family-Friendly Miami', ['family', 'beach', 'culture']),
      ('Rainy-Day Miami', ['indoor', 'culture', 'foodie']),
      ('Influencer Photo Route', ['creator', 'photo', 'trending']),
      ('Luxury on a Budget Miami', ['luxury', 'value', 'local']),
    ];

    return [
      for (var i = 0; i < routes.length; i++)
        MiamiMoodRoute(
          routeId: 'miami-route-$i',
          title: routes[i].$1,
          description: 'Prebuilt Luxora concierge flow — ${routes[i].$2.join(', ')}.',
          moodTags: routes[i].$2,
          morningPlaceId: pick(beaches.isNotEmpty ? beaches : dining, i),
          lunchPlaceId: pick(dining, i + 1),
          afternoonPlaceId: pick(culture.isNotEmpty ? culture : dining, i + 2),
          dinnerPlaceId: pick(dining, i + 3),
          eveningPlaceId: pick(nightlife.isNotEmpty ? nightlife : dining, i),
          bestStartTime: i.isEven ? '9:00 AM' : '10:30 AM',
          weatherSensitive: i % 3 != 1,
          crowdSensitive: i % 2 == 0,
          estimatedDriveMinutes: 25 + (i * 7) % 35,
        ),
    ];
  }

  static LuxPlace _place({
    required String id,
    required String title,
    required LuxPlaceCategory category,
    required double lat,
    required double lng,
    required String location,
    required String description,
    required List<String> moodTags,
    required String photo,
  }) {
    return LuxPlace(
      id: id,
      slug: id,
      title: title,
      category: category,
      unsplashPhotoId: photo,
      location: location,
      latitude: lat,
      longitude: lng,
      description: description,
      moodTags: moodTags,
      cityPackId: cityId,
    );
  }

  static double _districtLat(DistrictPack d) =>
      (d.mapBounds!.north + d.mapBounds!.south) / 2;

  static double _districtLng(DistrictPack d) =>
      (d.mapBounds!.east + d.mapBounds!.west) / 2;
}
