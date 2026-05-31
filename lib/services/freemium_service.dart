import 'package:flutter/material.dart';
import 'package:luxora_ai/data/local_secrets_registry.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/freemium_limits.dart';
import 'package:luxora_ai/services/paywall_bypass.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/widgets/destination_search_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Freemium tier — discovery free, execution unlocked via city pack purchase.
abstract final class FreemiumService {
  static const _conciergeCountKey = 'luxora_freemium_concierge_user_msgs';

  static bool hasFullAccess([String? cityId]) {
    if (PaywallBypass.enabled) return true;
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    return !PaywallService.needsUnlock(id);
  }

  static bool canAccessDay(int dayIndex, [String? cityId]) =>
      hasFullAccess(cityId) || dayIndex <= FreemiumLimits.freeDayIndex;

  static int previewLimit(FreemiumUnlockTrigger trigger) => switch (trigger) {
        FreemiumUnlockTrigger.hotelsPreview => FreemiumLimits.previewHotels,
        FreemiumUnlockTrigger.restaurantsPreview =>
          FreemiumLimits.previewRestaurants,
        FreemiumUnlockTrigger.attractionsPreview =>
          FreemiumLimits.previewAttractions,
        FreemiumUnlockTrigger.hiddenGemsPreview =>
          FreemiumLimits.previewHiddenGems,
        FreemiumUnlockTrigger.localSecretsPreview =>
          FreemiumLimits.previewLocalSecrets,
        FreemiumUnlockTrigger.experiencesPreview =>
          FreemiumLimits.previewExperiences,
        _ => FreemiumLimits.previewHotels,
      };

  static List<T> previewSlice<T>(List<T> items, FreemiumUnlockTrigger trigger) {
    if (hasFullAccess()) return items;
    return items.take(previewLimit(trigger)).toList();
  }

  static int lockedCount(int total, FreemiumUnlockTrigger trigger) {
    if (hasFullAccess()) return 0;
    return (total - previewLimit(trigger)).clamp(0, total);
  }

  static Future<int> conciergeMessagesUsed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_conciergeCountKey) ?? 0;
  }

  static Future<int> conciergeMessagesRemaining() async {
    if (hasFullAccess()) return FreemiumLimits.freeConciergeMessages;
    final used = await conciergeMessagesUsed();
    return (FreemiumLimits.freeConciergeMessages - used)
        .clamp(0, FreemiumLimits.freeConciergeMessages);
  }

  static Future<bool> canSendConciergeMessage() async {
    if (hasFullAccess()) return true;
    return (await conciergeMessagesRemaining()) > 0;
  }

  static Future<void> recordConciergeUserMessage() async {
    if (hasFullAccess()) return;
    final prefs = await SharedPreferences.getInstance();
    final used = prefs.getInt(_conciergeCountKey) ?? 0;
    await prefs.setInt(_conciergeCountKey, used + 1);
  }

  static String contextualHeadline(
    AppLocalizations l,
    FreemiumUnlockTrigger trigger,
    String cityName,
  ) =>
      switch (trigger) {
        FreemiumUnlockTrigger.dayTwoPlus =>
          l.freemiumHeadlineDayTwoPlus(cityName),
        FreemiumUnlockTrigger.conciergeLimit =>
          l.freemiumHeadlineConciergeLimit,
        FreemiumUnlockTrigger.hotelsPreview =>
          l.freemiumHeadlineHotels(cityName),
        FreemiumUnlockTrigger.restaurantsPreview =>
          l.freemiumHeadlineRestaurants(cityName),
        FreemiumUnlockTrigger.hiddenGemsPreview => l.freemiumHeadlineGems,
        FreemiumUnlockTrigger.localSecretsPreview =>
          l.freemiumHeadlineSecrets,
        FreemiumUnlockTrigger.experiencesPreview =>
          l.freemiumHeadlineExperiences(cityName),
        FreemiumUnlockTrigger.attractionsPreview =>
          l.freemiumHeadlineAttractions,
        FreemiumUnlockTrigger.hotelMatchmaker =>
          l.freemiumHeadlineHotelMatchmaker,
        FreemiumUnlockTrigger.fullItinerary => l.freemiumHeadlineFullItinerary,
      };

  static String lockedRowLabel(AppLocalizations l, int dayNumber) =>
      switch (dayNumber) {
        3 => l.freemiumLockedDayGems,
        4 => l.freemiumLockedDayWeather,
        5 => l.freemiumLockedDayDeparture,
        _ => l.freemiumLockedDayConcierge(dayNumber),
      };

  static List<LuxPlace> previewLocalSecretPlaces() {
    final places = PlacesRepository.instance.activePlaces
        .where((p) => LocalSecretsRegistry.l10nKeyFor(p) != null)
        .toList()
      ..sort((a, b) => a.title.compareTo(b.title));
    return places.take(FreemiumLimits.previewLocalSecrets).toList();
  }

  static bool canViewLocalSecret(LuxPlace place) {
    if (hasFullAccess()) return true;
    return previewLocalSecretPlaces().any((p) => p.id == place.id);
  }

  static Future<void> openSearchOrPaywall(
    BuildContext context, {
    PlaceSearchFilter initialFilter = PlaceSearchFilter.all,
  }) async {
    if (hasFullAccess()) {
      await showDestinationSearchSheet(context, initialFilter: initialFilter);
      return;
    }
    final trigger = switch (initialFilter) {
      PlaceSearchFilter.hotels => FreemiumUnlockTrigger.hotelsPreview,
      PlaceSearchFilter.restaurants => FreemiumUnlockTrigger.restaurantsPreview,
      _ => FreemiumUnlockTrigger.attractionsPreview,
    };
    await promptUnlock(context, trigger: trigger);
  }

  static Future<bool> promptUnlock(
    BuildContext context, {
    FreemiumUnlockTrigger? trigger,
    String? cityId,
  }) async {
    final id = cityId ?? CityPackRegistry.instance.active.cityId;
    if (hasFullAccess(id)) return true;
    final l = AppLocalizations.of(context);
    final cityName = PaywallCatalog.offerFor(id).cityName;
    final headline = trigger == null
        ? l.freemiumUnlockConcierge(cityName)
        : contextualHeadline(l, trigger, cityName);
    return PaywallService.showPaywall(
      context,
      cityId: id,
      contextHeadline: headline,
    );
  }
}
