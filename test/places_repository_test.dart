import 'package:flutter_test/flutter_test.dart';

// Loads assets/unsplash/curated.json in tests.
import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_cover_resolver.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await UnsplashPhotoRegistry.instance.ensureLoaded();
  });

  test('feed and gem ids resolve to places with image urls', () {
    final repo = PlacesRepository.instance;
    for (final id in kFeedItemPlaceIds.values) {
      final place = repo.byId(id);
      expect(place, isNotNull);
      expect(place!.unsplashPhoto?.hotlinkUrl, startsWith('https://'));
    }
    for (final id in kGemPlaceIds.values) {
      expect(repo.byId(id)?.unsplashPhoto?.hotlinkUrl, isNotEmpty);
    }
  });

  test('trip cover resolver maps saved trips', () {
    final cover = TripCoverResolver.instance.forSavedTrip(
      const SavedTripSummary(
        id: 'orlando-golden',
        title: 'Test',
        dateRange: 'Mar 1–5',
        experienceCount: 3,
        moodTags: ['Romantic'],
        timelineStatus: 'Ready',
      ),
    );
    expect(cover?.id, 'cover-romantic-sunset');
  });
}
