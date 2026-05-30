import 'package:intl/intl.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/weather_service.dart';

/// Packing chip the concierge may suggest for today's conditions.
enum WeatherPackItem {
  sunscreen,
  sunglasses,
  umbrella,
  lightJacket,
  comfortableShoes,
  waterBottle,
  hat,
  poncho,
  swimwear,
}

/// Highlight band on the hourly timeline.
enum WeatherHourlyHighlight {
  bestOutdoor,
  rainRisk,
  sunset,
}

/// Travel-aware guidance derived from live weather + today's itinerary.
class WeatherConciergeInsight {
  const WeatherConciergeInsight({
    required this.adviceLines,
    required this.packing,
    required this.planImpact,
    this.outdoorStopsAtRisk = const [],
    this.indoorBackups = const [],
    this.bestOutdoorWindow,
    this.rainRiskWindow,
    this.sunsetWindow,
    this.sunsetRecommendation,
    this.showRerouteHint = false,
    this.hourlyHighlights = const {},
  });

  final List<String> adviceLines;
  final List<WeatherPackItem> packing;
  final String planImpact;
  final List<String> outdoorStopsAtRisk;
  final List<String> indoorBackups;
  final WeatherTimeWindow? bestOutdoorWindow;
  final WeatherTimeWindow? rainRiskWindow;
  final WeatherTimeWindow? sunsetWindow;
  final String? sunsetRecommendation;
  final bool showRerouteHint;
  final Map<int, WeatherHourlyHighlight> hourlyHighlights;
}

class WeatherTimeWindow {
  const WeatherTimeWindow({required this.start, required this.end});

  final DateTime start;
  final DateTime end;
}

/// Heuristic concierge — turns Open-Meteo data and the day plan into
/// vacation-aware guidance (not a generic forecast dump).
abstract final class WeatherConciergeAdvisor {
  static WeatherConciergeInsight build({
    required AppLocalizations l,
    required LuxWeather weather,
    required DayFlow flow,
    required List<LuxPlace> pool,
    String localeTag = 'en',
  }) {
    String fmt(DateTime t) => DateFormat.jm(localeTag).format(t);
    final now = DateTime.now();
    final advice = <String>[];
    final packing = <WeatherPackItem>{};

    final tempF = weather.temperatureF;
    final feelsF = weather.feelsLikeF ?? tempF;
    final rainNow = weather.currentHourRainChance ?? weather.rainChance ?? 0;
    final uv = weather.uvIndex ?? 0;
    final wind = weather.windSpeedMph ?? 0;

    if (feelsF <= 62 && now.hour >= 17) {
      advice.add(l.weatherAdviceLightJacket);
      packing.add(WeatherPackItem.lightJacket);
    } else if (feelsF <= 65) {
      packing.add(WeatherPackItem.lightJacket);
    }

    if (uv >= 6) {
      advice.add(l.weatherAdviceHighUv);
      packing
        ..add(WeatherPackItem.sunscreen)
        ..add(WeatherPackItem.sunglasses)
        ..add(WeatherPackItem.hat);
    } else if (uv >= 3 && weather.isDay) {
      packing
        ..add(WeatherPackItem.sunscreen)
        ..add(WeatherPackItem.sunglasses);
    }

    if (rainNow >= 40 || weather.rainLikely) {
      packing
        ..add(WeatherPackItem.umbrella)
        ..add(WeatherPackItem.poncho);
    }

    if (tempF >= 82 || feelsF >= 86) {
      packing.add(WeatherPackItem.waterBottle);
    }
    packing.add(WeatherPackItem.comfortableShoes);

    if (weather.condition == LuxWeatherCondition.clear &&
        tempF >= 78 &&
        !weather.rainLikely) {
      packing.add(WeatherPackItem.swimwear);
    }

    final bestOutdoor = _bestOutdoorWindow(weather);
    final rainWindow = _rainRiskWindow(weather);
    final sunsetWindow = _sunsetWindow(weather);

    if (bestOutdoor != null && now.hour < 14) {
      advice.add(l.weatherAdviceOutdoorBefore(fmt(bestOutdoor.end)));
    }

    if (rainWindow != null && rainWindow.start.isAfter(now)) {
      advice.add(l.weatherAdviceRainLater);
    }

    if (wind >= 18 &&
        (weather.condition == LuxWeatherCondition.clear ||
            weather.condition == LuxWeatherCondition.partlyCloudy)) {
      advice.add(l.weatherAdviceWindBeach);
    }

    String? sunsetRec;
    if (weather.sunset != null &&
        (weather.condition == LuxWeatherCondition.clear ||
            weather.condition == LuxWeatherCondition.partlyCloudy) &&
        (weather.rainChance ?? 0) < 35) {
      advice.add(l.weatherAdviceGreatSunset);
      sunsetRec = l.weatherSunsetRecRooftop(fmt(weather.sunset!));
    }

    if (advice.isEmpty) {
      advice.add(l.weatherAdviceDefault);
    }

    _applyMiamiGuidance(
      l: l,
      advice: advice,
      packing: packing,
      weather: weather,
      flow: flow,
      pool: pool,
    );
    if (CityPackRegistry.instance.active.cityId == 'miami' &&
        weather.sunset != null) {
      sunsetRec = l.weatherMiamiSunsetWaterfront;
    }

    final outdoorRisk = _outdoorStopsAtRisk(flow);
    final indoorBackups = _indoorBackups(pool, flow, limit: 3);

    final planImpact = _planImpactText(
      l: l,
      weather: weather,
      flow: flow,
      outdoorRisk: outdoorRisk,
      indoorBackups: indoorBackups,
      rainWindow: rainWindow,
      bestOutdoor: bestOutdoor,
      formatTime: fmt,
    );

    final highlights = _hourlyHighlights(
      weather: weather,
      bestOutdoor: bestOutdoor,
      rainWindow: rainWindow,
      sunsetWindow: sunsetWindow,
    );

    return WeatherConciergeInsight(
      adviceLines: advice.take(3).toList(),
      packing: packing.toList(),
      planImpact: planImpact,
      outdoorStopsAtRisk: outdoorRisk,
      indoorBackups: indoorBackups,
      bestOutdoorWindow: bestOutdoor,
      rainRiskWindow: rainWindow,
      sunsetWindow: sunsetWindow,
      sunsetRecommendation: sunsetRec,
      showRerouteHint: outdoorRisk.isNotEmpty &&
          (weather.rainLikely || rainWindow != null),
      hourlyHighlights: highlights,
    );
  }

