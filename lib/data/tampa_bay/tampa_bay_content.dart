import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_curated_places.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_feed_items.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_gem_discoveries.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_hotels_catalog.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_local_secrets.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/tampa_bay/tampa_bay_mood_route.dart';

/// Tampa Bay city pack — waterfront lifestyle, beaches, food, sports, local culture.
abstract final class TampaBayContent {
  static const cityId = 'tampa-bay';

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
    ('Waterfront seafood', ['foodie', 'seafood', 'sunset', 'waterfront']),
    ('Cuban classics', ['foodie', 'local', 'culture', 'casual']),
    ('Craft brewery taproom', ['brewery', 'social', 'local', 'weekend']),
    ('Sunset dining deck', ['sunset', 'romantic', 'waterfront', 'dining']),
    ('Steakhouse', ['foodie', 'date-night', 'luxury', 'dining']),
    ('Brunch spot', ['brunch', 'weekend', 'family', 'social']),
    ('Rooftop dining', ['sunset', 'romantic', 'views', 'nightlife']),
    ('Local favorite', ['local', 'hidden', 'foodie', 'gem']),
    ('Italian trattoria', ['foodie', 'romantic', 'family', 'dining']),
    ('Sushi bar', ['foodie', 'date-night', 'waterfront', 'dining']),
  ];

  static const _attractionKinds = [
    ('Waterfront walk', LuxPlaceCategory.adventure, ['waterfront', 'walkable', 'scenic']),
    ('Beach park', LuxPlaceCategory.beach, ['beach', 'family', 'sunset']),
    ('Sports venue', LuxPlaceCategory.adventure, ['sports', 'social', 'local']),
    ('Historic district', LuxPlaceCategory.adventure, ['culture', 'historic', 'walkable']),
    ('Nature preserve', LuxPlaceCategory.nature, ['nature', 'relaxing', 'photo']),
  ];

  static const _experienceKinds = [
    ('Sunset cruise', ['sunset', 'water', 'romantic', 'cruise']),
    ('Dolphin cruise', ['wildlife', 'water', 'family', 'cruise']),
    ('Kayak tour', ['adventure', 'water', 'nature']),
    ('Fishing charter', ['adventure', 'water', 'local']),
    ('Brewery tour', ['brewery', 'foodie', 'local', 'social']),
    ('Food tour', ['foodie', 'culture', 'local']),
    ('Paddleboard rental', ['beach', 'water', 'adventure']),
    ('Boat rental', ['water', 'adventure', 'family']),
  ];

  static List<DistrictPack>? _districts;
  static List<LuxPlace>? _places;
  static List<LuxHotel>? _hotels;
  static List<HiddenGem>? _gems;
  static List<HiddenGem>? _localSecrets;
  static List<FeedItem>? _feed;
  static List<BeachIntelligence>? _beachIntel;
  static List<TampaBayMoodRoute>? _routes;

  static List<DistrictPack> get districts => _districts ??= _buildDistricts();
  static List<LuxPlace> get places => _places ??= _buildAllPlaces();
  static List<LuxHotel> get hotels => _hotels ??= TampaBayHotelsCatalog.all;
  static List<HiddenGem> get gems => _gems ??= _buildGems();
  static List<HiddenGem> get localSecrets =>
      _localSecrets ??= TampaBayLocalSecrets.buildForDistricts(districts);
  static List<FeedItem> get feedItems => _feed ??= tampaBayDiscoveryFeed;
  static List<BeachIntelligence> get beachIntelligence =>
      _beachIntel ??= _buildBeachIntel();
  static List<TampaBayMoodRoute> get moodRoutes => _routes ??= _buildMoodRoutes();

  static Map<String, String> get feedItemPlaceIds => kTampaBayFeedItemPlaceIds;
  static Map<String, String> get gemPlaceIds => kTampaBayGemPlaceIds;
  static Map<String, String> get itineraryMomentPlaceIds =>
      kTampaBayItineraryMomentPlaceIds;

  static String _photo(int i) => _photos[i % _photos.length];

  static List<DistrictPack> _buildDistricts() {
    const seeds = [
      ('tampa-bay-downtown-tampa', 'Downtown Tampa', DistrictType.downtown,
          'Skyline towers, Curtis Hixon park, and urban bay energy.', ['waterfront', 'walkable', 'culture'], ['weekend', 'foodie', 'culture'], 27.947, -82.458),
      ('tampa-bay-channelside', 'Channelside', DistrictType.downtown,
          'Harbor cruises, aquarium, and pre-game waterfront buzz.', ['waterfront', 'social', 'family'], ['families', 'friend-groups', 'weekend'], 27.944, -82.445),
      ('tampa-bay-hyde-park', 'Hyde Park', DistrictType.suburban,
          'Bayshore boulevard joggers and village dining under oaks.', ['romantic', 'walkable', 'foodie', 'local'], ['couples', 'foodies', 'weekend'], 27.938, -82.482),
      ('tampa-bay-ybor', 'Ybor City', DistrictType.nightlife,
          'Cigar history, Cuban plates, and brick-street nightlife.', ['culture', 'nightlife', 'foodie', 'historic'], ['nightlife', 'foodies', 'friend-groups'], 27.963, -82.436),
      ('tampa-bay-riverwalk', 'Riverwalk', DistrictType.downtown,
          'Continuous waterfront path linking parks, museums, and wharf dining.', ['waterfront', 'walkable', 'sunset', 'family'], ['families', 'couples', 'weekend'], 27.945, -82.458),
      ('tampa-bay-seminole-heights', 'Seminole Heights', DistrictType.other,
          'Craft beer, chef-driven kitchens, and bungalow neighborhood charm.', ['foodie', 'local', 'brewery', 'trending'], ['foodies', 'friend-groups', 'local'], 27.992, -82.458),
      ('tampa-bay-downtown-st-pete', 'Downtown St. Pete', DistrictType.downtown,
          'Museums, marinas, and the pier — Tampa Bay\'s arts capital.', ['culture', 'waterfront', 'walkable'], ['culture', 'couples', 'weekend'], 27.771, -82.638),
      ('tampa-bay-central-arts', 'Central Arts District', DistrictType.arts,
          'Murals, galleries, and indie coffee between Central and 1st Ave.', ['arts', 'culture', 'walkable', 'trending'], ['foodies', 'culture', 'influencers'], 27.768, -82.645),
      ('tampa-bay-vinoy', 'Vinoy Area', DistrictType.resort,
          'Pink palace history, marina views, and old Florida elegance.', ['luxury', 'romantic', 'waterfront', 'historic'], ['couples', 'luxury', 'weekend'], 27.775, -82.628),
      ('tampa-bay-beach-drive', 'Beach Drive', DistrictType.downtown,
          'Palm-lined dining, bay breezes, and the classic St. Pete stroll.', ['walkable', 'foodie', 'sunset', 'romantic'], ['couples', 'foodies', 'weekend'], 27.772, -82.631),
      ('tampa-bay-clearwater-beach', 'Clearwater Beach', DistrictType.beach,
          'Gulf sand, Pier 60 sunsets, and the region\'s most famous beach day.', ['beach', 'family', 'sunset', 'iconic'], ['families', 'beach', 'weekend'], 27.979, -82.831),
      ('tampa-bay-sand-key', 'Sand Key', DistrictType.beach,
          'Quieter Gulf cove across the bridge — local beach escape.', ['beach', 'hidden', 'relaxing', 'local'], ['couples', 'local', 'beach'], 27.959, -82.828),
      ('tampa-bay-downtown-dunedin', 'Downtown Dunedin', DistrictType.suburban,
          'Scottish heritage, brewery row, and small-town main street.', ['local', 'brewery', 'walkable', 'weekend'], ['friend-groups', 'foodies', 'local'], 28.020, -82.772),
      ('tampa-bay-dunedin-waterfront', 'Dunedin Waterfront', DistrictType.beach,
          'Marina walks, sunset decks, and calmer Pinellas harbor life.', ['waterfront', 'sunset', 'relaxing', 'local'], ['couples', 'weekend', 'local'], 28.018, -82.780),
      ('tampa-bay-sponge-docks', 'Sponge Docks', DistrictType.other,
          'Greek fishing village — sponges, octopus, and boat tours.', ['culture', 'foodie', 'waterfront', 'local'], ['foodies', 'culture', 'family'], 28.146, -82.755),
      ('tampa-bay-tarpon-historic', 'Tarpon Historic District', DistrictType.other,
          'Antique shops and brick streets behind the sponge docks.', ['historic', 'culture', 'walkable', 'local'], ['couples', 'culture', 'weekend'], 28.150, -82.760),
      ('tampa-bay-safety-harbor-downtown', 'Safety Harbor Downtown', DistrictType.suburban,
          'Main-street cafés and spa-town calm on the bay.', ['relaxing', 'wellness', 'local', 'foodie'], ['couples', 'wellness', 'weekend'], 27.990, -82.693),
      ('tampa-bay-safety-harbor-waterfront', 'Safety Harbor Waterfront', DistrictType.beach,
          'Marina sunsets and boardwalk benches — rain-day spa backup nearby.', ['waterfront', 'sunset', 'relaxing', 'local'], ['couples', 'wellness', 'local'], 27.988, -82.688),
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
      ...TampaBayCuratedPlaces.flagship,
      ...TampaBayHotelsCatalog.hotelPlaces,
    ];
    var idx = 0;

    for (var d = 0; d < districts.length; d++) {
      final dist = districts[d];
      final lat = _districtLat(dist);
      final lng = _districtLng(dist);

      for (var r = 0; r < 9; r++) {
        final style = _restaurantStyles[(d + r) % _restaurantStyles.length];
        out.add(_place(
          id: 'tampa-bay-dining-${dist.districtId}-$r',
          title: '${dist.districtName} ${style.$1}',
          category: LuxPlaceCategory.dining,
          lat: lat + (r * 0.0018),
          lng: lng - (r * 0.0012),
          location: '${dist.districtName}, Tampa Bay',
          description:
              'Concierge-curated ${style.$1.toLowerCase()} — ${dist.description}',
          moodTags: [...style.$2, 'dining', 'tampa-bay'],
          photo: _photo(idx++),
        ));
      }

      for (var a = 0; a < 4; a++) {
        final kind = _attractionKinds[(d + a) % _attractionKinds.length];
        out.add(_place(
          id: 'tampa-bay-attr-${dist.districtId}-$a',
          title: '${dist.districtName} ${kind.$1}',
          category: kind.$2,
          lat: lat - (a * 0.0025),
          lng: lng + (a * 0.0018),
          location: '${dist.districtName}, Tampa Bay',
          description: '${kind.$1} — ${dist.vibeTags.take(2).join(' & ')} energy.',
          moodTags: [...kind.$3, 'tampa-bay'],
          photo: _photo(idx++),
        ));
      }

      for (var e = 0; e < 6; e++) {
        final kind = _experienceKinds[(d + e) % _experienceKinds.length];
        out.add(_place(
          id: 'tampa-bay-exp-${dist.districtId}-$e',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (e * 0.003),
          lng: lng + (e * 0.0025),
          location: '${dist.districtName}, Tampa Bay',
          description:
              'Bookable experience — ${kind.$1.toLowerCase()} with local operators.',
          moodTags: [...kind.$2, 'experience', 'tampa-bay'],
          photo: _photo(idx++),
        ));
      }

      for (var g = 0; g < 6; g++) {
        out.add(_place(
          id: 'tampa-bay-gem-place-${dist.districtId}-$g',
          title: 'Hidden ${dist.districtName} ${g + 1}',
          category: g.isEven ? LuxPlaceCategory.beach : LuxPlaceCategory.dining,
          lat: lat + (g * 0.0012),
          lng: lng - (g * 0.0016),
          location: '${dist.districtName} · local gem',
          description:
              'Insider-only — secret beach, rooftop, brewery, or sunset bench worth the detour.',
          moodTags: ['hidden', 'local', 'gem', 'tampa-bay'],
          photo: _photo(idx++),
        ));
      }
    }

    return out;
  }

  static List<HiddenGem> _buildGems() {
    final out = <HiddenGem>[...tampaBayHiddenGemsCatalog];
    for (final dist in districts) {
      for (var g = 0; g < 6; g++) {
        if (out.length >= 105) break;
        out.add(
          HiddenGem(
            id: 'tampa-bay-gem-${dist.districtId}-$g',
            title: 'Hidden ${dist.districtName} ${g + 1}',
            location: '${dist.districtName} · Tampa Bay',
            whySpecial:
                'Local-only ${dist.vibeTags.first} spot — photogenic, quiet, and off the tourist loop.',
            bestTime: g.isEven ? 'Sunrise · weekdays' : 'Golden hour',
            crowdLevel: g.isEven ? 'Low' : 'Moderate weekends',
            insiderTip:
                'Pair with ${dist.districtName} dinner — arrive 30 min before peak.',
            localOnlyNote: 'Residents guard this one — not in guidebooks.',
            gradient: tampaBayHiddenGemsCatalog.first.gradient,
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
          bestTimeToVisit: i.isEven ? 'Before noon · calmer Gulf' : 'Sunset golden hour',
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

  static List<TampaBayMoodRoute> _buildMoodRoutes() {
    final dining = places.where((p) => p.category == LuxPlaceCategory.dining).toList();
    final beaches = places.where((p) => p.category == LuxPlaceCategory.beach).toList();
    final culture = places.where((p) => p.moodTags.contains('culture')).toList();
    final waterfront = places.where((p) => p.moodTags.contains('waterfront')).toList();

    String pick(List<LuxPlace> list, int i) =>
        list.isEmpty ? dining[i % dining.length].id : list[i % list.length].id;

    const routes = [
      ('Ultimate Tampa Weekend', ['weekend', 'waterfront', 'foodie', 'local']),
      ('St. Pete Art & Food Route', ['arts', 'culture', 'foodie', 'walkable']),
      ('Clearwater Beach Escape', ['beach', 'family', 'sunset', 'relaxing']),
      ('Romantic Tampa Bay', ['romantic', 'couples', 'sunset', 'waterfront']),
      ('Family Adventure Tampa', ['family', 'adventure', 'beach', 'full-day']),
      ('Brewery Explorer Route', ['brewery', 'local', 'social', 'foodie']),
      ('Sunset Chaser Route', ['sunset', 'waterfront', 'photo', 'romantic']),
      ('Hidden Tampa Bay', ['hidden', 'local', 'gem', 'off-path']),
      ('Waterfront Weekend', ['waterfront', 'walkable', 'relaxing', 'weekend']),
      ('Local Favorites Route', ['local', 'foodie', 'culture', 'authentic']),
    ];

    return [
      for (var i = 0; i < routes.length; i++)
        TampaBayMoodRoute(
          routeId: 'tampa-bay-route-$i',
          title: routes[i].$1,
          description:
              'Prebuilt Luxora concierge flow — ${routes[i].$2.join(', ')}.',
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
