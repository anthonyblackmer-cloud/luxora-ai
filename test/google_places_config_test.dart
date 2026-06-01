import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/services/google_places_config.dart';

void main() {
  test('GooglePlacesConfig reads dart-define name', () {
    expect(GooglePlacesConfig.apiKey, isA<String>());
    // Empty in CI unless GOOGLE_PLACES_API_KEY is injected at build time.
    expect(GooglePlacesConfig.isConfigured, GooglePlacesConfig.apiKey.isNotEmpty);
  });
}
