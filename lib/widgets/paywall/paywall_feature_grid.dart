import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/paywall/paywall_reveal.dart';

/// Premium capability grid — what unlocking the concierge includes.
class PaywallFeatureGrid extends StatelessWidget {
  const PaywallFeatureGrid({super.key, this.revealIndex = 1});

  final int revealIndex;

  static List<(IconData, String Function(AppLocalizations))> get features => [
        (Icons.auto_awesome_rounded, (l) => l.paywallFeatureAiConcierge),
        (Icons.route_rounded, (l) => l.paywallFeatureItineraries),
        (Icons.diamond_rounded, (l) => l.paywallFeatureHiddenGems),
        (Icons.hotel_rounded, (l) => l.paywallFeatureHotelIntel),
        (Icons.confirmation_number_rounded, (l) => l.paywallFeatureTicketSavings),
        (Icons.wb_sunny_rounded, (l) => l.paywallFeatureWeatherConcierge),
        (Icons.groups_rounded, (l) => l.paywallFeatureCrowdIntel),
        (Icons.navigation_rounded, (l) => l.paywallFeatureGpsNav),
        (Icons.key_rounded, (l) => l.paywallFeatureLocalSecrets),
        (Icons.restaurant_rounded, (l) => l.paywallFeatureDining),
        (Icons.all_inclusive_rounded, (l) => l.paywallFeatureUnlimitedPlanning),
      ];

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return PaywallReveal(
      index: revealIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(l.paywallWhatYouUnlock),
          const SizedBox(height: 14),
          ...features.map(
            (f) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GlassCard(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  children: [
                    Icon(f.$1, size: 20, color: LuxColors.gold),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        f.$2(l),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: LuxColors.cream,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.check_rounded,
                      size: 18,
                      color: LuxColors.gold.withValues(alpha: 0.85),
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

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.3,
        color: LuxColors.cream,
      ),
    );
  }
}
