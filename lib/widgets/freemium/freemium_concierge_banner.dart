import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/freemium_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Remaining free concierge questions — premium shows nothing.
class FreemiumConciergeBanner extends StatelessWidget {
  const FreemiumConciergeBanner({super.key, required this.remaining});

  final int remaining;

  @override
  Widget build(BuildContext context) {
    if (FreemiumService.hasFullAccess()) return const SizedBox.shrink();

    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final label = remaining <= 0
        ? l.freemiumConciergeLimitReached
        : l.freemiumConciergeRemaining(remaining);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: tokens.accent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: tokens.accent.withValues(alpha: 0.25)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: tokens.textPrimary,
          ),
        ),
      ),
    );
  }
}
