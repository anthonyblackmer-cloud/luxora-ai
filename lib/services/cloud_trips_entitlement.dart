import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/supabase_bootstrap.dart';
import 'package:luxora_ai/services/supabase_config.dart';

/// Cloud trip backup is a premium benefit — unlocked with any city pack purchase.
abstract final class CloudTripsEntitlement {
  static bool get hasPremium =>
      CityPackEntitlementStore.instance.unlockedCityIds.isNotEmpty;

  static bool get isBackendReady =>
      SupabaseConfig.isConfigured && SupabaseBootstrap.isInitialized;

  static bool get canUseCloud => isBackendReady && hasPremium;
}
