import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/util/today_plan_helpers.dart';

void main() {
  test('dayIndexForToday uses trip start date', () {
    final today = DateTime.now();
    final start = today.subtract(const Duration(days: 2));
    final iso =
        '${start.year}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}';

    expect(
      TodayPlanHelpers.dayIndexForToday(startDateIso: iso, dayCount: 5),
      2,
    );
  });

  String formatTime(DateTime t) {
    final h = t.hour > 12 ? t.hour - 12 : (t.hour == 0 ? 12 : t.hour);
    final m = t.minute.toString().padLeft(2, '0');
    final suffix = t.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $suffix';
  }

  test('resolveUpNext picks upcoming timed stop', () {
    final now = DateTime.now();
    final earlier = now.subtract(const Duration(hours: 3));
    final later = now.add(const Duration(hours: 2));

    final day = TripDay(
      dayNumber: 1,
      label: 'Explore',
      items: [
        TripItem(
          id: 'a',
          time: formatTime(earlier),
          title: 'Past',
          emotionalLine: '',
          location: '',
          category: '',
        ),
        TripItem(
          id: 'b',
          time: formatTime(later),
          title: 'Future',
          emotionalLine: '',
          location: '',
          category: '',
        ),
      ],
    );

    final state = TodayPlanHelpers.resolveUpNext(day);
    expect(state.kind, TodayUpNextKind.upcoming);
    expect(state.item?.title, 'Future');
    expect(state.startsIn, isNotNull);
  });

  test('resolveUpNext shows happening now during active stop', () {
    final now = DateTime.now();
    final start = now.subtract(const Duration(minutes: 30));
    final end = now.add(const Duration(hours: 2));

    final day = TripDay(
      dayNumber: 1,
      label: 'Explore',
      items: [
        TripItem(
          id: 'a',
          time: formatTime(start),
          title: 'Magic Kingdom',
          emotionalLine: '',
          location: '',
          category: '',
        ),
        TripItem(
          id: 'b',
          time: formatTime(end),
          title: 'Lunch',
          emotionalLine: '',
          location: '',
          category: '',
        ),
      ],
    );

    final state = TodayPlanHelpers.resolveUpNext(day);
    expect(state.kind, TodayUpNextKind.happeningNow);
    expect(state.item?.title, 'Magic Kingdom');
  });

  test('resolveUpNext marks day complete after final stop', () {
    final now = DateTime.now();
    final earlier = now.subtract(const Duration(hours: 4));
    final later = now.subtract(const Duration(hours: 2));

    final day = TripDay(
      dayNumber: 1,
      label: 'Explore',
      items: [
        TripItem(
          id: 'a',
          time: formatTime(earlier),
          title: 'Morning',
          emotionalLine: '',
          location: '',
          category: '',
        ),
        TripItem(
          id: 'b',
          time: formatTime(later),
          title: 'Evening',
          emotionalLine: '',
          location: '',
          category: '',
        ),
      ],
    );

    final state = TodayPlanHelpers.resolveUpNext(day);
    expect(state.kind, TodayUpNextKind.complete);
    expect(TodayPlanHelpers.nextTripItem(day), isNull);
  });

  test('nextTripItem picks first stop before day begins', () {
    final now = DateTime.now();
    final first = now.add(const Duration(hours: 1));

    final day = TripDay(
      dayNumber: 1,
      label: 'Explore',
      items: [
        TripItem(
          id: 'a',
          time: formatTime(first),
          title: 'Magic Kingdom',
          emotionalLine: '',
          location: '',
          category: '',
        ),
      ],
    );

    final state = TodayPlanHelpers.resolveUpNext(day);
    expect(state.kind, TodayUpNextKind.upcoming);
    expect(state.item?.title, 'Magic Kingdom');
  });
}
