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
import 'package:luxora_ai/util/day_flow_share_content.dart';
import 'package:luxora_ai/util/day_flow_labels.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:luxora_ai/widgets/visual_share_icon_button.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/drive_friction_service.dart';
import 'package:luxora_ai/widgets/travel_stop_intel_card.dart';
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
import 'package:luxora_ai/widgets/day_flow_swap_sheet.dart';
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

/// Map + weather + day plan with crowd outlook and one-tap reroute.
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
  String? _rerouteMessage;

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
      _rerouteMessage = null;
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
    final l = context.l10n;
    final result = DayFlowRerouter.apply(
      flow: _flow,
      pool: widget.pool,
      profile: widget.profile,
      rainLikely: _rainLikely,
      savedIds: widget.savedIds,
    );
    setState(() {
      _flow = result.flow;
      _rerouteMessage = result.changed
          ? l.mapRerouteApplied(result.swappedStopCount)
          : l.mapRerouteNone;
    });
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

  void _swapStop(int blockIndex) {
    showDayFlowSwapSheet(
      context,
      flow: _flow,
      blockIndex: blockIndex,
      pool: widget.pool,
      profile: widget.profile,
      savedIds: widget.savedIds,
      onApply: (flow, message) {
        setState(() {
          _flow = flow;
          _rerouteMessage = message;
        });
        unawaited(_persistFlow());
      },
      onViewPlace: widget.onPlaceTap,
    );
  }

  @override
  Widget build(BuildContext context) {
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
        AspectRatio(
          aspectRatio: 16 / 10,
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
        _PlanMyDay(
          flow: _flow,
          rainLikely: _rainLikely,
          rerouteMessage: _rerouteMessage,
          onReroute: _flow.isEmpty ? null : _reroute,
          onChangeStop: _flow.isEmpty ? null : _swapStop,
          onTapStop: widget.onPlaceTap,
        ),
      ],
    );
  }
}

/// The "Plan my day" card — renders the Day Flow as a time-of-day timeline
/// (morning → night) with a one-line rationale per stop, so the plan reads
/// like a concierge sequenced it around how the traveler wants to feel.
class _PlanMyDay extends StatelessWidget {
  const _PlanMyDay({
    required this.flow,
    required this.onTapStop,
    this.rainLikely = false,
    this.rerouteMessage,
    this.onReroute,
    this.onChangeStop,
  });

