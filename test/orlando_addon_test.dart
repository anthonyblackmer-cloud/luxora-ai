import 'package:luxora_ai/data/orlando/disney_world_content.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/data/orlando/universal_orlando_content.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/orlando_addon_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await CityPackEntitlementStore.instance.clearAll();
    await PlacesRepository.instance.initialize();
  });

  test('theme park places map to single theme-parks addon', () {
    expect(
      OrlandoAddonCatalog.addonForPlaceId('place-magic-kingdom'),
      OrlandoAddonCatalog.themeParks,
    );
    expect(
      OrlandoAddonCatalog.addonForPlaceId('place-universal-studios'),
      OrlandoAddonCatalog.themeParks,
    );
    expect(OrlandoAddonCatalog.addonForPlaceId('place-icon-park'), isNull);
  });

  test('theme parks require Orlando city unlock', () async {
    final mk = PlacesRepository.instance.byId('place-magic-kingdom');
    expect(mk, isNotNull);
    expect(OrlandoAddonService.isPlaceAccessible(mk!), isFalse);

    await CityPackEntitlementStore.instance
        .unlockCity(OrlandoAddonCatalog.parentCityId);
    expect(OrlandoAddonService.isPlaceAccessible(mk), isTrue);
  });

  test('legacy disney-world unlock grants bundled theme parks', () async {
    await CityPackEntitlementStore.instance
        .unlockCity(OrlandoAddonCatalog.parentCityId);
    await CityPackEntitlementStore.instance
        .unlockAddon(OrlandoAddonCatalog.legacyDisneyWorld);

    expect(
      CityPackEntitlementStore.instance
          .isAddonUnlocked(OrlandoAddonCatalog.themeParks),
      isTrue,
    );

    final universal =
        PlacesRepository.instance.byId('place-universal-studios');
    expect(universal, isNotNull);
    expect(OrlandoAddonService.isPlaceAccessible(universal!), isTrue);
  });

  test('mood routes exist for both resorts under one pack', () {
    expect(DisneyWorldContent.moodRoutes, isNotEmpty);
    expect(UniversalOrlandoContent.moodRoutes, isNotEmpty);
    expect(DisneyWorldContent.addonId, OrlandoAddonCatalog.themeParks);
    expect(UniversalOrlandoContent.addonId, OrlandoAddonCatalog.themeParks);
  });
}
