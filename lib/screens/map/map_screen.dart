import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/l10n/luxora_l10n_helpers.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/active_day_flow_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/day_flow_codec.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/day_flow_rerouter.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/partner_sponsorship_service.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/destination_search_sheet.dart';
import 'package:luxora_ai/widgets/discover_radius_selector.dart';
import 'package:luxora_ai/widgets/discover_scope_banner.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/florida_keys/keys_concierge_cards.dart';
import 'package:luxora_ai/widgets/miami/miami_concierge_cards.dart';
import 'package:luxora_ai/widgets/lux_florida_map.dart';
import 'package:luxora_ai/widgets/golden_hour_card.dart';
import 'package:luxora_ai/widgets/hotel_intel_map_banner.dart';
import 'package:luxora_ai/widgets/right_now_panel.dart';
import 'package:luxora_ai/widgets/vacation_score_badge.dart';
import 'package:luxora_ai/widgets/weather_card.dart';
import 'package:luxora_ai/widgets/weather_concierge_sheet.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static void _showPlace(BuildContext context, LuxPlace place) {
    showAttractionDetailSheet(context, place: place);
  }

  static void _openAffiliateCategory(BuildContext context, int index) {
    final route = switch (index) {
      0 => '/stays/matchmaker',
      1 || 2 || 6 => '/discover',
      3 || 4 => '/ticket-savings',
      5 => '/partner-offers',
      _ => '/partner-offers',
    };
    context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListenableBuilder(
        listenable: CityPackRegistry.instance,
        builder: (context, _) {
          final activeCityId = CityPackRegistry.instance.active.cityId;
          final hub = CityPackRegistry.instance.hubCenter;
          return ListenableBuilder(
        listenable: DiscoverRadiusController.instance,
        builder: (context, _) {
          final radius = DiscoverRadiusController.instance.radius;
          final repo = PlacesRepository.instance;
          final places = repo.placesWithinRadius(radius);
          final placeIds = places.map((p) => p.id).toSet();
          final gemIds =
              defaultGemPlaceIds().where(placeIds.contains).toSet();
          final radiusMiles =
              radius.isUnlimited ? null : radius.miles.toDouble();
          final l = context.l10n;
          final affiliateCategories = affiliateCategoriesL10n(l);

          return ValueListenableBuilder<Set<String>>(
            valueListenable: SavedPlacesStorage.instance.savedIds,
            builder: (context, savedIds, _) {
              return ValueListenableBuilder<String?>(
                valueListenable: HomeBaseStore.instance.placeId,
                builder: (context, homeBaseId, _) {
              return ListenableBuilder(
                listenable: ActiveDayFlowStore.instance,
                builder: (context, _) {
              return ValueListenableBuilder<TripProfile?>(
                valueListenable: TripProfileStore.instance.profile,
                builder: (context, profile, _) {
                  final homeBase = repo.byId(homeBaseId);
                  final storedFlow = ActiveDayFlowStore.instance.flowFor(activeCityId);
                  final dayFlow = resolveDayFlowForActiveCity(
                    profile: profile,
                    pool: places,
                    homeBase: homeBase,
                    savedIds: savedIds,
                    storedFlow: storedFlow,
                  );

                  // Map pins: capped (curated + nearest OSM) unioned with the
                  // user's saved + day-flow places so those always render.
                  final mapPins = <String, LuxPlace>{
                    for (final p in repo.mapPlacesWithinRadius(radius)) p.id: p,
                  };
                  for (final p in places.where((p) => savedIds.contains(p.id))) {
                    mapPins[p.id] = p;
                  }
                  for (final b in dayFlow.blocks) {
                    mapPins[b.place.id] = b.place;
                  }
                  final mapPlaces = mapPins.values.toList();
                  final fallbackRouteIds = defaultItineraryRouteIds()
                      .where(placeIds.contains)
                      .toList();

                  return ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            l.mapBadge,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.5,
              color: LuxColors.gold.withValues(alpha: 0.8),
            ),
          ),
          Text(
            l.mapTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            l.mapSubtitle,
            style: const TextStyle(color: LuxColors.stone400, height: 1.45),
          ),
          const SizedBox(height: 14),
          DestinationSearchBar(hint: l.discoverSearchHint),
          const SizedBox(height: 14),
          const DiscoverRadiusSelector(),
          const SizedBox(height: 12),
          const DiscoverScopeBanner(),
          if (CityPackRegistry.instance.active.cityId == 'miami') ...[
            const SizedBox(height: 14),
            MiamiMoodRoutesPanel(
              onRouteSelected: (route) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(route.title),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
          if (CityPackRegistry.instance.active.cityId == 'florida-keys') ...[
            const SizedBox(height: 14),
            KeysMoodRoutesPanel(
              onRouteSelected: (route) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(route.title),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
          const SizedBox(height: 14),
          if (homeBase == null) const HotelIntelMapBanner(),
          _MapRoutePlanner(
            key: ValueKey(
              '$activeCityId-${ActiveDayFlowStore.instance.revision}-${dayFlow.orderedPlaceIds.join('-')}-${profile?.hashCode}-${savedIds.join(',')}-$homeBaseId-${radius.name}',
            ),
            initialFlow: dayFlow,
            fallbackRouteIds: fallbackRouteIds,
            mapPlaces: mapPlaces,
            pool: places,
            profile: profile,
            homeBase: homeBase,
            savedIds: savedIds,
            gemIds: gemIds,
            radiusMiles: radiusMiles,
            weatherLat: homeBase?.latitude ?? hub.latitude,
            weatherLng: homeBase?.longitude ?? hub.longitude,
            weatherLabel: homeBase != null
                ? catalogText(context, homeBase.title)
                : CityPackRegistry.instance.hubLabel.split(',').first,
            mapHubCenter: hub,
            onPlaceTap: (place) => _showPlace(context, place),
          ),
          const SizedBox(height: 16),
          Text(
            l.mapBookingTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var i = 0; i < affiliateCategories.length; i++)
                ActionChip(
                  label: Text(
                    affiliateCategories[i],
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: Colors.white.withValues(alpha: 0.06),
                  side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                  onPressed: () => _openAffiliateCategory(context, i),
                ),
            ],
          ),
          const SizedBox(height: 24),
        ],
                  );
                },
              );
                },
              );
                },
              );
            },
          );
        },
      );
        },
      ),
    );
  }
}

