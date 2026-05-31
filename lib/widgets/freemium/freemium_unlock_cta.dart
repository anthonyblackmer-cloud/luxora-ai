import 'package:flutter/material.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/freemium_limits.dart';
import 'package:luxora_ai/services/freemium_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';

/// Locked preview row — shows what exists without giving full access.
class FreemiumUnlockCta extends StatelessWidget {
  const FreemiumUnlockCta({
    super.key,
    required this.trigger,
    required this.lockedCount,
    this.cityId,
  });

  final FreemiumUnlockTrigger trigger;
  final int lockedCount;
  final String? cityId;

  @override
  Widget build(BuildContext context) {
    if (FreemiumService.hasFullAccess(cityId) || lockedCount <= 0) {
      return const SizedBox.shrink();
    }

    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final cityName =
        PaywallCatalog.offerFor(cityId ?? CityPackRegistry.instance.active.cityId)
            .cityName;
    final lockLine = switch (trigger) {
      FreemiumUnlockTrigger.hotelsPreview =>
        l.freemiumLockedHotels(lockedCount),
      FreemiumUnlockTrigger.restaurantsPreview =>
        l.freemiumLockedRestaurants(lockedCount),
      FreemiumUnlockTrigger.hiddenGemsPreview =>
        l.freemiumLockedGems(lockedCount),
      FreemiumUnlockTrigger.localSecretsPreview =>
        l.freemiumLockedSecrets(lockedCount),
      FreemiumUnlockTrigger.experiencesPreview =>
        l.freemiumLockedExperiences(lockedCount),
      FreemiumUnlockTrigger.attractionsPreview => l.freemiumLockedAttractions,
      _ => l.freemiumLockedAttractions,
    };

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: GlassCard(
        glow: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              lockLine,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: tokens.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l.freemiumUnlockExplore(cityName),
              style: TextStyle(
                fontSize: 13,
                height: 1.35,
                color: tokens.textMuted,
              ),
            ),
            const SizedBox(height: 12),
            LuxButton(
              label: l.freemiumUnlockConcierge(cityName),
              icon: Icons.lock_open_rounded,
              onPressed: () => FreemiumService.promptUnlock(
                context,
                trigger: trigger,
                cityId: cityId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
