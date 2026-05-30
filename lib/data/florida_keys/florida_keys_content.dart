import 'package:luxora_ai/data/florida_keys/florida_keys_curated_places.dart';
import 'package:luxora_ai/data/florida_keys/florida_keys_feed_items.dart';
import 'package:luxora_ai/data/florida_keys/florida_keys_gem_discoveries.dart';
import 'package:luxora_ai/data/florida_keys/florida_keys_hotels_catalog.dart';
import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/florida_keys/keys_mood_route.dart';
import 'package:luxora_ai/models/florida_keys/keys_water_intelligence.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// Florida Keys city pack — island concierge with reef, sunset, and boating intelligence.
abstract final class FloridaKeysContent {
  static const cityId = 'florida-keys';

  static const _photos = [
    'AK2vwEobto4',
    'X_LNSoZ7xeM',
    'eQ2ElhooTjc',
    'sWK9wki5zHU',
    'JZYQ_P94T-Q',
    'xEaAoizNFV8',
    'RibghBxKlKc',
    'p0vZplFhKYI',
    'M4RVCkMpb1I',
    'z78FxiNCA5w',
  ];

  static const _restaurantStyles = [
    ('Waterfront seafood shack', ['foodie', 'seafood', 'local', 'waterfront']),
    ('Sunset dining deck', ['sunset', 'romantic', 'waterfront', 'fine-dining']),
    ('Tiki bar & conch fritters', ['local', 'social', 'nightlife', 'hidden']),
    ('Dockside grill', ['foodie', 'fishing', 'waterfront', 'casual']),
    ('Keys breakfast café', ['breakfast', 'local', 'relaxing', 'family']),
    ('Hidden local favorite', ['hidden', 'local', 'foodie', 'gem']),
    ('Fine dining island room', ['luxury', 'romantic', 'fine-dining', 'sunset']),
    ('Sandbar picnic spot', ['adventure', 'water', 'local', 'hidden']),
  ];

  static const _attractionKinds = [
    ('State park beach', LuxPlaceCategory.beach, ['beach', 'nature', 'family']),
    ('Historic lighthouse', LuxPlaceCategory.adventure, ['historic', 'photo', 'scenic']),
    ('Wildlife refuge trail', LuxPlaceCategory.nature, ['wildlife', 'nature', 'local']),
    ('Scenic Overseas pull-off', LuxPlaceCategory.adventure, ['scenic', 'drive', 'photo']),
    ('Reef access point', LuxPlaceCategory.nature, ['snorkeling', 'water', 'adventure']),
  ];

  static const _experienceKinds = [
    ('Snorkel reef trip', ['snorkeling', 'water', 'adventure']),
    ('Scuba dive charter', ['diving', 'water', 'adventure']),
    ('Backcountry fishing charter', ['fishing', 'water', 'local']),
    ('Sunset sail cruise', ['sunset', 'romantic', 'water']),
    ('Kayak mangrove tour', ['kayak', 'nature', 'relaxing']),
    ('Sandbar excursion', ['adventure', 'water', 'social']),
    ('Dolphin eco tour', ['wildlife', 'family', 'water']),
    ('Jet ski rental', ['adventure', 'water', 'social']),
    ('Island hopper boat', ['boating', 'adventure', 'scenic']),
    ('Paddleboard lagoon', ['paddleboard', 'wellness', 'water']),
  ];

  static List<DistrictPack>? _districts;
  static List<LuxPlace>? _places;
  static List<HiddenGem>? _gems;
  static List<FeedItem>? _feed;
  static List<KeysWaterIntelligence>? _waterIntel;
  static List<KeysMoodRoute>? _routes;

  static List<DistrictPack> get districts => _districts ??= _buildDistricts();
  static List<LuxPlace> get places => _places ??= _buildAllPlaces();
  static List<LuxHotel> get hotels => FloridaKeysHotelsCatalog.all;
  static List<HiddenGem> get gems => _gems ??= floridaKeysHiddenGemsCatalog;
  static List<FeedItem> get feedItems => _feed ??= floridaKeysDiscoveryFeed;
  static List<KeysWaterIntelligence> get waterIntelligence =>
      _waterIntel ??= _buildWaterIntel();
  static List<KeysMoodRoute> get moodRoutes => _routes ??= _buildMoodRoutes();

  static Map<String, String> get feedItemPlaceIds => kFloridaKeysFeedItemPlaceIds;
  static Map<String, String> get gemPlaceIds => kFloridaKeysGemPlaceIds;
  static Map<String, String> get itineraryMomentPlaceIds =>
      kFloridaKeysItineraryMomentPlaceIds;

