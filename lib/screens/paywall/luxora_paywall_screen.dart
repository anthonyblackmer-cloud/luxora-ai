import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/paywall/paywall_city_offer.dart';
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
import 'package:luxora_ai/widgets/paywall/paywall_pricing_card.dart';
import 'package:luxora_ai/widgets/paywall/paywall_social_proof.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

/// Full-screen cinematic paywall — unlock a personal concierge, not software.
class LuxoraPaywallScreen extends StatefulWidget {
  const LuxoraPaywallScreen({super.key, required this.cityId});

  final String cityId;

  @override
  State<LuxoraPaywallScreen> createState() => _LuxoraPaywallScreenState();
}

class _LuxoraPaywallScreenState extends State<LuxoraPaywallScreen> {
  late PaywallCityOffer _offer;
  late PaywallPersona _persona;
  bool _unlocking = false;

  @override
  void initState() {
    super.initState();
    _offer = PaywallService.offerForCity(widget.cityId);
    _persona = PaywallService.personaForCurrentTrip();
  }

  Future<void> _unlock() async {
    if (_unlocking) return;
    setState(() => _unlocking = true);
    try {
      await PaywallService.completeUnlock(_offer.cityId);
      if (mounted) context.pop(true);
    } finally {
      if (mounted) setState(() => _unlocking = false);
    }
  }

  Future<void> _switchCity(String cityId) async {
    if (!PaywallService.needsUnlock(cityId)) {
      await CityPackSync.switchCity(cityId);
      if (mounted) context.pop(true);
      return;
    }
    setState(() => _offer = PaywallService.offerForCity(cityId));
  }

  void _continueExploring() {
    context.pop(false);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final headline = PaywallPersonalization.headline(
      l,
      _persona,
      _offer.cityName,
      cityId: _offer.cityId,
    );
    final heroId = _offer.heroForPersona(_persona);

    return Scaffold(
      backgroundColor: LuxColors.bg,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
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
                  key: ValueKey(_offer.cityId),
                  heroPhotoId: heroId,
                  headline: headline,
                  subheadline: l.paywallHeroSubheadline,
                  emotionalLine: l.paywallEmotionalLine,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    PaywallFeatureGrid(revealIndex: 1),
                    const SizedBox(height: 28),
                    PaywallBenefitCards(revealIndex: 2),
                    const SizedBox(height: 28),
                    PaywallLockedPreview(revealIndex: 3),
                    const SizedBox(height: 28),
                    PaywallPricingCard(offer: _offer, revealIndex: 4),
                    const SizedBox(height: 28),
                    PaywallSocialProof(revealIndex: 5),
                    const SizedBox(height: 28),
                    PaywallCTA(
                      offer: _offer,
                      onUnlock: _unlock,
                      onContinue: _continueExploring,
                      isLoading: _unlocking,
                      revealIndex: 6,
                    ),
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: PaywallStickyCTA(
              offer: _offer,
              onUnlock: _unlock,
              isLoading: _unlocking,
            ),
          ),
        ],
      ),
    );
  }
}
