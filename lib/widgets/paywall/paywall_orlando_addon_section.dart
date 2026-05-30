import 'package:flutter/material.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/paywall/paywall_addon_offer.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/paywall/paywall_reveal.dart';

/// Orlando theme-park add-on upsell — Disney & Universal together.
class PaywallOrlandoAddonSection extends StatelessWidget {
  const PaywallOrlandoAddonSection({
    super.key,
    required this.revealIndex,
    this.onAddonUnlock,
    this.unlocking = false,
  });

  final int revealIndex;
  final Future<void> Function(String addonId)? onAddonUnlock;
  final bool unlocking;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = luxThemeTokensOf(context);
    final offer = OrlandoAddonCatalog.offer;

    return PaywallReveal(
      index: revealIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.paywallOrlandoAddonsHeading,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: t.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.paywallOrlandoBaseIncludes,
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: t.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          _ThemeParksOfferCard(
            offer: offer,
            unlocking: unlocking,
            onUnlock: onAddonUnlock,
          ),
        ],
      ),
    );
  }
}

class _ThemeParksOfferCard extends StatelessWidget {
  const _ThemeParksOfferCard({
    required this.offer,
    required this.unlocking,
    this.onUnlock,
  });

  final PaywallAddonOffer offer;
  final bool unlocking;
  final Future<void> Function(String addonId)? onUnlock;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = luxThemeTokensOf(context);
    final unlocked = CityPackEntitlementStore.instance
        .isAddonUnlocked(OrlandoAddonCatalog.themeParks);
    final orlandoUnlocked = CityPackEntitlementStore.instance
        .isUnlocked(OrlandoAddonCatalog.parentCityId);
    final title = l.paywallAddonThemeParksTitle;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: t.panelFill,
        border: Border.all(
          color: t.textMuted.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: t.textPrimary,
                  ),
                ),
              ),
              Text(
                unlocked ? l.paywallAddonUnlocked : offer.formattedPrice,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: unlocked ? LuxColors.feedLive : t.accent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            l.paywallAddonThemeParksSubtitle,
            style: TextStyle(
              fontSize: 12,
              height: 1.4,
              color: t.textMuted,
            ),
          ),
          if (!unlocked) ...[
            const SizedBox(height: 14),
            if (!orlandoUnlocked)
              Text(
                l.paywallAddonRequiresOrlando,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: t.textMuted,
                ),
              )
            else
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: unlocking || onUnlock == null
                      ? null
                      : () => onUnlock!(offer.addonId),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: t.accent,
                    side: BorderSide(color: t.accent.withValues(alpha: 0.5)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: unlocking
                      ? SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: t.accent,
                          ),
                        )
                      : Text(
                          l.paywallUnlockAddon(title, offer.formattedPrice),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}

/// Focused pricing card when purchasing the theme-parks add-on.
class PaywallAddonPricingCard extends StatelessWidget {
  const PaywallAddonPricingCard({
    super.key,
    required this.offer,
    this.revealIndex = 4,
  });

  final PaywallAddonOffer offer;
  final int revealIndex;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final t = luxThemeTokensOf(context);
    final title = l.paywallAddonThemeParksTitle;

    return PaywallReveal(
      index: revealIndex,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              t.accent.withValues(alpha: 0.18),
              t.bgSecondary,
            ],
          ),
          border: Border.all(
            color: t.accent.withValues(alpha: 0.45),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l.paywallUnlockAddonPack(title),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: t.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l.paywallAddonThemeParksSubtitle,
              style: TextStyle(
                fontSize: 13,
                height: 1.45,
                color: t.textMuted,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  offer.formattedPrice,
                  style: TextStyle(
                    fontSize: 48,
                    height: 1,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1.5,
                    color: t.accent,
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
                      color: t.textMuted,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              l.paywallAddonRequiresOrlando,
              style: TextStyle(
                fontSize: 12,
                color: t.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
