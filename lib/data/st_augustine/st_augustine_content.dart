import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_curated_places.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_feed_items.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_gem_discoveries.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_hotels_catalog.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_local_secrets.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/st_augustine/st_augustine_mood_route.dart';

/// St. Augustine city pack â€” Historic streets, coastal romance, ghost tours, and walkable colonial charm.
abstract final class StAugustineContent {
  static const cityId = 'st-augustine';

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
    ('Historic tavern', ['foodie', 'historic', 'local', 'casual']),
    ('Waterfront seafood', ['seafood', 'sunset', 'waterfront', 'foodie']),
    ('Spanish tapas', ['foodie', 'culture', 'romantic', 'dining']),
    ('Ghost tour pub', ['nightlife', 'historic', 'local', 'social']),
    ('Coffee roastery', ['local', 'walkable', 'morning', 'hidden']),
    ('Farm-to-table bistro', ['foodie', 'romantic', 'local', 'dining']),
    ('Oyster bar', ['seafood', 'waterfront', 'social', 'foodie']),
    ('Courtyard wine bar', ['romantic', 'hidden', 'date-night', 'dining']),
    ('Cuban cafÃ©', ['foodie', 'local', 'casual', 'culture']),
    ('Fine dining colonial', ['luxury', 'romantic', 'historic', 'dining']),
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
  static List<StAugustineMoodRoute>? _routes;

  static List<DistrictPack> get districts => _districts ??= _buildDistricts();
  static List<LuxPlace> get places => _places ??= _buildAllPlaces();
  static List<LuxHotel> get hotels => _hotels ??= StAugustineHotelsCatalog.all;
  static List<HiddenGem> get gems => _gems ??= _buildGems();
  static List<HiddenGem> get localSecrets =>
      _localSecrets ??= StAugustineLocalSecrets.buildForDistricts(districts);
  static List<FeedItem> get feedItems => _feed ??= stAugustineDiscoveryFeed;
  static List<BeachIntelligence> get beachIntelligence =>
      _beachIntel ??= _buildBeachIntel();
  static List<StAugustineMoodRoute> get moodRoutes => _routes ??= _buildMoodRoutes();

  static Map<String, String> get feedItemPlaceIds => kStAugustineFeedItemPlaceIds;
  static Map<String, String> get gemPlaceIds => kStAugustineGemPlaceIds;
  static Map<String, String> get itineraryMomentPlaceIds =>
      kStAugustineItineraryMomentPlaceIds;

  static String _photo(int i) => _photos[i % _photos.length];

