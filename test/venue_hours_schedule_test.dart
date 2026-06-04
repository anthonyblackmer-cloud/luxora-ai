import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/smart_itinerary/itinerary_day_schedule.dart';
import 'package:luxora_ai/util/place_distance.dart';

void main() {
  final ripleys = LuxPlace(
    id: 'place-ripleys-orlando',
    slug: 'ripleys',
    title: "Ripley's Believe It or Not! Orlando",
    category: LuxPlaceCategory.family,
    unsplashPhotoId: 'test',
    location: 'Orlando, FL',
    latitude: 28.4462,
    longitude: -81.4718,
    description: 'Odditorium on I-Drive.',
    moodTags: const ['family'],
  );
  final sealife = LuxPlace(
    id: 'place-sealife-orlando',
    slug: 'sealife',
    title: 'SEA LIFE Orlando Aquarium',
    category: LuxPlaceCategory.family,
    unsplashPhotoId: 'test',
    location: 'Orlando, FL',
    latitude: 28.4435,
    longitude: -81.4689,
    description: '360° ocean tunnel.',
    moodTags: const ['family', 'nature'],
  );
  final dining = LuxPlace(
    id: 'dining-test',
    slug: 'dining-test',
    title: 'Test dinner',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: 'test',
    location: 'Orlando, FL',
    latitude: 28.54,
    longitude: -81.38,
    description: 'Dinner stop.',
  );

  test('stacked I-Drive stops stay within venue hours', () {
    final anchor = DateTime(2026, 6, 1);
    final blocks = [
      DayBlock(
        phase: DayPhase.midday,
        place: ripleys,
        reason: DayBlockReason.middayIcon,
      ),
      DayBlock(
        phase: DayPhase.afternoon,
        place: sealife,
        reason: DayBlockReason.middayIcon,
      ),
      DayBlock(
        phase: DayPhase.evening,
        place: dining,
        reason: DayBlockReason.eveningDining,
      ),
    ];

    expect(
      ItineraryDaySchedule.isFeasible(
        blocks: blocks,
        dayStart: PlaceDistance.hubCenter,
        anchorDate: anchor,
        compactDurations: true,
      ),
      isTrue,
    );

    final scheduled = ItineraryDaySchedule.build(
      blocks: blocks,
      dayStart: PlaceDistance.hubCenter,
      anchorDate: anchor,
      compactDurations: true,
    );

    expect(scheduled.length, greaterThanOrEqualTo(2));
    for (final slot in scheduled) {
      expect(slot.start.hour, greaterThanOrEqualTo(9));
      expect(slot.end.hour, lessThanOrEqualTo(22));
    }
    expect(scheduled.first.start.hour, lessThan(22));
    expect(scheduled.last.end.hour, lessThanOrEqualTo(22));
  });
}
