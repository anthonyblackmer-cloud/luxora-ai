import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/luxora_share_section.dart';

/// Branded Luxora card layout for PNG sharing (trips, day plans, destinations).
class LuxoraBrandedShareCard extends StatelessWidget {
  const LuxoraBrandedShareCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.header,
    this.lines = const [],
    this.chips = const [],
    this.sections = const [],
    this.footer,
  });

  final String title;
  final String subtitle;
  final Widget? header;
  final List<String> lines;
  final List<String> chips;
  final List<LuxoraShareSection> sections;
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
          if (header != null) ...[
            header!,
            const SizedBox(height: 14),
          ],
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
              height: 1.35,
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
          if (sections.isNotEmpty) ...[
            const SizedBox(height: 16),
            for (final section in sections) ...[
              if (section.heading != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    section.heading!,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                      color: LuxColors.gold.withValues(alpha: 0.9),
                    ),
                  ),
                ),
              if (section.body != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    section.body!,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.35,
                      fontWeight: FontWeight.w600,
                      color: LuxColors.cream,
                    ),
                  ),
                ),
              for (final line in section.lines)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, left: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '· ',
                        style: TextStyle(
                          color: LuxColors.stone500.withValues(alpha: 0.95),
                          fontSize: 12,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          line,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.35,
                            color: LuxColors.stone400.withValues(alpha: 0.98),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
            ],
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
