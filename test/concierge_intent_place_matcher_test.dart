import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/concierge_trip_save_sync.dart';
import 'package:luxora_ai/services/smart_itinerary/concierge_intent_place_matcher.dart';

LuxPlace _place({
  required String id,
  required String title,
  LuxPlaceCategory category = LuxPlaceCategory.adventure,
}) {
  return LuxPlace(
    id: id,
    slug: id,
    title: title,
    category: category,
    unsplashPhotoId: 'test',
    location: 'Orlando, FL',
    latitude: 28.4,
    longitude: -81.5,
    description: title,
    moodTags: const ['iconic'],
  );
}

void main() {
  test('hasActivitySchedulingIntent catches natural activity requests', () {
    expect(
      ConciergeIntentPlaceMatcher.hasActivitySchedulingIntent(
        'Can we go to Kennedy Space Center on day 3?',
      ),
      isTrue,
    );
    expect(
      ConciergeTripSaveSync.shouldRebuildItinerary(
        'Include Wine Bar George for dinner on the fourth day',
      ),
      isTrue,
    );
    expect(
      ConciergeIntentPlaceMatcher.hasActivitySchedulingIntent('Thanks!'),
      isFalse,
    );
  });

  test('placesMentionedIn matches catalog titles in chat', () {
    final pool = [
      _place(
        id: 'place-kennedy-space-center',
        title: 'Kennedy Space Center Visitor Complex',
      ),
      _place(id: 'place-luma-on-park', title: 'Luma on Park'),
    ];

    final matches = ConciergeIntentPlaceMatcher.placesMentionedIn(
      'Put Kennedy Space Center Visitor Complex on day 2',
      pool,
    );

    expect(matches, isNotEmpty);
    expect(matches.first.id, 'place-kennedy-space-center');
  });

  test('resolveTargetDayIndex parses day numbers', () {
    expect(
      ConciergeIntentPlaceMatcher.resolveTargetDayIndex('On day 4 please', 6),
      3,
    );
    expect(
      ConciergeIntentPlaceMatcher.resolveTargetDayIndex('third day', 5),
      2,
    );
  });
}
