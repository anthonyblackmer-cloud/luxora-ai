import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/services/rainviewer_service.dart';

void main() {
  test('RainViewerService builds tile URL from frame path', () {
    const path = '/v2/radar/test123';
    final url = RainViewerService.instance.tileUrlTemplate(path);
    expect(url, contains(path));
    expect(url, contains('{z}'));
    expect(url, contains('{x}'));
    expect(url, contains('{y}'));
  });
}