/// Map, weather intel, and route pins — day agenda lives on the Agenda tab.
class _MapRoutePlanner extends StatefulWidget {
  const _MapRoutePlanner({
    super.key,
    required this.initialFlow,
    required this.fallbackRouteIds,
    required this.mapPlaces,
    required this.pool,
    required this.profile,
    required this.homeBase,
    required this.savedIds,
    required this.gemIds,
    required this.radiusMiles,
    required this.weatherLat,
    required this.weatherLng,
    required this.weatherLabel,
    required this.mapHubCenter,
    required this.onPlaceTap,
  });

  final DayFlow initialFlow;
  final List<String> fallbackRouteIds;
  final List<LuxPlace> mapPlaces;
  final List<LuxPlace> pool;
  final TripProfile? profile;
  final LuxPlace? homeBase;
  final Set<String> savedIds;
  final Set<String> gemIds;
  final double? radiusMiles;
  final double weatherLat;
  final double weatherLng;
  final String weatherLabel;
  final LatLng mapHubCenter;
  final void Function(LuxPlace place) onPlaceTap;

  @override
  State<_MapRoutePlanner> createState() => _MapRoutePlannerState();
}

class _MapRoutePlannerState extends State<_MapRoutePlanner> {
  late DayFlow _flow;
  LuxWeather? _weather;

  @override
  void initState() {
    super.initState();
    _flow = widget.initialFlow;
    _loadWeather();
  }

