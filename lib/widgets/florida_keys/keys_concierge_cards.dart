import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/florida_keys/keys_mood_route.dart';
import 'package:luxora_ai/models/florida_keys/keys_water_intelligence.dart';
import 'package:luxora_ai/services/florida_keys_concierge_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Water & reef intelligence for Florida Keys beach and snorkel pins.
class KeysWaterIntelCard extends StatelessWidget {
  const KeysWaterIntelCard({super.key, required this.intel});

  final KeysWaterIntelligence intel;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.keysWaterIntelTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: tokens.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.keysWaterBestTime(intel.bestTimeToVisit),
            style: TextStyle(fontSize: 13, color: tokens.textMuted),
          ),
          const SizedBox(height: 4),
          Text(
            l.keysWaterTemp(intel.waterTemperatureNote),
            style: TextStyle(fontSize: 12, color: tokens.textMuted),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ScoreChip(l.keysWaterSnorkelScore, intel.snorkelingQuality),
              _ScoreChip(l.keysWaterDivingScore, intel.divingConditions),
              _ScoreChip(l.keysWaterBoatingScore, intel.boatingSuitability),
              _ScoreChip(l.keysWaterFishingScore, intel.fishingOutlook),
              _ScoreChip(l.keysWaterWindScore, intel.windSensitivity),
              _ScoreChip(l.keysWaterSunsetScore, intel.sunsetQuality),
              _ScoreChip(l.keysWaterCrowdScore, intel.crowdLevel),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScoreChip extends StatelessWidget {
  const _ScoreChip(this.label, this.score);

  final String label;
  final int score;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: tokens.accent.withValues(alpha: 0.1),
        border: Border.all(color: tokens.accent.withValues(alpha: 0.22)),
      ),
      child: Text(
        '$label $score',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: tokens.textPrimary,
        ),
      ),
    );
  }
}

/// Horizontal mood route picker — Florida Keys pack only.
class KeysMoodRoutesPanel extends StatelessWidget {
  const KeysMoodRoutesPanel({
    super.key,
    this.onRouteSelected,
  });

  final void Function(KeysMoodRoute route)? onRouteSelected;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final routes = KeysMoodRouteService.routesForActive();
    if (routes.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Text(
            l.keysMoodRoutesTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: tokens.textPrimary,
            ),
          ),
        ),
        SizedBox(
          height: 132,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: routes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final route = routes[i];
              return GestureDetector(
                onTap: () => onRouteSelected?.call(route),
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        tokens.accent.withValues(alpha: 0.14),
                        tokens.bgSecondary,
                      ],
                    ),
                    border: Border.all(
                      color: tokens.accent.withValues(alpha: 0.22),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        route.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: tokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l.keysMoodRouteStart(route.bestStartTime),
                        style: TextStyle(fontSize: 11, color: tokens.textMuted),
                      ),
                      const Spacer(),
                      Text(
                        route.moodTags.take(3).join(' · '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: tokens.accent.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
