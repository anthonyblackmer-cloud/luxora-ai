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

  test('nextTripItem picks upcoming timed stop', () {
    final now = DateTime.now();
    final later = now.add(const Duration(hours: 2));
    final earlier = now.subtract(const Duration(hours: 1));
    final format = (DateTime t) {
      final h = t.hour > 12 ? t.hour - 12 : (t.hour == 0 ? 12 : t.hour);
      final m = t.minute.toString().padLeft(2, '0');
      final suffix = t.hour >= 12 ? 'PM' : 'AM';
      return '$h:$m $suffix';
    };

    const day = TripDay(
      dayNumber: 1,
      label: 'Explore',
      items: [
        TripItem(
          id: 'a',
          time: '6:00 AM',
          title: 'Early',
          emotionalLine: '',
          location: '',
          category: '',
        ),
        TripItem(
          id: 'b',
          time: '11:59 PM',
          title: 'Late',
          emotionalLine: '',
          location: '',
          category: '',
        ),
      ],
    );

    final patched = TripDay(
      dayNumber: 1,
      label: 'Explore',
      items: [
        TripItem(
          id: 'a',
          time: format(earlier),
          title: 'Past',
          emotionalLine: '',
          location: '',
          category: '',
        ),
        TripItem(
          id: 'b',
          time: format(later),
          title: 'Future',
          emotionalLine: '',
          location: '',
          category: '',
        ),
      ],
    );

    expect(TodayPlanHelpers.nextTripItem(patched)?.title, 'Future');
    expect(TodayPlanHelpers.nextTripItem(day)?.title, isNotNull);
  });
}
