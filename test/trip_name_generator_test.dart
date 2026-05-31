import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/trip_name_generator.dart';

void main() {
  test('suggest uses occasion and destination', () {
    const profile = TripProfile(
      destination: 'Orlando',
      occasion: TripOccasion.coupleAnniversary,
      moods: [TripMood.romantic],
    );
    expect(
      TripNameGenerator.suggest(profile),
      'Orlando Anniversary Escape',
    );
  });

  test('resolve prefers custom name when auto naming is off', () {
    const profile = TripProfile(
      destination: 'Miami',
      tripName: 'Our Babymoon',
      useAutoTripName: false,
    );
    expect(TripNameGenerator.resolve(profile), 'Our Babymoon');
  });

  test('resolve falls back to suggest when custom name empty', () {
    const profile = TripProfile(
      destination: 'Orlando',
      tripName: '',
      useAutoTripName: false,
      moods: [TripMood.luxurious],
      desiredTripEmotion: DesiredTripEmotion.luxurious,
    );
    expect(TripNameGenerator.resolve(profile), 'Orlando Luxury Escape');
  });

  test('budget friendly onboarding yields value title not luxury', () {
    const profile = TripProfile(
      destination: 'Orlando',
      hotelTypePreferences: [HotelTypePreference.budgetFriendly],
      hotelBudgetLevel: HotelBudgetLevel.two,
      moods: [TripMood.luxurious, TripMood.relaxing],
      tripStyles: [TripStyle.themeParks],
      vacationGoals: [VacationGoal.saveMoney],
    );
    expect(
      TripNameGenerator.suggest(profile),
      'Orlando Smart Park Getaway',
    );
  });

  test('budget friendly without theme parks uses smart getaway', () {
    const profile = TripProfile(
      destination: 'Orlando',
      hotelTypePreferences: [HotelTypePreference.budgetFriendly],
      moods: [TripMood.luxurious],
      tripStyles: [TripStyle.relaxation],
    );
    expect(TripNameGenerator.suggest(profile), 'Orlando Easy Getaway');
  });

  test('luxury hotel preference still yields luxury title', () {
    const profile = TripProfile(
      destination: 'Orlando',
      hotelTypePreferences: [HotelTypePreference.luxuryResort],
      hotelBudgetLevel: HotelBudgetLevel.four,
      moods: [TripMood.relaxing],
    );
    expect(TripNameGenerator.suggest(profile), 'Orlando Ultra Luxury Escape');
  });

  test('SavedTripSummary uses resolved title', () {
    const profile = TripProfile(
      destination: 'Orlando',
      tripName: 'Spring Magic',
      useAutoTripName: false,
    );
    final summary = SavedTripSummary.fromProfile(
      profile,
      flexibleDateLabel: 'Dates flexible',
    );
    expect(summary.title, 'Spring Magic');
  });
}
