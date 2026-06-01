import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/iap_product_catalog.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/models/paywall/paywall_addon_offer.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/services/freemium_service.dart';
import 'package:luxora_ai/services/iap_purchase_service.dart';
import 'package:luxora_ai/services/paywall_personalization.dart';
import 'package:luxora_ai/router/app_router.dart';
import 'package:luxora_ai/screens/paywall/luxora_paywall_screen.dart';
import 'package:luxora_ai/services/paywall_bypass.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/util/trip_occasion_catalog.dart';

/// Entry points for showing and completing city-pack unlock flows.
abstract final class PaywallService {
  /// Legacy no-op — theme parks no longer use a separate prompt session.
  static void resetOrlandoAddonPromptSession() {}

  static PaywallCityOffer offerForCity(String? cityId) {
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    return PaywallCatalog.offerFor(id);
  }

  static bool needsUnlock(String cityId) =>
      !CityPackEntitlementStore.instance.hasStoredCityUnlock(cityId);

  /// Whether this city has a live App Store / Play product (launch packs only).
  static bool hasStoreListing(String cityId) =>
      IapProductCatalog.hasStoreProductForCity(cityId);

  static String? storePriceForCity(String cityId) =>
      IapPurchaseService.instance.localizedPriceForCity(cityId);

  static PaywallAddonOffer addonOfferFor(String addonId) =>
      OrlandoAddonCatalog.offerFor(addonId);

  static bool needsAddonUnlock(String addonId) {
    if (OrlandoAddonCatalog.isThemeParksAddon(addonId)) return false;
    return !CityPackEntitlementStore.instance.hasStoredAddonUnlock(addonId);
  }

  static bool isOrlandoAddon(String? addonId) =>
      OrlandoAddonCatalog.isThemeParksAddon(addonId);

  static PaywallPersona personaForCurrentTrip() =>
      PaywallPersonalization.personaFor(TripProfileStore.instance.profile.value);

  /// Full-screen paywall. Returns `true` when the city was unlocked.
  static Future<bool> showPaywall(
    BuildContext context, {
    String? cityId,
    String? addonId,
    String? contextHeadline,
  }) async {
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    final preview = PaywallBypass.forcePreviewMode;

    if (isOrlandoAddon(addonId)) {
      return _pushPaywall(
        context,
        OrlandoAddonCatalog.parentCityId,
        contextHeadline: contextHeadline,
      );
    }
    if (!preview && !needsUnlock(id)) {
      await CityPackSync.switchCity(id);
      return true;
    }

    return _pushPaywall(context, id, contextHeadline: contextHeadline);
  }

  /// Legacy entry — theme parks are bundled into the Orlando city pack.
  static Future<bool> showAddonPaywall(
    BuildContext context, {
    required String addonId,
  }) =>
      showPaywall(
        context,
        cityId: OrlandoAddonCatalog.parentCityId,
      );

  /// No-op — Disney & Universal are included with Orlando.
  static Future<void> promptOrlandoThemeParksIfNeeded(
    BuildContext context, {
    bool force = false,
  }) async {}

  /// Ensures Orlando city unlock is offered before occasion selection.
  static Future<bool> prepareOrlandoBeforeOccasion(BuildContext context) async {
    await CityPackEntitlementStore.instance.load();

    if (needsUnlock(OrlandoAddonCatalog.parentCityId)) {
      if (!context.mounted) return false;
      await showPaywall(
        context,
        cityId: OrlandoAddonCatalog.parentCityId,
      );
    } else {
      await CityPackSync.switchCity(OrlandoAddonCatalog.parentCityId);
    }

    return context.mounted;
  }

  /// Settings entry — show paywall when locked, otherwise open the Concierge tab.
  static Future<void> openConciergeEntry(BuildContext context) =>
      talkToLuxora(context);

