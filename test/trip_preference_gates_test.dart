import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/smart_itinerary/trip_preference_gates.dart';

void main() {
  test('theme parks require explicit onboarding selection', () {
    const profile = TripProfile(
      adventureInterest: 90,
      experiencePreferences: [],
      tripStyles: [],
    );
    expect(TripPreferenceGates.wantsThemeParks(profile), isFalse);
    expect(
      TripPreferenceGates.allowsPlace(profile, 'place-magic-kingdom'),
      isFalse,
    );
  });

  test('friends trip blocks kid-focused I-Drive venues', () {
    const profile = TripProfile(
      travelerType: TravelerType.friends,
      adults: 4,
      travelerCount: 4,
      experiencePreferences: [],
    );
    expect(
      TripPreferenceGates.allowsPlace(profile, 'place-ripleys-orlando'),
      isFalse,
    );
    expect(
      TripPreferenceGates.allowsPlace(profile, 'place-sealife-orlando'),
      isFalse,
    );
  });

  test('spa morning requires spas preference or wellness style', () {
    const noSpa = TripProfile(poolsideInterest: 80);
    expect(TripPreferenceGates.allowsWellnessMorning(noSpa), isFalse);

    const withSpa = TripProfile(
      poolsideInterest: 80,
      experiencePreferences: [ExperiencePreference.spas],
    );
    expect(TripPreferenceGates.allowsWellnessMorning(withSpa), isTrue);
  });
}
