import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/util/trip_occasion_catalog.dart';

void main() {
  setUp(() async {
    await CityPackEntitlementStore.instance.clearAll();
  });

  test('theme park occasions hidden until pack unlock on Orlando trips', () {
    const profile = TripProfile(cityId: OrlandoAddonCatalog.parentCityId);

    expect(
      TripOccasionCatalog.visibleOccasions(profile),
      TripOccasionCatalog.coreOccasions,
    );

    expect(
      TripOccasionCatalog.normalizeOccasion(
        TripOccasion.disneyAdventure,
        profile: profile,
      ),
      TripOccasion.general,
    );
  });

  test('theme park occasions appear after Orlando city unlock', () async {
    await CityPackEntitlementStore.instance
        .unlockCity(OrlandoAddonCatalog.parentCityId);

    const profile = TripProfile(cityId: OrlandoAddonCatalog.parentCityId);
    final visible = TripOccasionCatalog.visibleOccasions(profile);

    expect(visible, contains(TripOccasion.disneyAdventure));
    expect(visible, contains(TripOccasion.universalAdventure));
    expect(visible.length, TripOccasionCatalog.coreOccasions.length + 2);
  });

  test('non-Orlando trips never show theme park occasions', () async {
    await CityPackEntitlementStore.instance
        .unlockAddon(OrlandoAddonCatalog.themeParks);

    const profile = TripProfile(cityId: 'miami');
    expect(
      TripOccasionCatalog.visibleOccasions(profile),
      TripOccasionCatalog.coreOccasions,
    );
  });
}
