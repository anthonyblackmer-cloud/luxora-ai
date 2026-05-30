import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/sponsorship_extensions.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/ticket_deal_source_links.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/partner_sponsor_badge.dart';

class TicketDealCard extends StatefulWidget {
  const TicketDealCard({
    super.key,
    required this.deal,
    required this.familySavingsUsd,
    this.onTap,
  });

  final TicketDeal deal;
  final int familySavingsUsd;
  final VoidCallback? onTap;

  @override
  State<TicketDealCard> createState() => _TicketDealCardState();
}

class _TicketDealCardState extends State<TicketDealCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final deal = widget.deal;
    final locale = Localizations.localeOf(context);
    final expires = DateFormat.yMMMd(locale.toLanguageTag()).format(deal.expiresAt);
    final place = deal.placeId != null
        ? PlacesRepository.instance.byId(deal.placeId!)
        : null;
    final sourceUrl = TicketDealSourceLinks.resolve(deal);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlassCard(
        glow: deal.hasDiscount,
        padding: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: SizedBox(
                  height: 140,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (place != null)
                        LuxPlaceImage(
                          place: place,
                          presentation: LuxImagePresentation.feedHero,
                        )
                      else
                        LuxPlaceImage.fallback(
                          presentation: LuxImagePresentation.feedHero,
                          fallbackGradient: const [
                            Color(0xFF78350F),
                            Color(0xFF92400E),
                            Color(0xFF1C1917),
                          ],
                        ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.75),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: _SavingsBadge(
                          pulse: _pulse,
                          label: l.ticketSavingsBadge(deal.effectiveDiscountPercent),
                        ),
                      ),
                      if (deal.activeSponsorship != null)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: PartnerSponsorBadge(
                            sponsorship: deal.activeSponsorship!,
                            compact: true,
                          ),
                        ),
                      Positioned(
                        left: 14,
                        bottom: 12,
                        right: 14,
                        child: Text(
                          deal.title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: LuxColors.cream,
                            shadows: [Shadow(color: Colors.black, blurRadius: 8)],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (deal.hasDiscount)
                      Text(
                        l.ticketBetterOption,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                          color: LuxColors.gold.withValues(alpha: 0.9),
                        ),
                      ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _PriceColumn(
                          label: l.ticketOfficialPrice,
                          value: _usd(deal.officialPriceUsd),
                          strikethrough: true,
                        ),
                        const SizedBox(width: 20),
                        _PriceColumn(
                          label: l.ticketDiscountPrice,
                          value: _usd(deal.discountPriceUsd),
                          highlight: true,
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              l.ticketSaveAmount(_usd(deal.savingsUsd)),
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: LuxColors.gold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              l.ticketFamilySave(_usd(widget.familySavingsUsd)),
                              style: const TextStyle(
                                fontSize: 11,
                                color: LuxColors.stone400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.verified_outlined,
                            size: 14, color: LuxColors.gold.withValues(alpha: 0.85)),
                        const SizedBox(width: 4),
                        Expanded(
                          child: _TicketSourceLabel(
                            label: l.ticketSource(deal.sourceName),
                            url: sourceUrl,
                            onTap: sourceUrl == null
                                ? null
                                : () => TicketDealSourceLinks.open(deal),
                          ),
                        ),
                        _ConfidenceChip(confidence: deal.confidence),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l.ticketExpires(expires),
                      style: const TextStyle(
                        fontSize: 11,
                        color: LuxColors.stone500,
                      ),
                    ),
                    if (deal.conciergeBestDay != null) ...[
                      const SizedBox(height: 10),
                      _ConciergeRow(
                        icon: Icons.calendar_today_rounded,
                        text: deal.conciergeBestDay!,
                      ),
                    ],
                    if (deal.conciergeCrowd != null)
                      _ConciergeRow(
                        icon: Icons.groups_outlined,
                        text: deal.conciergeCrowd!,
                      ),
                    if (deal.conciergeResidentNote != null)
                      _ConciergeRow(
                        icon: Icons.home_outlined,
                        text: deal.conciergeResidentNote!,
                      ),
                    if (deal.bundleOpportunity != null)
                      _ConciergeRow(
                        icon: Icons.layers_outlined,
                        text: deal.bundleOpportunity!,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _usd(int amount) => '\$$amount';
}

class _SavingsBadge extends StatelessWidget {
  const _SavingsBadge({required this.pulse, required this.label});

  final AnimationController pulse;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulse,
      builder: (context, child) {
        final glow = 0.25 + pulse.value * 0.2;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: LuxColors.gold.withValues(alpha: 0.92),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: LuxColors.gold.withValues(alpha: glow),
                blurRadius: 12 + pulse.value * 6,
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              color: Color(0xFF0C0A09),
            ),
          ),
        );
      },
    );
  }
}

class _PriceColumn extends StatelessWidget {
  const _PriceColumn({
    required this.label,
    required this.value,
    this.strikethrough = false,
    this.highlight = false,
  });

  final String label;
  final String value;
  final bool strikethrough;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: LuxColors.stone500)),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: highlight ? 18 : 15,
            fontWeight: FontWeight.w700,
            color: highlight ? LuxColors.gold : LuxColors.stone400,
            decoration: strikethrough ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    );
  }
}

class _ConfidenceChip extends StatelessWidget {
  const _ConfidenceChip({required this.confidence});

  final DealConfidence confidence;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final (label, color) = switch (confidence) {
      DealConfidence.high => (l.ticketConfidenceHigh, LuxColors.gold),
      DealConfidence.verified => (l.ticketConfidenceVerified, LuxColors.feedLive),
      DealConfidence.limited => (l.ticketConfidenceLimited, LuxColors.stone400),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: color),
      ),
    );
  }
}

class _TicketSourceLabel extends StatelessWidget {
  const _TicketSourceLabel({
    required this.label,
    required this.url,
    this.onTap,
  });

  final String label;
  final String? url;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 12,
      color: url == null ? LuxColors.stone400 : LuxColors.gold.withValues(alpha: 0.9),
      decoration: url == null ? null : TextDecoration.underline,
      decorationColor: LuxColors.gold.withValues(alpha: 0.5),
    );

    if (onTap == null) {
      return Text(label, style: style);
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(label, style: style),
      ),
    );
  }
}

class _ConciergeRow extends StatelessWidget {
  const _ConciergeRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: LuxColors.gold.withValues(alpha: 0.75)),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                height: 1.35,
                color: LuxColors.stone400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