  @override
  void didUpdateWidget(_MapRoutePlanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_sameFlow(oldWidget.initialFlow, widget.initialFlow)) {
      _flow = widget.initialFlow;
    }
    if (oldWidget.weatherLat != widget.weatherLat ||
        oldWidget.weatherLng != widget.weatherLng) {
      _loadWeather();
    }
  }

  Future<void> _loadWeather() async {
    final weather = await WeatherService.instance.fetch(
      widget.weatherLat,
      widget.weatherLng,
    );
    if (!mounted) return;
    setState(() => _weather = weather);
  }

  bool get _rainLikely => _weather?.rainLikely ?? false;

  LatLng get _origin => widget.homeBase != null
      ? LatLng(widget.homeBase!.latitude, widget.homeBase!.longitude)
      : PlaceDistance.hubCenter;

  static bool _sameFlow(DayFlow a, DayFlow b) =>
      a.orderedPlaceIds.join(',') == b.orderedPlaceIds.join(',');

  List<String> get _routeIds => _flow.isEmpty
      ? widget.fallbackRouteIds
      : _flow.orderedPlaceIds;

  List<LuxPlace> get _mapPlacesWithFlow {
    final byId = {for (final p in widget.mapPlaces) p.id: p};
    for (final b in _flow.blocks) {
      byId[b.place.id] = b.place;
    }
    return byId.values.toList();
  }

  Future<void> _persistFlow() async {
    if (_flow.isEmpty) return;
    final cityId = CityPackRegistry.instance.active.cityId;
    await ActiveDayFlowStore.instance.save(_flow, cityId: cityId);
  }

  void _reroute() {
    final result = DayFlowRerouter.apply(
      flow: _flow,
      pool: widget.pool,
      profile: widget.profile,
      rainLikely: _rainLikely,
      savedIds: widget.savedIds,
    );
    setState(() => _flow = result.flow);
    unawaited(_persistFlow());
  }

  void _openWeatherConcierge() {
    final weather = _weather;
    if (weather == null) return;
    showWeatherConciergeSheet(
      context,
      weather: weather,
      placeLabel: widget.weatherLabel,
      latitude: widget.weatherLat,
      longitude: widget.weatherLng,
      flow: _flow,
      pool: widget.pool,
      onAdjustDay: _flow.isEmpty ? null : _reroute,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mapHeight = (MediaQuery.sizeOf(context).height * 0.52).clamp(340.0, 560.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RightNowPanel(
          pool: widget.pool,
          origin: _origin,
          profile: widget.profile,
          weatherLat: widget.weatherLat,
          weatherLng: widget.weatherLng,
          onPlaceTap: widget.onPlaceTap,
        ),
        SizedBox(
          height: mapHeight,
          child: GlassCard(
            padding: EdgeInsets.zero,
            glow: true,
            child: LuxFloridaMap(
              key: ValueKey(
                '${widget.mapHubCenter.latitude}-${widget.mapHubCenter.longitude}',
              ),
              hubCenter: widget.mapHubCenter,
              places: _mapPlacesWithFlow,
              routePlaceIds: _routeIds,
              gemPlaceIds: widget.gemIds,
              sponsoredPlaceIds: PartnerSponsorshipService.sponsoredMapPlaceIds(),
              radiusMiles: widget.radiusMiles,
              onPlaceTap: widget.onPlaceTap,
            ),
          ),
        ),
        const SizedBox(height: 16),
        WeatherCard(
          latitude: widget.weatherLat,
          longitude: widget.weatherLng,
          placeLabel: widget.weatherLabel,
          weather: _weather,
          onTap: _weather == null ? null : _openWeatherConcierge,
        ),
        GoldenHourCard(
          weather: _weather,
          origin: _origin,
          pool: widget.pool,
          profile: widget.profile,
          onPlaceTap: widget.onPlaceTap,
        ),
        VacationScoreBadge(
          weather: _weather,
          flow: _flow,
          profile: widget.profile,
          bookmarkCount: widget.savedIds.length,
        ),
      ],
    );
  }
}
