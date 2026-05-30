import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Chip row: travel distance from Orlando hub.
class DiscoverRadiusSelector extends StatelessWidget {
  const DiscoverRadiusSelector({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: DiscoverRadiusController.instance,
      builder: (context, _) {
        final selected = DiscoverRadiusController.instance.radius;
        final l = context.l10n;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!compact) ...[
              Row(
                children: [
                  Icon(
                    Icons.near_me_rounded,
                    size: 16,
                    color: LuxColors.gold.withValues(alpha: 0.9),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    l.discoverFromActiveHub(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: LuxColors.gold.withValues(alpha: 0.95),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                selected.descriptionL10n(l),
                style: const TextStyle(
                  fontSize: 11,
                  color: LuxColors.stone500,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 10),
            ],
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final option in DiscoverRadius.values)
                  ChoiceChip(
                    label: Text(option.shortLabelL10n(l)),
                    selected: selected == option,
                    onSelected: (_) =>
                        DiscoverRadiusController.instance.setRadius(option),
                    selectedColor: LuxColors.gold.withValues(alpha: 0.22),
                    backgroundColor: Colors.white.withValues(alpha: 0.04),
                    labelStyle: TextStyle(
                      fontSize: compact ? 11 : 12,
                      fontWeight: FontWeight.w600,
                      color: selected == option
                          ? LuxColors.cream
                          : LuxColors.stone400,
                    ),
                    side: BorderSide(
                      color: selected == option
                          ? LuxColors.gold.withValues(alpha: 0.55)
                          : Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
