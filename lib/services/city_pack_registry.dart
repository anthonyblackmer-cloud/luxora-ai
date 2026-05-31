import 'package:flutter/foundation.dart';
import 'package:luxora_ai/data/nyc/nyc_ticket_deals.dart';
import 'package:luxora_ai/data/nyc/nyc_hub.dart';
import 'package:luxora_ai/data/nyc/nyc_content.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_ticket_deals.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_hub.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_content.dart';
import 'package:luxora_ai/data/naples/naples_ticket_deals.dart';
import 'package:luxora_ai/data/naples/naples_hub.dart';
import 'package:luxora_ai/data/naples/naples_content.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_ticket_deals.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_hub.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_content.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/data/hotels_catalog.dart';
import 'package:luxora_ai/data/florida_keys/florida_keys_content.dart';
import 'package:luxora_ai/data/florida_keys/florida_keys_ticket_deals.dart';
import 'package:luxora_ai/data/miami/miami_content.dart';
import 'package:luxora_ai/data/miami/miami_ticket_deals.dart';
import 'package:luxora_ai/data/orlando_hub.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_content.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_hub.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_ticket_deals.dart';
import 'package:luxora_ai/data/vegas/vegas_content.dart';
import 'package:luxora_ai/data/vegas/vegas_hub.dart';
import 'package:luxora_ai/data/vegas/vegas_ticket_deals.dart';
import 'package:luxora_ai/data/ticket_deals_catalog.dart';
import 'package:luxora_ai/models/city_pack/city_pack.dart';
import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/city_pack/state_pack.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/services/city_pack_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _activeCityKey = 'luxora_active_city_pack_id';

