import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/weather_concierge_sheet.dart';

/// Opens weather concierge from anywhere (More tab, etc.) using hub weather.
abstract final class WeatherConciergeLauncher {
  static Future<void> open(BuildContext context) async {
    final l = context.l10n;
    final hub = CityPackRegistry.instance.hubCenter;
    final hubLabel = CityPackRegistry.instance.hubLabel;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Center(
        child: CircularProgressIndicator(
          color: luxThemeTokensOf(ctx).accent,
        ),
      ),
    );

    await SavedPlacesStorage.instance.load();
    final weather = await WeatherService.instance.fetch(
      hub.latitude,
      hub.longitude,
    );

    if (!context.mounted) return;
    Navigator.of(context, rootNavigator: true).pop();

    if (weather == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l.weatherConciergeTapHint)),
      );
      return;
    }

    final radius = DiscoverRadiusController.instance.radius;
    final pool = PlacesRepository.instance.placesWithinRadius(radius);
    final profile = TripProfileStore.instance.profile.value;
    final homeBaseId = HomeBaseStore.instance.placeId.value;
    final homeBase =
        homeBaseId != null ? PlacesRepository.instance.byId(homeBaseId) : null;
    final flow = DayFlowPlanner.plan(
      profile: profile,
      pool: pool,
      homeBase: homeBase,
      savedIds: SavedPlacesStorage.instance.savedIds.value,
    );

    if (!context.mounted) return;
    await showWeatherConciergeSheet(
      context,
      weather: weather,
      placeLabel: hubLabel,
      latitude: hub.latitude,
      longitude: hub.longitude,
      flow: flow,
      pool: pool,
    );
  }
}
