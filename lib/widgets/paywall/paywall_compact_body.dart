import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/paywall/paywall_addon_offer.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/paywall/paywall_feature_grid.dart';
import 'package:luxora_ai/widgets/unsplash_image.dart';

/// Single-screen paywall — hero, pricing, value copy, and feature list.
class PaywallCompactBody extends StatelessWidget {
  const PaywallCompactBody({
    super.key,
    required this.offer,
    required this.headline,
    required this.heroPhotoId,
    required this.priceLabel,
    this.addonOffer,
    this.addonFocus = false,
  });

  final PaywallCityOffer offer;
  final String headline;
  final String heroPhotoId;
  final String priceLabel;
  final PaywallAddonOffer? addonOffer;
  final bool addonFocus;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = luxThemeTokensOf(context);

    if (addonFocus && addonOffer != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PaywallCompactHero(
            heroPhotoId: heroPhotoId,
            headline: headline,
            subheadline: l.paywallAddonThemeParksSubtitle,
          ),
          const SizedBox(height: 14),
          _AddonPriceCard(
            title: l.paywallAddonThemeParksTitle,
            price: addonOffer!.formattedPrice,
            headline: l.paywallAddonUnifiedHeadline(
              PaywallService.storePriceForCity(offer.cityId) ??
                  addonOffer!.formattedPrice,
            ),
            subtitle: l.paywallAddonUnifiedBody,
          ),
          const SizedBox(height: 14),
          PaywallCompactBenefits(l: l),
          const SizedBox(height: 14),
          PaywallCompactFeatureList(l: l, cityName: offer.cityName),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PaywallCompactHero(
          heroPhotoId: heroPhotoId,
          headline: headline,
          subheadline: l.paywallHeroSubheadline,
        ),
        const SizedBox(height: 12),
        _EmotionalPitch(text: l.paywallEmotionalLine),
        const SizedBox(height: 12),
        _ValueStoryCard(
          cityName: offer.cityName,
          priceLabel: priceLabel,
        ),
        const SizedBox(height: 14),
        _UnifiedLaunchPricingCard(
          selectedPackName: offer.cityName,
          priceLabel: priceLabel,
        ),
        const SizedBox(height: 14),
        _VacationValueCard(offer: offer, priceLabel: priceLabel),
        const SizedBox(height: 16),
        PaywallCompactBenefits(l: l),
        const SizedBox(height: 12),
        _RoiHook(text: l.paywallRoiHook),
        const SizedBox(height: 14),
        _PeaceOfMindCard(l: l),
        const SizedBox(height: 16),
        PaywallCompactFeatureList(l: l, cityName: offer.cityName),
        const SizedBox(height: 14),
        PaywallCompactSocialProof(l: l),
        const SizedBox(height: 12),
        Text(
          l.paywallConciergePromise,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            height: 1.45,
            fontStyle: FontStyle.italic,
            color: t.textMuted,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${l.paywallNoSubscription} · ${l.paywallNoMonthlyFees}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: t.textMuted),
        ),
      ],
    );
  }
}

class PaywallCompactHero extends StatelessWidget {
  const PaywallCompactHero({
    super.key,
    required this.heroPhotoId,
    required this.headline,
    required this.subheadline,
  });

  final String heroPhotoId;
  final String headline;
  final String subheadline;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final l = context.l10n;
    final photo = UnsplashPhotoRegistry.instance.byId(heroPhotoId);

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        height: 156,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (photo != null)
              UnsplashImage(
                photo: photo,
                height: 156,
                fit: BoxFit.cover,
                showAttributionOverlay: false,
                trackUsageOnDisplay: true,
                scrim: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.2),
                    Colors.black.withValues(alpha: 0.75),
                  ],
                ),
              )
            else
              Container(color: t.bgSecondary),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    l.paywallHeroEyebrow,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.4,
                      color: t.accent.withValues(alpha: 0.92),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    headline,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 22,
                      height: 1.12,
                      fontWeight: FontWeight.w800,
                      color: LuxColors.cream,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subheadline,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.3,
                      color: LuxColors.cream.withValues(alpha: 0.82),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmotionalPitch extends StatelessWidget {
  const _EmotionalPitch({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: t.accent.withValues(alpha: 0.1),
        border: Border.all(color: t.accent.withValues(alpha: 0.28)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          height: 1.45,
          fontWeight: FontWeight.w600,
          color: t.textPrimary,
        ),
      ),
    );
  }
}

class _ValueStoryCard extends StatelessWidget {
  const _ValueStoryCard({
    required this.cityName,
    required this.priceLabel,
  });

  final String cityName;
  final String priceLabel;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final l = context.l10n;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: t.panelFill,
        border: Border.all(color: t.borderSubtle),
      ),
      child: Text(
        l.paywallValueStory(cityName, priceLabel),
        style: TextStyle(
          fontSize: 13,
          height: 1.5,
          fontWeight: FontWeight.w600,
          color: t.textPrimary,
        ),
      ),
    );
  }
}

