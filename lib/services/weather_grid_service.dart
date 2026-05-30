import 'dart:convert';

import 'package:http/http.dart' as http;

/// One cell in a regional weather grid for map overlays.
class WeatherGridCell {
  const WeatherGridCell({
    required this.latitude,
    required this.longitude,
    required this.halfSpanDegrees,
    this.temperatureF,
    this.cloudCover,
    this.windSpeedMph,
    this.windDirectionDeg,
  });

  final double latitude;
  final double longitude;
  final double halfSpanDegrees;
  final double? temperatureF;
  final int? cloudCover;
  final double? windSpeedMph;
  final int? windDirectionDeg;

  double get temperatureC =>
      temperatureF == null ? 0 : (temperatureF! - 32) * 5 / 9;
}

/// Fetches a coarse lat/lon grid around a hub for temperature, cloud, and wind overlays.
class WeatherGridService {
  WeatherGridService._();

  static final WeatherGridService instance = WeatherGridService._();

  static const _ttl = Duration(minutes: 20);
  static const _gridRadius = 2; // 5×5
  static const _stepDegrees = 0.18; // ~12 mi between points

  final Map<String, _GridCacheEntry> _cache = {};

  Future<List<WeatherGridCell>> fetchRegionalGrid(
    double centerLat,
    double centerLng,
  ) async {
    final key =
        '${centerLat.toStringAsFixed(2)},${centerLng.toStringAsFixed(2)}';
    final cached = _cache[key];
    if (cached != null && DateTime.now().difference(cached.at) < _ttl) {
      return cached.cells;
    }

    final lats = <String>[];
    final lons = <String>[];
    for (var dy = -_gridRadius; dy <= _gridRadius; dy++) {
      for (var dx = -_gridRadius; dx <= _gridRadius; dx++) {
        lats.add((centerLat + dy * _stepDegrees).toStringAsFixed(4));
        lons.add((centerLng + dx * _stepDegrees).toStringAsFixed(4));
      }
    }

    final uri = Uri.https('api.open-meteo.com', '/v1/forecast', {
      'latitude': lats.join(','),
      'longitude': lons.join(','),
      'current':
          'temperature_2m,cloud_cover,wind_speed_10m,wind_direction_10m',
      'temperature_unit': 'fahrenheit',
      'wind_speed_unit': 'mph',
      'timezone': 'auto',
    });

    try {
      final res = await http.get(uri).timeout(const Duration(seconds: 15));
      if (res.statusCode != 200) return cached?.cells ?? const [];

      final decoded = jsonDecode(res.body);
      final cells = _parseGridResponse(decoded, _stepDegrees / 2);
      if (cells.isNotEmpty) {
        _cache[key] = _GridCacheEntry(cells, DateTime.now());
      }
      return cells;
    } catch (_) {
      return cached?.cells ?? const [];
    }
  }

  List<WeatherGridCell> _parseGridResponse(Object? decoded, double halfSpan) {
    if (decoded is! List<dynamic>) return const [];

    return [
      for (final entry in decoded)
        if (entry is Map<String, dynamic>)
          WeatherGridCell(
            latitude: (entry['latitude'] as num?)?.toDouble() ?? 0,
            longitude: (entry['longitude'] as num?)?.toDouble() ?? 0,
            halfSpanDegrees: halfSpan,
            temperatureF: ((entry['current'] as Map<String, dynamic>?)?[
                    'temperature_2m'] as num?)
                ?.toDouble(),
            cloudCover: ((entry['current'] as Map<String, dynamic>?)?[
                    'cloud_cover'] as num?)
                ?.toInt(),
            windSpeedMph: ((entry['current'] as Map<String, dynamic>?)?[
                    'wind_speed_10m'] as num?)
                ?.toDouble(),
            windDirectionDeg: ((entry['current'] as Map<String, dynamic>?)?[
                    'wind_direction_10m'] as num?)
                ?.toInt(),
          ),
    ];
  }
}

class _GridCacheEntry {
  _GridCacheEntry(this.cells, this.at);
  final List<WeatherGridCell> cells;
  final DateTime at;
}
