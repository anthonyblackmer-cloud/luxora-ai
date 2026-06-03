import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/active_day_flow_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/day_flow_rerouter.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';
import 'package:luxora_ai/services/vacation_score_service.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/today_plan_helpers.dart';
import 'package:luxora_ai/util/traveler_name.dart';
import 'package:luxora_ai/widgets/agenda/agenda_day_share_actions.dart';
import 'package:luxora_ai/widgets/agenda/itinerary_day_timeline.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/vacation_score_badge.dart';
import 'package:luxora_ai/widgets/weather_card.dart';

/// Focused daily dashboard — weather, score, next stop, rain reroute, Concierge CTA.
class TodayDashboard extends StatefulWidget {
  const TodayDashboard({
    super.key,
    required this.plan,
    required this.selectedDay,
    this.profile,
  });

  final TripPlan plan;
  final TripDay? selectedDay;
  final TripProfile? profile;

  @override
  State<TodayDashboard> createState() => _TodayDashboardState();
}

class _TodayDashboardState extends State<TodayDashboard> {
  LuxWeather? _weather;
  bool _rerouteBusy = false;
  Timer? _clockTimer;

  @override
  void initState() {
    super.initState();
    PlacesRepository.instance.ensureLocalCatalogLoaded();
    unawaited(_loadWeather());
    unawaited(_ensureMediaReady());
    _clockTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  Future<void> _ensureMediaReady() async {
    await Future.wait([
      UnsplashPhotoRegistry.instance.ensureLoaded(),
      PlacesRepository.instance.initialize(),
    ]);
  }

  Future<void> _loadWeather() async {
    final homeId = HomeBaseStore.instance.placeId.value;
    final repo = PlacesRepository.instance;
    final home = homeId == null ? null : repo.byId(homeId);
    final lat = home?.latitude ?? CityPackRegistry.instance.hubCenter.latitude;
    final lng = home?.longitude ?? CityPackRegistry.instance.hubCenter.longitude;
    final weather = await WeatherService.instance.fetch(lat, lng);
    if (!mounted) return;
    setState(() => _weather = weather);
  }

  Future<void> _fixAfternoon() async {
    if (_rerouteBusy) return;
    final l = context.l10n;
    final cityId = CityPackRegistry.instance.active.cityId;
    final flow = ActiveDayFlowStore.instance.flowFor(cityId);
    if (flow == null || flow.isEmpty) return;

    setState(() => _rerouteBusy = true);
    try {
      await PlacesRepository.instance.initialize();
      final radius = DiscoverRadiusController.instance.radius;
      final pool = PlacesRepository.instance.placesWithinRadius(radius);
      final profile =
          widget.profile ?? TripProfileStore.instance.profile.value;
      final savedIds = SavedPlacesStorage.instance.savedIds.value;

      final result = DayFlowRerouter.apply(
        flow: flow,
        pool: pool,
        profile: profile,
        rainLikely: _weather?.rainLikely ?? false,
        savedIds: savedIds,
      );

      if (!result.changed) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.agendaRainRerouteNone),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      await ActiveDayFlowStore.instance.save(result.flow, cityId: cityId);
      final afterScore = VacationScoreService.compute(
        weather: _weather,
        flow: result.flow,
        profile: profile,
        bookmarkCount: savedIds.length,
      ).score;

      if (!mounted) return;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l.agendaRainRerouteDone(result.swappedStopCount, afterScore),
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 4),
        ),
      );
    } finally {
      if (mounted) setState(() => _rerouteBusy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final cityId = CityPackRegistry.instance.active.cityId;
    final flow = ActiveDayFlowStore.instance.flowFor(cityId);
    final profile =
        widget.profile ?? TripProfileStore.instance.profile.value;

    final homeId = HomeBaseStore.instance.placeId.value;
    final home = homeId == null
        ? null
        : PlacesRepository.instance.byId(homeId);
    final lat = home?.latitude ?? CityPackRegistry.instance.hubCenter.latitude;
    final lng =
        home?.longitude ?? CityPackRegistry.instance.hubCenter.longitude;
    final placeLabel = home?.title ?? CityPackRegistry.instance.hubLabel;

    final day = widget.selectedDay;
    final upNext = day == null
        ? (flow == null || flow.isEmpty
            ? const TodayUpNextState(kind: TodayUpNextKind.complete)
            : TodayPlanHelpers.resolveUpNextFromFlow(flow))
        : TodayPlanHelpers.resolveUpNext(day);

    return ListenableBuilder(
      listenable: Listenable.merge([
        PlacesRepository.instance,
        UnsplashPhotoRegistry.instance,
      ]),
      builder: (context, _) {
        final planHeroPlace = day == null ? null : _heroPlaceForDay(day);
        final cityName = CityPackRegistry.instance.active.cityName;
        final upNextItem = upNext.item;
        final upNextBlock = upNext.block;
        final upNextPlace = upNextItem?.placeId == null
            ? upNextBlock?.place
            : PlacesRepository.instance.byId(upNextItem!.placeId) ??
                upNextBlock?.place;

        return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (day != null) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: GlassCard(
              glow: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (planHeroPlace != null) ...[
                    LuxPlaceImage(
                      place: planHeroPlace,
                      presentation: LuxImagePresentation.feedHero,
                      borderRadius: BorderRadius.circular(12),
                      trackUsageOnDisplay: true,
                    ),
                    const SizedBox(height: 12),
                  ],
                  Text(
                    l.freemiumVacationTitle(cityName),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l.todayDayHeading(day.dayNumber),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l.todayPlanStopCount(day.items.length),
                    style: TextStyle(
                      fontSize: 13,
                      color: tokens.textMuted,
                      height: 1.3,
                    ),
                  ),
                  if (day.items.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    AgendaDayShareActions(plan: widget.plan, day: day),
                  ],
                ],
              ),
            ),
          ),
        ],
        WeatherCard(
          latitude: lat,
          longitude: lng,
          placeLabel: placeLabel,
          weather: _weather,
        ),
        if (flow != null && !flow.isEmpty)
          VacationScoreBadge(
            weather: _weather,
            flow: flow,
            profile: profile,
            bookmarkCount: SavedPlacesStorage.instance.savedIds.value.length,
          ),
        if (_weather?.rainLikely == true &&
            flow != null &&
            !flow.isEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: GlassCard(
              glow: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l.todayRainRerouteTitle,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.6,
                      color: tokens.accent.withValues(alpha: 0.85),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (TravelerNameDisplay.firstName(profile?.travelerName) !=
                      null) ...[
                    Text(
                      l.weatherRerouteLuxoraIntro(
                        TravelerNameDisplay.firstName(profile!.travelerName)!,
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        fontWeight: FontWeight.w600,
                        color: LuxColors.cream,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  Row(
                    children: [
                      Icon(
                        Icons.umbrella_rounded,
                        color: LuxColors.gold.withValues(alpha: 0.9),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          l.mapRerouteRainHint,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.35,
                            color: LuxColors.cream,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l.weatherRerouteLuxoraClosing,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.35,
                      fontStyle: FontStyle.italic,
                      color: LuxColors.stone400.withValues(alpha: 0.95),
                    ),
                  ),
                  const SizedBox(height: 12),
                  LuxButton(
                    label: l.agendaFixAfternoonRain,
                    icon: Icons.alt_route_rounded,
                    onPressed: _rerouteBusy ? null : _fixAfternoon,
                  ),
                ],
              ),
            ),
          ),
        ],
        if (day != null && day.items.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              l.todayPlanDetailsTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          ItineraryDayTimeline(day: day),
          const SizedBox(height: 8),
        ],
        Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: GlassCard(
            glow: true,
            child: _UpNextSection(
              upNext: upNext,
              place: upNextPlace,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: LuxButton(
            label: l.rightNowButton,
            icon: Icons.chat_bubble_outline_rounded,
            onPressed: () => context.go('/concierge'),
          ),
        ),
      ],
    );
      },
    );
  }

  static LuxPlace? _heroPlaceForDay(TripDay day) {
    for (final item in day.items) {
      final place = PlacesRepository.instance.byId(item.placeId);
      if (place?.unsplashPhoto != null) {
        return place;
      }
    }
    for (final item in day.items) {
      final place = PlacesRepository.instance.byId(item.placeId);
      if (place != null) {
        return place;
      }
    }
    return null;
  }
}

