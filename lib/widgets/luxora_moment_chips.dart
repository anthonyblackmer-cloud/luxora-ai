import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Feeling-first search chips — Luxora Moments brand layer.
class LuxoraMomentChips extends StatelessWidget {
  const LuxoraMomentChips({
    super.key,
    required this.onMomentSelected,
  });

  final ValueChanged<String> onMomentSelected;

  static const _moments = [
    _Moment('momentFeelRelaxed', Icons.spa_rounded),
    _Moment('momentImpressSpouse', Icons.favorite_rounded),
    _Moment('momentPerfectSunset', Icons.wb_twilight_rounded),
    _Moment('momentFamilyMemory', Icons.family_restroom_rounded),
    _Moment('momentLuxuryValue', Icons.diamond_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.momentsTitle,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: LuxColors.gold.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l.momentsSubtitle,
          style: const TextStyle(fontSize: 12, color: LuxColors.stone400),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final m in _moments)
              ActionChip(
                avatar: Icon(m.icon, size: 16, color: LuxColors.gold),
                label: Text(_label(l, m.key), style: const TextStyle(fontSize: 12)),
                backgroundColor: Colors.white.withValues(alpha: 0.06),
                side: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
                onPressed: () => onMomentSelected(_prompt(l, m.key)),
              ),
          ],
        ),
      ],
    );
  }

  String _label(dynamic l, String key) => switch (key) {
        'momentFeelRelaxed' => l.momentFeelRelaxed,
        'momentImpressSpouse' => l.momentImpressSpouse,
        'momentPerfectSunset' => l.momentPerfectSunset,
        'momentFamilyMemory' => l.momentFamilyMemory,
        'momentLuxuryValue' => l.momentLuxuryValue,
        _ => key,
      };

  String _prompt(dynamic l, String key) => switch (key) {
        'momentFeelRelaxed' => l.momentPromptRelaxed,
        'momentImpressSpouse' => l.momentPromptImpressSpouse,
        'momentPerfectSunset' => l.momentPromptPerfectSunset,
        'momentFamilyMemory' => l.momentPromptFamilyMemory,
        'momentLuxuryValue' => l.momentPromptLuxuryValue,
        _ => '',
      };
}

class _Moment {
  const _Moment(this.key, this.icon);
  final String key;
  final IconData icon;
}
