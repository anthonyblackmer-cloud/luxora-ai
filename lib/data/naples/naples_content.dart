import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/data/naples/naples_curated_places.dart';
import 'package:luxora_ai/data/naples/naples_feed_items.dart';
import 'package:luxora_ai/data/naples/naples_gem_discoveries.dart';
import 'package:luxora_ai/data/naples/naples_hotels_catalog.dart';
import 'package:luxora_ai/data/naples/naples_local_secrets.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/naples/naples_mood_route.dart';

/// Naples city pack â€” Gulf luxury, white-sand beaches, golf corridors, and Fifth Avenue polish.
abstract final class NaplesContent {
  static const cityId = 'naples';

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
    ('Waterfront fine dining', ['luxury', 'seafood', 'sunset', 'dining']),
    ('Steak & wine', ['luxury', 'date-night', 'foodie', 'dining']),
    ('Fresh Gulf seafood', ['seafood', 'foodie', 'local', 'waterfront']),
    ('Italian coastal', ['foodie', 'romantic', 'luxury', 'dining']),
    ('Beach club grill', ['beach', 'casual', 'family', 'sunset']),
    ('Sushi lounge', ['luxury', 'date-night', 'foodie', 'dining']),
    ('Farm-to-table', ['foodie', 'local', 'wellness', 'dining']),
    ('Rooftop cocktails', ['luxury', 'sunset', 'romantic', 'nightlife']),
    ('Casual bayfront', ['waterfront', 'family', 'local', 'casual']),
    ('Chef\'s tasting menu', ['luxury', 'foodie', 'romantic', 'dining']),
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
  static List<NaplesMoodRoute>? _routes;

  static List<DistrictPack> get districts => _districts ??= _buildDistricts();
  static List<LuxPlace> get places => _places ??= _buildAllPlaces();
  static List<LuxHotel> get hotels => _hotels ??= NaplesHotelsCatalog.all;
  static List<HiddenGem> get gems => _gems ??= _buildGems();
  static List<HiddenGem> get localSecrets =>
      _localSecrets ??= NaplesLocalSecrets.buildForDistricts(districts);
  static List<FeedItem> get feedItems => _feed ??= naplesDiscoveryFeed;
  static List<BeachIntelligence> get beachIntelligence =>
      _beachIntel ??= _buildBeachIntel();
  static List<NaplesMoodRoute> get moodRoutes => _routes ??= _buildMoodRoutes();

  static Map<String, String> get feedItemPlaceIds => kNaplesFeedItemPlaceIds;
  static Map<String, String> get gemPlaceIds => kNaplesGemPlaceIds;
  static Map<String, String> get itineraryMomentPlaceIds =>
      kNaplesItineraryMomentPlaceIds;

  static String _photo(int i) => _photos[i % _photos.length];

