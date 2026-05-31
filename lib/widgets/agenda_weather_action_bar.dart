import 'dart:async';

import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/active_day_flow_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/day_flow_rerouter.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/services/vacation_score_service.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';

/// One-tap rain reroute when weather threatens the active day plan.
class AgendaWeatherActionBar extends StatefulWidget {
  const AgendaWeatherActionBar({super.key});

  @override
  State<AgendaWeatherActionBar> createState() => _AgendaWeatherActionBarState();
}

class _AgendaWeatherActionBarState extends State<AgendaWeatherActionBar> {
  LuxWeather? _weather;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _loadWeather();
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
    if (_busy) return;
    final l = context.l10n;
    final cityId = CityPackRegistry.instance.active.cityId;
    final flow = ActiveDayFlowStore.instance.flowFor(cityId);
    if (flow == null || flow.isEmpty) return;

    setState(() => _busy = true);
    try {
      await PlacesRepository.instance.initialize();
      final radius = DiscoverRadiusController.instance.radius;
      final pool = PlacesRepository.instance.placesWithinRadius(radius);
      final profile = TripProfileStore.instance.profile.value;
      final savedIds = SavedPlacesStorage.instance.savedIds.value;
      final rainLikely = _weather?.rainLikely ?? false;

      final result = DayFlowRerouter.apply(
        flow: flow,
        pool: pool,
        profile: profile,
        rainLikely: rainLikely,
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
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final weather = _weather;
    if (weather == null || !weather.rainLikely) {
      return const SizedBox.shrink();
    }

    return ListenableBuilder(
      listenable: ActiveDayFlowStore.instance,
      builder: (context, _) {
        final flow = ActiveDayFlowStore.instance.flowFor(
          CityPackRegistry.instance.active.cityId,
        );
        if (flow == null || flow.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: GlassCard(
            glow: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                const SizedBox(height: 12),
                LuxButton(
                  label: l.agendaFixAfternoonRain,
                  icon: Icons.alt_route_rounded,
                  onPressed: _busy ? null : _fixAfternoon,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
