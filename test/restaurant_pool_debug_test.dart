import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/stay_dining_catalog_service.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await CityPackRegistry.instance.load();
    PlacesRepository.instance.ensureLocalCatalogLoaded();
  });

  test('restaurant pool populated before deferred initialize', () {
    final pool = StayDiningCatalogService.allRestaurants();
    expect(pool, isNotEmpty);
  });

  test('restaurant pool at 25mi radius', () {
    for (final r in DiscoverRadius.values) {
      if (r.isUnlimited) continue;
      final pool = PlacesRepository.instance
          .placesWithinRadius(r)
          .where(
            (p) =>
                p.category == LuxPlaceCategory.dining ||
                p.category == LuxPlaceCategory.romantic,
          )
          .toList();
      expect(
        pool.length,
        greaterThan(3),
        reason: 'radius ${r.name} only has ${pool.length} dining',
      );
    }
  });

  test('each restaurant category returns picks', () {
    const profile = TripProfile();
    for (final cat in RestaurantBrowseCategory.values) {
      final picks = StayDiningCatalogService.restaurantsForCategory(
        category: cat,
        profile: profile,
      );
      expect(picks, isNotEmpty, reason: 'empty category: $cat');
    }
  });
}
