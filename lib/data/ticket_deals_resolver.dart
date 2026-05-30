import 'package:luxora_ai/data/florida_keys/florida_keys_ticket_deals.dart';
import 'package:luxora_ai/data/miami/miami_ticket_deals.dart';
import 'package:luxora_ai/data/ticket_deals_catalog.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/orlando_addon_service.dart';
import 'package:luxora_ai/services/ticket_deals_repository.dart';

/// Unified ticket deal lookup — city pack filters which catalog applies.
abstract final class TicketDealsResolver {
  static List<TicketDeal> catalogForCity(String cityId) {
    final fromRepo = TicketDealsRepository.instance.dealsForCity(cityId);
    if (fromRepo.isNotEmpty) return fromRepo;
    return switch (cityId) {
      'miami' => miamiTicketDealsCatalog,
      'florida-keys' => floridaKeysTicketDealsCatalog,
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
    for (final cityId in ['orlando', 'miami', 'florida-keys']) {
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
    return null;
  }
}
