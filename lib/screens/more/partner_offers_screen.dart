import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/partner_sponsorship_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_secondary_app_bar.dart';
import 'package:luxora_ai/widgets/partner_sponsor_badge.dart';

class PartnerOffersScreen extends StatelessWidget {
  const PartnerOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final stays = PartnerSponsorshipService.featuredStays(limit: 6);
    final dining = PartnerSponsorshipService.featuredDining(limit: 4);
    final tickets = PartnerSponsorshipService.featuredTicketPartners(limit: 4);
    final all = [...stays, ...dining, ...tickets];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: LuxSecondaryAppBar(title: l.partnerOffersTitle),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            l.featuredTicketPartnersSubtitle,
            style: const TextStyle(
              color: LuxColors.stone400,
              height: 1.4,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 20),
          if (all.isEmpty)
            Text(
              l.commonSoon,
              style: const TextStyle(color: LuxColors.stone500),
            )
          else
            for (var i = 0; i < all.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GlassCard(
                  glow: i == 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PartnerSponsorBadge(sponsorship: all[i].sponsorship),
                      const SizedBox(height: 10),
                      Text(
                        all[i].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: LuxColors.cream,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        all[i].subtitle,
                        style: const TextStyle(
                          color: LuxColors.stone400,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
