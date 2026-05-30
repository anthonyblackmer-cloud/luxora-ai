import 'dart:convert';

import 'package:http/http.dart' as http;

/// A single RainViewer radar frame (10-minute steps).
class RainViewerFrame {
  const RainViewerFrame({
    required this.time,
    required this.path,
    this.isForecast = false,
  });

  final DateTime time;
  final String path;

  /// True for RainViewer nowcast tiles (short-range future, when available).
  final bool isForecast;
}

/// Cached RainViewer manifest for live precipitation / Doppler-style radar tiles.
class RainViewerService {
  RainViewerService._();

  static final RainViewerService instance = RainViewerService._();

  static const _manifestUrl = 'https://api.rainviewer.com/public/weather-maps.json';
  static const _ttl = Duration(minutes: 5);

  String _host = 'https://tilecache.rainviewer.com';
  List<RainViewerFrame> _frames = const [];
  DateTime? _loadedAt;

  List<RainViewerFrame> get frames => _frames;
  String get host => _host;

  RainViewerFrame? get latestFrame =>
      _frames.isEmpty ? null : _frames.last;

  /// PNG tile URL for flutter_map `{z}/{x}/{y}` placeholders.
  String tileUrlTemplate(String path) =>
      '$_host$path/256/{z}/{x}/{y}/2/1_1.png';

  Future<List<RainViewerFrame>> loadFrames({bool forceRefresh = false}) async {
    if (!forceRefresh &&
        _loadedAt != null &&
        DateTime.now().difference(_loadedAt!) < _ttl &&
        _frames.isNotEmpty) {
      return _frames;
    }

    try {
      final res = await http.get(Uri.parse(_manifestUrl)).timeout(
            const Duration(seconds: 12),
          );
      if (res.statusCode != 200) return _frames;

      final json = jsonDecode(res.body) as Map<String, dynamic>;
      final host = json['host'] as String?;
      if (host != null && host.isNotEmpty) _host = host;

      final radar = json['radar'] as Map<String, dynamic>?;
      final past = radar?['past'] as List<dynamic>? ?? const [];
      final nowcast = radar?['nowcast'] as List<dynamic>? ?? const [];

      List<RainViewerFrame> parseFrames(List<dynamic> raw, {required bool forecast}) {
        return [
          for (final item in raw)
            if (item is Map<String, dynamic>)
              RainViewerFrame(
                time: DateTime.fromMillisecondsSinceEpoch(
                  ((item['time'] as num?) ?? 0).toInt() * 1000,
                  isUtc: true,
                ).toLocal(),
                path: item['path'] as String? ?? '',
                isForecast: forecast,
              ),
        ].where((f) => f.path.isNotEmpty).toList();
      }

      _frames = [
        ...parseFrames(past, forecast: false),
        ...parseFrames(nowcast, forecast: true),
      ];

      _loadedAt = DateTime.now();
      return _frames;
    } catch (_) {
      return _frames;
    }
  }
}
