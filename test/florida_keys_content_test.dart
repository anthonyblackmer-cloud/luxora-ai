import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/florida_keys/florida_keys_content.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await UnsplashPhotoRegistry.instance.ensureLoaded();
  });

  test('Florida Keys place photos resolve from curated bundle', () {
    for (final place in FloridaKeysContent.places) {
      expect(
        place.unsplashPhoto?.hotlinkUrl,
        startsWith('https://'),
        reason: place.id,
      );
    }
  });

  test('Florida Keys pack meets minimum curated content targets', () {
    final places = FloridaKeysContent.places;
    final hotels = places.where((p) => p.category == LuxPlaceCategory.hotel);
    final dining = places.where((p) => p.category == LuxPlaceCategory.dining);
    final attractions = places.where(
      (p) =>
          p.id.contains('-attr-') ||
          FloridaKeysContent.places
              .where((x) => x.id.startsWith('place-keys-'))
              .contains(p),
    );
    final experiences = places.where((p) => p.id.contains('-exp-'));
    final gemPlaces = places.where((p) => p.id.contains('gem-place'));

    expect(hotels.length, greaterThanOrEqualTo(60));
    expect(dining.length, greaterThanOrEqualTo(150));
    expect(
      places.where((p) => p.id.contains('-attr-')).length,
      greaterThanOrEqualTo(75),
    );
    expect(experiences.length, greaterThanOrEqualTo(100));
    expect(gemPlaces.length, greaterThanOrEqualTo(100));
    expect(FloridaKeysContent.gems.length, greaterThanOrEqualTo(100));
    expect(FloridaKeysContent.moodRoutes.length, 10);
    expect(FloridaKeysContent.waterIntelligence.isNotEmpty, isTrue);
    expect(attractions.length, greaterThan(0));
  });
}
