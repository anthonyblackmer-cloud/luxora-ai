import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/paywall/paywall_addon_offer.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/services/paywall_personalization.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/city_destination_picker.dart';
import 'package:luxora_ai/widgets/paywall/paywall_benefit_cards.dart';
import 'package:luxora_ai/widgets/paywall/paywall_cta.dart';
import 'package:luxora_ai/widgets/paywall/paywall_feature_grid.dart';
import 'package:luxora_ai/widgets/paywall/paywall_hero.dart';
import 'package:luxora_ai/widgets/paywall/paywall_locked_preview.dart';
import 'package:luxora_ai/widgets/paywall/paywall_orlando_addon_section.dart';
import 'package:luxora_ai/widgets/paywall/paywall_pricing_card.dart';
import 'package:luxora_ai/widgets/paywall/paywall_social_proof.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

/// Full-screen cinematic paywall — unlock a personal concierge, not software.
class LuxoraPaywallScreen extends StatefulWidget {
  const LuxoraPaywallScreen({
    super.key,
    required this.cityId,
    this.addonId,
  });

  final String cityId;
  final String? addonId;

  @override
  State<LuxoraPaywallScreen> createState() => _LuxoraPaywallScreenState();
}

class _LuxoraPaywallScreenState extends State<LuxoraPaywallScreen> {
  late PaywallCityOffer _offer;
  late PaywallPersona _persona;
  PaywallAddonOffer? _addonOffer;
  bool _unlocking = false;
  bool _unlockingAddon = false;

  bool get _addonFocus =>
      _addonOffer != null && PaywallService.isOrlandoAddon(_addonOffer!.addonId);

  bool get _showOrlandoAddons =>
      _offer.cityId == OrlandoAddonCatalog.parentCityId && !_addonFocus;

  @override
  void initState() {
    super.initState();
    _offer = PaywallService.offerForCity(widget.cityId);
    _persona = PaywallService.personaForCurrentTrip();
    if (PaywallService.isOrlandoAddon(widget.addonId)) {
      _addonOffer = PaywallService.addonOfferFor(widget.addonId!);
    }
    CityPackEntitlementStore.instance.addListener(_onEntitlementsChanged);
  }

  @override
  void dispose() {
    CityPackEntitlementStore.instance.removeListener(_onEntitlementsChanged);
    super.dispose();
  }

  void _onEntitlementsChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _unlockCity() async {
    if (_unlocking) return;
    setState(() => _unlocking = true);
    try {
      await PaywallService.completeUnlock(_offer.cityId);
      if (!mounted) return;
      if (_offer.cityId == OrlandoAddonCatalog.parentCityId) {
        await PaywallService.promptOrlandoThemeParksIfNeeded(context);
      }
      if (mounted) context.pop(true);
    } finally {
      if (mounted) setState(() => _unlocking = false);
    }
  }

  Future<void> _unlockAddon(String addonId) async {
    if (_unlockingAddon) return;
    if (!CityPackEntitlementStore.instance
        .isUnlocked(OrlandoAddonCatalog.parentCityId)) {
      return;
    }
    setState(() => _unlockingAddon = true);
    try {
      await PaywallService.completeAddonUnlock(addonId);
      if (mounted) setState(() {});
    } finally {
      if (mounted) setState(() => _unlockingAddon = false);
    }
  }

  Future<void> _unlockFocusedAddon() async {
    final addon = _addonOffer;
    if (addon == null || _unlocking) return;
    if (!CityPackEntitlementStore.instance
        .isUnlocked(OrlandoAddonCatalog.parentCityId)) {
      return;
    }
    setState(() => _unlocking = true);
    try {
      await PaywallService.completeAddonUnlock(addon.addonId);
      if (mounted) context.pop(true);
    } finally {
      if (mounted) setState(() => _unlocking = false);
    }
  }

  Future<void> _switchCity(String cityId) async {
    if (CityDestinationPicker.isThemeParksPickerValue(cityId)) {
      setState(() {
        _offer = PaywallService.offerForCity(OrlandoAddonCatalog.parentCityId);
        _addonOffer = PaywallService.addonOfferFor(cityId);
      });
      return;
    }
    if (!PaywallService.needsUnlock(cityId)) {
      await CityPackSync.switchCity(cityId);
      if (!mounted) return;
      if (cityId == OrlandoAddonCatalog.parentCityId) {
        await PaywallService.promptOrlandoThemeParksIfNeeded(context);
      }
      if (mounted) context.pop(true);
      return;
    }
    setState(() {
      _offer = PaywallService.offerForCity(cityId);
      _addonOffer = null;
    });
  }

  void _continueExploring() {
    context.pop(false);
  }