  static String packLabel(AppLocalizations l, WeatherPackItem item) =>
      switch (item) {
        WeatherPackItem.sunscreen => l.weatherPackSunscreen,
        WeatherPackItem.sunglasses => l.weatherPackSunglasses,
        WeatherPackItem.umbrella => l.weatherPackUmbrella,
        WeatherPackItem.lightJacket => l.weatherPackLightJacket,
        WeatherPackItem.comfortableShoes => l.weatherPackShoes,
        WeatherPackItem.waterBottle => l.weatherPackWater,
        WeatherPackItem.hat => l.weatherPackHat,
        WeatherPackItem.poncho => l.weatherPackPoncho,
        WeatherPackItem.swimwear => l.weatherPackSwimwear,
      };

  static String windDirectionLabel(int? degrees) {
    if (degrees == null) return '—';
    const dirs = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    final idx = ((degrees + 22.5) % 360 / 45).floor();
    return dirs[idx % dirs.length];
  }

  static WeatherTimeWindow? _bestOutdoorWindow(LuxWeather weather) {
    if (weather.hourly.length < 3) return null;
    WeatherTimeWindow? best;
    var bestScore = -1;

    for (var i = 0; i < weather.hourly.length - 2; i++) {
      final slice = weather.hourly.sublist(i, i + 3);
      if (slice.any((h) => h.time.hour < 7 || h.time.hour > 19)) continue;

      var score = 0;
      for (final h in slice) {
        if (h.rainLikely) score -= 3;
        if ((h.rainChance ?? 0) < 25) score += 2;
        if (h.temperatureF >= 65 && h.temperatureF <= 88) score += 2;
        if ((h.windSpeedMph ?? 0) < 15) score += 1;
        if (h.condition == LuxWeatherCondition.clear ||
            h.condition == LuxWeatherCondition.partlyCloudy) {
          score += 2;
        }
      }
      if (score > bestScore) {
        bestScore = score;
        best = WeatherTimeWindow(start: slice.first.time, end: slice.last.time);
      }
    }
    return bestScore >= 4 ? best : null;
  }

  static WeatherTimeWindow? _rainRiskWindow(LuxWeather weather) {
    final hours = weather.hourly.where((h) => h.rainLikely).toList();
    if (hours.isEmpty) return null;
    return WeatherTimeWindow(start: hours.first.time, end: hours.last.time);
  }

  static WeatherTimeWindow? _sunsetWindow(LuxWeather weather) {
    final sunset = weather.sunset;
    if (sunset == null || weather.hourly.isEmpty) return null;
    final match = weather.hourly.where((h) => h.time.hour == sunset.hour);
    if (match.isEmpty) {
      return WeatherTimeWindow(
        start: sunset.subtract(const Duration(minutes: 45)),
        end: sunset.add(const Duration(minutes: 15)),
      );
    }
    final h = match.first;
    return WeatherTimeWindow(start: h.time, end: h.time);
  }

  static Map<int, WeatherHourlyHighlight> _hourlyHighlights({
    required LuxWeather weather,
    required WeatherTimeWindow? bestOutdoor,
    required WeatherTimeWindow? rainWindow,
    required WeatherTimeWindow? sunsetWindow,
  }) {
    final map = <int, WeatherHourlyHighlight>{};
    for (var i = 0; i < weather.hourly.length; i++) {
      final h = weather.hourly[i];
      if (sunsetWindow != null &&
          h.time.hour == sunsetWindow.start.hour &&
          _sameDay(h.time, sunsetWindow.start)) {
        map[i] = WeatherHourlyHighlight.sunset;
        continue;
      }
      if (rainWindow != null &&
          !h.time.isBefore(rainWindow.start) &&
          !h.time.isAfter(rainWindow.end) &&
          h.rainLikely) {
        map[i] = WeatherHourlyHighlight.rainRisk;
        continue;
      }
      if (bestOutdoor != null &&
          !h.time.isBefore(bestOutdoor.start) &&
          !h.time.isAfter(bestOutdoor.end)) {
        map[i] = WeatherHourlyHighlight.bestOutdoor;
      }
    }
    return map;
  }

