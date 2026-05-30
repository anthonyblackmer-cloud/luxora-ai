import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/paywall/paywall_reveal.dart';

/// Blurred locked previews — curiosity without feeling punitive.
class PaywallLockedPreview extends StatelessWidget {
  const PaywallLockedPreview({super.key, this.revealIndex = 3});

  final int revealIndex;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final l = context.l10n;
    final items = [
      l.paywallLockedDateNight,
      l.paywallLockedHiddenLuxury,
      l.paywallLockedVipSecrets,
      l.paywallLockedConciergeRecs,
      l.paywallLockedFamilyPlans,
      l.paywallLockedWeatherReroute,
      l.paywallLockedHotelMatchmaker,
    ];

    return PaywallReveal(
      index: revealIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.paywallLockedPreviewTitle,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: t.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l.paywallLockedPreviewSubtitle,
            style: TextStyle(
              fontSize: 13,
              color: t.textMuted,
            ),
          ),
          const SizedBox(height: 14),
          ...items.map(
            (label) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _LockedCard(label: label),
            ),
          ),
        ],
      ),
    );
  }
}

class _LockedCard extends StatelessWidget {
  const _LockedCard({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: BoxDecoration(
              color: t.bgSecondary,
              border: Border.all(color: t.accent.withValues(alpha: 0.12)),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: t.textMuted.withValues(alpha: 0.35),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                color: t.bg.withValues(alpha: 0.25),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_rounded,
                      size: 18,
                      color: t.accent.withValues(alpha: 0.85),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: t.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
