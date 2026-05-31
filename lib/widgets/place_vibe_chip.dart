import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/place_vibe.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

String placeVibeLabel(AppLocalizations l, PlaceVibe vibe) => switch (vibe) {
      PlaceVibe.sunsetReady => l.vibeSunsetReady,
      PlaceVibe.viral => l.vibeViral,
      PlaceVibe.familyApproved => l.vibeFamilyApproved,
      PlaceVibe.hiddenGem => l.vibeHiddenGem,
      PlaceVibe.rainSafe => l.vibeRainSafe,
      PlaceVibe.dateNight => l.vibeDateNight,
      PlaceVibe.nightVibe => l.vibeNightVibe,
      PlaceVibe.foodie => l.vibeFoodie,
      PlaceVibe.luxury => l.vibeLuxury,
      PlaceVibe.trending => l.vibeTrending,
      PlaceVibe.live => l.vibeLive,
      PlaceVibe.seasonal => l.vibeSeasonal,
      PlaceVibe.localPick => l.vibeLocalPick,
      PlaceVibe.adventure => l.vibeAdventure,
      PlaceVibe.wellness => l.vibeWellness,
      PlaceVibe.beachDay => l.vibeBeachDay,
      PlaceVibe.luxoraPick => l.vibeLuxoraPick,
    };

/// Compact mood chip for list cards — icon + short label.
class PlaceVibeChip extends StatelessWidget {
  const PlaceVibeChip({
    super.key,
    required this.vibe,
    this.compact = false,
  });

  final PlaceVibe vibe;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final color = vibe.accentColor(context);
    final label = placeVibeLabel(l, vibe);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 7 : 9,
        vertical: compact ? 4 : 5,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.38)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(vibe.icon, size: compact ? 11 : 13, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: compact ? 10 : 11,
              fontWeight: FontWeight.w700,
              color: color.withValues(alpha: 0.95),
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}

/// Row of vibe chips — capped for scan-friendly cards.
class PlaceVibeChipRow extends StatelessWidget {
  const PlaceVibeChipRow({
    super.key,
    required this.vibes,
    this.maxChips = 4,
    this.compact = false,
    this.spacing = 6,
    this.runSpacing = 6,
  });

  final List<PlaceVibe> vibes;
  final int maxChips;
  final bool compact;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    if (vibes.isEmpty) return const SizedBox.shrink();
    final visible = vibes.take(maxChips).toList();
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: [
        for (final vibe in visible)
          PlaceVibeChip(vibe: vibe, compact: compact),
      ],
    );
  }
}

/// Tiny Luxora score-style badge for editorial picks.
class LuxoraPickBadge extends StatelessWidget {
  const LuxoraPickBadge({super.key, this.compact = true});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 7 : 9,
        vertical: compact ? 3 : 4,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            LuxColors.gold.withValues(alpha: 0.22),
            LuxColors.gold.withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.45)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            size: compact ? 11 : 12,
            color: LuxColors.gold,
          ),
          const SizedBox(width: 4),
          Text(
            l.vibeLuxoraPick,
            style: TextStyle(
              fontSize: compact ? 9 : 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
              color: LuxColors.gold.withValues(alpha: 0.95),
            ),
          ),
        ],
      ),
    );
  }
}