  static List<DistrictPack> _buildDistricts() {
    const seeds = [
      ('st-augustine-historic-district', 'Historic District', DistrictType.other, 'America\'s oldest streets, coquina walls, and lantern-lit evenings.', ['historic', 'walkable', 'romantic'], ['couples', 'culture', 'weekend'], 29.898600000000002, -81.3175),
      ('st-augustine-st-george-street', 'St. George Street', DistrictType.downtown, 'Pedestrian spine of shops, courtyards, and living history performers.', ['walkable', 'historic', 'foodie'], ['families', 'weekend', 'culture'], 29.8966, -81.3155),
      ('st-augustine-anastasia-island', 'Anastasia Island', DistrictType.beach, 'Dunes, state park trails, and quieter Atlantic swims across the bridge.', ['beach', 'nature', 'family'], ['families', 'beach', 'weekend'], 29.8766, -81.3025),
      ('st-augustine-vilano-beach', 'Vilano Beach', DistrictType.beach, 'Inlet views, surf culture, and sunset decks north of the Matanzas.', ['beach', 'sunset', 'local'], ['couples', 'beach', 'local'], 29.9166, -81.3065),
      ('st-augustine-downtown-waterfront', 'Downtown Waterfront', DistrictType.downtown, 'Marina walks, bay breezes, and harbor dining along the Matanzas River.', ['waterfront', 'walkable', 'sunset'], ['couples', 'foodie', 'weekend'], 29.8956, -81.31049999999999),
      ('st-augustine-lincolnville', 'Lincolnville', DistrictType.other, 'Historic African-American heritage, galleries, and quiet residential charm.', ['culture', 'historic', 'local'], ['culture', 'local', 'weekend'], 29.8886, -81.32249999999999),
      ('st-augustine-castillo-district', 'Castillo District', DistrictType.other, 'Fort views, cannon demos, and coquina ramparts defining the skyline.', ['historic', 'iconic', 'family'], ['families', 'culture', 'weekend'], 29.8996, -81.3125),
      ('st-augustine-lighthouse-area', 'Lighthouse Area', DistrictType.beach, 'St. Augustine Lighthouse climbs and maritime museum energy.', ['historic', 'photo', 'coastal'], ['families', 'photo', 'weekend'], 29.8826, -81.2995),
      ('st-augustine-uptown-antique', 'Uptown Antique', DistrictType.suburban, 'San Marco antiques, cafÃ©s, and slower-paced browsing north of downtown.', ['local', 'walkable', 'romantic'], ['couples', 'weekend', 'local'], 29.9066, -81.3205),
      ('st-augustine-st-augustine-beach', 'St Augustine Beach', DistrictType.beach, 'Classic Atlantic beach town pier, tacos, and family sand days.', ['beach', 'family', 'casual'], ['families', 'beach', 'weekend'], 29.869600000000002, -81.2965),
      ('st-augustine-aviles-street', 'Aviles Street', DistrictType.arts, 'Oldest platted street in the U.S. â€” art studios and intimate courtyards.', ['arts', 'historic', 'hidden'], ['culture', 'couples', 'photo'], 29.8976, -81.31649999999999),
      ('st-augustine-spanish-quarter', 'Spanish Quarter', DistrictType.other, 'Living history village and colonial craft demonstrations.', ['historic', 'family', 'culture'], ['families', 'culture', 'weekend'], 29.898600000000002, -81.31349999999999),
      ('st-augustine-flagler-legacy', 'Flagler Legacy', DistrictType.resort, 'Flagler-era hotels, college campus beauty, and gilded-age architecture.', ['luxury', 'historic', 'romantic'], ['couples', 'luxury', 'culture'], 29.9006, -81.3185),
      ('st-augustine-san-marco-avenue', 'San Marco Avenue', DistrictType.suburban, 'Tree-lined dining strip connecting uptown to the historic core.', ['foodie', 'walkable', 'local'], ['foodies', 'weekend', 'local'], 29.9036, -81.31949999999999),
      ('st-augustine-matanzas-inlet', 'Matanzas Inlet', DistrictType.beach, 'Inlet fishing, sandbars, and dramatic tidal shifts at the river mouth.', ['nature', 'adventure', 'photo'], ['adventure', 'local', 'photo'], 29.9226, -81.29249999999999),
      ('st-augustine-cathedral-quarter', 'Cathedral Quarter', DistrictType.other, 'Plaza cathedral bells, courtyards, and Spanish colonial symmetry.', ['historic', 'romantic', 'walkable'], ['couples', 'culture', 'weekend'], 29.8976, -81.3175),
      ('st-augustine-mission-district', 'Mission District', DistrictType.other, 'Mission Nombre de Dios grounds and peaceful riverfront reflection.', ['historic', 'relaxing', 'spiritual'], ['couples', 'culture', 'wellness'], 29.9026, -81.3085),
      ('st-augustine-ponte-vedra-edge', 'Ponte Vedra Edge', DistrictType.suburban, 'Upscale coastal golf edge â€” resort calm a short drive south.', ['luxury', 'golf', 'beach'], ['luxury', 'couples', 'golf'], 29.8496, -81.2795),
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
      ...StAugustineCuratedPlaces.flagship,
      ...StAugustineHotelsCatalog.hotelPlaces,
    ];
    var idx = 0;

    for (var d = 0; d < districts.length; d++) {
      final dist = districts[d];
      final lat = _districtLat(dist);
      final lng = _districtLng(dist);

      for (var r = 0; r < 9; r++) {
        final style = _restaurantStyles[(d + r) % _restaurantStyles.length];
        out.add(_place(
          id: 'st-augustine-dining-${dist.districtId}-$r',
          title: '${dist.districtName} ${style.$1}',
          category: LuxPlaceCategory.dining,
          lat: lat + (r * 0.0018),
          lng: lng - (r * 0.0012),
          location: '${dist.districtName}, St. Augustine',
          description:
              'Concierge-curated ${style.$1.toLowerCase()} â€” ${dist.description}',
          moodTags: [...style.$2, 'dining', 'st-augustine'],
          photo: _photo(idx++),
        ));
      }

      for (var a = 0; a < 4; a++) {
        final kind = _attractionKinds[(d + a) % _attractionKinds.length];
        out.add(_place(
          id: 'st-augustine-attr-${dist.districtId}-$a',
          title: '${dist.districtName} ${kind.$1}',
          category: kind.$2,
          lat: lat - (a * 0.0025),
          lng: lng + (a * 0.0018),
          location: '${dist.districtName}, St. Augustine',
          description: '${kind.$1} â€” ${dist.vibeTags.take(2).join(' & ')} energy.',
          moodTags: [...kind.$3, 'st-augustine'],
          photo: _photo(idx++),
        ));
      }

      for (var e = 0; e < 6; e++) {
        final kind = _experienceKinds[(d + e) % _experienceKinds.length];
        out.add(_place(
          id: 'st-augustine-exp-${dist.districtId}-$e',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (e * 0.003),
          lng: lng + (e * 0.0025),
          location: '${dist.districtName}, St. Augustine',
          description:
              'Bookable experience â€” ${kind.$1.toLowerCase()} with local operators.',
          moodTags: [...kind.$2, 'experience', 'st-augustine'],
          photo: _photo(idx++),
        ));
      }

      for (var g = 0; g < 6; g++) {
        out.add(_place(
          id: 'st-augustine-gem-place-${dist.districtId}-$g',
          title: 'Hidden ${dist.districtName} ${g + 1}',
          category: g.isEven ? LuxPlaceCategory.beach : LuxPlaceCategory.dining,
          lat: lat + (g * 0.0012),
          lng: lng - (g * 0.0016),
          location: '${dist.districtName} Â· local gem',
          description:
              'Insider-only â€” secret beach, courtyard, or sunset bench worth the detour.',
          moodTags: ['hidden', 'local', 'gem', 'st-augustine'],
          photo: _photo(idx++),
        ));
      }
    }

    return out;
  }

