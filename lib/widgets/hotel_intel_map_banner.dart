import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';

/// Prompts travelers to pick a home base when none is set.
class HotelIntelMapBanner extends StatelessWidget {
  const HotelIntelMapBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GlassCard(
        glow: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l.mapHotelIntelBannerTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: LuxColors.cream,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l.mapHotelIntelBannerBody,
              style: const TextStyle(
                fontSize: 12,
                height: 1.4,
                color: LuxColors.stone400,
              ),
            ),
            const SizedBox(height: 12),
            LuxButton(
              label: l.mapHotelIntelBannerCta,
              icon: Icons.hotel_rounded,
              onPressed: () => context.push('/stays'),
            ),
          ],
        ),
      ),
    );
  }
}