  final DayFlow flow;
  final bool rainLikely;
  final String? rerouteMessage;
  final VoidCallback? onReroute;
  final void Function(int blockIndex)? onChangeStop;
  final void Function(LuxPlace place) onTapStop;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final hasFlow = !flow.isEmpty;
    return GlassCard(
      glow: hasFlow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.route_rounded, color: LuxColors.gold, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l.mapPlanDayTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              if (hasFlow)
                VisualShareIconButton(
                  subject: l.mapPlanDayTitle,
                  fileName: 'luxora_day_agenda.png',
                  shareWidth: 420,
                  color: LuxColors.gold,
                  background: LuxColors.gold.withValues(alpha: 0.12),
                  cardBuilder: (ctx) => buildDayAgendaShareCard(ctx, flow),
                ),
            ],
          ),
          const SizedBox(height: 8),
          if (!hasFlow)
            Text(
              l.mapPlanDayEmpty,
              style: const TextStyle(
                fontSize: 13,
                height: 1.4,
                color: LuxColors.stone400,
              ),
            )
          else ...[
            Text(
              l.dayFlowSubtitle,
              style: const TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: LuxColors.stone400,
                height: 1.35,
              ),
            ),
            if (flow.emphases.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final e in flow.emphases)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: LuxColors.gold.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: LuxColors.gold.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        dayFlowVibeLabel(l, e),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: LuxColors.gold,
                        ),
                      ),
                    ),
                ],
              ),
            ],
            const SizedBox(height: 10),
            Text(
              l.mapPlanDaySummary(
                flow.stopCount,
                flow.milesLabel,
                flow.driveTimeLabel,
              ),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: LuxColors.gold,
              ),
            ),
            if (flow.homeBase != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    const Icon(
                      Icons.home_rounded,
                      size: 14,
                      color: LuxColors.stone400,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        l.mapPlanDayHomeBase(
                          catalogText(context, flow.homeBase!.title),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          color: LuxColors.stone400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (onReroute != null) ...[
              const SizedBox(height: 12),
              if (rainLikely)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.umbrella_rounded,
                        size: 14,
                        color: LuxColors.gold,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          l.mapRerouteRainHint,
                          style: const TextStyle(
                            fontSize: 12,
                            height: 1.3,
                            color: LuxColors.stone400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              OutlinedButton.icon(
                onPressed: onReroute,
                icon: const Icon(Icons.alt_route_rounded, size: 18),
                label: Text(l.mapRerouteButton),
                style: OutlinedButton.styleFrom(
                  foregroundColor: LuxColors.gold,
                  side: BorderSide(
                    color: LuxColors.gold.withValues(alpha: 0.45),
                  ),
                ),
              ),
              if (rerouteMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    rerouteMessage!,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.35,
                      color: LuxColors.stone400,
                    ),
                  ),
                ),
            ],
            const SizedBox(height: 14),
            for (final (index, block) in flow.blocks.indexed)
              _DayFlowRow(
                block: block,
                legOrigin: index == 0
                    ? flow.start
                    : LatLng(
                        flow.blocks[index - 1].place.latitude,
                        flow.blocks[index - 1].place.longitude,
                      ),
                isLast: index == flow.blocks.length - 1,
                onTap: onChangeStop != null
                    ? () => onChangeStop!(index)
                    : () => onTapStop(block.place),
                onViewPlace: () => onTapStop(block.place),
              ),
          ],
        ],
      ),
    );
  }
}

class _DayFlowRow extends StatelessWidget {
  const _DayFlowRow({
    required this.block,
    required this.legOrigin,
    required this.isLast,
    required this.onTap,
    required this.onViewPlace,
  });

  final DayBlock block;
  final LatLng legOrigin;
  final bool isLast;
  final VoidCallback onTap;
  final VoidCallback onViewPlace;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final at = CrowdPredictionService.timeForPhase(block.phase);
    final friction = DriveFrictionService.scoreForLeg(
      from: legOrigin,
      to: block.place,
      atLocal: at,
    );
    final intelLines = travelStopIntelLines(
      l,
      place: block.place,
      atLocal: at,
      driveFriction: friction,
    );
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: LuxColors.gold.withValues(alpha: 0.16),
                    border: Border.all(
                      color: LuxColors.gold.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Icon(
                    dayFlowPhaseIcon(block.phase),
                    size: 15,
                    color: LuxColors.gold,
                  ),
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 52,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    color: LuxColors.gold.withValues(alpha: 0.22),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dayFlowPhaseLabel(l, block.phase),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                        color: LuxColors.gold.withValues(alpha: 0.85),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      catalogText(context, block.place.title),
                      style: const TextStyle(
                        fontSize: 14,
                        color: LuxColors.cream,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dayFlowReasonLabel(l, block.reason),
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.3,
                        color: LuxColors.stone400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    for (final line in intelLines)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          line,
                          style: TextStyle(
                            fontSize: 11,
                            height: 1.25,
                            color: LuxColors.stone500.withValues(alpha: 0.95),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              children: [
                IconButton(
                  tooltip: l.dayFlowSwapTapToChange,
                  onPressed: onTap,
                  icon: Icon(
                    Icons.edit_note_rounded,
                    size: 20,
                    color: LuxColors.gold.withValues(alpha: 0.85),
                  ),
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                ),
                IconButton(
                  tooltip: l.dayFlowSwapViewPlace,
                  onPressed: onViewPlace,
                  icon: Icon(
                    Icons.open_in_new_rounded,
                    size: 18,
                    color: LuxColors.stone500.withValues(alpha: 0.9),
                  ),
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
