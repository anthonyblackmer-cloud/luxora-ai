import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/smart_itinerary/itinerary_day_schedule.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:luxora_ai/util/today_plan_helpers.dart';

void main() {
  final lakeEola = LuxPlace(
    id: 'place-lake-eola',
    slug: 'lake-eola-park',
    title: 'Lake Eola Park',
    category: LuxPlaceCategory.romantic,
    unsplashPhotoId: 'test',
    location: 'Downtown Orlando, FL',
    latitude: 28.5433,
    longitude: -81.3790,
    description: 'Swan boats and skyline loop.',
  );
  final disneySprings = LuxPlace(
    id: 'place-disney-springs',
    slug: 'disney-springs',
    title: 'Disney Springs',
    category: LuxPlaceCategory.dining,
    unsplashPhotoId: 'test',
    location: 'Lake Buena Vista, FL',
    latitude: 28.3712,
    longitude: -81.5183,
    description: 'No-ticket dining and shopping.',
  );

  test('evening stops get sequential non-overlapping times', () {
    final anchor = DateTime(2026, 6, 1);
    final scheduled = ItineraryDaySchedule.build(
      blocks: [
        DayBlock(
          phase: DayPhase.evening,
          place: lakeEola,
          reason: DayBlockReason.afternoonGem,
        ),
        DayBlock(
          phase: DayPhase.evening,
          place: disneySprings,
          reason: DayBlockReason.eveningDining,
        ),
      ],
      dayStart: PlaceDistance.hubCenter,
      anchorDate: anchor,
    );

    expect(scheduled.length, 2);
    expect(scheduled[0].start.hour, 18);
    expect(scheduled[1].start.isBefore(scheduled[0].end), isFalse);
    expect(scheduled[1].start.isAfter(scheduled[0].start), isTrue);
    expect(
      ItineraryDaySchedule.formatStartTime(scheduled[0].start),
      isNot(equals(ItineraryDaySchedule.formatStartTime(scheduled[1].start))),
    );
  });

  test('trip item times are unique for Lake Eola then Disney Springs', () {
    final items = ItineraryDaySchedule.tripItemsFromBlocks(
      blocks: [
        DayBlock(
          phase: DayPhase.evening,
          place: lakeEola,
          reason: DayBlockReason.afternoonGem,
        ),
        DayBlock(
          phase: DayPhase.evening,
          place: disneySprings,
          reason: DayBlockReason.eveningDining,
        ),
      ],
      dayStart: PlaceDistance.hubCenter,
      dayNumber: 1,
      idPrefix: 'test',
      blockLine: (block) => block.place.description,
      categoryLabel: (c) => c,
    );

    expect(items.length, 2);
    expect(items[0].time, isNot(equals(items[1].time)));
    expect(items[0].time, contains('6:00'));
  });

  test('parseScheduleTime reads start from time range', () {
    final parsed = TodayPlanHelpers.parseScheduleTime('6:00–7:30 PM');
    expect(parsed, isNotNull);
    expect(parsed!.hour, 18);
    expect(parsed.minute, 0);
  });
}
