import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/lux_place.dart';
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

  test('spa morning requires explicit spas onboarding selection', () {
    const noSpa = TripProfile(poolsideInterest: 80);
    expect(TripPreferenceGates.allowsWellnessMorning(noSpa), isFalse);
    expect(TripPreferenceGates.wantsSpaWellness(noSpa), isFalse);

    const relaxationOnly = TripProfile(
      poolsideInterest: 80,
      tripStyles: [TripStyle.relaxation],
    );
    expect(TripPreferenceGates.allowsWellnessMorning(relaxationOnly), isFalse);

    const withSpa = TripProfile(
      poolsideInterest: 80,
      experiencePreferences: [ExperiencePreference.spas],
    );
    expect(TripPreferenceGates.allowsWellnessMorning(withSpa), isTrue);
    expect(TripPreferenceGates.wantsSpaWellness(withSpa), isTrue);
  });

  test('wellness places blocked unless spas selected', () {
    const noSpa = TripProfile(experiencePreferences: []);
    const spaPlace = LuxPlace(
      id: 'place-spa-ritz-grande-lakes',
      slug: 'ritz-spa',
      title: 'Spa',
      category: LuxPlaceCategory.wellness,
      unsplashPhotoId: 'test',
      latitude: 28.4,
      longitude: -81.5,
      location: 'Orlando',
      description: 'Spa',
      moodTags: const ['spa', 'wellness'],
    );
    expect(TripPreferenceGates.allowsWellnessPlace(noSpa, spaPlace), isFalse);
  });
}
