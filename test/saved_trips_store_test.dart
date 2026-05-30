import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/saved_trips_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('idForProfile is stable for the same onboarding answers', () {
    const profile = TripProfile(
      cityId: 'orlando',
      destination: 'Orlando',
      startDate: 'Mar 14',
      endDate: 'Mar 18',
    );
    expect(
      SavedTripSummary.idForProfile(profile),
      SavedTripSummary.idForProfile(profile),
    );
  });

  test('dedupeKey treats user trips with same dates as duplicates', () {
    const a = SavedTripSummary(
      id: 'trip-1',
      title: 'Orlando Escape',
      dateRange: 'Mar 14 – Mar 18',
      startDate: '2026-03-14',
      endDate: '2026-03-18',
      experienceCount: 0,
      moodTags: ['Romantic'],
      timelineStatus: 'Building itinerary',
      cityId: 'orlando',
      userCreated: true,
    );
    const b = SavedTripSummary(
      id: 'trip-2',
      title: 'Orlando Escape',
      dateRange: 'Mar 14 – Mar 18',
      startDate: '2026-03-14',
      endDate: '2026-03-18',
      experienceCount: 0,
      moodTags: ['Relaxing'],
      timelineStatus: 'Building itinerary',
      cityId: 'orlando',
      userCreated: true,
    );
    expect(a.dedupeKey, b.dedupeKey);
  });

  test('SavedTripsStore dedupes equivalent trips on upsert', () async {
    SharedPreferences.setMockInitialValues({
      'luxora_saved_trips_seeded_v1': true,
      'luxora_saved_trips_v1': '[]',
    });
    const profile = TripProfile(
      cityId: 'orlando',
      destination: 'Orlando',
      startDate: 'Apr 1',
      endDate: 'Apr 5',
    );
    final store = SavedTripsStore.instance;
    await store.upsertFromProfile(
      profile,
      flexibleDateLabel: 'Dates flexible',
    );
    await store.upsertFromProfile(
      profile,
      flexibleDateLabel: 'Dates flexible',
    );
    await store.load();
    expect(store.trips.value.length, 1);
    expect(store.trips.value.single.id, SavedTripSummary.idForProfile(profile));
  });
}
