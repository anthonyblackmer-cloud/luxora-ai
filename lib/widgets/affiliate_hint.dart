import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Subtle placeholder for seamless booking / affiliate integration.
class AffiliateHint extends StatelessWidget {
  const AffiliateHint({super.key, this.category = 'Experience'});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: LuxColors.gold.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lock_outline_rounded,
              size: 14, color: LuxColors.gold.withValues(alpha: 0.85)),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              'Reserve · $category · premium partner (soon)',
              style: TextStyle(
                fontSize: 11,
                color: LuxColors.gold.withValues(alpha: 0.9),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