class _RoiHook extends StatelessWidget {
  const _RoiHook({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13,
        height: 1.45,
        fontWeight: FontWeight.w700,
        color: t.accent,
      ),
    );
  }
}

class _PeaceOfMindCard extends StatelessWidget {
  const _PeaceOfMindCard({required this.l});

  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          colors: [
            t.accent.withValues(alpha: 0.08),
            t.bgSecondary,
          ],
        ),
        border: Border.all(color: t.accent.withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.paywallPeaceOfMindTitle,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: t.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.paywallPeaceOfMindBody,
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: t.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class PaywallCompactSocialProof extends StatelessWidget {
  const PaywallCompactSocialProof({super.key, required this.l});

  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final quotes = [l.paywallReview1, l.paywallReview2, l.paywallReview3];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.paywallSocialProofHeading,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: t.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        ...quotes.map(
          (quote) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.format_quote_rounded, size: 16, color: t.accent),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    quote,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      fontStyle: FontStyle.italic,
                      color: t.textMuted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _UnifiedLaunchPricingCard extends StatelessWidget {
  const _UnifiedLaunchPricingCard({
    required this.selectedPackName,
    required this.priceLabel,
  });

  final String selectedPackName;
  final String priceLabel;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final l = context.l10n;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            t.accent.withValues(alpha: 0.16),
            t.bgSecondary,
          ],
        ),
        border: Border.all(color: t.accent.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.paywallUnifiedPriceHeadline(priceLabel),
            style: TextStyle(
              fontSize: 18,
              height: 1.2,
              fontWeight: FontWeight.w900,
              color: t.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l.paywallUnifiedPriceBody,
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: t.textMuted,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                priceLabel,
                style: TextStyle(
                  fontSize: 40,
                  height: 1,
                  fontWeight: FontWeight.w900,
                  color: t.accent,
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  l.paywallOneTimePurchase,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: t.textMuted,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            l.paywallSelectedPackToday(selectedPackName),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: t.accent,
            ),
          ),
        ],
      ),
    );
  }
}

class _VacationValueCard extends StatelessWidget {
  const _VacationValueCard({
    required this.offer,
    required this.priceLabel,
  });

  final PaywallCityOffer offer;
  final String priceLabel;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final l = context.l10n;
    final min = _formatUsd(offer.vacationCostMinUsd);
    final max = _formatUsd(offer.vacationCostMaxUsd);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: t.panelFill,
        border: Border.all(color: t.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.paywallMostVacationsCost(offer.cityName, min, max),
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: t.textMuted,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l.paywallLuxoraPriceLine(priceLabel),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: t.accent,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l.paywallLessThanDinner,
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: t.textMuted,
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

class PaywallCompactBenefits extends StatelessWidget {
  const PaywallCompactBenefits({super.key, required this.l});

  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.paywallWhyTravelersUnlock,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: t.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        ...cards.map(
          (c) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: t.accent.withValues(alpha: 0.12),
                  ),
                  child: Icon(c.$1, color: t.accent, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c.$2,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: t.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        c.$3,
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.4,
                          color: t.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PaywallCompactFeatureList extends StatelessWidget {
  const PaywallCompactFeatureList({
    super.key,
    required this.l,
    required this.cityName,
  });

  final AppLocalizations l;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final features = PaywallFeatureGrid.features;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.paywallWhatYouUnlock,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: t.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final feature in features)
              _FeatureChip(
                icon: feature.$1,
                label: feature.$2(l),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          l.paywallFutureUpdatesIncluded(cityName),
          style: TextStyle(fontSize: 12, color: t.textMuted, height: 1.35),
        ),
      ],
    );
  }
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: t.panelFill,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: t.borderSubtle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: t.accent),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: t.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddonPriceCard extends StatelessWidget {
  const _AddonPriceCard({
    required this.title,
    required this.price,
    required this.subtitle,
    this.headline,
  });

  final String title;
  final String price;
  final String subtitle;
  final String? headline;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final l = context.l10n;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: t.accent.withValues(alpha: 0.4)),
        color: t.accent.withValues(alpha: 0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (headline != null) ...[
            Text(
              headline!,
              style: TextStyle(
                fontSize: 18,
                height: 1.2,
                fontWeight: FontWeight.w900,
                color: t.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
          ] else
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: t.textPrimary,
              ),
            ),
          if (headline != null) ...[
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: t.textMuted,
              ),
            ),
            const SizedBox(height: 8),
          ] else
            const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: t.accent,
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  l.paywallOneTimePurchase,
                  style: TextStyle(fontSize: 12, color: t.textMuted),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(subtitle, style: TextStyle(fontSize: 12, color: t.textMuted)),
        ],
      ),
    );
  }
}
