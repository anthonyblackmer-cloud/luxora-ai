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
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/vacation_score_badge.dart';
import 'package:luxora_ai/widgets/weather_card.dart';

/// Focused daily dashboard — weather, score, next stop, rain reroute, Concierge CTA.
class TodayDashboard extends StatefulWidget {
  const TodayDashboard({
    super.key,
    required this.selectedDay,
    this.profile,
  });

  final TripDay? selectedDay;
  final TripProfile? profile;

  @override
  State<TodayDashboard> createState() => _TodayDashboardState();
}

class _TodayDashboardState extends State<TodayDashboard> {
  LuxWeather? _weather;
  bool _rerouteBusy = false;

  @override
  void initState() {
    super.initState();
    PlacesRepository.instance.ensureLocalCatalogLoaded();
    unawaited(_loadWeather());
    unawaited(_ensureMediaReady());
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

    final nextItem = widget.selectedDay == null
        ? null
        : TodayPlanHelpers.nextTripItem(widget.selectedDay!);
    final nextBlock =
        flow == null || flow.isEmpty ? null : TodayPlanHelpers.nextDayFlowBlock(flow);
    final day = widget.selectedDay;

    return ListenableBuilder(
      listenable: Listenable.merge([
        PlacesRepository.instance,
        UnsplashPhotoRegistry.instance,
      ]),
      builder: (context, _) {
        final planHeroPlace = day == null ? null : _heroPlaceForDay(day);
        final nextPlace = nextItem?.placeId == null
            ? nextBlock?.place
            : PlacesRepository.instance.byId(nextItem!.placeId) ??
                nextBlock?.place;

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
                    l.todayPlanSectionTitle,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.6,
                      color: tokens.accent.withValues(alpha: 0.85),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l.itineraryDayTab(day.dayNumber, day.label),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
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
        if (nextItem != null || nextBlock != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: GlassCard(
              glow: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.todayNextActivityLabel,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.6,
                      color: tokens.accent.withValues(alpha: 0.85),
                    ),
                  ),
                  if (nextPlace != null) ...[
                    const SizedBox(height: 10),
                    LuxPlaceImage(
                      place: nextPlace,
                      presentation: LuxImagePresentation.feedHero,
                      borderRadius: BorderRadius.circular(12),
                      trackUsageOnDisplay: true,
                    ),
                  ],
                  const SizedBox(height: 6),
                  if (nextItem != null) ...[
                    Text(
                      nextItem.time,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: tokens.accent.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      catalogText(context, nextItem.title),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      catalogText(context, nextItem.emotionalLine),
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.35,
                        color: tokens.textMuted,
                      ),
                    ),
                  ] else if (nextBlock != null) ...[
                    Text(
                      nextBlock.phase.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: tokens.accent.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      nextBlock.place.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ],
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
