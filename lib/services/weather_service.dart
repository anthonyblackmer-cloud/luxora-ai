import 'dart:convert';

import 'package:http/http.dart' as http;

/// Coarse weather buckets mapped from WMO weather codes, each with its own
/// icon + localized label in the UI layer.
enum LuxWeatherCondition {
  clear,
  partlyCloudy,
  cloudy,
  fog,
  drizzle,
  rain,
  snow,
  thunder,
}

/// One hour in today's forecast timeline.
class LuxWeatherHourly {
  const LuxWeatherHourly({
    required this.time,
    required this.temperatureF,
    required this.condition,
    this.rainChance,
    this.windSpeedMph,
  });

  final DateTime time;
  final double temperatureF;
  final LuxWeatherCondition condition;
  final int? rainChance;
  final double? windSpeedMph;

  double get temperatureC => (temperatureF - 32) * 5 / 9;

  bool get rainLikely => (rainChance ?? 0) >= 40;
}

/// A weather snapshot for a location — current conditions, sun times, and an
/// hourly timeline for concierge-style travel guidance.
class LuxWeather {
  const LuxWeather({
    required this.temperatureF,
    required this.condition,
    required this.isDay,
    this.feelsLikeF,
    this.humidity,
    this.windSpeedMph,
    this.windDirectionDeg,
    this.uvIndex,
    this.cloudCover,
    this.visibilityMiles,
    this.sunrise,
    this.sunset,
    this.rainChance,
    this.hourly = const [],
  });

  final double temperatureF;
  final LuxWeatherCondition condition;
  final bool isDay;
  final double? feelsLikeF;
  final int? humidity;
  final double? windSpeedMph;
  final int? windDirectionDeg;
  final double? uvIndex;
  final int? cloudCover;
  final double? visibilityMiles;
  final DateTime? sunrise;
  final DateTime? sunset;
  final int? rainChance;
  final List<LuxWeatherHourly> hourly;

  double get temperatureC => (temperatureF - 32) * 5 / 9;

  double? get feelsLikeC =>
      feelsLikeF == null ? null : (feelsLikeF! - 32) * 5 / 9;

  bool get rainLikely => (rainChance ?? 0) >= 40;

  /// Current-hour rain probability when hourly data is available.
  int? get currentHourRainChance {
    if (hourly.isEmpty) return rainChance;
    final now = DateTime.now();
    for (final h in hourly) {
      if (h.time.hour == now.hour && _sameDay(h.time, now)) {
        return h.rainChance ?? rainChance;
      }
    }
    return hourly.first.rainChance ?? rainChance;
  }
}

bool _sameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

/// Fetches conditions from Open-Meteo (no API key required) with a short
/// in-memory cache keyed by rounded coordinates so the map can rebuild freely
/// without spamming the network.
class WeatherService {
  WeatherService._();

  static final WeatherService instance = WeatherService._();

  static const _ttl = Duration(minutes: 30);
  final Map<String, _CacheEntry> _cache = {};

  Future<LuxWeather?> fetch(double latitude, double longitude) async {
    final key =
        '${latitude.toStringAsFixed(2)},${longitude.toStringAsFixed(2)}';
    final cached = _cache[key];
    if (cached != null && DateTime.now().difference(cached.at) < _ttl) {
      return cached.weather;
    }

    final uri = Uri.https('api.open-meteo.com', '/v1/forecast', {
      'latitude': latitude.toStringAsFixed(4),
      'longitude': longitude.toStringAsFixed(4),
      'current':
          'temperature_2m,apparent_temperature,relative_humidity_2m,weather_code,is_day,wind_speed_10m,wind_direction_10m,uv_index,cloud_cover,visibility',
      'hourly':
          'temperature_2m,weather_code,precipitation_probability,wind_speed_10m',
      'daily': 'sunrise,sunset,precipitation_probability_max',
      'temperature_unit': 'fahrenheit',
      'wind_speed_unit': 'mph',
      'visibility_unit': 'mile',
      'timezone': 'auto',
      'forecast_days': '2',
    });

    try {
      final res = await http.get(uri).timeout(const Duration(seconds: 10));
      if (res.statusCode != 200) return null;
      final json = jsonDecode(res.body) as Map<String, dynamic>;
      final weather = _parse(json);
      if (weather != null) {
        _cache[key] = _CacheEntry(weather, DateTime.now());
      }
      return weather;
    } catch (_) {
      return null;
    }
  }

