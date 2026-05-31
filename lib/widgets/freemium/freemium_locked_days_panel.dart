import 'package:flutter/material.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/freemium_limits.dart';
import 'package:luxora_ai/services/freemium_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/util/traveler_name.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';

/// Shows Day 1 free + locked future days with visible premium value.
class FreemiumLockedDaysPanel extends StatelessWidget {
  const FreemiumLockedDaysPanel({
    super.key,
    required this.days,
    this.cityId,
    this.onLockedDayTap,
  });

  final List<TripDay> days;
  final String? cityId;
  final ValueChanged<int>? onLockedDayTap;

  @override
  Widget build(BuildContext context) {
    if (FreemiumService.hasFullAccess(cityId) || days.length <= 1) {
      return const SizedBox.shrink();
    }

    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final cityName =
        PaywallCatalog.offerFor(cityId ?? CityPackRegistry.instance.active.cityId)
            .cityName;
    final travelerName =
        TravelerNameDisplay.firstName(
          TripProfileStore.instance.profile.value?.travelerName,
        ) ??
            'friend';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l.paywallPersonalPitch(travelerName, cityName),
              style: TextStyle(
                fontSize: 13,
                height: 1.45,
                color: tokens.textMuted,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              l.freemiumVacationTitle(cityName),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: tokens.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            _Row(
              label: l.freemiumDay1Ready,
              locked: false,
              tokens: tokens,
            ),
            for (var i = 1; i < days.length; i++)
              _Row(
                label:
                    '🔒 ${FreemiumService.lockedRowLabel(l, days[i].dayNumber)}',
                locked: true,
                tokens: tokens,
                onTap: onLockedDayTap == null ? null : () => onLockedDayTap!(i),
              ),
            const SizedBox(height: 12),
            LuxButton(
              label: l.freemiumUnlockFullPlan,
              icon: Icons.auto_awesome_rounded,
              onPressed: () => FreemiumService.promptUnlock(
                context,
                trigger: FreemiumUnlockTrigger.fullItinerary,
                cityId: cityId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.locked,
    required this.tokens,
    this.onTap,
  });

  final String label;
  final bool locked;
  final LuxThemeTokens tokens;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      label,
      style: TextStyle(
        fontSize: 13,
        fontWeight: locked ? FontWeight.w600 : FontWeight.w700,
        color: locked ? tokens.textMuted : tokens.accent,
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: onTap == null
          ? text
          : Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Expanded(child: text),
                      Icon(
                        Icons.lock_outline_rounded,
                        size: 16,
                        color: tokens.textMuted.withValues(alpha: 0.85),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
