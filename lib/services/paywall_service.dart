import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/models/paywall/paywall_addon_offer.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/services/paywall_personalization.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/orlando_addon_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/util/trip_occasion_catalog.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Entry points for showing and completing city-pack unlock flows.
abstract final class PaywallService {
  static bool _orlandoAddonPromptVisible = false;
  static bool _orlandoAddonPromptShown = false;

  /// Clears so re-selecting Orlando can show the add-on prompt again.
  static void resetOrlandoAddonPromptSession() {
    _orlandoAddonPromptShown = false;
  }

  static PaywallCityOffer offerForCity(String? cityId) {
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    return PaywallCatalog.offerFor(id);
  }

  static bool needsUnlock(String cityId) =>
      !CityPackEntitlementStore.instance.isUnlocked(cityId);

  static PaywallAddonOffer addonOfferFor(String addonId) =>
      OrlandoAddonCatalog.offerFor(addonId);

  static bool needsAddonUnlock(String addonId) =>
      !CityPackEntitlementStore.instance.isAddonUnlocked(addonId);

  static bool isOrlandoAddon(String? addonId) =>
      OrlandoAddonCatalog.isThemeParksAddon(addonId);

  static PaywallPersona personaForCurrentTrip() =>
      PaywallPersonalization.personaFor(TripProfileStore.instance.profile.value);

  /// Full-screen cinematic paywall. Returns `true` when the city was unlocked.
  static Future<bool> showPaywall(
    BuildContext context, {
    String? cityId,
    String? addonId,
  }) async {
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    if (isOrlandoAddon(addonId)) {
      if (!needsAddonUnlock(addonId!)) return true;
      return _pushPaywall(context, id, addonId: addonId);
    }
    if (!needsUnlock(id)) {
      await CityPackSync.switchCity(id);
      return true;
    }

    return _pushPaywall(context, id);
  }

  /// Theme-park add-on paywall — Orlando base unlock sold separately.
  static Future<bool> showAddonPaywall(
    BuildContext context, {
    required String addonId,
  }) =>
      showPaywall(
        context,
        cityId: OrlandoAddonCatalog.parentCityId,
        addonId: addonId,
      );

  /// After Orlando is selected and unlocked, ask whether to add Disney & Universal.
  static Future<void> promptOrlandoThemeParksIfNeeded(BuildContext context) async {
    if (_orlandoAddonPromptVisible || _orlandoAddonPromptShown) return;
    if (!CityPackEntitlementStore.instance
        .isUnlocked(OrlandoAddonCatalog.parentCityId)) {
      return;
    }
    if (!OrlandoAddonService.needsThemeParksUnlock()) return;
    if (!context.mounted) return;

    _orlandoAddonPromptVisible = true;
    try {
      final l = context.l10n;
      final offer = OrlandoAddonCatalog.offer;
      final unlock = await showDialog<bool>(
        context: context,
        builder: (ctx) {
          final tokens = luxThemeTokensOf(ctx);
          return AlertDialog(
            backgroundColor: tokens.bgSecondary,
            title: Text(
              l.orlandoThemeParksPromptTitle,
              style: TextStyle(color: tokens.textPrimary),
            ),
            content: Text(
              l.orlandoThemeParksPromptBody,
              style: TextStyle(
                color: tokens.textMuted,
                height: 1.45,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: Text(l.orlandoThemeParksPromptNotNow),
              ),
              FilledButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: tokens.accent,
                  foregroundColor: tokens.bg,
                ),
                child: Text(
                  l.orlandoThemeParksPromptUnlock(offer.formattedPrice),
                ),
              ),
            ],
          );
        },
      );
      if (unlock == true && context.mounted) {
        await showAddonPaywall(
          context,
          addonId: OrlandoAddonCatalog.themeParks,
        );
      }
    } finally {
      _orlandoAddonPromptVisible = false;
      _orlandoAddonPromptShown = true;
    }
  }

  /// Settings entry — show paywall when locked, otherwise open the Concierge tab.
  static Future<void> openConciergeEntry(BuildContext context) =>
      talkToLuxora(context);

  /// Primary CTA for "Talk to Luxora" — unlock if needed, then Concierge tab.
  static Future<void> talkToLuxora(
    BuildContext context, {
    String? cityId,
    String? fallbackRoute,
  }) async {
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    if (needsUnlock(id)) {
      final ok = await showPaywall(context, cityId: id);
      if (!ok || !context.mounted) {
        if (fallbackRoute != null && context.mounted) {
          context.go(fallbackRoute);
        }
        return;
      }
    } else {
      await CityPackSync.switchCity(id);
    }

    if (!context.mounted) return;
    if (id == OrlandoAddonCatalog.parentCityId) {
      await promptOrlandoThemeParksIfNeeded(context);
    }
    if (context.mounted) {
      context.go('/concierge');
    }
  }

  static Future<bool> _pushPaywall(
    BuildContext context,
    String cityId, {
    String? addonId,
  }) async {
    final query = addonId == null
        ? 'city=$cityId'
        : 'city=$cityId&addon=$addonId';
    final result = await context.push<bool>('/paywall?$query');
    return result ?? false;
  }

  /// Simulated purchase — wire StoreKit / Play Billing here later.
  static Future<void> completeUnlock(String cityId) async {
    await CityPackEntitlementStore.instance.unlockCity(cityId);
    await CityPackSync.switchCity(cityId);
  }

  static Future<void> completeAddonUnlock(String addonId) async {
    await CityPackEntitlementStore.instance
        .unlockAddon(addonId);
    await CityPackSync.switchCity(OrlandoAddonCatalog.parentCityId);
    await TripOccasionCatalog.applyThemeParksUnlockToActiveProfile();
    _orlandoAddonPromptShown = true;
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
