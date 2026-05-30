import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/paywall/paywall_reveal.dart';

/// Emotional benefit cards — time, money, traps, smarter travel.
class PaywallBenefitCards extends StatelessWidget {
  const PaywallBenefitCards({super.key, this.revealIndex = 2});

  final int revealIndex;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cards = [
      (
        Icons.schedule_rounded,
        l.paywallBenefitSaveTimeTitle,
        l.paywallBenefitSaveTimeBody,
      ),
      (
        Icons.savings_rounded,
        l.paywallBenefitSaveMoneyTitle,
        l.paywallBenefitSaveMoneyBody,
      ),
      (
        Icons.block_rounded,
        l.paywallBenefitAvoidTrapsTitle,
        l.paywallBenefitAvoidTrapsBody,
      ),
      (
        Icons.travel_explore_rounded,
        l.paywallBenefitTravelSmarterTitle,
        l.paywallBenefitTravelSmarterBody,
      ),
    ];

    return PaywallReveal(
      index: revealIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.paywallWhyTravelersUnlock,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
              color: LuxColors.cream,
            ),
          ),
          const SizedBox(height: 14),
          ...cards.map(
            (c) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      LuxColors.gold.withValues(alpha: 0.08),
                      const Color(0xFF1C1917).withValues(alpha: 0.85),
                    ],
                  ),
                  border: Border.all(
                    color: LuxColors.gold.withValues(alpha: 0.18),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: LuxColors.gold.withValues(alpha: 0.12),
                      ),
                      child: Icon(c.$1, color: LuxColors.gold, size: 22),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c.$2,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: LuxColors.cream,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            c.$3,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.45,
                              color: LuxColors.stone400,
                            ),
                          ),
                        ],
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
