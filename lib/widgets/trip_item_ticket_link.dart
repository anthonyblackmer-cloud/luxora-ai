import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/concierge_ticket_sync.dart';
import 'package:luxora_ai/services/ticket_deal_source_links.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Opens an authorized reseller link for a timeline stop with a ticket deal.
class TripItemTicketLink extends StatelessWidget {
  const TripItemTicketLink({
    super.key,
    required this.item,
  });

  final TripItem item;

  @override
  Widget build(BuildContext context) {
    final deal = ConciergeTicketSync.dealForItem(item);
    if (deal == null) return const SizedBox.shrink();
    return _TicketDealButton(deal: deal);
  }
}

class _TicketDealButton extends StatelessWidget {
  const _TicketDealButton({required this.deal});

  final TicketDeal deal;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final savings = deal.hasDiscount ? deal.savingsUsd : 0;
    final label = savings > 0
        ? l.itineraryBookTickets('\$$savings')
        : l.itineraryOpenTicketDeal;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: LuxColors.gold,
            backgroundColor: LuxColors.gold.withValues(alpha: 0.12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: LuxColors.gold.withValues(alpha: 0.35)),
            ),
          ),
          onPressed: () => TicketDealSourceLinks.open(deal),
          icon: const Icon(Icons.confirmation_number_outlined, size: 16),
          label: Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
