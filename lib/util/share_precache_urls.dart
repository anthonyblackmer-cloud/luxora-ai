import 'package:luxora_ai/util/share_map_thumbnail.dart';

List<String> sharePrecacheUrlsForPlace({
  required double latitude,
  required double longitude,
}) {
  return [
    shareStaticMapUrl(latitude: latitude, longitude: longitude),
  ];
}
