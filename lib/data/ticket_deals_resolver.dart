import 'package:luxora_ai/data/florida_keys/florida_keys_ticket_deals.dart';
import 'package:luxora_ai/data/miami/miami_ticket_deals.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_ticket_deals.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_ticket_deals.dart';
import 'package:luxora_ai/data/naples/naples_ticket_deals.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_ticket_deals.dart';
import 'package:luxora_ai/data/vegas/vegas_ticket_deals.dart';
import 'package:luxora_ai/data/nyc/nyc_ticket_deals.dart';
import 'package:luxora_ai/data/ticket_deals_catalog.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/orlando_addon_service.dart';
import 'package:luxora_ai/services/ticket_deals_repository.dart';

/// Unified ticket deal lookup â€” city pack filters which catalog applies.
abstract final class TicketDealsResolver {
  static List<TicketDeal> catalogForCity(String cityId) {
    final fromRepo = TicketDealsRepository.instance.dealsForCity(cityId);
    if (fromRepo.isNotEmpty) return fromRepo;
    return switch (cityId) {
      'miami' => miamiTicketDealsCatalog,
      'florida-keys' => floridaKeysTicketDealsCatalog,
      'st-augustine' => stAugustineTicketDealsCatalog,
      'naples' => naplesTicketDealsCatalog,
      'destin-30a' => destin30aTicketDealsCatalog,
      'nyc' => nycTicketDealsCatalog,
      'vegas' => vegasTicketDealsCatalog,
      'tampa-bay' => tampaBayTicketDealsCatalog,
      _ => ticketDealsCatalog,
    };
  }

  static List<TicketDeal> catalogForActive() =>
      catalogForCity(CityPackRegistry.instance.active.cityId);

  static List<TicketDeal> allDealsForActive() {
    final ids = CityPackRegistry.instance.ticketDealIds.toSet();
    return catalogForActive()
        .where((d) => ids.contains(d.id))
        .where(OrlandoAddonService.isDealAccessible)
        .toList();
  }

  static TicketDeal? byId(String id) {
    for (final d in catalogForActive()) {
      if (d.id == id) return d;
    }
    return null;
  }

  static TicketDeal? byIdAnyCity(String id) {
    for (final cityId in ['orlando', 'miami', 'florida-keys', 'tampa-bay', 'st-augustine', 'naples', 'destin-30a', 'nyc', 'vegas']) {
      for (final d in TicketDealsRepository.instance.dealsForCity(cityId)) {
        if (d.id == id) return d;
      }
    }
    for (final d in ticketDealsCatalog) {
      if (d.id == id) return d;
    }
    for (final d in miamiTicketDealsCatalog) {
      if (d.id == id) return d;
    }
    for (final d in floridaKeysTicketDealsCatalog) {
      if (d.id == id) return d;
    }
    for (final d in tampaBayTicketDealsCatalog) {
      if (d.id == id) return d;
    }
    return null;
  }
}