  String _headline(dynamic l) {
    if (_addonFocus && _addonOffer != null) {
      return l.paywallAddonThemeParksTitle;
    }
    return PaywallPersonalization.headline(
      l,
      _persona,
      _offer.cityName,
      cityId: _offer.cityId,
    );
  }

  String _heroPhotoId() {
    if (_addonFocus && _addonOffer != null) {
      return _addonOffer!.heroUnsplashId;
    }
    return _offer.heroForPersona(_persona);
  }

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final l = context.l10n;
    final headline = _headline(l);
    final heroId = _heroPhotoId();
    final cityLocked = PaywallService.needsUnlock(_offer.cityId);
    final addonLocked = _addonFocus &&
        _addonOffer != null &&
        PaywallService.needsAddonUnlock(_addonOffer!.addonId);

    return Scaffold(
      backgroundColor: t.bg,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              if (!_addonFocus)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 56, 20, 0),
                    child: CityDestinationPicker(
                      label: l.paywallSwitchCity,
                      selectedCityId: _offer.cityId,
                      onChanged: _switchCity,
                    ),
                  ),
                ),
              SliverToBoxAdapter(
                child: PaywallHero(
                  key: ValueKey('$_addonFocus-${_offer.cityId}-$heroId'),
                  heroPhotoId: heroId,
                  headline: headline,
                  subheadline: _addonFocus
                      ? l.paywallOrlandoAddonsHeading
                      : l.paywallHeroSubheadline,
                  emotionalLine: l.paywallEmotionalLine,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    if (!_addonFocus) ...[
                      PaywallFeatureGrid(revealIndex: 1),
                      const SizedBox(height: 28),
                      PaywallBenefitCards(revealIndex: 2),
                      const SizedBox(height: 28),
                      PaywallLockedPreview(revealIndex: 3),
                      const SizedBox(height: 28),
                    ],
                    if (_addonFocus && _addonOffer != null)
                      PaywallAddonPricingCard(
                        offer: _addonOffer!,
                        revealIndex: 1,
                      )
                    else if (cityLocked)
                      PaywallPricingCard(offer: _offer, revealIndex: 4),
                    if (_showOrlandoAddons) ...[
                      const SizedBox(height: 28),
                      PaywallOrlandoAddonSection(
                        revealIndex: 5,
                        unlocking: _unlockingAddon,
                        onAddonUnlock: _unlockAddon,
                      ),
                    ],
                    if (!_addonFocus) ...[
                      const SizedBox(height: 28),
                      PaywallSocialProof(revealIndex: 6),
                      const SizedBox(height: 28),
                      PaywallCTA(
                        offer: _offer,
                        onUnlock: _unlockCity,
                        onContinue: _continueExploring,
                        isLoading: _unlocking,
                        revealIndex: 7,
                      ),
                    ] else if (addonLocked && _addonOffer != null) ...[
                      const SizedBox(height: 28),
                      PaywallAddonCTA(
                        packName: l.paywallAddonThemeParksTitle,
                        onUnlock: _unlockFocusedAddon,
                        onContinue: _continueExploring,
                        isLoading: _unlocking,
                        revealIndex: 2,
                      ),
                    ],
                  ]),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.paddingOf(context).top + 8,
            right: 12,
            child: LuxSheetCloseButton(
              color: LuxColors.cream,
              background: Colors.black.withValues(alpha: 0.35),
              onClose: _continueExploring,
            ),
          ),
          if (!_addonFocus && cityLocked)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: PaywallStickyCTA(
                offer: _offer,
                onUnlock: _unlockCity,
                isLoading: _unlocking,
              ),
            ),
        ],
      ),
    );
  }
}

class PaywallAddonCTA extends StatelessWidget {
  const PaywallAddonCTA({
    super.key,
    required this.packName,
    required this.onUnlock,
    required this.onContinue,
    this.isLoading = false,
    this.revealIndex = 2,
  });

  final String packName;
  final VoidCallback onUnlock;
  final VoidCallback onContinue;
  final bool isLoading;
  final int revealIndex;

  @override
  Widget build(BuildContext context) {
    final t = luxThemeTokensOf(context);
    final l = context.l10n;
    final orlandoUnlocked = CityPackEntitlementStore.instance
        .isUnlocked(OrlandoAddonCatalog.parentCityId);

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: isLoading || !orlandoUnlocked ? null : onUnlock,
            style: FilledButton.styleFrom(
              backgroundColor: t.accent,
              foregroundColor: t.onAccent,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: isLoading
                ? SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: t.onAccent,
                    ),
                  )
                : Text(
                    orlandoUnlocked
                        ? l.paywallCtaUnlockAddon(packName)
                        : l.paywallAddonRequiresOrlando,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 14),
        TextButton(
          onPressed: isLoading ? null : onContinue,
          child: Text(l.paywallContinueExploring),
        ),
      ],
    );
  }
}
