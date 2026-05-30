import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/partner_sponsorship.dart';
import 'package:luxora_ai/services/map_launcher.dart';
import 'package:luxora_ai/services/partner_sponsorship_service.dart';
import 'package:luxora_ai/services/ticket_deal_source_links.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';

/// Disclosure badge for sponsored / partner placements.
class PartnerSponsorBadge extends StatelessWidget {
  const PartnerSponsorBadge({
    super.key,
    required this.sponsorship,
    this.compact = false,
  });

  final PartnerSponsorship sponsorship;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (!PartnerSponsorshipService.isSponsorActive(sponsorship)) {
      return const SizedBox.shrink();
    }
    final l = context.l10n;
    final label = PartnerSponsorshipService.getSponsorBadge(l, sponsorship);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 7 : 10,
        vertical: compact ? 3 : 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0C0A09).withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(compact ? 8 : 10),
        border: Border.all(
          color: LuxColors.gold.withValues(alpha: 0.45),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified_outlined,
            size: compact ? 11 : 13,
            color: LuxColors.gold.withValues(alpha: 0.9),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: compact ? 9 : 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
              color: LuxColors.gold.withValues(alpha: 0.95),
            ),
          ),
        ],
      ),
    );
  }
}

/// Marks organic Luxora AI picks — visually distinct from partner badges.
class LuxoraRecommendedBadge extends StatelessWidget {
  const LuxoraRecommendedBadge({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 7 : 10,
        vertical: compact ? 3 : 5,
      ),
      decoration: BoxDecoration(
        color: LuxColors.ocean.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(compact ? 8 : 10),
        border: Border.all(color: LuxColors.ocean.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            size: compact ? 11 : 13,
            color: LuxColors.ocean,
          ),
          const SizedBox(width: 4),
          Text(
            l.sponsorLuxoraRecommended,
            style: TextStyle(
              fontSize: compact ? 9 : 10,
              fontWeight: FontWeight.w800,
              color: LuxColors.cream,
            ),
          ),
        ],
      ),
    );
  }
}

/// Horizontal Featured Partner section — separate from organic lists.
class FeaturedPartnerSection extends StatelessWidget {
  const FeaturedPartnerSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.items,
    required this.onItemTap,
    this.onCtaTap,
  });

  final String title;
  final String subtitle;
  final List<FeaturedPartnerItem> items;
  final void Function(FeaturedPartnerItem item) onItemTap;
  final void Function(FeaturedPartnerItem item)? onCtaTap;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.1,
            color: LuxColors.gold.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 11,
            height: 1.35,
            color: LuxColors.stone400,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 148,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, i) {
              final item = items[i];
              final l = context.l10n;
              final sourceUrl = _featuredItemSourceUrl(item);
              return SizedBox(
                width: 220,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => onItemTap(item),
                    borderRadius: BorderRadius.circular(14),
                    child: GlassCard(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PartnerSponsorBadge(
                            sponsorship: item.sponsorship,
                            compact: true,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: LuxColors.cream,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Expanded(
                            child: _FeaturedPartnerSubtitle(
                              text: item.subtitle,
                              url: sourceUrl,
                              onTap: sourceUrl == null
                                  ? null
                                  : () => MapLauncher.openUrl(sourceUrl),
                            ),
                          ),
                          if (onCtaTap != null &&
                              (item.sponsorship.sponsorUrl?.isNotEmpty ??
                                  false))
                            TextButton.icon(
                              onPressed: () => onCtaTap!(item),
                              icon: const Icon(Icons.open_in_new_rounded, size: 14),
                              label: Text(
                                item.sponsorship.ctaLabel(l),
                                style: const TextStyle(fontSize: 11),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  static String? _featuredItemSourceUrl(FeaturedPartnerItem item) {
    final sponsorUrl = item.sponsorship.sponsorUrl;
    if (sponsorUrl != null && sponsorUrl.isNotEmpty) return sponsorUrl;
    final deal = item.deal;
    if (deal != null) return TicketDealSourceLinks.resolve(deal);
    return null;
  }
}

class _FeaturedPartnerSubtitle extends StatelessWidget {
  const _FeaturedPartnerSubtitle({
    required this.text,
    required this.url,
    this.onTap,
  });

  final String text;
  final String? url;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 11,
      color: url == null ? LuxColors.stone400 : LuxColors.gold.withValues(alpha: 0.9),
      decoration: url == null ? null : TextDecoration.underline,
      decorationColor: LuxColors.gold.withValues(alpha: 0.5),
    );

    final child = Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: style,
    );

    if (onTap == null) return child;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: child,
    );
  }
}

/// External CTA for sponsored listings.
class PartnerSponsorCtaButton extends StatelessWidget {
  const PartnerSponsorCtaButton({
    super.key,
    required this.sponsorship,
  });

  final PartnerSponsorship sponsorship;

  @override
  Widget build(BuildContext context) {
    if (!PartnerSponsorshipService.isSponsorActive(sponsorship)) {
      return const SizedBox.shrink();
    }
    final url = sponsorship.sponsorUrl;
    if (url == null || url.isEmpty) return const SizedBox.shrink();

    final l = context.l10n;
    return LuxButton(
      label: sponsorship.ctaLabel(l),
      outline: true,
      icon: Icons.open_in_new_rounded,
      onPressed: () => PartnerSponsorshipService.openSponsorCta(sponsorship),
    );
  }
}
