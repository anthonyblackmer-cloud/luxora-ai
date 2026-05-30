import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/paywall/paywall_reveal.dart';

/// Primary unlock CTA + soft secondary exit — never trap the traveler.
class PaywallCTA extends StatelessWidget {
  const PaywallCTA({
    super.key,
    required this.offer,
    required this.onUnlock,
    required this.onContinue,
    this.isLoading = false,
    this.revealIndex = 6,
  });

  final PaywallCityOffer offer;
  final VoidCallback onUnlock;
  final VoidCallback onContinue;
  final bool isLoading;
  final int revealIndex;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return PaywallReveal(
      index: revealIndex,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: isLoading ? null : onUnlock,
              style: FilledButton.styleFrom(
                backgroundColor: LuxColors.gold,
                foregroundColor: const Color(0xFF0C0A09),
                padding: const EdgeInsets.symmetric(vertical: 18),
                elevation: 12,
                shadowColor: LuxColors.gold.withValues(alpha: 0.55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: isLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      l.paywallCtaUnlock(offer.cityName),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.2,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 14),
          TextButton(
            onPressed: isLoading ? null : onContinue,
            child: Text(
              l.paywallContinueExploring,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: LuxColors.stone400,
                decoration: TextDecoration.underline,
                decorationColor: LuxColors.stone500.withValues(alpha: 0.5),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.paywallConciergePromise,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              height: 1.4,
              color: LuxColors.stone500,
            ),
          ),
        ],
      ),
    );
  }
}

/// Sticky bottom bar variant for long scroll paywalls.
class PaywallStickyCTA extends StatelessWidget {
  const PaywallStickyCTA({
    super.key,
    required this.offer,
    required this.onUnlock,
    this.isLoading = false,
  });

  final PaywallCityOffer offer;
  final VoidCallback onUnlock;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF0C0A09).withValues(alpha: 0),
            const Color(0xFF0C0A09).withValues(alpha: 0.92),
            const Color(0xFF0C0A09),
          ],
        ),
      ),
      child: SafeArea(
        top: false,
        child: LuxButton(
          label: l.paywallCtaUnlock(offer.cityName),
          onPressed: isLoading ? null : onUnlock,
        ),
      ),
    );
  }
}