  static List<DistrictPack> _buildDistricts() {
    const seeds = [
      ('naples-downtown-naples', 'Downtown Naples', DistrictType.downtown, 'Fifth and Third corridors â€” polished dining and gallery walks.', ['luxury', 'walkable', 'foodie'], ['luxury', 'foodies', 'weekend'], 26.144, -81.79679999999999),
      ('naples-fifth-avenue-south', 'Fifth Avenue South', DistrictType.downtown, 'Designer boutiques, al fresco dining, and palm-lined evenings.', ['luxury', 'foodie', 'romantic'], ['couples', 'luxury', 'weekend'], 26.143, -81.7978),
      ('naples-third-street-south', 'Third Street South', DistrictType.downtown, 'Courtyard cafÃ©s and art galleries in Old Naples charm.', ['arts', 'foodie', 'walkable'], ['foodies', 'culture', 'couples'], 26.141, -81.7988),
      ('naples-vanderbilt-beach', 'Vanderbilt Beach', DistrictType.beach, 'Upscale Gulf access, paddleboard launches, and sunset decks.', ['beach', 'luxury', 'sunset'], ['couples', 'beach', 'luxury'], 26.177, -81.8098),
      ('naples-mercato', 'Mercato', DistrictType.nightlife, 'Open-air luxury retail, cinema, and social dining hub north of town.', ['luxury', 'social', 'nightlife'], ['friend-groups', 'luxury', 'weekend'], 26.166999999999998, -81.80279999999999),
      ('naples-naples-pier-area', 'Naples Pier Area', DistrictType.beach, 'Iconic pier sunsets and gentle Gulf swims at the city beach.', ['beach', 'iconic', 'family'], ['families', 'beach', 'sunset'], 26.134, -81.8008),
      ('naples-old-naples', 'Old Naples', DistrictType.suburban, 'Banyan-shaded streets and quiet luxury residential calm.', ['luxury', 'relaxing', 'local'], ['couples', 'luxury', 'local'], 26.137999999999998, -81.79979999999999),
      ('naples-park-shore', 'Park Shore', DistrictType.resort, 'High-rise resorts and private beach club energy.', ['luxury', 'beach', 'resort'], ['luxury', 'couples', 'beach'], 26.154, -81.8048),
      ('naples-pelican-bay', 'Pelican Bay', DistrictType.resort, 'Audubon preserves meet club-resort golf and tennis.', ['luxury', 'golf', 'nature'], ['luxury', 'golf', 'wellness'], 26.16, -81.8068),
      ('naples-marco-island', 'Marco Island', DistrictType.beach, 'Island resorts, shelling beaches, and boat-day launches.', ['beach', 'luxury', 'adventure'], ['families', 'luxury', 'beach'], 26.022, -81.7448),
      ('naples-bonita-springs', 'Bonita Springs', DistrictType.suburban, 'Estero Bay access and relaxed Gulf-town dining south of Naples.', ['beach', 'local', 'family'], ['families', 'local', 'weekend'], 26.221999999999998, -81.81479999999999),
      ('naples-estero-bay', 'Estero Bay', DistrictType.other, 'Kayak mangroves and paddle calm back-bay waters.', ['nature', 'adventure', 'water'], ['adventure', 'nature', 'couples'], 26.201999999999998, -81.8198),
      ('naples-north-naples', 'North Naples', DistrictType.suburban, 'Country-club corridors and quiet beach park escapes.', ['luxury', 'golf', 'local'], ['luxury', 'golf', 'local'], 26.187, -81.8128),
      ('naples-gulf-shore', 'Gulf Shore', DistrictType.beach, 'Million-dollar views and soft-sand morning walks.', ['beach', 'luxury', 'romantic'], ['couples', 'luxury', 'beach'], 26.136, -81.80279999999999),
      ('naples-waterside', 'Waterside', DistrictType.downtown, 'Naples Bay marina dining and boat-watching terraces.', ['waterfront', 'foodie', 'sunset'], ['foodies', 'couples', 'weekend'], 26.145, -81.7928),
      ('naples-tin-city', 'Tin City', DistrictType.other, 'Waterfront shops, casual seafood, and charter boat hub.', ['waterfront', 'foodie', 'local'], ['families', 'local', 'foodie'], 26.147, -81.79079999999999),
      ('naples-crayton-cove', 'Crayton Cove', DistrictType.suburban, 'Yacht-club village feel and hidden bayfront bistros.', ['luxury', 'hidden', 'waterfront'], ['couples', 'luxury', 'local'], 26.14, -81.7918),
      ('naples-royal-poinciana', 'Royal Poinciana', DistrictType.suburban, 'Plaza shopping and polished Old Naples gateway.', ['luxury', 'walkable', 'shopping'], ['luxury', 'weekend', 'couples'], 26.141, -81.79679999999999),
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
      ...NaplesCuratedPlaces.flagship,
      ...NaplesHotelsCatalog.hotelPlaces,
    ];
    var idx = 0;

    for (var d = 0; d < districts.length; d++) {
      final dist = districts[d];
      final lat = _districtLat(dist);
      final lng = _districtLng(dist);

      for (var r = 0; r < 9; r++) {
        final style = _restaurantStyles[(d + r) % _restaurantStyles.length];
        out.add(_place(
          id: 'naples-dining-${dist.districtId}-$r',
          title: '${dist.districtName} ${style.$1}',
          category: LuxPlaceCategory.dining,
          lat: lat + (r * 0.0018),
          lng: lng - (r * 0.0012),
          location: '${dist.districtName}, Naples',
          description:
              'Concierge-curated ${style.$1.toLowerCase()} â€” ${dist.description}',
          moodTags: [...style.$2, 'dining', 'naples'],
          photo: _photo(idx++),
        ));
      }

      for (var a = 0; a < 4; a++) {
        final kind = _attractionKinds[(d + a) % _attractionKinds.length];
        out.add(_place(
          id: 'naples-attr-${dist.districtId}-$a',
          title: '${dist.districtName} ${kind.$1}',
          category: kind.$2,
          lat: lat - (a * 0.0025),
          lng: lng + (a * 0.0018),
          location: '${dist.districtName}, Naples',
          description: '${kind.$1} â€” ${dist.vibeTags.take(2).join(' & ')} energy.',
          moodTags: [...kind.$3, 'naples'],
          photo: _photo(idx++),
        ));
      }

      for (var e = 0; e < 6; e++) {
        final kind = _experienceKinds[(d + e) % _experienceKinds.length];
        out.add(_place(
          id: 'naples-exp-${dist.districtId}-$e',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (e * 0.003),
          lng: lng + (e * 0.0025),
          location: '${dist.districtName}, Naples',
          description:
              'Bookable experience â€” ${kind.$1.toLowerCase()} with local operators.',
          moodTags: [...kind.$2, 'experience', 'naples'],
          photo: _photo(idx++),
        ));
      }

      for (var g = 0; g < 6; g++) {
        out.add(_place(
          id: 'naples-gem-place-${dist.districtId}-$g',
          title: 'Hidden ${dist.districtName} ${g + 1}',
          category: g.isEven ? LuxPlaceCategory.beach : LuxPlaceCategory.dining,
          lat: lat + (g * 0.0012),
          lng: lng - (g * 0.0016),
          location: '${dist.districtName} Â· local gem',
          description:
              'Insider-only â€” secret beach, courtyard, or sunset bench worth the detour.',
          moodTags: ['hidden', 'local', 'gem', 'naples'],
          photo: _photo(idx++),
        ));
      }
    }

    return out;
  }

