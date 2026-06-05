import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_itinerary_sync.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_feel_interpreter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  setUpAll(() async {
    await initializeDateFormatting('en_US');
    await PlacesRepository.instance.initialize();
  });

  test('enrichFromText boosts foodie interest from dining language', () {
    const profile = TripProfile(foodieInterest: 40);
    final next = TripFeelInterpreter.enrichFromText(
      profile,
      'We want romantic dinners and hidden luxury',
    );
    expect(next.foodieInterest, greaterThan(profile.foodieInterest));
    expect(next.moods, contains(TripMood.romantic));
  });

  test('applyAfterChat builds a non-empty plan for Orlando', () async {
    const profile = TripProfile(
      cityId: 'orlando',
      destination: 'Orlando',
      foodieInterest: 80,
      adventureInterest: 70,
      tripFeel: 'luxury family theme park day',
    );

    final result = await ConciergeItinerarySync.applyAfterChat(
      userMessage: 'Plan a relaxed luxury day with great food',
      profile: profile,
    );

    expect(result, isNotNull);
    expect(result!.flow.blocks, isNotEmpty);
    expect(result.plan.days.first.items, isNotEmpty);
    expect(
      result.plan.days.first.items.length,
      lessThanOrEqualTo(result.flow.blocks.length),
    );
    expect(
      ConciergeItinerarySync.timelineSnapshot(result.flow),
      isNotEmpty,
    );
  });

  test('applyAfterChat builds multi-day Disney and Universal excursion', () async {
    const profile = TripProfile(cityId: 'orlando', destination: 'Orlando');

    final result = await ConciergeItinerarySync.applyAfterChat(
      userMessage:
          'Create a four-day three-night excursion to Disney and Universal Studios',
      profile: profile,
    );

    expect(result, isNotNull);
    expect(result!.plan.days.length, 4);
    expect(
      result.plan.days.map((d) => d.label).join(' ').toLowerCase(),
      anyOf(contains('magic kingdom'), contains('wizarding'), contains('epcot')),
    );
    expect(
      result.plan.days.any(
        (d) => d.items.any((i) => i.category.toLowerCase() == 'dining'),
      ),
      isTrue,
    );
    expect(
      result.flow.blocks.map((b) => b.place.id),
      isNotEmpty,
    );
  });

  test('applyAfterChat uses onboarding dates when message omits day count', () async {
    const profile = TripProfile(
      cityId: 'orlando',
      destination: 'Orlando',
      startDate: '2026-03-14',
      endDate: '2026-03-17',
    );

    final result = await ConciergeItinerarySync.applyAfterChat(
      userMessage: 'Create our Disney and Universal trip',
      profile: profile,
    );

    expect(result, isNotNull);
    expect(result!.plan.days.length, 4);
  });

  test('DayFlowPlanner produces blocks for enriched romantic profile', () {
    final profile = TripFeelInterpreter.enrichFromText(
      const TripProfile(foodieInterest: 75, poolsideInterest: 60),
      'romantic sunset dinner',
    );
    final pool =
        PlacesRepository.instance.placesWithinRadius(DiscoverRadius.miles50);
    final flow = DayFlowPlanner.plan(profile: profile, pool: pool);
    expect(flow.blocks, isNotEmpty);
  });
}
