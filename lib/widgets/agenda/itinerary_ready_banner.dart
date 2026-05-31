import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Shown once after the first itinerary build completes onboarding.
class ItineraryReadyBanner extends StatelessWidget {
  const ItineraryReadyBanner({super.key, required this.onDismiss});

  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GlassCard(
        glow: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  color: tokens.accent.withValues(alpha: 0.9),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.onboardItineraryReadyTitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: tokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l.onboardItineraryReadyBody,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.45,
                          color: tokens.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: onDismiss,
                  icon: Icon(
                    Icons.close_rounded,
                    color: tokens.textMuted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