  LuxWeather? _parse(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>?;
    if (current == null) return null;
    final temp = (current['temperature_2m'] as num?)?.toDouble();
    if (temp == null) return null;
    final code = (current['weather_code'] as num?)?.toInt() ?? 0;
    final isDay = (current['is_day'] as num?)?.toInt() != 0;

    DateTime? sunrise;
    DateTime? sunset;
    int? rainChance;
    final daily = json['daily'] as Map<String, dynamic>?;
    if (daily != null) {
      final sunrises = daily['sunrise'] as List<dynamic>?;
      if (sunrises != null && sunrises.isNotEmpty) {
        sunrise = DateTime.tryParse(sunrises.first.toString());
      }
      final sunsets = daily['sunset'] as List<dynamic>?;
      if (sunsets != null && sunsets.isNotEmpty) {
        sunset = DateTime.tryParse(sunsets.first.toString());
      }
      final rains = daily['precipitation_probability_max'] as List<dynamic>?;
      if (rains != null && rains.isNotEmpty) {
        rainChance = (rains.first as num?)?.toInt();
      }
    }

    final hourly = _parseHourly(json['hourly'] as Map<String, dynamic>?);

    return LuxWeather(
      temperatureF: temp,
      condition: conditionFromCode(code),
      isDay: isDay,
      feelsLikeF: (current['apparent_temperature'] as num?)?.toDouble(),
      humidity: (current['relative_humidity_2m'] as num?)?.toInt(),
      windSpeedMph: (current['wind_speed_10m'] as num?)?.toDouble(),
      windDirectionDeg: (current['wind_direction_10m'] as num?)?.toInt(),
      uvIndex: (current['uv_index'] as num?)?.toDouble(),
      cloudCover: (current['cloud_cover'] as num?)?.toInt(),
      visibilityMiles: (current['visibility'] as num?)?.toDouble(),
      sunrise: sunrise,
      sunset: sunset,
      rainChance: rainChance,
      hourly: hourly,
    );
  }

  static List<LuxWeatherHourly> _parseHourly(Map<String, dynamic>? hourly) {
    if (hourly == null) return const [];
    final times = hourly['time'] as List<dynamic>?;
    final temps = hourly['temperature_2m'] as List<dynamic>?;
    final codes = hourly['weather_code'] as List<dynamic>?;
    final rains = hourly['precipitation_probability'] as List<dynamic>?;
    final winds = hourly['wind_speed_10m'] as List<dynamic>?;
    if (times == null || temps == null || codes == null) return const [];

    final now = DateTime.now();
    final end = now.add(const Duration(hours: 24));
    final out = <LuxWeatherHourly>[];

    for (var i = 0; i < times.length; i++) {
      final time = DateTime.tryParse(times[i].toString());
      if (time == null || time.isBefore(now.subtract(const Duration(hours: 1)))) {
        continue;
      }
      if (time.isAfter(end)) break;

      out.add(
        LuxWeatherHourly(
          time: time,
          temperatureF: (temps[i] as num?)?.toDouble() ?? 72,
          condition: conditionFromCode((codes[i] as num?)?.toInt() ?? 0),
          rainChance: (rains != null && i < rains.length)
              ? (rains[i] as num?)?.toInt()
              : null,
          windSpeedMph: (winds != null && i < winds.length)
              ? (winds[i] as num?)?.toDouble()
              : null,
        ),
      );
    }
    return out;
  }

  /// Maps WMO weather codes to coarse buckets.
  static LuxWeatherCondition conditionFromCode(int code) {
    if (code == 0) return LuxWeatherCondition.clear;
    if (code == 1 || code == 2) return LuxWeatherCondition.partlyCloudy;
    if (code == 3) return LuxWeatherCondition.cloudy;
    if (code == 45 || code == 48) return LuxWeatherCondition.fog;
    if (code >= 51 && code <= 57) return LuxWeatherCondition.drizzle;
    if ((code >= 61 && code <= 67) || (code >= 80 && code <= 82)) {
      return LuxWeatherCondition.rain;
    }
    if ((code >= 71 && code <= 77) || code == 85 || code == 86) {
      return LuxWeatherCondition.snow;
    }
    if (code >= 95) return LuxWeatherCondition.thunder;
    return LuxWeatherCondition.cloudy;
  }
}

class _CacheEntry {
  _CacheEntry(this.weather, this.at);
  final LuxWeather weather;
  final DateTime at;
}
