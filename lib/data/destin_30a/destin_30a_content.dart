import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_curated_places.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_feed_items.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_gem_discoveries.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_hotels_catalog.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_local_secrets.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/destin_30a/destin_30a_mood_route.dart';

/// Destin & 30A city pack â€” Emerald Gulf water, Crab Island boats, and 30A bike days.
abstract final class Destin30aContent {
  static const cityId = 'destin-30a';

  static const _photos = [
    'sWK9wki5zHU',
    'X_LNSoZ7xeM',
    'JZYQ_P94T-Q',
    'AK2vwEobto4',
    'eQ2ElhooTjc',
    'RE1uPSyVuls',
    'xEaAoizNFV8',
    'pXe2PzLwVgA',
    'M4RVCkMpb1I',
    'p0vZplFhKYI',
    'z78FxiNCA5w',
    '3i-TsBuiTPk',
  ];

  static const _restaurantStyles = [
    ('Harbor seafood shack', ['seafood', 'waterfront', 'casual', 'family']),
    ('Beach bar & grill', ['beach', 'casual', 'sunset', 'social']),
    ('Gulf fine dining', ['seafood', 'luxury', 'sunset', 'dining']),
    ('Taco & margarita spot', ['casual', 'family', 'beach', 'social']),
    ('Breakfast burrito window', ['local', 'morning', 'casual', 'family']),
    ('Sushi on 30A', ['foodie', 'date-night', 'beach', 'dining']),
    ('Pizza on the square', ['family', 'walkable', 'casual', 'weekend']),
    ('Oyster raw bar', ['seafood', 'foodie', 'local', 'waterfront']),
    ('Coffee & acai', ['local', 'morning', 'beach', 'wellness']),
    ('Chef-driven coastal', ['foodie', 'luxury', 'local', 'dining']),
  ];

  static const _attractionKinds = [
    ('Waterfront walk', LuxPlaceCategory.adventure, ['waterfront', 'walkable', 'scenic']),
    ('Beach park', LuxPlaceCategory.beach, ['beach', 'family', 'sunset']),
    ('Historic landmark', LuxPlaceCategory.adventure, ['culture', 'historic', 'walkable']),
    ('Nature preserve', LuxPlaceCategory.nature, ['nature', 'relaxing', 'photo']),
  ];

  static const _experienceKinds = [
    ('Sunset cruise', ['sunset', 'water', 'romantic', 'cruise']),
    ('Dolphin cruise', ['wildlife', 'water', 'family', 'cruise']),
    ('Kayak tour', ['adventure', 'water', 'nature']),
    ('Fishing charter', ['adventure', 'water', 'local']),
    ('Food tour', ['foodie', 'culture', 'local']),
    ('Boat rental', ['water', 'adventure', 'family']),
    ('Bike rental', ['bike', 'local', 'adventure']),
    ('Snorkel trip', ['beach', 'water', 'adventure']),
  ];

  static List<DistrictPack>? _districts;
  static List<LuxPlace>? _places;
  static List<LuxHotel>? _hotels;
  static List<HiddenGem>? _gems;
  static List<HiddenGem>? _localSecrets;
  static List<FeedItem>? _feed;
  static List<BeachIntelligence>? _beachIntel;
  static List<Destin30aMoodRoute>? _routes;

  static List<DistrictPack> get districts => _districts ??= _buildDistricts();
  static List<LuxPlace> get places => _places ??= _buildAllPlaces();
  static List<LuxHotel> get hotels => _hotels ??= Destin30aHotelsCatalog.all;
  static List<HiddenGem> get gems => _gems ??= _buildGems();
  static List<HiddenGem> get localSecrets =>
      _localSecrets ??= Destin30aLocalSecrets.buildForDistricts(districts);
  static List<FeedItem> get feedItems => _feed ??= destin30aDiscoveryFeed;
  static List<BeachIntelligence> get beachIntelligence =>
      _beachIntel ??= _buildBeachIntel();
  static List<Destin30aMoodRoute> get moodRoutes => _routes ??= _buildMoodRoutes();

  static Map<String, String> get feedItemPlaceIds => kDestin30aFeedItemPlaceIds;
  static Map<String, String> get gemPlaceIds => kDestin30aGemPlaceIds;
  static Map<String, String> get itineraryMomentPlaceIds =>
      kDestin30aItineraryMomentPlaceIds;

