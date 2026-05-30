import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';

/// Keeps [CityPackRegistry], [TripProfile], and unlocked entitlements aligned.
abstract final class CityPackSync {
  /// After profile + entitlements load — prefer the profile city when unlocked.
  static Future<void> bootstrapAfterLoad() async {
    final profile = TripProfileStore.instance.profile.value;
    if (profile == null) return;
    if (!CityPackEntitlementStore.instance.isUnlocked(profile.cityId)) return;
    if (CityPackRegistry.instance.active.cityId == profile.cityId) return;
    await CityPackRegistry.instance.setActiveCity(profile.cityId);
  }

  /// Switch the live app experience to [cityId] and mirror it on the profile.
  static Future<void> switchCity(String cityId) async {
    if (!PaywallCatalog.isSupported(cityId)) return;

    if (cityId != OrlandoAddonCatalog.parentCityId) {
      PaywallService.resetOrlandoAddonPromptSession();
    }

    await CityPackRegistry.instance.setActiveCity(cityId);

    final current = TripProfileStore.instance.profile.value;
    if (current != null && current.cityId != cityId) {
      await TripProfileStore.instance.save(
        PaywallService.profileForCity(current, cityId),
      );
    } else if (current == null) {
      await TripProfileStore.instance.save(
        PaywallService.profileForCity(const TripProfile(), cityId),
      );
    }
  }
}
