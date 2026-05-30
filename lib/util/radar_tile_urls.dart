import 'dart:math' as math;

/// Network tile URLs to warm the cache before capturing a radar preview.
List<String> radarAndBaseTileUrlsForCenter({
  required double latitude,
  required double longitude,
  required String? radarPath,
  String radarHost = 'https://tilecache.rainviewer.com',
  int zoom = 8,
  int radius = 1,
}) {
  final urls = <String>[];
  final x = _tileX(longitude, zoom);
  final y = _tileY(latitude, zoom);
  for (var dx = -radius; dx <= radius; dx++) {
    for (var dy = -radius; dy <= radius; dy++) {
      final tx = x + dx;
      final ty = y + dy;
      urls.add('https://tile.openstreetmap.org/$zoom/$tx/$ty.png');
      if (radarPath != null && radarPath.isNotEmpty) {
        urls.add('$radarHost$radarPath/256/$zoom/$tx/$ty/2/1_1.png');
      }
    }
  }
  return urls;
}

int _tileX(double longitude, int zoom) {
  final scale = math.pow(2, zoom).toDouble();
  return ((longitude + 180) / 360 * scale).floor().clamp(0, scale.toInt() - 1);
}

int _tileY(double latitude, int zoom) {
  final scale = math.pow(2, zoom).toDouble();
  final latRad = latitude * math.pi / 180;
  final y =
      (1 - math.log(math.tan(latRad) + 1 / math.cos(latRad)) / math.pi) /
          2 *
          scale;
  return y.floor().clamp(0, scale.toInt() - 1);
}