  static List<HiddenGem> _buildGems() {
    final out = <HiddenGem>[...stAugustineHiddenGemsCatalog];
    for (final dist in districts) {
      for (var g = 0; g < 6; g++) {
        if (out.length >= 105) break;
        out.add(
          HiddenGem(
            id: 'st-augustine-gem-${dist.districtId}-$g',
            title: 'Hidden ${dist.districtName} ${g + 1}',
            location: '${dist.districtName} Â· St. Augustine',
            whySpecial:
                'Local-only ${dist.vibeTags.first} spot â€” photogenic, quiet, and off the tourist loop.',
            bestTime: g.isEven ? 'Sunrise Â· weekdays' : 'Golden hour',
            crowdLevel: g.isEven ? 'Low' : 'Moderate weekends',
            insiderTip:
                'Pair with ${dist.districtName} dinner â€” arrive 30 min before peak.',
            localOnlyNote: 'Residents guard this one â€” not in guidebooks.',
            gradient: stAugustineHiddenGemsCatalog.first.gradient,
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

  static List<StAugustineMoodRoute> _buildMoodRoutes() {
    final dining = places.where((p) => p.category == LuxPlaceCategory.dining).toList();
    final beaches = places.where((p) => p.category == LuxPlaceCategory.beach).toList();
    final culture = places.where((p) => p.moodTags.contains('culture')).toList();
    final waterfront = places.where((p) => p.moodTags.contains('waterfront')).toList();

    String pick(List<LuxPlace> list, int i) =>
        list.isEmpty ? dining[i % dining.length].id : list[i % list.length].id;

    const routes = [
      ('Romantic St Augustine', ['romantic', 'couples', 'sunset', 'walkable']),
      ('Historic Walking Tour', ['historic', 'culture', 'walkable', 'full-day']),
      ('Food & Wine Weekend', ['foodie', 'weekend', 'dining', 'local']),
      ('Hidden St Augustine', ['hidden', 'local', 'gem', 'off-path']),
      ('Coastal Escape', ['beach', 'coastal', 'relaxing', 'sunset']),
      ('Family Weekend', ['family', 'beach', 'historic', 'weekend']),
      ('Photography Route', ['photo', 'historic', 'sunset', 'scenic']),
      ('Ghost Tour Adventure', ['nightlife', 'historic', 'culture', 'evening']),
      ('Sunset Waterfront Route', ['sunset', 'waterfront', 'romantic', 'dining']),
      ('Rainy Day St Augustine', ['rainy-day', 'indoor', 'culture', 'museum']),
    ];

    return [
      for (var i = 0; i < routes.length; i++)
        StAugustineMoodRoute(
          routeId: 'st-augustine-route-$i',
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

