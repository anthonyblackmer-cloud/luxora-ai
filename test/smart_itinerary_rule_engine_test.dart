import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_multi_day_planner.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/smart_itinerary/smart_itinerary_rule_engine.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final mk = _place(
    id: 'place-magic-kingdom',
    title: 'Magic Kingdom',
    category: LuxPlaceCategory.family,
    lat: 28.4177,
    lng: -81.5812,
  );
  final hs = _place(
    id: 'place-hollywood-studios',
    title: 'Hollywood Studios',
    category: LuxPlaceCategory.family,
    lat: 28.3575,
    lng: -81.5582,
  );
  final springs = _place(
    id: 'place-disney-springs',
    title: 'Disney Springs',
    category: LuxPlaceCategory.dining,
    lat: 28.3712,
    lng: -81.5183,
  );
  final dining = _place(
    id: 'dining-luma-on-park',
    title: 'Luma on Park',
    category: LuxPlaceCategory.dining,
    lat: 28.5970,
    lng: -81.3510,
  );

  test('ExperienceDurationCatalog marks major theme parks as full-day', () {
    final profile = ExperienceDurationCatalog.profileFor(mk);
    expect(profile.isMajorThemePark, isTrue);
    expect(profile.idealDurationMinutes, greaterThanOrEqualTo(480));
  });

  test('trims multiple major theme parks to one by default', () {
    final flow = DayFlow(
      blocks: [
        DayBlock(
          phase: DayPhase.morning,
          place: mk,
          reason: DayBlockReason.middayIcon,
        ),
        DayBlock(
          phase: DayPhase.midday,
          place: hs,
          reason: DayBlockReason.middayAdventure,
        ),
        DayBlock(
          phase: DayPhase.evening,
          place: springs,
          reason: DayBlockReason.eveningDining,
        ),
      ],
      start: PlaceDistance.hubCenter,
      totalMiles: 0,
    );

    final raw = ConciergeMultiDayPlan(
      plan: TripPlan(id: 'test', title: 'Test', days: const []),
      activeFlow: flow,
      flowsByDay: [flow],
    );

    final result = SmartItineraryRuleEngine.validateAndRepair(
      raw: raw,
      profile: const TripProfile(pace: PacePreference.balanced),
      pool: [mk, hs, springs, dining],
      userMessage: 'Disney day',
      repo: PlacesRepository.instance,
      cityId: 'orlando',
    );

    final majors = result.plan.activeFlow.blocks
        .where((b) => ExperienceDurationCatalog.isMajorThemePark(b.place.id))
        .length;
    expect(majors, 1);
    expect(result.confidenceScore, lessThan(1.0));
    expect(result.validationNotes, isNotEmpty);
  });

  test('allows two majors when packed and park hopper requested', () {
    final ioa = _place(
      id: 'place-islands-of-adventure',
      title: 'Islands of Adventure',
      category: LuxPlaceCategory.adventure,
      lat: 28.4710,
      lng: -81.4705,
    );
    final usf = _place(
      id: 'place-universal-studios',
      title: 'Universal Studios Florida',
      category: LuxPlaceCategory.adventure,
      lat: 28.4794,
      lng: -81.4686,
    );

    final flow = DayFlow(
      blocks: [
        DayBlock(
          phase: DayPhase.morning,
          place: ioa,
          reason: DayBlockReason.middayAdventure,
        ),
        DayBlock(
          phase: DayPhase.afternoon,
          place: usf,
          reason: DayBlockReason.middayIcon,
        ),
      ],
      start: PlaceDistance.hubCenter,
      totalMiles: 0,
    );

    final result = SmartItineraryRuleEngine.validateAndRepair(
      raw: ConciergeMultiDayPlan(
        plan: TripPlan(id: 'test', title: 'Test', days: const []),
        activeFlow: flow,
        flowsByDay: [flow],
      ),
      profile: const TripProfile(pace: PacePreference.packed),
      pool: [ioa, usf],
      userMessage: 'Universal park hopper day',
      repo: PlacesRepository.instance,
      cityId: 'orlando',
    );

    final majors = result.plan.activeFlow.blocks
        .where((b) => ExperienceDurationCatalog.isMajorThemePark(b.place.id))
        .length;
    expect(majors, 2);
  });

  test('refills sparse explore day to minimum stops', () {
    final nature = _place(
      id: 'place-winter-park',
      title: 'Park Avenue stroll',
      category: LuxPlaceCategory.nature,
      lat: 28.5990,
      lng: -81.3390,
    );
    final springs = _place(
      id: 'place-wekiwa-springs',
      title: 'Wekiwa Springs',
      category: LuxPlaceCategory.springs,
      lat: 28.7110,
      lng: -81.3650,
    );
    final seaworld = _place(
      id: 'place-seaworld-orlando',
      title: 'SeaWorld Orlando',
      category: LuxPlaceCategory.family,
      lat: 28.4110,
      lng: -81.4610,
    );

    final sparse = DayFlow(
      blocks: [
        DayBlock(
          phase: DayPhase.evening,
          place: dining,
          reason: DayBlockReason.eveningDining,
        ),
      ],
      start: PlaceDistance.hubCenter,
      totalMiles: 0,
    );

    final result = SmartItineraryRuleEngine.validateAndRepair(
      raw: ConciergeMultiDayPlan(
        plan: TripPlan(id: 'test', title: 'Test', days: const []),
        activeFlow: sparse,
        flowsByDay: [sparse],
      ),
      profile: const TripProfile(
        pace: PacePreference.balanced,
        adventureInterest: 70,
      ),
      pool: [dining, nature, springs, seaworld, mk],
      userMessage: 'Orlando explore day',
      repo: PlacesRepository.instance,
      cityId: 'orlando',
    );

    expect(result.plan.activeFlow.blocks.length, greaterThanOrEqualTo(3));
    expect(
      result.plan.activeFlow.blocks
          .where((b) => b.place.category == LuxPlaceCategory.dining)
          .length,
      1,
    );
  });
}

LuxPlace _place({
  required String id,
  required String title,
  required LuxPlaceCategory category,
  required double lat,
  required double lng,
}) {
  return LuxPlace(
    id: id,
    slug: id,
    title: title,
    category: category,
    unsplashPhotoId: 'test',
    location: 'Orlando, FL',
    latitude: lat,
    longitude: lng,
    description: 'Test place',
  );
}
