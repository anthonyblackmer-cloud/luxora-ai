import 'package:flutter_test/flutter_test.dart';

import 'package:luxora_ai/data/saved_trips.dart';

import 'package:luxora_ai/models/trip_occasion.dart';

import 'package:luxora_ai/models/trip_preferences.dart';

import 'package:luxora_ai/models/trip_profile.dart';

import 'package:luxora_ai/services/onboarding_preference_mapper.dart';

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



  test('empty onboarding defaults to neutral escape not luxury', () {

    const profile = TripProfile(

      destination: 'Orlando',

      desiredTripEmotion: DesiredTripEmotion.memorable,

    );

    expect(TripNameGenerator.suggest(profile), 'Orlando Memorable Escape');

  });



  test('budget friendly onboarding yields value title not luxury', () {

    const profile = TripProfile(

      destination: 'Orlando',

      hotelTypePreferences: [HotelTypePreference.budgetFriendly],

      hotelBudgetLevel: HotelBudgetLevel.two,

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

      tripStyles: [TripStyle.relaxation],

    );

    expect(TripNameGenerator.suggest(profile), 'Orlando Easy Getaway');

  });



  test('theme parks and family combo yields family park adventure', () {

    final profile = OnboardingPreferenceMapper.enrichForPlanning(

      const TripProfile(

        destination: 'Orlando',

        travelerType: TravelerType.family,

        childrenTypes: [ChildrenType.elementary],

        tripStyles: [TripStyle.themeParks, TripStyle.familyActivities],

      ),

    );

    expect(

      TripNameGenerator.suggest(profile),

      'Orlando Family Park Adventure',

    );

  });



  test('foodie style yields foodie journey not luxury', () {

    const profile = TripProfile(

      destination: 'Orlando',

      tripStyles: [TripStyle.foodie],

      vacationGoals: [VacationGoal.bestFood],

    );

    expect(TripNameGenerator.suggest(profile), 'Orlando Foodie Journey');

  });



  test('luxury hotel preference still yields luxury title', () {

    const profile = TripProfile(

      destination: 'Orlando',

      hotelTypePreferences: [HotelTypePreference.luxuryResort],

      hotelBudgetLevel: HotelBudgetLevel.four,

      tripStyles: [TripStyle.luxury],

    );

    expect(TripNameGenerator.suggest(profile), 'Orlando Luxury Escape');

  });



  test('wellness selections yield wellness retreat', () {

    const profile = TripProfile(

      destination: 'Orlando',

      tripStyles: [TripStyle.wellness],

      hotelTypePreferences: [HotelTypePreference.spaResort],

      desiredTripEmotion: DesiredTripEmotion.relaxed,

    );

    expect(TripNameGenerator.suggest(profile), 'Orlando Wellness Retreat');

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

