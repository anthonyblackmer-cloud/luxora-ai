import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/concierge_context_builder.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await CityPackRegistry.instance.load();
    await DiscoverRadiusController.instance.load();
    await PlacesRepository.instance.initialize();
  });

  test('builds context with city and place hints', () {
    const profile = TripProfile(
      cityId: 'orlando',
      destination: 'Orlando',
      tripFeel: 'slow romantic escape',
      budgetUsd: 4000,
      adults: 2,
      kids: 1,
    );

    final ctx = ConciergeContextBuilder.build(
      profile: profile,
      stylePrefs: const ['Less crowded'],
      localeCode: 'en',
    );

    expect(ctx.cityId, 'orlando');
    expect(ctx.cityName, 'Orlando');
    expect(ctx.tripFeel, contains('romantic'));
    expect(ctx.stylePrefs, contains('Less crowded'));
    expect(ctx.places, isNotEmpty);
    expect(ctx.places.first.title, isNotEmpty);
  });
}