  /// Debug only — opens the full paywall screen even if the city is unlocked.
  static Future<void> openPaywallPreview(
    BuildContext context, {
    String? cityId,
    String? addonId,
    String? contextHeadline,
  }) async {
    assert(kDebugMode);
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    await _pushPaywall(
      context,
      id,
      addonId: addonId,
      contextHeadline: contextHeadline,
    );
  }

  /// Debug only — clears stored city/add-on unlocks so freemium locks appear.
  static Future<void> resetEntitlementsForPreview() async {
    assert(kDebugMode);
    await CityPackEntitlementStore.instance.resetForDebugPreview();
    await FreemiumService.resetPreviewState();
  }

  /// Primary CTA for "Talk to Luxora" — Concierge tab (freemium: 3 free messages).
  static Future<void> talkToLuxora(
    BuildContext context, {
    String? cityId,
    String? fallbackRoute,
  }) async {
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    await CityPackSync.switchCity(id);

    if (context.mounted) {
      context.go('/concierge');
    }
  }

  static Future<bool> _pushPaywall(
    BuildContext context,
    String cityId, {
    String? addonId,
    String? contextHeadline,
  }) async {
    final navigator = luxoraRootNavigatorKey.currentState;
    if (navigator == null) {
      if (kDebugMode) {
        debugPrint('PaywallService: root navigator unavailable');
      }
      return false;
    }

    final result = await navigator.push<bool>(
      PageRouteBuilder<bool>(
        fullscreenDialog: true,
        opaque: true,
        barrierDismissible: false,
        pageBuilder: (ctx, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: LuxoraPaywallScreen(
              cityId: cityId,
              addonId: addonId,
              contextHeadline: contextHeadline,
            ),
          );
        },
      ),
    );
    return result ?? false;
  }

  /// StoreKit / Play Billing — returns when the transaction completes or fails.
  static Future<IapPurchaseOutcome> purchaseCityPack(String cityId) async {
    final outcome = await IapPurchaseService.instance.purchaseCity(cityId);
    if (outcome == IapPurchaseOutcome.success ||
        outcome == IapPurchaseOutcome.alreadyOwned) {
      await CityPackSync.switchCity(cityId);
    }
    return outcome;
  }

  static Future<IapPurchaseOutcome> purchaseAddon(String addonId) async {
    final outcome = await IapPurchaseService.instance.purchaseAddon(addonId);
    if (outcome == IapPurchaseOutcome.success ||
        outcome == IapPurchaseOutcome.alreadyOwned) {
      await CityPackSync.switchCity(OrlandoAddonCatalog.parentCityId);
    }
    return outcome;
  }

  static Future<IapRestoreOutcome> restorePurchases() =>
      IapPurchaseService.instance.restorePurchases();

  /// Called after a verified store purchase — not exposed as a paywall shortcut.
  static Future<void> grantCityEntitlement(String cityId) async {
    await CityPackEntitlementStore.instance.unlockCity(cityId);
    if (cityId == OrlandoAddonCatalog.parentCityId) {
      await TripOccasionCatalog.applyThemeParksUnlockToActiveProfile();
    }
  }

  static Future<void> grantAddonEntitlement(String addonId) async {
    await CityPackEntitlementStore.instance.unlockAddon(addonId);
    await TripOccasionCatalog.applyThemeParksUnlockToActiveProfile();
  }

  @Deprecated('Use purchaseCityPack — simulated unlock removed from production.')
  static Future<void> completeUnlock(String cityId) async {
    assert(IapPurchaseService.allowSimulatedPurchases);
    await grantCityEntitlement(cityId);
    await CityPackSync.switchCity(cityId);
  }

  @Deprecated('Use purchaseAddon — simulated unlock removed from production.')
  static Future<void> completeAddonUnlock(String addonId) async {
    assert(IapPurchaseService.allowSimulatedPurchases);
    await grantAddonEntitlement(addonId);
    await CityPackSync.switchCity(OrlandoAddonCatalog.parentCityId);
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
