import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/paywall/paywall_reveal.dart';

/// City pack pricing — one-time purchase, not subscription framing.
class PaywallPricingCard extends StatelessWidget {
  const PaywallPricingCard({
    super.key,
    required this.offer,
    this.revealIndex = 4,
  });

  final PaywallCityOffer offer;
  final int revealIndex;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final min = _formatUsd(offer.vacationCostMinUsd);
    final max = _formatUsd(offer.vacationCostMaxUsd);

    return PaywallReveal(
      index: revealIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  LuxColors.gold.withValues(alpha: 0.18),
                  const Color(0xFF1C1917),
                ],
              ),
              border: Border.all(
                color: LuxColors.gold.withValues(alpha: 0.45),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: LuxColors.gold.withValues(alpha: 0.15),
                  blurRadius: 32,
                  spreadRadius: -4,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.paywallUnlockCityConcierge(offer.cityName),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: LuxColors.cream,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      offer.formattedPrice,
                      style: const TextStyle(
                        fontSize: 48,
                        height: 1,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.5,
                        color: LuxColors.gold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        l.paywallOneTimePurchase,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: LuxColors.stone300,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...[
                  l.paywallNoSubscription,
                  l.paywallNoMonthlyFees,
                  l.paywallLifetimeAccess(offer.cityName),
                  l.paywallFutureUpdatesIncluded(offer.cityName),
                ].map(
                  (line) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          size: 16,
                          color: LuxColors.gold.withValues(alpha: 0.9),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            line,
                            style: TextStyle(
                              fontSize: 13,
                              color: LuxColors.stone300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withValues(alpha: 0.35),
              border: Border.all(
                color: LuxColors.stone500.withValues(alpha: 0.25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.paywallMostVacationsCost(
                    offer.cityName,
                    min,
                    max,
                  ),
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.45,
                    color: LuxColors.stone400,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Luxora: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: LuxColors.stone300,
                      ),
                    ),
                    Text(
                      l.paywallLuxoraPriceLine(offer.formattedPrice),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: LuxColors.gold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  l.paywallLessThanDinner,
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: LuxColors.stone400.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatUsd(int amount) {
    if (amount >= 1000) {
      return '\$${(amount / 1000).toStringAsFixed(0)},${(amount % 1000).toString().padLeft(3, '0')}';
    }
    return '\$$amount';
  }
}
