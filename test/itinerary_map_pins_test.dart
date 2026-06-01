import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/trip_plans.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/util/itinerary_map_pins.dart';
import 'package:latlong2/latlong.dart';

void main() {
  setUpAll(() async {
    await PlacesRepository.instance.initialize();
  });

  test('resolveDay uses trip item placeIds from sample plan', () {
    final day = sampleGoldenEscapePlan.days.first;
    final data = ItineraryMapPins.resolveDay(day: day);
    expect(data, isNotNull);
    expect(data!.routePlaceIds, [
      'place-woodhouse-winter-park',
      'place-wekiwa-springs',
      'dining-luma-on-park',
    ]);
  });

  test('resolveFullPlan collects unique stops across all days', () {
    final data = ItineraryMapPins.resolveFullPlan(sampleGoldenEscapePlan);
    expect(data, isNotNull);
    expect(data!.places.length, greaterThan(3));
    expect(
      data.places.map((p) => p.id),
      contains('place-magic-kingdom'),
    );
  });

  test('resolveDay prefers non-empty day flow over trip items', () {
    final day = sampleGoldenEscapePlan.days.first;
    final mk = PlacesRepository.instance.byId('place-magic-kingdom');
    expect(mk, isNotNull);
    final flow = DayFlow(
      blocks: [
        DayBlock(
          phase: DayPhase.midday,
          place: mk!,
          reason: DayBlockReason.middayIcon,
        ),
      ],
      start: LatLng(mk.latitude, mk.longitude),
      totalMiles: 0,
    );

    final data = ItineraryMapPins.resolveDay(day: day, dayFlow: flow);
    expect(data!.routePlaceIds, ['place-magic-kingdom']);
  });
}
