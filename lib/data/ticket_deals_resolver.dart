import 'package:luxora_ai/data/miami/miami_ticket_deals.dart';
import 'package:luxora_ai/data/ticket_deals_catalog.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// Unified ticket deal lookup — city pack filters which catalog applies.
abstract final class TicketDealsResolver {
  static List<TicketDeal> catalogForCity(String cityId) => switch (cityId) {
        'miami' => miamiTicketDealsCatalog,
        _ => ticketDealsCatalog,
      };

  static List<TicketDeal> catalogForActive() =>
      catalogForCity(CityPackRegistry.instance.active.cityId);

  static List<TicketDeal> allDealsForActive() {
    final ids = CityPackRegistry.instance.ticketDealIds.toSet();
    return catalogForActive().where((d) => ids.contains(d.id)).toList();
  }

  static TicketDeal? byId(String id) {
    for (final d in catalogForActive()) {
      if (d.id == id) return d;
    }
    return null;
  }

  static TicketDeal? byIdAnyCity(String id) {
    for (final d in ticketDealsCatalog) {
      if (d.id == id) return d;
    }
    for (final d in miamiTicketDealsCatalog) {
      if (d.id == id) return d;
    }
    return null;
  }
}
