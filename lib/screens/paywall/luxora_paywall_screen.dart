import 'package:flutter/material.dart';
import 'package:luxora_ai/data/iap_product_catalog.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/paywall/paywall_addon_offer.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/services/iap_purchase_service.dart';
import 'package:luxora_ai/services/paywall_personalization.dart';
import 'package:luxora_ai/services/paywall_bypass.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/iap_user_messages.dart';
import 'package:luxora_ai/widgets/city_destination_picker.dart';
import 'package:luxora_ai/widgets/paywall/paywall_compact_body.dart';
import 'package:luxora_ai/widgets/paywall/paywall_cta.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

/// Full-screen paywall — single view for App Store screenshots and unlock flow.
class LuxoraPaywallScreen extends StatefulWidget {
  const LuxoraPaywallScreen({
    super.key,
    required this.cityId,
    this.addonId,
    this.contextHeadline,
  });

  final String cityId;
  final String? addonId;
  final String? contextHeadline;

  @override
  State<LuxoraPaywallScreen> createState() => _LuxoraPaywallScreenState();
}

class _LuxoraPaywallScreenState extends State<LuxoraPaywallScreen> {
  late PaywallCityOffer _offer;
  late PaywallPersona _persona;
  PaywallAddonOffer? _addonOffer;
  bool _unlocking = false;
  bool _restoring = false;

  bool get _addonFocus =>
      _addonOffer != null && PaywallService.isOrlandoAddon(_addonOffer!.addonId);

  @override
  void initState() {
    super.initState();
    _offer = PaywallService.offerForCity(widget.cityId);
    _persona = PaywallService.personaForCurrentTrip();
    if (PaywallService.isOrlandoAddon(widget.addonId)) {
      _addonOffer = null;
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
    if (!PaywallService.hasStoreListing(_offer.cityId)) {
      showIapSnackBar(context, context.l10n.paywallProductUnavailable);
      return;
    }
    setState(() => _unlocking = true);
    try {
      final outcome = await PaywallService.purchaseCityPack(_offer.cityId);
      if (!mounted) return;
      if (outcome == IapPurchaseOutcome.success ||
          outcome == IapPurchaseOutcome.alreadyOwned) {
        if (mounted) Navigator.of(context).pop(true);
        return;
      }
      if (outcome != IapPurchaseOutcome.pending) {
        showIapSnackBar(context, iapPurchaseMessage(context.l10n, outcome));
      }
    } finally {
      if (mounted) setState(() => _unlocking = false);
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
      final outcome = await PaywallService.purchaseAddon(addon.addonId);
      if (!mounted) return;
      if (outcome == IapPurchaseOutcome.success ||
          outcome == IapPurchaseOutcome.alreadyOwned) {
        Navigator.of(context).pop(true);
        return;
      }
      if (outcome != IapPurchaseOutcome.pending) {
        showIapSnackBar(context, iapPurchaseMessage(context.l10n, outcome));
      }
    } finally {
      if (mounted) setState(() => _unlocking = false);
    }
  }

  Future<void> _restorePurchases() async {
    if (_restoring || _unlocking) return;
    if (PaywallBypass.forcePreviewMode) {
      showIapSnackBar(context, context.l10n.paywallRestorePreviewDisabled);
      return;
    }
    setState(() => _restoring = true);
    try {
      final outcome = await PaywallService.restorePurchases();
      if (!mounted) return;
      showIapSnackBar(context, iapRestoreMessage(context.l10n, outcome));
      if (outcome == IapRestoreOutcome.restored) {
        setState(() {});
        if (!_addonFocus && !PaywallService.needsUnlock(_offer.cityId)) {
          Navigator.of(context).pop(true);
        }
      }
    } finally {
      if (mounted) setState(() => _restoring = false);
    }
  }

  Future<void> _switchCity(String cityId) async {
    if (CityDestinationPicker.isThemeParksPickerValue(cityId)) {
      cityId = OrlandoAddonCatalog.parentCityId;
    }
    if (!PaywallBypass.forcePreviewMode &&
        !PaywallService.needsUnlock(cityId)) {
      await CityPackSync.switchCity(cityId);
      if (mounted) Navigator.of(context).pop(true);
      return;
    }
    setState(() {
      _offer = PaywallService.offerForCity(cityId);
      _addonOffer = null;
    });
  }

  void _continueExploring() {
    Navigator.of(context).pop(false);
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
    final headline = widget.contextHeadline ?? _headline(l);
    final heroId = _heroPhotoId();
    final preview = PaywallBypass.forcePreviewMode;
    final cityLocked =
        preview || PaywallService.needsUnlock(_offer.cityId);
    final addonLocked = _addonFocus &&
        _addonOffer != null &&
        (preview || PaywallService.needsAddonUnlock(_addonOffer!.addonId));
    final priceLabel =
        PaywallService.storePriceForCity(_offer.cityId) ?? _offer.formattedPrice;

    return Scaffold(
      backgroundColor: t.bg,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!_addonFocus)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CityDestinationPicker(
                        label: l.paywallUnlockingDestination,
                        selectedCityId: _offer.cityId,
                        limitedCityIds: IapProductCatalog.launchCityIds,
                        showUnlockStatus: false,
                        onChanged: _switchCity,
                      ),
                    ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: ListenableBuilder(
                        listenable: IapPurchaseService.instance,
                        builder: (context, _) {
                          return PaywallCompactBody(
                            offer: _offer,
                            headline: headline,
                            heroPhotoId: heroId,
                            priceLabel: priceLabel,
                            addonOffer: _addonOffer,
                            addonFocus: _addonFocus,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (_addonFocus && addonLocked && _addonOffer != null)
                    PaywallAddonCTA(
                      packName: l.paywallAddonThemeParksTitle,
                      onUnlock: _unlockFocusedAddon,
                      onContinue: _continueExploring,
                      isLoading: _unlocking,
                    )
                  else if (cityLocked)
                    PaywallCTA(
                      offer: _offer,
                      onUnlock: _unlockCity,
                      onContinue: _continueExploring,
                      onRestore: preview ? null : _restorePurchases,
                      isLoading: _unlocking,
                      isRestoring: _restoring,
                      revealIndex: 0,
                    ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 12,
              child: LuxSheetCloseButton(
                color: LuxColors.cream,
                background: Colors.black.withValues(alpha: 0.35),
                onClose: _continueExploring,
              ),
            ),
          ],
        ),
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
  });

  final String packName;
  final VoidCallback onUnlock;
  final VoidCallback onContinue;
  final bool isLoading;

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
              padding: const EdgeInsets.symmetric(vertical: 16),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: isLoading ? null : onContinue,
          child: Text(l.paywallContinueExploring),
        ),
      ],
    );
  }
}