class _UpNextSection extends StatelessWidget {
  const _UpNextSection({
    required this.upNext,
    required this.place,
  });

  final TodayUpNextState upNext;
  final LuxPlace? place;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final item = upNext.item;
    final block = upNext.block;

    final sectionLabel = switch (upNext.kind) {
      TodayUpNextKind.happeningNow => l.todayHappeningNowLabel,
      TodayUpNextKind.complete => l.todayNextActivityLabel,
      TodayUpNextKind.upcoming => l.todayNextActivityLabel,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionLabel,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.6,
            color: tokens.accent.withValues(alpha: 0.85),
          ),
        ),
        if (upNext.kind == TodayUpNextKind.complete) ...[
          const SizedBox(height: 10),
          Text(
            l.todayPlanComplete,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
        ] else ...[
          if (place != null) ...[
            const SizedBox(height: 10),
            LuxPlaceImage(
              place: place!,
              presentation: LuxImagePresentation.feedHero,
              borderRadius: BorderRadius.circular(12),
              trackUsageOnDisplay: true,
            ),
          ],
          const SizedBox(height: 6),
          if (item != null) ...[
            Text(
              item.time,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: tokens.accent.withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              catalogText(context, item.title),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            if (item.emotionalLine.trim().isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                catalogText(context, item.emotionalLine),
                style: TextStyle(
                  fontSize: 13,
                  height: 1.35,
                  color: tokens.textMuted,
                ),
              ),
            ],
          ] else if (block != null) ...[
            Text(
              block.phase.name.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: tokens.accent.withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              block.place.title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
          if (upNext.kind == TodayUpNextKind.upcoming &&
              upNext.startsIn != null) ...[
            const SizedBox(height: 8),
            Text(
              l.todayStartsIn(
                TodayPlanHelpers.formatStartsIn(upNext.startsIn!),
              ),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: tokens.textMuted,
              ),
            ),
          ],
        ],
      ],
    );
  }
}
