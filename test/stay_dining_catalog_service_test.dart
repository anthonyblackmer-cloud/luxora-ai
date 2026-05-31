import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/l10n/app_localizations_en.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/stay_dining_catalog_service.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await PlacesRepository.instance.initialize();
    await CityPackRegistry.instance.load();
  });

  test('disney hotel category returns multiple options', () {
    const profile = TripProfile(budgetUsd: 8000);
    final hotels = StayDiningCatalogService.hotelsForCategory(
      category: HotelBrowseCategory.disneyArea,
      profile: profile,
      l: AppLocalizationsEn(),
    );
    expect(hotels.length, greaterThanOrEqualTo(4));
    expect(
      hotels.any((h) => h.name.toLowerCase().contains('disney') ||
          h.neighborhood.toLowerCase().contains('disney')),
      isTrue,
    );
  });

  test('theme park dining category returns multiple restaurants', () {
    const profile = TripProfile(budgetUsd: 6000);
    final places = StayDiningCatalogService.restaurantsForCategory(
      category: RestaurantBrowseCategory.themeParkDining,
      profile: profile,
    );
    expect(places.length, greaterThanOrEqualTo(3));
  });
}
