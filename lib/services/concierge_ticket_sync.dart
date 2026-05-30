import 'package:luxora_ai/data/ticket_deals_resolver.dart';
import 'package:luxora_ai/data/trip_plans.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/ticket_savings_service.dart';

/// Matches Smart Ticket Savings deals to Concierge requests and timeline stops.
abstract final class ConciergeTicketSync {
  static const _ticketKeywords = [
    'ticket',
    'tickets',
    'deal',
    'deals',
    'discount',
    'discounted',
    'cheaper',
    'best price',
    'lowest price',
    'save money',
    'link',
    'book',
    'booking',
    'affordable',
    'pass',
    'admission',
    'undercover',
    'reseller',
  ];

  static bool wantsTicketHelp(String message) {
    final lower = message.toLowerCase();
    return _ticketKeywords.any(lower.contains);
  }

  static List<TicketDeal> dealsFor({
    required String userMessage,
    TripPlan? plan,
    TripProfile? profile,
  }) {
    final catalog = TicketDealsResolver.allDealsForActive();
    if (catalog.isEmpty) return [];

    final titles = <String>[userMessage];
    if (plan != null) {
      for (final day in plan.days) {
        for (final item in day.items) {
          titles.add(item.title);
        }
      }
    }

    final tags = TicketSavingsService.detectItineraryTags(
      plan: plan,
      itemTitles: titles,
    );

    var matches = TicketSavingsService.dealsMatchingItinerary(tags);

    if (plan != null) {
      for (final day in plan.days) {
        for (final item in day.items) {
          final placeId = item.placeId;
          if (placeId == null) continue;
          final best = _bestDealForPlace(placeId, catalog);
          if (best != null && !matches.any((m) => m.id == best.id)) {
            matches.add(best);
          }
        }
      }
    }

    if (matches.isEmpty && wantsTicketHelp(userMessage)) {
      matches = List<TicketDeal>.from(catalog)
        ..sort((a, b) => b.savingsUsd.compareTo(a.savingsUsd));
      return matches.take(4).toList();
    }

    matches.sort((a, b) => b.savingsUsd.compareTo(a.savingsUsd));
    return matches.take(6).toList();
  }

  static TripPlan attachDealsToPlan(TripPlan plan, List<TicketDeal> deals) {
    if (deals.isEmpty) return plan;

    final catalog = TicketDealsResolver.allDealsForActive();
    final days = plan.days.map((day) {
      final items = day.items.map((item) {
        if (item.ticketDealId != null) return item;
        final placeId = item.placeId;
        if (placeId == null) return item;

        TicketDeal? deal;
        for (final d in deals) {
          if (d.placeId == placeId) {
            deal = d;
            break;
          }
        }
        deal ??= _bestDealForPlace(placeId, catalog);
        if (deal == null) return item;
        return item.copyWith(ticketDealId: deal.id);
      }).toList();
      return TripDay(dayNumber: day.dayNumber, label: day.label, items: items);
    }).toList();

    return TripPlan(id: plan.id, title: plan.title, days: days);
  }

  static Future<List<TicketDeal>> enrichActivePlanWithDeals({
    required String userMessage,
    required String cityId,
    TripProfile? profile,
  }) async {
    await ActiveTripPlanStore.instance.load();
    final existing = ActiveTripPlanStore.instance.planFor(cityId);
    final plan = existing ?? samplePlanForActiveCity();
    final deals = dealsFor(
      userMessage: userMessage,
      plan: plan,
      profile: profile,
    );
    if (deals.isEmpty) return [];

    final updated = attachDealsToPlan(plan, deals);
    await ActiveTripPlanStore.instance.save(updated, cityId: cityId);
    return deals;
  }

  static String chatSummary(
    AppLocalizations l,
    List<TicketDeal> deals, {
    TripProfile? profile,
  }) {
    if (deals.isEmpty) return '';

    final adults = profile?.adults ?? 2;
    final kids = profile?.kids ?? 0;
    final buffer = StringBuffer('${l.conciergeTicketsFoundIntro}\n\n');

    for (final deal in deals.take(4)) {
      final familySave = TicketSavingsService.familySavingsUsd(
        deal: deal,
        adults: adults,
        kids: kids,
      );
      buffer.writeln(
        l.conciergeTicketDealLine(
          deal.title,
          _usd(deal.discountPriceUsd),
          deal.sourceName,
          _usd(deal.hasDiscount ? deal.savingsUsd : familySave),
        ),
      );
    }

    buffer.write('\n${l.conciergeTicketsTimelineHint}');
    return buffer.toString().trim();
  }

  static TicketDeal? dealForItem(TripItem item) {
    final id = item.ticketDealId;
    if (id == null) return null;
    return TicketDealsResolver.byIdAnyCity(id);
  }

  static TicketDeal? _bestDealForPlace(String placeId, List<TicketDeal> catalog) {
    final exact = catalog.where((d) => d.placeId == placeId).toList()
      ..sort((a, b) => b.savingsUsd.compareTo(a.savingsUsd));
    if (exact.isNotEmpty) return exact.first;

    final tags = TicketSavingsService.detectItineraryTags(
      savedPlaceIds: [placeId],
    );
    final matches = TicketSavingsService.dealsMatchingItinerary(tags);
    return matches.isEmpty ? null : matches.first;
  }

  static String _usd(int amount) => '\$$amount';
}
