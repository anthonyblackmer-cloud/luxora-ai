import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/data/nyc/nyc_curated_places.dart';
import 'package:luxora_ai/data/nyc/nyc_feed_items.dart';
import 'package:luxora_ai/data/nyc/nyc_gem_discoveries.dart';
import 'package:luxora_ai/data/nyc/nyc_hotels_catalog.dart';
import 'package:luxora_ai/data/nyc/nyc_local_secrets.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/nyc/nyc_mood_route.dart';

/// New York City city pack — Five boroughs of walkable culture, Broadway nights, and subway-smart clusters.
abstract final class NycContent {
  static const cityId = 'nyc';

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
    ('Classic NY slice shop', ['pizza', 'foodie', 'local', 'iconic']),
    ('Bagel & schmear counter', ['bagel', 'foodie', 'morning', 'local']),
    ('Chinatown dim sum hall', ['foodie', 'local', 'walkable', 'value']),
    ('Upscale tasting menu', ['luxury', 'foodie', 'evening', 'couples']),
    ('Deli sandwich institution', ['foodie', 'local', 'historic', 'iconic']),
    ('Rooftop cocktail bar', ['rooftop', 'nightlife', 'views', 'evening']),
    ('Speakeasy hidden entrance', ['speakeasy', 'hidden', 'nightlife', 'local']),
    ('Food hall crawl stop', ['market', 'foodie', 'walkable', 'local']),
    ('Italian red-sauce classic', ['foodie', 'historic', 'local', 'family']),
    ('Modern farm-to-table', ['foodie', 'local', 'walkable', 'date-night']),
    ('Halal cart legend', ['foodie', 'local', 'budget', 'late-night']),
    ('Jewish appetizing store', ['foodie', 'local', 'morning', 'historic']),
    ('Greek diner institution', ['foodie', 'local', 'budget', 'comfort']),
    ('Latin bodega comfort', ['foodie', 'local', 'budget', 'walkable']),
    ('Michelin omakase counter', ['luxury', 'foodie', 'hidden', 'evening']),
    ('Coal-oven Brooklyn pizza', ['pizza', 'foodie', 'local', 'iconic']),
    ('Broadway pre-show prix fixe', ['broadway', 'foodie', 'evening', 'efficient']),
    ('Smorgasburg-style vendor', ['market', 'foodie', 'weekend', 'local']),
  ];

  static const _attractionKinds = [
    ('Observation deck', LuxPlaceCategory.adventure, ['views', 'iconic', 'bucket-list']),
    ('World-class museum', LuxPlaceCategory.adventure, ['museum', 'culture', 'rainy-day']),
    ('Historic landmark', LuxPlaceCategory.adventure, ['historic', 'walkable', 'photo']),
    ('Urban park', LuxPlaceCategory.nature, ['park', 'walkable', 'local']),
    ('Broadway theater district', LuxPlaceCategory.adventure, ['broadway', 'entertainment', 'evening']),
    ('Food market hall', LuxPlaceCategory.dining, ['foodie', 'market', 'local']),
    ('Rooftop bar', LuxPlaceCategory.adventure, ['rooftop', 'views', 'nightlife']),
    ('Iconic pizza slice shop', LuxPlaceCategory.dining, ['pizza', 'foodie', 'local']),
  ];

  static const _experienceKinds = [
    ('Neighborhood walking tour', ['walkable', 'local', 'culture', 'exploration']),
    ('Subway food crawl', ['foodie', 'local', 'subway', 'value']),
    ('Photography walk', ['photo', 'iconic', 'walkable', 'exploration']),
    ('Broadway ticket concierge', ['broadway', 'entertainment', 'evening', 'bucket-list']),
    ('Central Park guided stroll', ['park', 'family', 'walkable', 'morning']),
    ('Speakeasy crawl', ['speakeasy', 'hidden', 'nightlife', 'local']),
    ('Harbor cruise', ['waterfront', 'views', 'romantic', 'evening']),
    ('Bagel & coffee trail', ['foodie', 'morning', 'local', 'walkable']),
    ('Museum skip-the-line pass', ['museum', 'culture', 'rainy-day', 'efficient']),
    ('Brooklyn bridge sunrise', ['photo', 'iconic', 'morning', 'walkable']),
  ];
  static const _broadwayKinds = [
    ('Tony-winning musical', ['broadway', 'show', 'entertainment', 'evening']),
    ('Intimate off-Broadway play', ['broadway', 'culture', 'local', 'evening']),
    ('Classic revival production', ['broadway', 'historic', 'iconic', 'evening']),
    ('Family Broadway matinee', ['broadway', 'family', 'matinee', 'weekend']),
  ];

  static const _guideKinds = [
    ('Neighborhood walking route', ['walkable', 'local', 'cluster', 'efficient']),
    ('Subway-efficient day plan', ['subway', 'efficient', 'local', 'no-backtrack']),
  ];


  static List<DistrictPack>? _districts;
  static List<LuxPlace>? _places;
  static List<LuxHotel>? _hotels;
  static List<HiddenGem>? _gems;
  static List<HiddenGem>? _localSecrets;
  static List<FeedItem>? _feed;
  static List<BeachIntelligence>? _beachIntel;
  static List<NycMoodRoute>? _routes;

  static List<DistrictPack> get districts => _districts ??= _buildDistricts();
  static List<LuxPlace> get places => _places ??= _buildAllPlaces();
  static List<LuxHotel> get hotels => _hotels ??= NycHotelsCatalog.all;
  static List<HiddenGem> get gems => _gems ??= _buildGems();
  static List<HiddenGem> get localSecrets =>
      _localSecrets ??= NycLocalSecrets.buildForDistricts(districts);
  static List<FeedItem> get feedItems => _feed ??= nycDiscoveryFeed;
  static List<BeachIntelligence> get beachIntelligence =>
      _beachIntel ??= _buildBeachIntel();
  static List<NycMoodRoute> get moodRoutes => _routes ??= _buildMoodRoutes();

  static Map<String, String> get feedItemPlaceIds => kNycFeedItemPlaceIds;
  static Map<String, String> get gemPlaceIds => kNycGemPlaceIds;
  static Map<String, String> get itineraryMomentPlaceIds =>
      kNycItineraryMomentPlaceIds;

  static String _photo(int i) => _photos[i % _photos.length];

  static List<DistrictPack> _buildDistricts() {
    const seeds = [
      ('nyc-midtown', 'Midtown', DistrictType.downtown, 'Theater District, museums, and classic Manhattan energy between Bryant Park and Rockefeller Center.', ['iconic', 'walkable', 'entertainment'], ['first-time', 'culture', 'shopping'], 40.7549, -73.984),
      ('nyc-times-square', 'Times Square', DistrictType.nightlife, 'Neon crossroads, TKTS, and Broadway box offices — pulse of Midtown nights.', ['broadway', 'entertainment', 'iconic'], ['first-time', 'nightlife', 'weekend'], 40.758, -73.9855),
      ('nyc-upper-east-side', 'Upper East Side', DistrictType.suburban, 'Museum Mile, brownstones, and Central Park east-side gates.', ['culture', 'luxury', 'walkable'], ['couples', 'museum', 'luxury'], 40.7736, -73.9566),
      ('nyc-upper-west-side', 'Upper West Side', DistrictType.suburban, 'Lincoln Center, Riverside Park, and neighborhood bodega rhythm.', ['culture', 'local', 'walkable'], ['families', 'culture', 'local'], 40.787, -73.9754),
      ('nyc-soho', 'SoHo', DistrictType.arts, 'Cast-iron streets, gallery hops, and boutique dining below Houston.', ['shopping', 'foodie', 'walkable'], ['foodies', 'shopping', 'photo'], 40.7233, -73.9989),
      ('nyc-greenwich-village', 'Greenwich Village', DistrictType.arts, 'Winding lanes, jazz clubs, and Washington Square student energy.', ['culture', 'nightlife', 'local'], ['foodies', 'culture', 'nightlife'], 40.7336, -73.9967),
      ('nyc-chelsea', 'Chelsea', DistrictType.arts, 'High Line access, gallery district, and Hudson Yards skyline views.', ['walkable', 'photo', 'culture'], ['culture', 'photo', 'walkable'], 40.7465, -74.0014),
      ('nyc-financial-district', 'Financial District', DistrictType.downtown, 'Wall Street history, harbor views, and ferry connections downtown.', ['historic', 'walkable', 'iconic'], ['first-time', 'historic', 'photo'], 40.7075, -74.0113),
      ('nyc-tribeca', 'Tribeca', DistrictType.downtown, 'Film-festival streets, loft dining, and quiet cobblestone evenings.', ['luxury', 'foodie', 'local'], ['foodies', 'luxury', 'couples'], 40.7163, -74.0086),
      ('nyc-harlem', 'Harlem', DistrictType.downtown, 'Jazz heritage, soul food institutions, and Apollo legend.', ['culture', 'foodie', 'historic'], ['culture', 'foodie', 'local'], 40.8116, -73.9465),
      ('nyc-williamsburg', 'Williamsburg', DistrictType.arts, 'Brooklyn creative scene — waterfront parks, markets, and nightlife.', ['foodie', 'nightlife', 'local'], ['foodies', 'nightlife', 'local'], 40.7081, -73.9571),
      ('nyc-dumbo', 'DUMBO', DistrictType.downtown, 'Brooklyn Bridge views, cobblestones, and photo-perfect waterfront.', ['photo', 'walkable', 'iconic'], ['photo', 'couples', 'first-time'], 40.7033, -73.9896),
      ('nyc-brooklyn-heights', 'Brooklyn Heights', DistrictType.suburban, 'Promenade sunsets and brownstone calm above the East River.', ['walkable', 'romantic', 'local'], ['couples', 'walkable', 'local'], 40.696, -73.9936),
      ('nyc-park-slope', 'Park Slope', DistrictType.suburban, 'Prospect Park access, family dining, and brownstone Brooklyn life.', ['family', 'local', 'walkable'], ['families', 'local', 'foodie'], 40.671, -73.9814),
      ('nyc-long-island-city', 'Long Island City', DistrictType.downtown, 'Skyline views, MoMA PS1, and quick Manhattan subway hops.', ['photo', 'culture', 'walkable'], ['photo', 'culture', 'value'], 40.7447, -73.9485),
      ('nyc-astoria', 'Astoria', DistrictType.suburban, 'Greek tavernas, beer gardens, and Queens neighborhood authenticity.', ['foodie', 'local', 'nightlife'], ['foodies', 'local', 'nightlife'], 40.772, -73.9301),
      ('nyc-yankee-stadium', 'Yankee Stadium Area', DistrictType.other, 'Bronx baseball culture, stadium energy, and Arthur Avenue nearby.', ['entertainment', 'local', 'historic'], ['families', 'sports', 'local'], 40.8296, -73.9262),
      ('nyc-ferry-district', 'Ferry District', DistrictType.other, 'Staten Island Ferry, harbor views, and a borough apart from Manhattan rush.', ['waterfront', 'photo', 'local'], ['first-time', 'photo', 'budget'], 40.6437, -74.0737),
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
      ...NycCuratedPlaces.flagship,
      ...NycHotelsCatalog.hotelPlaces,
    ];
    var idx = 0;

    for (var d = 0; d < districts.length; d++) {
      final dist = districts[d];
      final lat = _districtLat(dist);
      final lng = _districtLng(dist);

      for (var r = 0; r < 17; r++) {
        final style = _restaurantStyles[(d + r) % _restaurantStyles.length];
        out.add(_place(
          id: 'nyc-dining-${dist.districtId}-$r',
          title: '${dist.districtName} ${style.$1}',
          category: LuxPlaceCategory.dining,
          lat: lat + (r * 0.0018),
          lng: lng - (r * 0.0012),
          location: '${dist.districtName}, New York City',
          description:
              'Concierge-curated ${style.$1.toLowerCase()} — ${dist.description}',
          moodTags: [...style.$2, 'dining', 'nyc'],
          photo: _photo(idx++),
        ));
      }

      for (var a = 0; a < 9; a++) {
        final kind = _attractionKinds[(d + a) % _attractionKinds.length];
        out.add(_place(
          id: 'nyc-attr-${dist.districtId}-$a',
          title: '${dist.districtName} ${kind.$1}',
          category: kind.$2,
          lat: lat - (a * 0.0025),
          lng: lng + (a * 0.0018),
          location: '${dist.districtName}, New York City',
          description: '${kind.$1} — ${dist.vibeTags.take(2).join(' & ')} energy.',
          moodTags: [...kind.$3, 'nyc'],
          photo: _photo(idx++),
        ));
      }

      for (var e = 0; e < 9; e++) {
        final kind = _experienceKinds[(d + e) % _experienceKinds.length];
        out.add(_place(
          id: 'nyc-exp-${dist.districtId}-$e',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (e * 0.003),
          lng: lng + (e * 0.0025),
          location: '${dist.districtName}, New York City',
          description:
              'Bookable experience — ${kind.$1.toLowerCase()} with local operators.',
          moodTags: [...kind.$2, 'experience', 'nyc'],
          photo: _photo(idx++),
        ));
      }

      for (var b = 0; b < 3; b++) {
        final kind = _broadwayKinds[(d + b) % _broadwayKinds.length];
        out.add(_place(
          id: 'nyc-broadway-${dist.districtId}-$b',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (b * 0.0018),
          lng: lng - (b * 0.0015),
          location: '${dist.districtName}, New York City',
          description:
              'Broadway intelligence — ${kind.$1.toLowerCase()} with TKTS and rush-seat timing.',
          moodTags: [...kind.$2, 'broadway', 'nyc'],
          photo: _photo(idx++),
        ));
      }
      for (var g = 0; g < 2; g++) {
        final kind = _guideKinds[(d + g) % _guideKinds.length];
        out.add(_place(
          id: 'nyc-guide-${dist.districtId}-$g',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (g * 0.0014),
          lng: lng + (g * 0.0011),
          location: '${dist.districtName} · neighborhood guide',
          description:
              'Clustered day plan — ${kind.$1.toLowerCase()} minimizing subway hops and backtracking.',
          moodTags: [...kind.$2, 'guide', 'nyc'],
          photo: _photo(idx++),
        ));
      }

      for (var g = 0; g < 6; g++) {
        out.add(_place(
          id: 'nyc-gem-place-${dist.districtId}-$g',
          title: 'Hidden ${dist.districtName} ${g + 1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (g * 0.0012),
          lng: lng - (g * 0.0016),
          location: '${dist.districtName} · local gem',
          description:
              'Insider-only — quiet block, secret view, or neighborhood bite locals guard.',
          moodTags: ['hidden', 'local', 'gem', 'nyc'],
          photo: _photo(idx++),
        ));
      }
    }

    return out;
  }

  static List<HiddenGem> _buildGems() {
    final out = <HiddenGem>[...nycHiddenGemsCatalog];
    for (final dist in districts) {
      for (var g = 0; g < 9; g++) {
        if (out.length >= 165) break;
        out.add(
          HiddenGem(
            id: 'nyc-gem-${dist.districtId}-$g',
            title: 'Hidden ${dist.districtName} ${g + 1}',
            location: '${dist.districtName} · New York City',
            whySpecial:
                'Local-only ${dist.vibeTags.first} spot — photogenic, quiet, and off the tourist loop.',
            bestTime: g.isEven ? 'Sunrise · weekdays' : 'Golden hour',
            crowdLevel: g.isEven ? 'Low' : 'Moderate weekends',
            insiderTip:
                'Pair with ${dist.districtName} dinner — arrive 30 min before peak.',
            localOnlyNote: 'Residents guard this one — not in guidebooks.',
            gradient: nycHiddenGemsCatalog.first.gradient,
          ),
        );
      }
    }
    return out;
  }

  static List<BeachIntelligence> _buildBeachIntel() {
    final targets = places.where((p) => p.moodTags.contains('park') || p.moodTags.contains('museum') || p.moodTags.contains('walkable')).take(100).toList();
    return [
      for (var i = 0; i < targets.length; i++)
        BeachIntelligence(
          placeId: targets[i].id,
          bestTimeToVisit: i.isEven ? 'Weekday morning · lighter crowds' : 'Golden hour · rooftop season',
          familyFriendlyScore: 50 + (i * 4) % 35,
          crowdScore: 35 + (i * 9) % 50,
          photoScore: 72 + (i * 5) % 26,
          romanceScore: 65 + (i * 5) % 30,
          walkabilityScore: 88 + (i * 2) % 10,
          windSensitivity: 20 + (i * 4) % 35,
          sunsetValue: 75 + (i * 3) % 20,
          sunriseValue: 60 + (i * 4) % 25,
          parkingDifficulty: i.isEven ? 'Walk or subway · skip driving' : 'Rain plan · subway underfoot routes',
          nearbyRestaurantPlaceIds: places
              .where((p) => p.category == LuxPlaceCategory.dining)
              .skip(i)
              .take(2)
              .map((p) => p.id)
              .toList(),
        ),
    ];
  }

  static List<NycMoodRoute> _buildMoodRoutes() {
    final dining = places.where((p) => p.category == LuxPlaceCategory.dining).toList();
    final parks = places.where((p) => p.moodTags.contains('park')).toList();
    final museums = places.where((p) => p.moodTags.contains('museum')).toList();
    final broadway = places.where((p) => p.id.contains('-broadway-')).toList();
    final rooftops = places.where((p) => p.moodTags.contains('rooftop')).toList();

    String pick(List<LuxPlace> list, int i) =>
        list.isEmpty ? dining[i % dining.length].id : list[i % list.length].id;

    const routes = [
      ('First Time NYC', ['first-time', 'iconic', 'walkable', 'bucket-list']),
      ('Ultimate 3-Day NYC', ['efficient', 'cluster', 'subway', 'iconic']),
      ('Ultimate 5-Day NYC', ['exploration', 'boroughs', 'culture', 'foodie']),
      ('Romantic New York', ['romantic', 'couples', 'rooftop', 'evening']),
      ('Luxury New York', ['luxury', 'fine-dining', 'views', 'couples']),
      ('Foodie New York', ['foodie', 'market', 'local', 'walkable']),
      ('Hidden NYC', ['hidden', 'speakeasy', 'local', 'off-path']),
      ('Broadway Weekend', ['broadway', 'entertainment', 'weekend', 'evening']),
      ('Family NYC', ['family', 'park', 'museum', 'walkable']),
      ('Christmas in NYC', ['seasonal', 'holiday', 'iconic', 'romantic']),
      ('Rainy Day NYC', ['rainy-day', 'museum', 'indoor', 'subway']),
      ('Local New Yorker Route', ['local', 'subway', 'neighborhood', 'efficient']),
    ];

    return [
      for (var i = 0; i < routes.length; i++)
        NycMoodRoute(
          routeId: 'nyc-route-$i',
          title: routes[i].$1,
          description:
              'Prebuilt Luxora concierge flow — ${routes[i].$2.join(', ')}.',
          moodTags: routes[i].$2,
          morningPlaceId: pick(parks.isNotEmpty ? parks : museums, i),
          lunchPlaceId: pick(dining, i + 1),
          afternoonPlaceId: pick(museums.isNotEmpty ? museums : dining, i + 2),
          dinnerPlaceId: pick(dining, i + 3),
          eveningPlaceId: pick(broadway.isNotEmpty ? broadway : rooftops, i),
          bestStartTime: i.isEven ? '8:30 AM · walkable cluster start' : '5:30 PM · show then dinner',
          weatherSensitive: true,
          crowdSensitive: i % 2 == 0,
          estimatedDriveMinutes: 8 + (i * 3) % 18,
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

