import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/data/hotels_catalog.dart';
import 'package:luxora_ai/data/florida_keys/florida_keys_content.dart';
import 'package:luxora_ai/data/florida_keys/florida_keys_ticket_deals.dart';
import 'package:luxora_ai/data/miami/miami_content.dart';
import 'package:luxora_ai/data/miami/miami_ticket_deals.dart';
import 'package:luxora_ai/data/orlando_hub.dart';
import 'package:luxora_ai/data/ticket_deals_catalog.dart';
import 'package:luxora_ai/models/city_pack/city_pack.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/city_pack/state_pack.dart';
import 'package:luxora_ai/services/city_pack_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _activeCityKey = 'luxora_active_city_pack_id';

/// Luxora Engine → active State/City pack — destinations are data, not code forks.
class CityPackRegistry extends ChangeNotifier {
  CityPackRegistry._();

  static final CityPackRegistry instance = CityPackRegistry._();

  final Map<String, StatePack> _states = {};
  final Map<String, CityPack> _cities = {};
  String _activeCityId = 'orlando';

  CityPack get active => _cities[_activeCityId] ?? _orlandoFallback();
  StatePack? get stateForActive => _states[active.stateId];

  List<StatePack> get allStates => _states.values.toList();
  List<CityPack> get allCities => _cities.values.toList();
  List<CityPack> citiesInState(String stateId) =>
      _cities.values.where((c) => c.stateId == stateId).toList();

  LatLng get hubCenter =>
      LatLng(active.mapCenterLat, active.mapCenterLng);

  String get hubLabel => active.hubLabel ?? active.cityName;

  Map<String, String> get feedItemPlaceIds {
    final featured = active.feedItemPlaceIds;
    if (featured.isNotEmpty) return featured;
    return active.cityId == 'orlando' ? kFeedItemPlaceIds : const {};
  }

  Map<String, String> get gemPlaceIds {
    final featured = active.gemPlaceIds;
    if (featured.isNotEmpty) return featured;
    return active.cityId == 'orlando' ? kGemPlaceIds : const {};
  }

  Map<String, String> get itineraryMomentPlaceIds {
    final featured = active.itineraryMomentPlaceIds;
    if (featured.isNotEmpty) return featured;
    return active.cityId == 'orlando' ? kItineraryMomentPlaceIds : const {};
  }

  List<String> get hotelIntelIds {
    final featured = active.featuredHotelIntelIds;
    if (featured.isNotEmpty) return featured;
    return active.cityId == 'orlando'
        ? HotelsCatalog.all.map((h) => h.id).toList()
        : const [];
  }

  List<String> get ticketDealIds {
    final featured = active.featuredTicketDealIds;
    if (featured.isNotEmpty) return featured;
    return active.cityId == 'orlando'
        ? ticketDealsCatalog.map((d) => d.id).toList()
        : const [];
  }

  bool _loaded = false;

  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;

    _registerFloridaState();
    await _loadBundledPacks();
    _mergeOrlandoFromDartCatalog();
    _mergeMiamiFromDartCatalog();
    _mergeFloridaKeysFromDartCatalog();

