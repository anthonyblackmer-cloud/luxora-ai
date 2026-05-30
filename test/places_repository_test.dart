import 'package:flutter_test/flutter_test.dart';

// Loads assets/unsplash/curated.json in tests.
import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_cover_resolver.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await UnsplashPhotoRegistry.instance.ensureLoaded();
    await CityPackRegistry.instance.load();
    await PlacesRepository.instance.initialize();
  });

  test('every catalog unsplashPhotoId resolves in curated.json', () {
    final repo = PlacesRepository.instance;
    for (final place in repo.activePlaces) {
      expect(
        place.unsplashPhoto?.hotlinkUrl,
        startsWith('https://'),
        reason: '${place.id} → ${place.unsplashPhotoId}',
      );
    }
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

  test('catalog includes major tourist attractions', () {
    final repo = PlacesRepository.instance;
    expect(repo.mappablePlaces.length, greaterThan(70));
    for (final id in [
      'place-hollywood-studios',
      'place-animal-kingdom',
      'place-busch-gardens-tampa',
      'place-everglades-national-park',
      'place-st-augustine-historic',
    ]) {
      expect(repo.byId(id), isNotNull, reason: 'missing $id');
    }
  });

  test('search finds destinations by name and respects radius', () {
    final repo = PlacesRepository.instance;
    final disney = repo.searchPlaces(
      'magic kingdom',
      radius: DiscoverRadius.miles50,
    );
    expect(disney, isNotEmpty);
    expect(disney.first.id, 'place-magic-kingdom');

    final keysIn50 = repo.searchPlaces(
      'key west old town',
      radius: DiscoverRadius.miles50,
    );
    expect(keysIn50, isEmpty);

    final keysAll = repo.searchPlaces(
      'key west old town',
      radius: DiscoverRadius.allFlorida,
    );
    expect(keysAll.any((p) => p.id == 'place-key-west-old-town'), isTrue);
  });

  test('radius filter excludes Keys from 50mi Orlando hub', () {
    final repo = PlacesRepository.instance;
    final within50 = repo.placesWithinRadius(DiscoverRadius.miles50);
    expect(within50.any((p) => p.id == 'place-keys-sail'), isFalse);
    expect(within50.any((p) => p.id == 'place-magic-kingdom'), isTrue);

    final all = repo.placesWithinRadius(DiscoverRadius.allFlorida);
    expect(all.any((p) => p.id == 'place-keys-sail'), isTrue);
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
