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

/// A lightweight snapshot of current conditions for a location, plus today's
/// sunset and rain outlook — enough to make the day plan feel weather-aware.
class LuxWeather {
  const LuxWeather({
    required this.temperatureF,
    required this.condition,
    required this.isDay,
    this.sunset,
    this.rainChance,
  });

  /// Current temperature in Fahrenheit (Celsius derived on demand).
  final double temperatureF;
  final LuxWeatherCondition condition;
  final bool isDay;

  /// Today's sunset (local to the queried location), when available.
  final DateTime? sunset;

  /// Max precipitation probability for today, 0–100, when available.
  final int? rainChance;

  double get temperatureC => (temperatureF - 32) * 5 / 9;

  bool get rainLikely => (rainChance ?? 0) >= 40;
}

/// Fetches conditions from Open-Meteo (no API key required) with a short
/// in-memory cache keyed by rounded coordinates so the map can rebuild freely
/// without spamming the network.
class WeatherService {
  WeatherService._();

  static final WeatherService instance = WeatherService._();

  static const _ttl = Duration(minutes: 30);
  final Map<String, _CacheEntry> _cache = {};

  Future<LuxWeather?> fetch(double latitude, double longitude) async {
    final key = '${latitude.toStringAsFixed(2)},${longitude.toStringAsFixed(2)}';
    final cached = _cache[key];
    if (cached != null && DateTime.now().difference(cached.at) < _ttl) {
      return cached.weather;
    }

    final uri = Uri.https('api.open-meteo.com', '/v1/forecast', {
      'latitude': latitude.toStringAsFixed(4),
      'longitude': longitude.toStringAsFixed(4),
      'current': 'temperature_2m,weather_code,is_day',
      'daily': 'sunset,precipitation_probability_max',
      'temperature_unit': 'fahrenheit',
      'timezone': 'auto',
      'forecast_days': '1',
    });

    try {
      final res = await http
          .get(uri)
          .timeout(const Duration(seconds: 8));
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

    DateTime? sunset;
    int? rainChance;
    final daily = json['daily'] as Map<String, dynamic>?;
    if (daily != null) {
      final sunsets = daily['sunset'] as List<dynamic>?;
      if (sunsets != null && sunsets.isNotEmpty) {
        sunset = DateTime.tryParse(sunsets.first.toString());
      }
      final rains = daily['precipitation_probability_max'] as List<dynamic>?;
      if (rains != null && rains.isNotEmpty) {
        rainChance = (rains.first as num?)?.toInt();
      }
    }

    return LuxWeather(
      temperatureF: temp,
      condition: _conditionFromCode(code),
      isDay: isDay,
      sunset: sunset,
      rainChance: rainChance,
    );
  }

  /// Maps WMO weather codes to coarse buckets.
  static LuxWeatherCondition _conditionFromCode(int code) {
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
