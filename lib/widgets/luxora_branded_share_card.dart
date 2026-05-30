import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Branded Luxora card layout for PNG sharing (trips, day plans, destinations).
class LuxoraBrandedShareCard extends StatelessWidget {
  const LuxoraBrandedShareCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.lines = const [],
    this.chips = const [],
    this.footer,
  });

  final String title;
  final String subtitle;
  final List<String> lines;
  final List<String> chips;
  final String? footer;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final footerText = footer ?? l.shareItineraryFooter;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1C1917), Color(0xFF0C0A09), Color(0xFF292524)],
        ),
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'LUXORA',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 3,
              color: LuxColors.gold.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: LuxColors.cream,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: LuxColors.stone400,
            ),
          ),
          if (chips.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final chip in chips)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: LuxColors.gold.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: LuxColors.gold.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      chip,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: LuxColors.gold,
                      ),
                    ),
                  ),
              ],
            ),
          ],
          if (lines.isNotEmpty) ...[
            const SizedBox(height: 16),
            for (final line in lines)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('✦ ', style: TextStyle(color: LuxColors.gold)),
                    Expanded(
                      child: Text(
                        line,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.35,
                          color: LuxColors.cream,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
          const SizedBox(height: 14),
          Text(
            footerText,
            style: TextStyle(
              fontSize: 11,
              height: 1.35,
              color: LuxColors.stone500.withValues(alpha: 0.95),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
