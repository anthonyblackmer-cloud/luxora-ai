import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_itinerary_patch.dart';
import 'package:luxora_ai/services/concierge_trip_save_sync.dart';

void main() {
  final existing = TripPlan(
    id: 'trip-4d',
    title: 'Christina trip',
    days: [
      for (var i = 1; i <= 4; i++)
        TripDay(
          dayNumber: i,
          label: 'Day $i',
          items: [
            TripItem(
              id: 'd$i-lunch',
              time: '12:30 PM',
              title: 'Lunch spot $i',
              emotionalLine: 'Midday bite',
              location: 'Orlando',
              category: 'Dining',
              placeId: 'dining-lunch-$i',
            ),
          ],
        ),
    ],
  );

  test('shouldPatch targets scheduling edits on existing multi-day trips', () {
    expect(
      ConciergeItineraryPatch.shouldPatch(
        'Add a spa on day 2',
        existing,
        const TripProfile(cityId: 'orlando'),
      ),
      isTrue,
    );
    expect(
      ConciergeItineraryPatch.shouldPatch(
        'Plan a four-day trip to Disney',
        existing,
        const TripProfile(cityId: 'orlando'),
      ),
      isFalse,
    );
    expect(
      ConciergeTripSaveSync.shouldPatchItinerary(
        'Put us at the spa on day 3',
        existingPlan: existing,
        profile: const TripProfile(cityId: 'orlando'),
      ),
      isTrue,
    );
  });
}