  static String _photo(int i) => _photos[i % _photos.length];

  static List<DistrictPack> _buildDistricts() {
    const seeds = [
      ('destin-30a-destin-harbor', 'Destin Harbor', DistrictType.downtown, 'Fishing fleet, harborwalk dining, and emerald water views.', ['waterfront', 'foodie', 'family'], ['families', 'foodie', 'weekend'], 30.3955, -86.4988),
      ('destin-30a-henderson-beach', 'Henderson Beach', DistrictType.beach, 'State park dunes and wide emerald Gulf sand.', ['beach', 'nature', 'family'], ['families', 'beach', 'photo'], 30.3785, -86.5038),
      ('destin-30a-miramar-beach', 'Miramar Beach', DistrictType.beach, 'Resort strip and public beach access along 98.', ['beach', 'family', 'resort'], ['families', 'beach', 'weekend'], 30.3685, -86.5078),
      ('destin-30a-sandestin', 'Sandestin', DistrictType.resort, 'Golf, bay, and beach resort village with tram loops.', ['luxury', 'golf', 'beach'], ['luxury', 'families', 'golf'], 30.3585, -86.5138),
      ('destin-30a-rosemary-beach', 'Rosemary Beach', DistrictType.suburban, 'New Urbanism town center and cobblestone dining.', ['walkable', 'luxury', 'foodie'], ['couples', 'luxury', 'weekend'], 30.3385, -86.52080000000001),
      ('destin-30a-seaside', 'Seaside', DistrictType.suburban, 'Pastel cottages, central square, and Truman Show fame.', ['walkable', 'family', 'iconic'], ['families', 'photo', 'weekend'], 30.3355, -86.52380000000001),
      ('destin-30a-grayton-beach', 'Grayton Beach', DistrictType.beach, 'Old Florida beach town vibe and state park trails.', ['beach', 'local', 'relaxing'], ['couples', 'local', 'beach'], 30.3285, -86.5278),
      ('destin-30a-watercolor', 'WaterColor', DistrictType.resort, 'Coastal lake trails and family-friendly resort calm.', ['family', 'nature', 'beach'], ['families', 'beach', 'relaxing'], 30.3375, -86.5258),
      ('destin-30a-alys-beach', 'Alys Beach', DistrictType.resort, 'White Bermudian architecture and polished quiet luxury.', ['luxury', 'photo', 'romantic'], ['luxury', 'couples', 'photo'], 30.3415, -86.5218),
      ('destin-30a-santa-rosa-beach', 'Santa Rosa Beach', DistrictType.beach, '30A communities hub and dune lake access points.', ['beach', 'family', 'local'], ['families', 'beach', 'weekend'], 30.3455, -86.5198),
      ('destin-30a-30a-east', '30A East', DistrictType.suburban, 'Eastern 30A bike path and quieter rental corridors.', ['local', 'adventure', 'bike'], ['friend-groups', 'local', 'weekend'], 30.3535, -86.5108),
      ('destin-30a-blue-mountain-beach', 'Blue Mountain Beach', DistrictType.beach, 'Highest dune on the Gulf â€” quiet rental enclave.', ['beach', 'hidden', 'relaxing'], ['couples', 'local', 'beach'], 30.3235, -86.5308),
      ('destin-30a-dune-allen', 'Dune Allen', DistrictType.beach, 'Western 30A gateway and dune lake paddling.', ['nature', 'beach', 'adventure'], ['adventure', 'nature', 'family'], 30.348499999999998, -86.5158),
      ('destin-30a-destin-commons', 'Destin Commons', DistrictType.suburban, 'Shopping, dining, and rainy-day indoor backup.', ['family', 'shopping', 'rainy-day'], ['families', 'weekend', 'local'], 30.4015, -86.5008),
      ('destin-30a-crab-island', 'Crab Island', DistrictType.other, 'Sandbar party boats and pontoon day culture.', ['water', 'social', 'adventure'], ['friend-groups', 'adventure', 'summer'], 30.3985, -86.5078),
      ('destin-30a-okaloosa-island', 'Okaloosa Island', DistrictType.beach, 'Boardwalk, pier, and calmer family beach parks.', ['beach', 'family', 'iconic'], ['families', 'beach', 'weekend'], 30.4055, -86.4808),
      ('destin-30a-fort-walton-edge', 'Fort Walton Edge', DistrictType.suburban, 'History museums and bay-side calm west of Destin.', ['culture', 'family', 'local'], ['families', 'culture', 'local'], 30.418499999999998, -86.4758),
      ('destin-30a-inlet-beach', 'Inlet Beach', DistrictType.beach, 'Eastern 30A quiet sands near Panama City edge.', ['beach', 'hidden', 'relaxing'], ['couples', 'local', 'beach'], 30.3185, -86.5338),
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
            north: s.$7 + 0.022,
            south: s.$7 - 0.022,
            east: s.$8 + 0.022,
            west: s.$8 - 0.022,
          ),
        ),
    ];
  }

  static List<LuxPlace> _buildAllPlaces() {
    final out = <LuxPlace>[
      ...Destin30aCuratedPlaces.flagship,
      ...Destin30aHotelsCatalog.hotelPlaces,
    ];
    var idx = 0;

    for (var d = 0; d < districts.length; d++) {
      final dist = districts[d];
      final lat = _districtLat(dist);
      final lng = _districtLng(dist);

      for (var r = 0; r < 9; r++) {
        final style = _restaurantStyles[(d + r) % _restaurantStyles.length];
        out.add(_place(
          id: 'destin-30a-dining-${dist.districtId}-$r',
          title: '${dist.districtName} ${style.$1}',
          category: LuxPlaceCategory.dining,
          lat: lat + (r * 0.0018),
          lng: lng - (r * 0.0012),
          location: '${dist.districtName}, Destin & 30A',
          description:
              'Concierge-curated ${style.$1.toLowerCase()} â€” ${dist.description}',
          moodTags: [...style.$2, 'dining', 'destin-30a'],
          photo: _photo(idx++),
        ));
      }

      for (var a = 0; a < 4; a++) {
        final kind = _attractionKinds[(d + a) % _attractionKinds.length];
        out.add(_place(
          id: 'destin-30a-attr-${dist.districtId}-$a',
          title: '${dist.districtName} ${kind.$1}',
          category: kind.$2,
          lat: lat - (a * 0.0025),
          lng: lng + (a * 0.0018),
          location: '${dist.districtName}, Destin & 30A',
          description: '${kind.$1} â€” ${dist.vibeTags.take(2).join(' & ')} energy.',
          moodTags: [...kind.$3, 'destin-30a'],
          photo: _photo(idx++),
        ));
      }

      for (var e = 0; e < 6; e++) {
        final kind = _experienceKinds[(d + e) % _experienceKinds.length];
        out.add(_place(
          id: 'destin-30a-exp-${dist.districtId}-$e',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (e * 0.003),
          lng: lng + (e * 0.0025),
          location: '${dist.districtName}, Destin & 30A',
          description:
              'Bookable experience â€” ${kind.$1.toLowerCase()} with local operators.',
          moodTags: [...kind.$2, 'experience', 'destin-30a'],
          photo: _photo(idx++),
        ));
      }

      for (var g = 0; g < 6; g++) {
        out.add(_place(
          id: 'destin-30a-gem-place-${dist.districtId}-$g',
          title: 'Hidden ${dist.districtName} ${g + 1}',
          category: g.isEven ? LuxPlaceCategory.beach : LuxPlaceCategory.dining,
          lat: lat + (g * 0.0012),
          lng: lng - (g * 0.0016),
          location: '${dist.districtName} Â· local gem',
          description:
              'Insider-only â€” secret beach, courtyard, or sunset bench worth the detour.',
          moodTags: ['hidden', 'local', 'gem', 'destin-30a'],
          photo: _photo(idx++),
        ));
      }
    }

    return out;
  }

  static List<HiddenGem> _buildGems() {
    final out = <HiddenGem>[...destin30aHiddenGemsCatalog];
    for (final dist in districts) {
      for (var g = 0; g < 6; g++) {
        if (out.length >= 105) break;
        out.add(
          HiddenGem(
            id: 'destin-30a-gem-${dist.districtId}-$g',
            title: 'Hidden ${dist.districtName} ${g + 1}',
            location: '${dist.districtName} Â· Destin & 30A',
            whySpecial:
                'Local-only ${dist.vibeTags.first} spot â€” photogenic, quiet, and off the tourist loop.',
            bestTime: g.isEven ? 'Sunrise Â· weekdays' : 'Golden hour',
            crowdLevel: g.isEven ? 'Low' : 'Moderate weekends',
            insiderTip:
                'Pair with ${dist.districtName} dinner â€” arrive 30 min before peak.',
            localOnlyNote: 'Residents guard this one â€” not in guidebooks.',
            gradient: destin30aHiddenGemsCatalog.first.gradient,
          ),
        );
      }
    }
    return out;
  }

  static List<BeachIntelligence> _buildBeachIntel() {
    final beaches = places.where((p) => p.category == LuxPlaceCategory.beach).toList();
    return [
      for (var i = 0; i < beaches.length; i++)
        BeachIntelligence(
          placeId: beaches[i].id,
          bestTimeToVisit: i.isEven ? 'Before noon Â· calmer water' : 'Sunset golden hour',
          familyFriendlyScore: 55 + (i * 7) % 40,
          crowdScore: 35 + (i * 9) % 50,
          photoScore: 72 + (i * 5) % 26,
          romanceScore: 60 + (i * 8) % 35,
          walkabilityScore: 58 + (i * 6) % 38,
          windSensitivity: 25 + (i * 7) % 45,
          sunsetValue: 80 + (i * 3) % 18,
          sunriseValue: 70 + (i * 4) % 25,
          parkingDifficulty: i.isEven ? 'Moderate' : 'Difficult weekends',
          nearbyRestaurantPlaceIds: places
              .where((p) => p.category == LuxPlaceCategory.dining)
              .skip(i)
              .take(2)
              .map((p) => p.id)
              .toList(),
        ),
    ];
  }

  static List<Destin30aMoodRoute> _buildMoodRoutes() {
    final dining = places.where((p) => p.category == LuxPlaceCategory.dining).toList();
    final beaches = places.where((p) => p.category == LuxPlaceCategory.beach).toList();
    final culture = places.where((p) => p.moodTags.contains('culture')).toList();
    final waterfront = places.where((p) => p.moodTags.contains('waterfront')).toList();

    String pick(List<LuxPlace> list, int i) =>
        list.isEmpty ? dining[i % dining.length].id : list[i % list.length].id;

    const routes = [
      ('Family Beach Weekend', ['family', 'beach', 'full-day', 'weekend']),
      ('Emerald Coast Explorer', ['beach', 'water', 'adventure', 'photo']),
      ('30A Bike & Beach Day', ['bike', 'walkable', 'beach', 'local']),
      ('Crab Island Adventure', ['water', 'social', 'adventure', 'summer']),
      ('Romantic 30A Escape', ['romantic', 'couples', 'luxury', 'sunset']),
      ('Hidden Beaches Route', ['hidden', 'local', 'beach', 'gem']),
      ('Harbor & Seafood Day', ['foodie', 'waterfront', 'local', 'family']),
      ('Sunset Chaser 30A', ['sunset', 'beach', 'photo', 'romantic']),
      ('Luxury Rosemary & Alys', ['luxury', 'walkable', 'foodie', 'couples']),
      ('Rainy Day Destin', ['rainy-day', 'shopping', 'indoor', 'family']),
    ];

    return [
      for (var i = 0; i < routes.length; i++)
        Destin30aMoodRoute(
          routeId: 'destin-30a-route-$i',
          title: routes[i].$1,
          description:
              'Prebuilt Luxora concierge flow â€” ${routes[i].$2.join(', ')}.',
          moodTags: routes[i].$2,
          morningPlaceId: pick(beaches.isNotEmpty ? beaches : waterfront, i),
          lunchPlaceId: pick(dining, i + 1),
          afternoonPlaceId: pick(culture.isNotEmpty ? culture : dining, i + 2),
          dinnerPlaceId: pick(dining, i + 3),
          eveningPlaceId: pick(waterfront.isNotEmpty ? waterfront : beaches, i),
          bestStartTime: i.isEven ? '8:00 AM' : '9:30 AM',
          weatherSensitive: true,
          crowdSensitive: i % 2 == 0,
          estimatedDriveMinutes: 20 + (i * 6) % 40,
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

