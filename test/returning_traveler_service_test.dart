import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/returning_traveler_service.dart';

void main() {
  test('profileForNewTrip keeps preferences and clears trip-specific fields', () {
    const prior = TripProfile(
      travelerName: 'Maria Lopez',
      cityId: 'miami',
      destination: 'Miami',
      startDate: '2026-06-01',
      endDate: '2026-06-07',
      tripName: 'Miami Escape',
      tripFeel: 'Sun-soaked and slow',
      pace: PacePreference.slow,
      tripStyles: [TripStyle.beaches],
      hotelTypePreferences: [HotelTypePreference.boutiqueHotel],
    );

    final next = ReturningTravelerService.profileForNewTrip(prior);

    expect(next.travelerName, 'Maria Lopez');
    expect(next.pace, PacePreference.slow);
    expect(next.tripStyles, [TripStyle.beaches]);
    expect(next.hotelTypePreferences, [HotelTypePreference.boutiqueHotel]);
    expect(next.startDate, isEmpty);
    expect(next.endDate, isEmpty);
    expect(next.tripName, isEmpty);
    expect(next.tripFeel, isEmpty);
    expect(next.moods, isEmpty);
    expect(next.useAutoTripName, isTrue);
  });
}
