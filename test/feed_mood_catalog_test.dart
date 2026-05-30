import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/util/feed_mood_catalog.dart';
import 'package:flutter_test/flutter_test.dart';

TripProfile _familyProfile() => const TripProfile(
      kids: 2,
      adults: 2,
      occasion: TripOccasion.familyWithKids,
      moods: [TripMood.familyBonding],
    );

void main() {
  group('feedTripIsFamily', () {
    test('true when kids count is positive', () {
      expect(feedTripIsFamily(const TripProfile(kids: 1)), isTrue);
    });

    test('false for default couple profile', () {
      expect(feedTripIsFamily(const TripProfile()), isFalse);
    });
  });

  group('visibleFeedMoods', () {
    test('includes family and hides romantic for family trips', () {
      final moods = visibleFeedMoods(_familyProfile());
      expect(moods, contains(FeedMood.family));
      expect(moods, isNot(contains(FeedMood.romantic)));
      expect(moods, isNot(contains(FeedMood.social)));
    });

    test('excludes family chip for non-family trips', () {
      final moods = visibleFeedMoods(const TripProfile());
      expect(moods, isNot(contains(FeedMood.family)));
      expect(moods, contains(FeedMood.romantic));
    });
  });

  group('FeedMood.family matches', () {
    test('matches family-tagged places', () {
      expect(
        FeedMood.family.matches(
          const LuxPlace(
            id: 'x',
            slug: 'x',
            title: 'Magic Kingdom',
            category: LuxPlaceCategory.family,
            unsplashPhotoId: 't',
            location: 'Orlando',
            latitude: 28.4,
            longitude: -81.5,
            description: 'd',
            moodTags: ['family', 'iconic'],
          ),
        ),
        isTrue,
      );
    });
  });

  group('normalizeFeedMood', () {
    test('switches hidden romantic to family on family profile', () {
      expect(
        normalizeFeedMood(FeedMood.romantic, _familyProfile()),
        FeedMood.family,
      );
    });
  });
}