/// Luxora Engine â†’ active State/City pack â€” destinations are data, not code forks.
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
    _registerNevadaState();
    _registerNewYorkState();
    await _loadBundledPacks();
    _mergeOrlandoFromDartCatalog();
    _mergeMiamiFromDartCatalog();
    _mergeFloridaKeysFromDartCatalog();
    _mergeTampaBayFromDartCatalog();
    _mergeStAugustineFromDartCatalog();
    _mergeNaplesFromDartCatalog();
    _mergeDestin30aFromDartCatalog();
    _mergeVegasFromDartCatalog();
    _mergeNycFromDartCatalog();

    try {
      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getString(_activeCityKey);
      if (stored != null && _cities.containsKey(stored)) {
        _activeCityId = stored;
      }
    } catch (_) {
      // SharedPreferences unavailable in unit tests â€” keep default city.
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
    // Florida Keys is merged from [FloridaKeysContent] â€” skip JSON so stale web
    // builds (hot restart without asset rebundle) do not 404 on the new file.
    const assets = [
      'assets/city_packs/city_pack_orlando.json',
      'assets/city_packs/city_pack_miami.json',
      'assets/city_packs/city_pack_tampa-bay.json',
      'assets/city_packs/city_pack_destin-30a.json',
      'assets/city_packs/city_pack_naples.json',
      'assets/city_packs/city_pack_st-augustine.json',
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
        destinationCount: 7,
        cityIds: ['orlando', 'miami', 'florida-keys', 'tampa-bay', 'st-augustine', 'naples', 'destin-30a'],
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
          'Luxury beaches, Wynwood art, Brickell nightlife, and Cuban culture â€” '
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
          'From Key Largo reef dives to Key West sunsets â€” island concierge for boating, '
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

  void _mergeTampaBayFromDartCatalog() {
    final existing = _cities['tampa-bay'];
    final bayPlaces = TampaBayContent.places;
    final bayHotels = TampaBayContent.hotels;
    final tampaBay = CityPack(
      cityId: 'tampa-bay',
      cityName: 'Tampa Bay',
      stateId: 'florida',
      description: existing?.description ??
          'Waterfront lifestyle, Gulf beaches, Cuban culture, craft beer, and '
          'sunset cruises â€” Tampa Bay as a relaxed local concierge, not theme parks.',
      heroImageUrl: existing?.heroImageUrl ?? 'sWK9wki5zHU',
      mapCenterLat: TampaBayHub.latitude,
      mapCenterLng: TampaBayHub.longitude,
      hubLabel: TampaBayHub.label,
      supportedCategories: existing?.supportedCategories ??
          [
            'hotel',
            'dining',
            'beach',
            'waterfront',
            'culture',
            'sports',
            'brewery',
            'adventure',
            'wellness',
            'foodie',
            'family',
          ],
      featuredExperienceIds: bayPlaces
          .where((p) => p.id.contains('-exp-'))
          .map((p) => p.id)
          .toList(),
      featuredHotelIds: bayHotels.map((h) => h.placeId).toList(),
      featuredRestaurantIds: bayPlaces
          .where((p) => p.category.name == 'dining')
          .map((p) => p.id)
          .toList(),
      featuredTicketDealIds:
          tampaBayTicketDealsCatalog.map((d) => d.id).toList(),
      featuredHotelIntelIds: bayHotels.map((h) => h.id).toList(),
      districts: TampaBayContent.districts,
      experiences: const [],
      feedItemPlaceIds: TampaBayContent.feedItemPlaceIds,
      gemPlaceIds: TampaBayContent.gemPlaceIds,
      itineraryMomentPlaceIds: TampaBayContent.itineraryMomentPlaceIds,
      osmAssetPath: existing?.osmAssetPath,
      defaultRadiusMiles: 35,
      maxRadiusMiles: 75,
    );
    _cities['tampa-bay'] = tampaBay;
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
  void _mergeStAugustineFromDartCatalog() {
    _mergeCityPack(
      cityId: StAugustineContent.cityId,
      cityName: 'St. Augustine',
      description:
          'Historic streets, coastal romance, ghost tours, and walkable colonial charm.',
      heroImageUrl: 'RE1uPSyVuls',
      hubLat: StAugustineHub.latitude,
      hubLng: StAugustineHub.longitude,
      hubLabel: StAugustineHub.label,
      places: StAugustineContent.places,
      hotels: StAugustineContent.hotels,
      districts: StAugustineContent.districts,
      feedItemPlaceIds: StAugustineContent.feedItemPlaceIds,
      gemPlaceIds: StAugustineContent.gemPlaceIds,
      itineraryMomentPlaceIds: StAugustineContent.itineraryMomentPlaceIds,
      ticketDeals: stAugustineTicketDealsCatalog,
      defaultRadiusMiles: 30,
      maxRadiusMiles: 60,
    );
  }

  void _mergeNaplesFromDartCatalog() {
    _mergeCityPack(
      cityId: NaplesContent.cityId,
      cityName: 'Naples',
      description:
          'Gulf luxury, white-sand beaches, golf corridors, and Fifth Avenue polish.',
      heroImageUrl: 'X_LNSoZ7xeM',
      hubLat: NaplesHub.latitude,
      hubLng: NaplesHub.longitude,
      hubLabel: NaplesHub.label,
      places: NaplesContent.places,
      hotels: NaplesContent.hotels,
      districts: NaplesContent.districts,
      feedItemPlaceIds: NaplesContent.feedItemPlaceIds,
      gemPlaceIds: NaplesContent.gemPlaceIds,
      itineraryMomentPlaceIds: NaplesContent.itineraryMomentPlaceIds,
      ticketDeals: naplesTicketDealsCatalog,
      defaultRadiusMiles: 25,
      maxRadiusMiles: 70,
    );
  }

  void _mergeDestin30aFromDartCatalog() {
    _mergeCityPack(
      cityId: Destin30aContent.cityId,
      cityName: 'Destin & 30A',
      description:
          'Emerald Gulf water, Crab Island boats, and Scenic Highway 30A beach days.',
      heroImageUrl: 'JZYQ_P94T-Q',
      hubLat: Destin30aHub.latitude,
      hubLng: Destin30aHub.longitude,
      hubLabel: Destin30aHub.label,
      places: Destin30aContent.places,
      hotels: Destin30aContent.hotels,
      districts: Destin30aContent.districts,
      feedItemPlaceIds: Destin30aContent.feedItemPlaceIds,
      gemPlaceIds: Destin30aContent.gemPlaceIds,
      itineraryMomentPlaceIds: Destin30aContent.itineraryMomentPlaceIds,
      ticketDeals: destin30aTicketDealsCatalog,
      defaultRadiusMiles: 35,
      maxRadiusMiles: 80,
    );
  }

  void _mergeCityPack({
    required String cityId,
    required String cityName,
    required String description,
    required String heroImageUrl,
    required double hubLat,
    required double hubLng,
    required String hubLabel,
    required List<LuxPlace> places,
    required List<LuxHotel> hotels,
    required List<DistrictPack> districts,
    required Map<String, String> feedItemPlaceIds,
    required Map<String, String> gemPlaceIds,
    required Map<String, String> itineraryMomentPlaceIds,
    required List<TicketDeal> ticketDeals,
    required int defaultRadiusMiles,
    required int maxRadiusMiles,
  }) {
    final existing = _cities[cityId];
    final pack = CityPack(
      cityId: cityId,
      cityName: cityName,
      stateId: 'florida',
      description: existing?.description ?? description,
      heroImageUrl: existing?.heroImageUrl ?? heroImageUrl,
      mapCenterLat: hubLat,
      mapCenterLng: hubLng,
      hubLabel: hubLabel,
      supportedCategories: existing?.supportedCategories ??
          [
            'hotel',
            'dining',
            'beach',
            'culture',
            'foodie',
            'family',
            'adventure',
          ],
      featuredExperienceIds: places
          .where((p) => p.id.contains('-exp-'))
          .map((p) => p.id)
          .toList(),
      featuredHotelIds: hotels.map((h) => h.placeId).toList(),
      featuredRestaurantIds: places
          .where((p) => p.category == LuxPlaceCategory.dining)
          .map((p) => p.id)
          .toList(),
      featuredTicketDealIds: ticketDeals.map((d) => d.id).toList(),
      featuredHotelIntelIds: hotels.map((h) => h.id).toList(),
      districts: districts,
      experiences: const [],
      feedItemPlaceIds: feedItemPlaceIds,
      gemPlaceIds: gemPlaceIds,
      itineraryMomentPlaceIds: itineraryMomentPlaceIds,
      osmAssetPath: existing?.osmAssetPath,
      defaultRadiusMiles: defaultRadiusMiles,
      maxRadiusMiles: maxRadiusMiles,
    );
    _cities[cityId] = pack;
  }

  void _registerNevadaState() {
    registerStatePack(
      const StatePack(
        stateId: 'nevada',
        stateName: 'Nevada',
        heroImageUrl: 'eQ2ElhooTjc',
        destinationCount: 1,
        cityIds: ['vegas'],
      ),
    );
  }

  void _mergeVegasFromDartCatalog() {
    final existing = _cities['vegas'];
    final vegasPlaces = VegasContent.places;
    final vegasHotels = VegasContent.hotels;
    final vegas = CityPack(
      cityId: 'vegas',
      cityName: 'Las Vegas',
      stateId: 'nevada',
      description: existing?.description ??
          'Strip spectacle, residency shows, rooftop nights, and desert escapes — '
          'Vegas insider concierge for heat, shows, and high-energy planning.',
      heroImageUrl: existing?.heroImageUrl ?? 'eQ2ElhooTjc',
      mapCenterLat: VegasHub.latitude,
      mapCenterLng: VegasHub.longitude,
      hubLabel: VegasHub.label,
      supportedCategories: existing?.supportedCategories ??
          [
            'hotel',
            'dining',
            'nightlife',
            'show',
            'casino',
            'pool',
            'shopping',
            'luxury',
            'foodie',
            'romantic',
            'adventure',
            'wellness',
          ],
      featuredExperienceIds: vegasPlaces
          .where((p) => p.id.contains('-exp-'))
          .map((p) => p.id)
          .toList(),
      featuredHotelIds: vegasHotels.map((h) => h.placeId).toList(),
      featuredRestaurantIds: vegasPlaces
          .where((p) => p.category.name == 'dining')
          .map((p) => p.id)
          .toList(),
      featuredTicketDealIds:
          vegasTicketDealsCatalog.map((d) => d.id).toList(),
      featuredHotelIntelIds: vegasHotels.map((h) => h.id).toList(),
      districts: VegasContent.districts,
      experiences: const [],
      feedItemPlaceIds: VegasContent.feedItemPlaceIds,
      gemPlaceIds: VegasContent.gemPlaceIds,
      itineraryMomentPlaceIds: VegasContent.itineraryMomentPlaceIds,
      osmAssetPath: existing?.osmAssetPath,
      defaultRadiusMiles: 20,
      maxRadiusMiles: 60,
    );
    _cities['vegas'] = vegas;
  }
  void _registerNewYorkState() {
    registerStatePack(
      const StatePack(
        stateId: 'new-york',
        stateName: 'New York',
        heroImageUrl: 'xMMA_mtJ8xM',
        destinationCount: 1,
        cityIds: ['nyc'],
      ),
    );
  }

  void _mergeNycFromDartCatalog() {
    final existing = _cities['nyc'];
    final nycPlaces = NycContent.places;
    final nycHotels = NycContent.hotels;
    final nyc = CityPack(
      cityId: 'nyc',
      cityName: 'New York City',
      stateId: 'new-york',
      description: existing?.description ??
          'Five boroughs of walkable culture, Broadway nights, and subway-smart clusters — '
          'New York insider concierge for crowds, weather, and efficient routing.',
      heroImageUrl: existing?.heroImageUrl ?? 'xMMA_mtJ8xM',
      mapCenterLat: NycHub.latitude,
      mapCenterLng: NycHub.longitude,
      hubLabel: NycHub.label,
      supportedCategories: existing?.supportedCategories ??
          [
            'hotel',
            'dining',
            'nightlife',
            'culture',
            'adventure',
            'luxury',
            'foodie',
            'romantic',
            'family',
            'walkable',
            'broadway',
            'museum',
            'park',
            'rooftop',
            'historic',
            'shopping',
            'walking',
            'photo',
            'subway',
            'market',
          ],
      featuredExperienceIds: nycPlaces
          .where((p) => p.id.contains('-exp-'))
          .map((p) => p.id)
          .toList(),
      featuredHotelIds: nycHotels.map((h) => h.placeId).toList(),
      featuredRestaurantIds: nycPlaces
          .where((p) => p.category.name == 'dining')
          .map((p) => p.id)
          .toList(),
      featuredTicketDealIds:
          nycTicketDealsCatalog.map((d) => d.id).toList(),
      featuredHotelIntelIds: nycHotels.map((h) => h.id).toList(),
      districts: NycContent.districts,
      experiences: const [],
      feedItemPlaceIds: NycContent.feedItemPlaceIds,
      gemPlaceIds: NycContent.gemPlaceIds,
      itineraryMomentPlaceIds: NycContent.itineraryMomentPlaceIds,
      osmAssetPath: existing?.osmAssetPath,
      defaultRadiusMiles: 15,
      maxRadiusMiles: 40,
    );
    _cities['nyc'] = nyc;
  }
}
