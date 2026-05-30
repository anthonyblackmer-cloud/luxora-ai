import 'package:flutter_test/flutter_test.dart';
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
    expect(result.plan.days.first.items.length, result.flow.blocks.length);
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
      result.flow.blocks.map((b) => b.place.id),
      isNotEmpty,
    );
    expect(
      result.flow.blocks.any((b) => b.place.id.contains('magic-kingdom')) ||
          result.flow.blocks.any((b) => b.place.id.contains('universal')) ||
          result.flow.blocks.any((b) => b.place.id.contains('islands')),
      isTrue,
    );
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
