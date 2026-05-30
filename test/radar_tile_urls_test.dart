import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/util/radar_tile_urls.dart';

void main() {
  test('radarAndBaseTileUrlsForCenter includes base and radar tiles', () {
    final urls = radarAndBaseTileUrlsForCenter(
      latitude: 28.42,
      longitude: -81.58,
      radarPath: '/v2/radar/123',
      radarHost: 'https://tilecache.rainviewer.com',
      zoom: 8,
      radius: 0,
    );

    expect(urls.length, 2);
    expect(urls[0], contains('openstreetmap.org/8/'));
    expect(urls[1], contains('tilecache.rainviewer.com/v2/radar/123'));
  });
}