    try {
      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getString(_activeCityKey);
      if (stored != null && _cities.containsKey(stored)) {
        _activeCityId = stored;
      }
    } catch (_) {
      // SharedPreferences unavailable in unit tests — keep default city.
    }
  }

  Future<void> setActiveCity(String cityId) async {
    if (!_cities.containsKey(cityId)) return;
    _activeCityId = cityId;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_activeCityKey, cityId);
    notifyListeners();
  }

  /// Import a pack from JSON (admin / publish pipeline).
  void registerCityPack(CityPack pack) {
    _cities[pack.cityId] = pack;
    final state = _states[pack.stateId];
    if (state != null &&
        !state.cityIds.contains(pack.cityId)) {
      _states[pack.stateId] = StatePack(
        stateId: state.stateId,
        stateName: state.stateName,
        heroImageUrl: state.heroImageUrl,
        destinationCount: state.cityIds.length + 1,
        cityIds: [...state.cityIds, pack.cityId],
      );
    }
    notifyListeners();
  }

  void registerStatePack(StatePack state) {
    _states[state.stateId] = state;
  }

  bool placeBelongsToActivePack(String? cityPackId) {
    final normalized = (cityPackId == null || cityPackId.isEmpty)
        ? 'orlando'
        : cityPackId;
    return normalized == active.cityId;
  }

  Future<void> _loadBundledPacks() async {
    // Florida Keys is merged from [FloridaKeysContent] — skip JSON so stale web
    // builds (hot restart without asset rebundle) do not 404 on the new file.
    const assets = [
      'assets/city_packs/city_pack_orlando.json',
      'assets/city_packs/city_pack_miami.json',
      'assets/city_packs/city_pack_nyc.json',
      'assets/city_packs/city_pack_vegas.json',
      'assets/city_packs/city_pack_paris.json',
    ];
    for (final path in assets) {
      try {
        final pack = await CityPackLoader.loadCityPackAsset(path);
        _cities[pack.cityId] = pack;
      } catch (e) {
        if (kDebugMode) {
          debugPrint('CityPackRegistry: skip $path ($e)');
        }
      }
    }
  }

  void _registerFloridaState() {
    registerStatePack(
      const StatePack(
        stateId: 'florida',
        stateName: 'Florida',
        destinationCount: 3,
        cityIds: ['orlando', 'miami', 'florida-keys'],
      ),
    );
  }

  void _mergeOrlandoFromDartCatalog() {
    final existing = _cities['orlando'];
    final orlando = CityPack(
      cityId: 'orlando',
      cityName: 'Orlando',
      stateId: 'florida',
      description: existing?.description ??
          'Theme parks, springs, and concierge-calibrated neighborhoods.',
      heroImageUrl: existing?.heroImageUrl,
      mapCenterLat: OrlandoHub.latitude,
      mapCenterLng: OrlandoHub.longitude,
      hubLabel: OrlandoHub.label,
      supportedCategories: existing?.supportedCategories ??
          [
            'hotel',
            'dining',
            'family',
            'nature',
            'springs',
            'nightlife',
            'wellness',
            'adventure',
          ],
      featuredExperienceIds: curatedPlacesCatalog.map((p) => p.id).toList(),
      featuredHotelIds: HotelsCatalog.all.map((h) => h.placeId).toList(),
      featuredRestaurantIds: curatedPlacesCatalog
          .where((p) => p.category.name == 'dining')
          .map((p) => p.id)
          .toList(),
      featuredTicketDealIds: ticketDealsCatalog.map((d) => d.id).toList(),
      featuredHotelIntelIds: HotelsCatalog.all.map((h) => h.id).toList(),
      districts: existing?.districts ?? _orlandoDistricts(),
      experiences: const [],
      feedItemPlaceIds: kFeedItemPlaceIds,
      gemPlaceIds: kGemPlaceIds,
      itineraryMomentPlaceIds: kItineraryMomentPlaceIds,
      osmAssetPath: 'assets/places/osm_places.json',
      defaultRadiusMiles: 50,
      maxRadiusMiles: 100,
    );
    _cities['orlando'] = orlando;
  }

  void _mergeMiamiFromDartCatalog() {
    final existing = _cities['miami'];
    final miamiPlaces = MiamiContent.places;
    final miamiHotels = MiamiContent.hotels;
    final miami = CityPack(
      cityId: 'miami',
      cityName: 'Miami',
      stateId: 'florida',
      description: existing?.description ??
          'Luxury beaches, Wynwood art, Brickell nightlife, and Cuban culture — '
          'Miami as a lifestyle concierge, not a theme-park clone.',
      heroImageUrl: existing?.heroImageUrl ?? 'JZYQ_P94T-Q',
      mapCenterLat: 25.7617,
      mapCenterLng: -80.1918,
      hubLabel: 'Miami, FL',
      supportedCategories: existing?.supportedCategories ??
          [
            'hotel',
            'dining',
            'beach',
            'nightlife',
            'wellness',
            'adventure',
            'culture',
            'luxury',
            'foodie',
          ],
      featuredExperienceIds: miamiPlaces
          .where((p) => p.id.contains('-exp-'))
          .map((p) => p.id)
          .toList(),
      featuredHotelIds:
          miamiHotels.map((h) => h.placeId).toList(),
      featuredRestaurantIds: miamiPlaces
          .where((p) => p.category.name == 'dining')
          .map((p) => p.id)
          .toList(),
      featuredTicketDealIds:
          miamiTicketDealsCatalog.map((d) => d.id).toList(),
      featuredHotelIntelIds: miamiHotels.map((h) => h.id).toList(),
      districts: MiamiContent.districts,
      experiences: const [],
      feedItemPlaceIds: MiamiContent.feedItemPlaceIds,
      gemPlaceIds: MiamiContent.gemPlaceIds,
      itineraryMomentPlaceIds: MiamiContent.itineraryMomentPlaceIds,
      osmAssetPath: existing?.osmAssetPath,
      defaultRadiusMiles: 25,
      maxRadiusMiles: 75,
    );
    _cities['miami'] = miami;
  }

  void _mergeFloridaKeysFromDartCatalog() {
    final existing = _cities['florida-keys'];
    final keysPlaces = FloridaKeysContent.places;
    final keysHotels = FloridaKeysContent.hotels;
    final keys = CityPack(
      cityId: 'florida-keys',
      cityName: 'Florida Keys',
      stateId: 'florida',
      description: existing?.description ??
          'From Key Largo reef dives to Key West sunsets — island concierge for boating, '
          'snorkeling, fishing, and barefoot luxury across the Overseas Highway.',
      heroImageUrl: existing?.heroImageUrl ?? 'AK2vwEobto4',
      mapCenterLat: 24.65,
      mapCenterLng: -81.45,
      hubLabel: 'Florida Keys, FL',
      supportedCategories: existing?.supportedCategories ??
          [
            'hotel',
            'dining',
            'beach',
            'adventure',
            'nature',
            'wellness',
            'luxury',
            'foodie',
            'water',
          ],
      featuredExperienceIds: keysPlaces
          .where((p) => p.id.contains('-exp-'))
          .map((p) => p.id)
          .toList(),
      featuredHotelIds: keysHotels.map((h) => h.placeId).toList(),
      featuredRestaurantIds: keysPlaces
          .where((p) => p.category.name == 'dining')
          .map((p) => p.id)
          .toList(),
      featuredTicketDealIds:
          floridaKeysTicketDealsCatalog.map((d) => d.id).toList(),
      featuredHotelIntelIds: keysHotels.map((h) => h.id).toList(),
      districts: FloridaKeysContent.districts,
      experiences: const [],
      feedItemPlaceIds: FloridaKeysContent.feedItemPlaceIds,
      gemPlaceIds: FloridaKeysContent.gemPlaceIds,
      itineraryMomentPlaceIds: FloridaKeysContent.itineraryMomentPlaceIds,
      osmAssetPath: existing?.osmAssetPath,
      defaultRadiusMiles: 30,
      maxRadiusMiles: 120,
    );
    _cities['florida-keys'] = keys;
  }

  static List<DistrictPack> _orlandoDistricts() => [
        DistrictPack(
          districtId: 'orlando-disney',
          cityId: 'orlando',
          districtName: 'Disney Area',
          districtType: DistrictType.themePark,
          description: 'Lake Buena Vista & Disney Springs corridor.',
          mapBounds: const DistrictBounds(
            north: 28.42,
            south: 28.34,
            east: -81.50,
            west: -81.62,
          ),
        ),
        DistrictPack(
          districtId: 'orlando-universal',
          cityId: 'orlando',
          districtName: 'Universal Area',
          districtType: DistrictType.themePark,
          description: 'Universal Blvd & CityWalk energy.',
          mapBounds: const DistrictBounds(
            north: 28.49,
            south: 28.45,
            east: -81.45,
            west: -81.48,
          ),
        ),
        DistrictPack(
          districtId: 'orlando-winter-park',
          cityId: 'orlando',
          districtName: 'Winter Park',
          districtType: DistrictType.arts,
          description: 'Park Avenue culture & rooftop dining.',
          mapBounds: const DistrictBounds(
            north: 28.61,
            south: 28.58,
            east: -81.34,
            west: -81.36,
          ),
        ),
        DistrictPack(
          districtId: 'orlando-lake-nona',
          cityId: 'orlando',
          districtName: 'Lake Nona',
          districtType: DistrictType.suburban,
          description: 'Modern luxury & medical city calm.',
          mapBounds: const DistrictBounds(
            north: 28.38,
            south: 28.34,
            east: -81.22,
            west: -81.28,
          ),
        ),
        DistrictPack(
          districtId: 'orlando-idrive',
          cityId: 'orlando',
          districtName: 'International Drive',
          districtType: DistrictType.resort,
          description: 'I-Drive dining, value hotels, convention corridor.',
          mapBounds: const DistrictBounds(
            north: 28.46,
            south: 28.42,
            east: -81.46,
            west: -81.48,
          ),
        ),
      ];

  CityPack _orlandoFallback() => CityPack(
        cityId: 'orlando',
        cityName: 'Orlando',
        stateId: 'florida',
        description: 'Orlando',
        mapCenterLat: OrlandoHub.latitude,
        mapCenterLng: OrlandoHub.longitude,
        hubLabel: OrlandoHub.label,
      );
}
