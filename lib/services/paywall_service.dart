import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
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
    if (!needsUnlock(id)) {
      await CityPackSync.switchCity(id);
      return true;
    }

    return _pushPaywall(context, id);
  }

  /// Settings entry — show paywall when locked, otherwise open the Concierge tab.
  static Future<void> openConciergeEntry(BuildContext context) async {
    final id = CityPackRegistry.instance.active.cityId;
    if (needsUnlock(id)) {
      await _pushPaywall(context, id);
      return;
    }

    await CityPackSync.switchCity(id);
    if (context.mounted) {
      context.go('/concierge');
    }
  }

  static Future<bool> _pushPaywall(BuildContext context, String cityId) async {
    final result = await context.push<bool>('/paywall?city=$cityId');
    return result ?? false;
  }

  /// Simulated purchase — wire StoreKit / Play Billing here later.
  static Future<void> completeUnlock(String cityId) async {
    await CityPackEntitlementStore.instance.unlockCity(cityId);
    await CityPackSync.switchCity(cityId);
  }

  /// Maps a catalog city id onto trip profile destination fields.
  static TripProfile profileForCity(TripProfile profile, String cityId) {
    if (!PaywallCatalog.isSupported(cityId)) return profile;
    final offer = PaywallCatalog.offerFor(cityId);
    return profile.copyWith(
      cityId: cityId,
      destination: offer.cityName,
      region: offer.regionLabel,
    );
  }
}
