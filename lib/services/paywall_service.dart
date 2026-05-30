import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/paywall_personalization.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';

/// Entry points for showing and completing city-pack unlock flows.
abstract final class PaywallService {
  static PaywallCityOffer offerForCity(String? cityId) {
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    return PaywallCatalog.offerFor(id);
  }

  static bool needsUnlock(String cityId) =>
      !CityPackEntitlementStore.instance.isUnlocked(cityId);

  static PaywallPersona personaForCurrentTrip() =>
      PaywallPersonalization.personaFor(TripProfileStore.instance.profile.value);

  /// Full-screen cinematic paywall. Returns `true` when the city was unlocked.
  static Future<bool> showPaywall(
    BuildContext context, {
    String? cityId,
  }) async {
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    if (!needsUnlock(id)) return true;

    final result = await context.push<bool>('/paywall?city=$id');
    return result ?? false;
  }

  /// Simulated purchase — wire StoreKit / Play Billing here later.
  static Future<void> completeUnlock(String cityId) async {
    await CityPackEntitlementStore.instance.unlockCity(cityId);
    await CityPackRegistry.instance.setActiveCity(cityId);
  }
}
