import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/day_flow_codec.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await PlacesRepository.instance.initialize();
  });

  test('DayFlowCodec round-trip preserves blocks', () {
    final pool =
        PlacesRepository.instance.placesWithinRadius(DiscoverRadius.miles50);
    final flow = DayFlowPlanner.plan(
      profile: const TripProfile(foodieInterest: 80, adventureInterest: 70),
      pool: pool,
    );
    expect(flow.isEmpty, isFalse);

    final json = DayFlowCodec.encode(flow);
    final decoded = DayFlowCodec.decode(json);

    expect(decoded, isNotNull);
    expect(decoded!.blocks.length, flow.blocks.length);
    expect(
      decoded.blocks.map((b) => b.place.id).toList(),
      flow.blocks.map((b) => b.place.id).toList(),
    );
    expect(decoded.totalMiles, flow.totalMiles);
  });
}
