import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_multi_day_planner.dart';
import 'package:luxora_ai/util/trip_duration.dart';

void main() {
  test('tripDaysFromProfile counts inclusive calendar days', () {
    expect(
      tripDaysFromProfile(
        const TripProfile(startDate: '2026-03-14', endDate: '2026-03-17'),
      ),
      4,
    );
  });

  test('resolveDayCount prefers profile dates over default message count', () {
    const profile = TripProfile(
      startDate: '2026-03-14',
      endDate: '2026-03-18',
    );
    expect(
      ConciergeMultiDayPlanner.resolveDayCount('save my trip please', profile),
      5,
    );
  });
}
