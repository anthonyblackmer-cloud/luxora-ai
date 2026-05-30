import 'package:luxora_ai/services/rainviewer_service.dart';
import 'package:luxora_ai/util/radar_tile_urls.dart';
import 'package:luxora_ai/util/share_map_thumbnail.dart';

List<String> sharePrecacheUrlsForPlace({
  required double latitude,
  required double longitude,
}) {
  return [
    shareStaticMapUrl(latitude: latitude, longitude: longitude),
  ];
}

/// RainViewer Doppler tiles for weather share capture.
List<String> sharePrecacheUrlsForWeather({
  required double latitude,
  required double longitude,
}) {
  final frame = RainViewerService.instance.latestFrame;
  return radarAndBaseTileUrlsForCenter(
    latitude: latitude,
    longitude: longitude,
    radarPath: frame?.path,
    radarHost: RainViewerService.instance.host,
  );
}
