import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// Entitlement checks for the Orlando theme-park add-on.
abstract final class OrlandoAddonService {
  static bool get isOrlandoActive =>
      CityPackRegistry.instance.active.cityId == OrlandoAddonCatalog.parentCityId;

  static bool needsThemeParksUnlock() =>
      !CityPackEntitlementStore.instance
          .isAddonUnlocked(OrlandoAddonCatalog.themeParks);

  static bool canAccessThemeParks() {
    if (!CityPackEntitlementStore.instance
        .isUnlocked(OrlandoAddonCatalog.parentCityId)) {
      return false;
    }
    return CityPackEntitlementStore.instance
        .isAddonUnlocked(OrlandoAddonCatalog.themeParks);
  }

  static bool isPlaceAccessible(LuxPlace place) {
    if (place.cityPackId != null &&
        place.cityPackId != OrlandoAddonCatalog.parentCityId) {
      return true;
    }
    if (OrlandoAddonCatalog.addonForPlaceId(place.id) == null) return true;
    return canAccessThemeParks();
  }

  static bool isDealAccessible(TicketDeal deal) {
    if (!isOrlandoActive) return true;
    if (OrlandoAddonCatalog.addonForDealId(deal.id) == null) return true;
    return canAccessThemeParks();
  }

  static bool isFeedItemAccessible(String feedItemId) {
    if (!isOrlandoActive) return true;
    if (OrlandoAddonCatalog.addonForFeedItemId(feedItemId) == null) {
      return true;
    }
    return canAccessThemeParks();
  }

  static bool isHotelAccessible(LuxHotel hotel) {
    if (!isOrlandoActive) return true;
    if (OrlandoAddonCatalog.isThemeParkHotelTags(hotel.plannedAttractionTags)) {
      return canAccessThemeParks();
    }
    return true;
  }

  static bool isDistrictAccessible(String? districtId) {
    if (districtId == null || !isOrlandoActive) return true;
    if (!OrlandoAddonCatalog.themeParkDistrictIds.contains(districtId)) {
      return true;
    }
    return canAccessThemeParks();
  }
}