  static List<DistrictPack> _buildDistricts() {
    const seeds = [
      (
        'keys-key-largo',
        'Key Largo',
        DistrictType.beach,
        'Reef gateway — Pennekamp, dive boats, and mangrove calm.',
        ['snorkeling', 'diving', 'nature', 'fishing'],
        ['adventure', 'couples', 'families'],
        25.086,
        -80.447,
      ),
      (
        'keys-islamorada',
        'Islamorada',
        DistrictType.resort,
        'Sportfishing capital — marina docks, tarpon rituals, and chic waterfront.',
        ['fishing', 'luxury', 'waterfront', 'local'],
        ['foodies', 'fishing', 'couples'],
        24.924,
        -80.628,
      ),
      (
        'keys-marathon',
        'Marathon',
        DistrictType.beach,
        'Middle Keys hub — Seven Mile Bridge, Sombrero Beach, and turtle rescue.',
        ['beach', 'family', 'scenic', 'wildlife'],
        ['families', 'road-trip', 'relaxing'],
        24.714,
        -81.078,
      ),
      (
        'keys-big-pine',
        'Big Pine Key',
        DistrictType.other,
        'Key deer, Bahia Honda sands, and quiet island pacing.',
        ['nature', 'beach', 'wildlife', 'relaxing'],
        ['couples', 'nature', 'photography'],
        24.671,
        -81.365,
      ),
      (
        'keys-key-west',
        'Key West',
        DistrictType.nightlife,
        'Sunset celebrations, Duval nights, and Old Town romance.',
        ['sunset', 'nightlife', 'romantic', 'culture'],
        ['couples', 'nightlife', 'weekend'],
        24.555,
        -81.782,
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
            north: s.$7 + 0.04,
            south: s.$7 - 0.04,
            east: s.$8 + 0.06,
            west: s.$8 - 0.06,
          ),
        ),
    ];
  }

  static List<LuxPlace> _buildAllPlaces() {
    final out = <LuxPlace>[
      ...FloridaKeysCuratedPlaces.flagship,
      ...FloridaKeysHotelsCatalog.hotelPlaces,
    ];
    var idx = 0;

    for (var d = 0; d < districts.length; d++) {
      final dist = districts[d];
      final lat = _districtLat(dist);
      final lng = _districtLng(dist);

      for (var r = 0; r < 30; r++) {
        final style = _restaurantStyles[(d + r) % _restaurantStyles.length];
        out.add(_place(
          id: 'keys-dining-${dist.districtId}-$r',
          title: '${dist.districtName} ${style.$1}',
          category: LuxPlaceCategory.dining,
          lat: lat + (r * 0.0018),
          lng: lng - (r * 0.0012),
          location: '${dist.districtName}, FL Keys',
          description:
              'Concierge-curated ${style.$1.toLowerCase()} — ${dist.description}',
          moodTags: [...style.$2, 'dining', 'keys'],
          photo: _photos[idx++ % _photos.length],
        ));
      }

      for (var a = 0; a < 15; a++) {
        final kind = _attractionKinds[(d + a) % _attractionKinds.length];
        out.add(_place(
          id: 'keys-attr-${dist.districtId}-$a',
          title: '${dist.districtName} ${kind.$1}',
          category: kind.$2,
          lat: lat - (a * 0.0025),
          lng: lng + (a * 0.0018),
          location: '${dist.districtName}, FL Keys',
          description: '${kind.$1} — ${dist.vibeTags.take(2).join(' & ')} island energy.',
          moodTags: [...kind.$3, 'keys', 'attraction'],
          photo: _photos[idx++ % _photos.length],
        ));
      }

      for (var e = 0; e < 20; e++) {
        final kind = _experienceKinds[(d + e) % _experienceKinds.length];
        out.add(_place(
          id: 'keys-exp-${dist.districtId}-$e',
          title: '${dist.districtName} ${kind.$1}',
          category: LuxPlaceCategory.adventure,
          lat: lat + (e * 0.0022),
          lng: lng + (e * 0.0015),
          location: '${dist.districtName}, FL Keys',
          description:
              'Bookable Keys experience — ${kind.$1.toLowerCase()} with vetted local captains.',
          moodTags: [...kind.$2, 'experience', 'keys'],
          photo: _photos[idx++ % _photos.length],
        ));
      }

      for (var g = 0; g < 20; g++) {
        out.add(_place(
          id: 'keys-gem-place-${dist.districtId}-$g',
          title: 'Secret ${dist.districtName} spot ${g + 1}',
          category: g.isEven ? LuxPlaceCategory.beach : LuxPlaceCategory.dining,
          lat: lat + (g * 0.0012),
          lng: lng - (g * 0.0016),
          location: '${dist.districtName} · local secret',
          description:
              'Insider-only — quiet dock, sunset angle, or reef entry locals guard.',
          moodTags: ['hidden', 'local', 'gem', 'keys', 'sunset'],
          photo: _photos[idx++ % _photos.length],
        ));
      }
    }

    return out;
  }

  static List<KeysWaterIntelligence> _buildWaterIntel() {
    final waterPlaces = places
        .where(
          (p) =>
              p.category == LuxPlaceCategory.beach ||
              p.category == LuxPlaceCategory.nature ||
              p.moodTags.contains('water') ||
              p.moodTags.contains('snorkeling'),
        )
        .toList();

    return [
      for (var i = 0; i < waterPlaces.length; i++)
        KeysWaterIntelligence(
          placeId: waterPlaces[i].id,
          bestTimeToVisit: i.isEven ? '8–11 AM · calm wind window' : '90 min before sunset',
          waterTemperatureNote: i.isEven ? '78–82°F · warm swim season' : '75–80°F · breezy evenings',
          snorkelingQuality: 65 + (i * 9) % 34,
          divingConditions: 60 + (i * 11) % 38,
          boatingSuitability: 70 + (i * 7) % 28,
          fishingOutlook: 55 + (i * 13) % 42,
          windSensitivity: 25 + (i * 8) % 55,
          sunsetQuality: 72 + (i * 5) % 27,
          crowdLevel: 30 + (i * 12) % 60,
          parkingDifficulty: i.isEven ? 'Limited · arrive early' : 'Moderate',
          nearbyRestaurantPlaceIds: places
              .where((p) => p.category == LuxPlaceCategory.dining)
              .skip(i)
              .take(2)
              .map((p) => p.id)
              .toList(),
        ),
    ];
  }

  static List<KeysMoodRoute> _buildMoodRoutes() {
    final dining = places.where((p) => p.category == LuxPlaceCategory.dining).toList();
    final beaches = places.where((p) => p.category == LuxPlaceCategory.beach).toList();
    final experiences = places.where((p) => p.id.contains('-exp-')).toList();
    final sunsets = places.where((p) => p.moodTags.contains('sunset')).toList();

    String pick(List<LuxPlace> list, int i) =>
        list.isEmpty ? dining[i % dining.length].id : list[i % list.length].id;

    const routes = [
      ('Ultimate Key West Weekend', ['weekend', 'key-west', 'iconic']),
      ('Romantic Florida Keys Escape', ['romantic', 'couples', 'sunset']),
      ('Hidden Keys Adventure', ['hidden', 'local', 'adventure']),
      ('Sunset Chaser Route', ['sunset', 'photo', 'waterfront']),
      ('Luxury Island Weekend', ['luxury', 'resort', 'wellness']),
      ('Fishing & Boating Route', ['fishing', 'boating', 'water']),
      ('Family Island Adventure', ['family', 'beach', 'wildlife']),
      ('Foodie Keys Experience', ['foodie', 'seafood', 'local']),
      ('Snorkeling & Reef Explorer', ['snorkeling', 'diving', 'reef']),
      ('Local Secrets Route', ['hidden', 'local', 'gem']),
    ];

    return [
      for (var i = 0; i < routes.length; i++)
        KeysMoodRoute(
          routeId: 'keys-route-$i',
          title: routes[i].$1,
          description:
              'Prebuilt island concierge flow — ${routes[i].$2.join(', ')} across the Overseas Highway.',
          moodTags: routes[i].$2,
          morningPlaceId: pick(beaches.isNotEmpty ? beaches : experiences, i),
          lunchPlaceId: pick(dining, i + 1),
          afternoonPlaceId: pick(experiences, i + 2),
          dinnerPlaceId: pick(dining, i + 3),
          eveningPlaceId: pick(sunsets.isNotEmpty ? sunsets : beaches, i),
          bestStartTime: i.isEven ? '8:30 AM' : '10:00 AM',
          weatherSensitive: true,
          crowdSensitive: i.isEven,
          estimatedDriveMinutes: 35 + (i * 11) % 90,
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