  static List<HiddenGem> _buildGems() {
    final out = <HiddenGem>[...naplesHiddenGemsCatalog];
    for (final dist in districts) {
      for (var g = 0; g < 6; g++) {
        if (out.length >= 105) break;
        out.add(
          HiddenGem(
            id: 'naples-gem-${dist.districtId}-$g',
            title: 'Hidden ${dist.districtName} ${g + 1}',
            location: '${dist.districtName} Â· Naples',
            whySpecial:
                'Local-only ${dist.vibeTags.first} spot â€” photogenic, quiet, and off the tourist loop.',
            bestTime: g.isEven ? 'Sunrise Â· weekdays' : 'Golden hour',
            crowdLevel: g.isEven ? 'Low' : 'Moderate weekends',
            insiderTip:
                'Pair with ${dist.districtName} dinner â€” arrive 30 min before peak.',
            localOnlyNote: 'Residents guard this one â€” not in guidebooks.',
            gradient: naplesHiddenGemsCatalog.first.gradient,
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

  static List<NaplesMoodRoute> _buildMoodRoutes() {
    final dining = places.where((p) => p.category == LuxPlaceCategory.dining).toList();
    final beaches = places.where((p) => p.category == LuxPlaceCategory.beach).toList();
    final culture = places.where((p) => p.moodTags.contains('culture')).toList();
    final waterfront = places.where((p) => p.moodTags.contains('waterfront')).toList();

    String pick(List<LuxPlace> list, int i) =>
        list.isEmpty ? dining[i % dining.length].id : list[i % list.length].id;

    const routes = [
      ('Luxury Naples Weekend', ['luxury', 'beach', 'dining', 'weekend']),
      ('Fifth Avenue Food & Shop', ['foodie', 'luxury', 'walkable', 'shopping']),
      ('Gulf Beach Day', ['beach', 'family', 'sunset', 'relaxing']),
      ('Romantic Naples Escape', ['romantic', 'couples', 'luxury', 'sunset']),
      ('Golf & Spa Retreat', ['golf', 'wellness', 'luxury', 'relaxing']),
      ('Marco Island Adventure', ['beach', 'adventure', 'luxury', 'full-day']),
      ('Hidden Naples Locals', ['hidden', 'local', 'gem', 'waterfront']),
      ('Sunset Pier Route', ['sunset', 'beach', 'iconic', 'photo']),
      ('Family Gulf Weekend', ['family', 'beach', 'casual', 'weekend']),
      ('Rainy Day Naples', ['rainy-day', 'culture', 'spa', 'indoor']),
    ];

    return [
      for (var i = 0; i < routes.length; i++)
        NaplesMoodRoute(
          routeId: 'naples-route-$i',
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