  static List<String> _outdoorStopsAtRisk(DayFlow flow) {
    if (flow.isEmpty) return const [];
    return [
      for (final b in flow.blocks)
        if (_isRainExposed(b.place)) b.place.title,
    ];
  }

  static List<String> _indoorBackups(
    List<LuxPlace> pool,
    DayFlow flow, {
    required int limit,
  }) {
    final used = {for (final b in flow.blocks) b.place.id};
    final picks = <String>[];
    for (final p in pool) {
      if (used.contains(p.id)) continue;
      if (_isRainExposed(p)) continue;
      if (p.category == LuxPlaceCategory.wellness ||
          p.category == LuxPlaceCategory.dining ||
          p.category == LuxPlaceCategory.family) {
        picks.add(p.title);
        if (picks.length >= limit) break;
      }
    }
    return picks;
  }

  static String _planImpactText({
    required AppLocalizations l,
    required LuxWeather weather,
    required DayFlow flow,
    required List<String> outdoorRisk,
    required List<String> indoorBackups,
    required WeatherTimeWindow? rainWindow,
    required WeatherTimeWindow? bestOutdoor,
    required String Function(DateTime) formatTime,
  }) {
    if (flow.isEmpty) {
      if (weather.rainLikely) return l.weatherImpactNoPlanRain;
      if (bestOutdoor != null) {
        return l.weatherImpactNoPlanClear(
          formatTime(bestOutdoor.start),
          formatTime(bestOutdoor.end),
        );
      }
      return l.weatherImpactNoPlanDefault;
    }

    if (rainWindow != null && outdoorRisk.isNotEmpty) {
      final outdoor = outdoorRisk.first;
      final indoor = indoorBackups.isNotEmpty
          ? indoorBackups.first
          : l.weatherImpactIndoorFallback;
      return l.weatherImpactRainLater(
        formatTime(rainWindow.start),
        outdoor,
        indoor,
      );
    }

    if (weather.temperatureF >= 90 && outdoorRisk.isNotEmpty) {
      return l.weatherImpactHeat(
        formatTime(
          bestOutdoor?.end ?? DateTime.now().add(const Duration(hours: 2)),
        ),
      );
    }

    if (outdoorRisk.isEmpty) {
      return l.weatherImpactClear;
    }

    return l.weatherImpactMixed(outdoorRisk.length);
  }

  static bool _isRainExposed(LuxPlace place) {
    if (place.category == LuxPlaceCategory.beach ||
        place.category == LuxPlaceCategory.springs) {
      return true;
    }
    return place.moodTags.any((t) {
      final lower = t.toLowerCase();
      return lower.contains('beach') ||
          lower.contains('springs') ||
          lower.contains('outdoor');
    });
  }

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static void _applyMiamiGuidance({
    required AppLocalizations l,
    required List<String> advice,
    required Set<WeatherPackItem> packing,
    required LuxWeather weather,
    required DayFlow flow,
    required List<LuxPlace> pool,
  }) {
    if (CityPackRegistry.instance.active.cityId != 'miami') return;

    final tempF = weather.temperatureF;
    final feelsF = weather.feelsLikeF ?? tempF;
    final humidity = weather.humidity ?? 0;
    final wind = weather.windSpeedMph ?? 0;

    if (humidity >= 70 || feelsF >= 88) {
      advice.insert(
        0,
        l.weatherMiamiHumidityIndoor,
      );
      packing.add(WeatherPackItem.waterBottle);
    }

    if (tempF >= 92 || feelsF >= 95) {
      advice.add(l.weatherMiamiHeatAdvisory);
    }

    if (weather.isDay && (weather.uvIndex ?? 0) >= 5) {
      advice.add(l.weatherMiamiBeachMorning);
      packing
        ..add(WeatherPackItem.sunscreen)
        ..add(WeatherPackItem.hat);
    }

    if (wind >= 18 &&
        flow.blocks.any((b) => b.place.moodTags.contains('water'))) {
      advice.add(l.weatherMiamiBoatWind);
    }

    if (weather.rainLikely &&
        flow.blocks.any((b) => _isRainExposed(b.place))) {
      final indoor = pool
          .where((p) =>
              p.category == LuxPlaceCategory.dining ||
              p.moodTags.contains('arts'))
          .take(1)
          .map((p) => p.title)
          .toList();
      if (indoor.isNotEmpty) {
        advice.add(l.weatherMiamiRainReroute(indoor.first));
      }
    }
  }
}
