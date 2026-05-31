import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/data/vegas/vegas_curated_places.dart';
import 'package:luxora_ai/data/vegas/vegas_feed_items.dart';
import 'package:luxora_ai/data/vegas/vegas_gem_discoveries.dart';
import 'package:luxora_ai/data/vegas/vegas_hotels_catalog.dart';
import 'package:luxora_ai/data/vegas/vegas_local_secrets.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/vegas/vegas_mood_route.dart';

/// Las Vegas city pack — Strip spectacle, residency shows, rooftop nights, and desert escapes.
abstract final class VegasContent {
  static const cityId = 'vegas';

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
    ('Celebrity steakhouse', ['foodie', 'luxury', 'steak', 'evening']),
    ('Buffet icon', ['foodie', 'value', 'family', 'iconic']),
    ('Rooftop tasting menu', ['rooftop', 'luxury', 'romantic', 'views']),
    ('Speakeasy supper club', ['speakeasy', 'hidden', 'nightlife', 'foodie']),
    ('Late-night diner', ['late-night', 'local', 'budget', 'comfort']),
    ('Omakase counter', ['foodie', 'luxury', 'hidden', 'date-night']),
    ('Poolside cabana bites', ['pool', 'dayclub', 'summer', 'social']),
    ('Sportsbook grill', ['sportsbook', 'casual', 'social', 'game-day']),
    ('Vegas classic prime rib', ['iconic', 'foodie', 'historic', 'local']),
    ('Plant-based tasting', ['wellness', 'foodie', 'modern', 'local']),
    ('Dim sum lounge', ['foodie', 'nightlife', 'social', 'late-night']),
    ('Chef\'s table experience', ['luxury', 'foodie', 'bucket-list', 'evening']),
  ];

  static const _attractionKinds = [
    ('Casino resort', LuxPlaceCategory.adventure, ['casino', 'luxury', 'nightlife']),
    ('Signature show venue', LuxPlaceCategory.adventure, ['show', 'entertainment', 'bucket-list']),
    ('Rooftop lounge', LuxPlaceCategory.adventure, ['rooftop', 'nightlife', 'views']),
    ('Luxury shopping atrium', LuxPlaceCategory.adventure, ['shopping', 'luxury', 'indoor']),
    ('Pool club', LuxPlaceCategory.adventure, ['pool', 'dayclub', 'summer']),
    ('Sportsbook lounge', LuxPlaceCategory.adventure, ['sportsbook', 'casino', 'social']),
    ('Fine dining room', LuxPlaceCategory.dining, ['fine-dining', 'celebrity', 'luxury']),
    ('Desert overlook', LuxPlaceCategory.nature, ['desert', 'scenic', 'photo']),
  ];

  static const _experienceKinds = [
    ('Helicopter Strip flight', ['bucket-list', 'aerial', 'luxury', 'show']),
    ('VIP nightclub table', ['nightlife', 'luxury', 'social', 'evening']),
    ('Show ticket package', ['show', 'entertainment', 'evening', 'bucket-list']),
    ('Speakeasy crawl', ['speakeasy', 'hidden', 'nightlife', 'local']),
    ('Celebrity chef tasting', ['foodie', 'fine-dining', 'luxury', 'evening']),
    ('Pool cabana day', ['pool', 'dayclub', 'summer', 'relaxing']),
    ('Red Rock hike', ['desert', 'nature', 'adventure', 'morning']),
    ('High-roller observation', ['views', 'luxury', 'bucket-list', 'evening']),
    ('Slot tournament entry', ['casino', 'social', 'nightlife', 'local']),
    ('Romantic gondola ride', ['romantic', 'luxury', 'couples', 'evening']),
    ('Race & sports experience', ['sportsbook', 'adventure', 'social']),
    ('Magic / comedy night', ['show', 'entertainment', 'nightlife']),
  ];
  static const _showKinds = [
    ('Residency headliner', ['show', 'entertainment', 'bucket-list', 'evening']),
    ('Cirque-style spectacle', ['show', 'family', 'iconic', 'evening']),
    ('Magic revue', ['show', 'entertainment', 'nightlife', 'evening']),
    ('Comedy club headliner', ['show', 'nightlife', 'social', 'late-night']),
    ('Tribute production', ['show', 'entertainment', 'budget', 'evening']),
    ('Adult revue', ['show', 'nightlife', 'couples', 'evening']),
    ('Live music residency', ['show', 'nightlife', 'live-music', 'evening']),
    ('Production show', ['show', 'luxury', 'bucket-list', 'evening']),
  ];

  static const _nightlifeKinds = [
    ('Mega nightclub', ['nightclub', 'nightlife', 'high-energy', 'late-night']),
    ('Rooftop day club', ['dayclub', 'pool', 'luxury', 'summer']),
    ('Sportsbook bar', ['sportsbook', 'casino', 'social', 'game-day']),
    ('Speakeasy lounge', ['speakeasy', 'hidden', 'cocktails', 'late-night']),
    ('Cigar & whiskey lounge', ['luxury', 'nightlife', 'couples', 'late-night']),
    ('Dance lounge', ['nightlife', 'social', 'high-energy', 'late-night']),
    ('Karaoke lounge', ['nightlife', 'social', 'budget', 'late-night']),
    ('VIP host club', ['nightlife', 'luxury', 'bucket-list', 'late-night']),
  ];


  static List<DistrictPack>? _districts;
  static List<LuxPlace>? _places;
  static List<LuxHotel>? _hotels;
  static List<HiddenGem>? _gems;
  static List<HiddenGem>? _localSecrets;
  static List<FeedItem>? _feed;
  static List<BeachIntelligence>? _beachIntel;
  static List<VegasMoodRoute>? _routes;

  static List<DistrictPack> get districts => _districts ??= _buildDistricts();
  static List<LuxPlace> get places => _places ??= _buildAllPlaces();
  static List<LuxHotel> get hotels => _hotels ??= VegasHotelsCatalog.all;
  static List<HiddenGem> get gems => _gems ??= _buildGems();
  static List<HiddenGem> get localSecrets =>
      _localSecrets ??= VegasLocalSecrets.buildForDistricts(districts);
  static List<FeedItem> get feedItems => _feed ??= vegasDiscoveryFeed;
  static List<BeachIntelligence> get beachIntelligence =>
      _beachIntel ??= _buildBeachIntel();
  static List<VegasMoodRoute> get moodRoutes => _routes ??= _buildMoodRoutes();

  static Map<String, String> get feedItemPlaceIds => kVegasFeedItemPlaceIds;
  static Map<String, String> get gemPlaceIds => kVegasGemPlaceIds;
  static Map<String, String> get itineraryMomentPlaceIds =>
      kVegasItineraryMomentPlaceIds;

  static String _photo(int i) => _photos[i % _photos.length];

  static List<DistrictPack> _buildDistricts() {
    const seeds = [
      ('vegas-las-vegas-strip', 'Las Vegas Strip', DistrictType.nightlife, 'Four-mile resort corridor — casinos, shows, and spectacle at every turn.', ['luxury', 'nightlife', 'entertainment'], ['couples', 'bucket-list', 'weekend'], 36.1147, -115.1728),
      ('vegas-downtown-las-vegas', 'Downtown Las Vegas', DistrictType.downtown, 'Classic Vegas energy beyond the Strip — murals, bars, and local rhythm.', ['local', 'nightlife', 'foodie'], ['foodies', 'budget', 'weekend'], 36.1673, -115.1484),
      ('vegas-fremont-street', 'Fremont Street', DistrictType.nightlife, 'Neon canopy, zip lines, and vintage Vegas under the Viva Vision screen.', ['nightlife', 'entertainment', 'budget'], ['friend-groups', 'weekend', 'nightlife'], 36.1705, -115.1435),
      ('vegas-arts-district', 'Arts District', DistrictType.arts, 'Gallery walks, cocktail bars, and creative dining south of downtown.', ['arts', 'foodie', 'local'], ['foodies', 'culture', 'couples'], 36.155, -115.152),
      ('vegas-summerlin', 'Summerlin', DistrictType.suburban, 'Master-planned west-side calm — golf, spas, and Red Rock access.', ['luxury', 'relaxing', 'local'], ['couples', 'luxury', 'wellness'], 36.149, -115.333),
      ('vegas-red-rock-area', 'Red Rock Area', DistrictType.other, 'Desert sandstone, scenic loops, and sunrise hikes minutes from the Strip.', ['desert', 'nature', 'adventure'], ['adventure', 'photo', 'wellness'], 36.135, -115.428),
      ('vegas-henderson', 'Henderson', DistrictType.suburban, 'Green Valley dining, locals-only casinos, and quieter resort pools.', ['local', 'family', 'foodie'], ['families', 'local', 'budget'], 36.0395, -115.035),
      ('vegas-venetian-area', 'Venetian Area', DistrictType.resort, 'Grand canals, luxury shopping, and high-limit tables on the mid-Strip.', ['luxury', 'romantic', 'shopping'], ['couples', 'luxury', 'shopping'], 36.1212, -115.1697),
      ('vegas-bellagio-corridor', 'Bellagio Corridor', DistrictType.resort, 'Fountains, conservatory, and fine-dining icons on the central Strip.', ['luxury', 'romantic', 'iconic'], ['couples', 'luxury', 'bucket-list'], 36.1126, -115.1767),
      ('vegas-caesars-corridor', 'Caesars Corridor', DistrictType.resort, 'Roman spectacle, mega-mall energy, and show-residency central.', ['entertainment', 'luxury', 'shopping'], ['friend-groups', 'luxury', 'show'], 36.1162, -115.1745),
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
      ...VegasCuratedPlaces.flagship,
      ...VegasHotelsCatalog.hotelPlaces,
    ];
    var idx = 0;

    for (var d = 0; d < districts.length; d++) {
      final dist = districts[d];
      final lat = _districtLat(dist);
      final lng = _districtLng(dist);

      for (var r = 0; r < 20; r++) {
        final style = _restaurantStyles[(d + r) % _restaurantStyles.length];
        out.add(_place(
          id: 'vegas-dining-${dist.districtId}-$r',
          title: '${dist.districtName} ${style.$1}',
          category: LuxPlaceCategory.dining,
          lat: lat + (r * 0.0018),
          lng: lng - (r * 0.0012),
          location: '${dist.districtName}, Las Vegas',
          description:
              'Concierge-curated ${style.$1.toLowerCase()} — ${dist.description}',
          moodTags: [...style.$2, 'dining', 'vegas'],
          photo: _photo(idx++),
        ));
      }

      for (var a = 0; a < 10; a++) {
        final kind = _attractionKinds[(d + a) % _attractionKinds.length];
        out.add(_place(
          id: 'vegas-attr-${dist.districtId}-$a',
          title: '${dist.districtName} ${kind.$1}',
          category: kind.$2,
          lat: lat - (a * 0.0025),
          lng: lng + (a * 0.0018),
          location: '${dist.districtName}, Las Vegas',
          description: '${kind.$1} — ${dist.vibeTags.take(2).join(' & ')} energy.',
          moodTags: [...kind.$3, 'vegas'],
          photo: _photo(idx++),
        ));
      }

      for (var e = 0; e < 15; e++) {
        final kind = _experienceKinds[(d + e) % _experienceKinds.length];
        out.add(_place(
          id: 'vegas-exp-${dist.districtId}-$e',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (e * 0.003),
          lng: lng + (e * 0.0025),
          location: '${dist.districtName}, Las Vegas',
          description:
              'Bookable experience — ${kind.$1.toLowerCase()} with local operators.',
          moodTags: [...kind.$2, 'experience', 'vegas'],
          photo: _photo(idx++),
        ));
      }

      for (var sh = 0; sh < 10; sh++) {
        final kind = _showKinds[(d + sh) % _showKinds.length];
        out.add(_place(
          id: 'vegas-show-${dist.districtId}-$sh',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (sh * 0.0022),
          lng: lng - (sh * 0.0019),
          location: '${dist.districtName}, Las Vegas',
          description:
              'Show intelligence — ${kind.$1.toLowerCase()} with concierge seat timing.',
          moodTags: [...kind.$2, 'show', 'vegas'],
          photo: _photo(idx++),
        ));
      }
      for (var n = 0; n < 8; n++) {
        final kind = _nightlifeKinds[(d + n) % _nightlifeKinds.length];
        out.add(_place(
          id: 'vegas-nightlife-${dist.districtId}-$n',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat - (n * 0.0021),
          lng: lng + (n * 0.0028),
          location: '${dist.districtName}, Las Vegas',
          description:
              'Nightlife intel — ${kind.$1.toLowerCase()} with door and table timing.',
          moodTags: [...kind.$2, 'nightlife', 'vegas'],
          photo: _photo(idx++),
        ));
      }

      for (var g = 0; g < 6; g++) {
        out.add(_place(
          id: 'vegas-gem-place-${dist.districtId}-$g',
          title: 'Hidden ${dist.districtName} ${g + 1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (g * 0.0012),
          lng: lng - (g * 0.0016),
          location: '${dist.districtName} · local gem',
          description:
              'Insider-only — speakeasy angle, quiet bar, or view locals guard.',
          moodTags: ['hidden', 'local', 'gem', 'vegas'],
          photo: _photo(idx++),
        ));
      }
    }

    return out;
  }

  static List<HiddenGem> _buildGems() {
    final out = <HiddenGem>[...vegasHiddenGemsCatalog];
    for (final dist in districts) {
      for (var g = 0; g < 10; g++) {
        if (out.length >= 110) break;
        out.add(
          HiddenGem(
            id: 'vegas-gem-${dist.districtId}-$g',
            title: 'Hidden ${dist.districtName} ${g + 1}',
            location: '${dist.districtName} · Las Vegas',
            whySpecial:
                'Local-only ${dist.vibeTags.first} spot — photogenic, quiet, and off the tourist loop.',
            bestTime: g.isEven ? 'Sunrise · weekdays' : 'Golden hour',
            crowdLevel: g.isEven ? 'Low' : 'Moderate weekends',
            insiderTip:
                'Pair with ${dist.districtName} dinner — arrive 30 min before peak.',
            localOnlyNote: 'Residents guard this one — not in guidebooks.',
            gradient: vegasHiddenGemsCatalog.first.gradient,
          ),
        );
      }
    }
    return out;
  }

  static List<BeachIntelligence> _buildBeachIntel() {
    final targets = places.where((p) => p.moodTags.contains('pool') || p.moodTags.contains('show') || p.id.contains('-nightlife-')).take(80).toList();
    return [
      for (var i = 0; i < targets.length; i++)
        BeachIntelligence(
          placeId: targets[i].id,
          bestTimeToVisit: i.isEven ? 'After 6 PM · cooler walks' : 'Morning before 10 AM · heat advisory',
          familyFriendlyScore: 45 + (i * 5) % 35,
          crowdScore: 35 + (i * 9) % 50,
          photoScore: 72 + (i * 5) % 26,
          romanceScore: 70 + (i * 6) % 28,
          walkabilityScore: 40 + (i * 4) % 30,
          windSensitivity: 15 + (i * 3) % 20,
          sunsetValue: 85 + (i * 2) % 12,
          sunriseValue: 30 + (i * 3) % 25,
          parkingDifficulty: i.isEven ? 'Use garage comps · validate tickets' : 'Strip weekends · valet only',
          nearbyRestaurantPlaceIds: places
              .where((p) => p.category == LuxPlaceCategory.dining)
              .skip(i)
              .take(2)
              .map((p) => p.id)
              .toList(),
        ),
    ];
  }

  static List<VegasMoodRoute> _buildMoodRoutes() {
    final dining = places.where((p) => p.category == LuxPlaceCategory.dining).toList();
    final shows = places.where((p) => p.id.contains('-show-')).toList();
    final nightlife = places.where((p) => p.id.contains('-nightlife-')).toList();
    final pools = places.where((p) => p.moodTags.contains('pool')).toList();

    String pick(List<LuxPlace> list, int i) =>
        list.isEmpty ? dining[i % dining.length].id : list[i % list.length].id;

    const routes = [
      ('First Time Vegas', ['first-time', 'iconic', 'strip', 'bucket-list']),
      ('Ultimate Vegas Weekend', ['weekend', 'high-energy', 'nightlife', 'show']),
      ('Luxury Vegas Escape', ['luxury', 'spa', 'fine-dining', 'couples']),
      ('Vegas On A Budget', ['budget', 'downtown', 'local', 'value']),
      ('Romantic Vegas', ['romantic', 'couples', 'fountains', 'fine-dining']),
      ('Bachelor Party Route', ['bachelor', 'nightlife', 'pool', 'high-energy']),
      ('Bachelorette Weekend', ['bachelorette', 'pool', 'show', 'nightlife']),
      ('Foodie Vegas', ['foodie', 'celebrity', 'fine-dining', 'local']),
      ('Hidden Vegas', ['hidden', 'speakeasy', 'local', 'off-strip']),
      ('Non-Gambling Vegas', ['no-casino', 'show', 'dining', 'wellness']),
      ('Family Vegas', ['family', 'daytime', 'show', 'attraction']),
      ('Show Lover Route', ['show', 'entertainment', 'evening', 'bucket-list']),
    ];

    return [
      for (var i = 0; i < routes.length; i++)
        VegasMoodRoute(
          routeId: 'vegas-route-$i',
          title: routes[i].$1,
          description:
              'Prebuilt Luxora concierge flow — ${routes[i].$2.join(', ')}.',
          moodTags: routes[i].$2,
          morningPlaceId: pick(pools.isNotEmpty ? pools : shows, i),
          lunchPlaceId: pick(dining, i + 1),
          afternoonPlaceId: pick(shows.isNotEmpty ? shows : dining, i + 2),
          dinnerPlaceId: pick(dining, i + 3),
          eveningPlaceId: pick(nightlife.isNotEmpty ? nightlife : shows, i),
          bestStartTime: i.isEven ? '10:00 AM · beat the heat' : '4:00 PM · pool to show',
          weatherSensitive: true,
          crowdSensitive: i % 2 == 0,
          estimatedDriveMinutes: 15 + (i * 4) % 25,
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

