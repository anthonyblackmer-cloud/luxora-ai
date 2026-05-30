import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/paywall/paywall_reveal.dart';

/// Placeholder review architecture — swap real testimonials later.
class PaywallSocialProof extends StatelessWidget {
  const PaywallSocialProof({super.key, this.revealIndex = 5});

  final int revealIndex;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final quotes = [
      l.paywallReview1,
      l.paywallReview2,
      l.paywallReview3,
    ];

    return PaywallReveal(
      index: revealIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.paywallSocialProofTitle,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: LuxColors.cream,
            ),
          ),
          const SizedBox(height: 14),
          ...quotes.map(
            (quote) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(0xFF1C1917).withValues(alpha: 0.8),
                  border: Border.all(
                    color: LuxColors.gold.withValues(alpha: 0.12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (_) => Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: LuxColors.gold.withValues(alpha: 0.95),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      quote,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.45,
                        fontStyle: FontStyle.italic,
                        color: LuxColors.stone300,
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
