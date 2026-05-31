import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/freemium_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Day picker shown under map chips when Itinerary mode is on.
class MapItineraryDayPicker extends StatelessWidget {
  const MapItineraryDayPicker({
    super.key,
    required this.days,
    required this.followCurrentDay,
    required this.selectedDayIndex,
    required this.currentDayIndex,
    required this.onFollowCurrentDay,
    required this.onDaySelected,
  });

  final List<TripDay> days;
  final bool followCurrentDay;
  final int selectedDayIndex;
  final int currentDayIndex;
  final VoidCallback onFollowCurrentDay;
  final ValueChanged<int> onDaySelected;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    if (days.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l.mapItineraryDayLabel,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.4,
                color: tokens.accent.withValues(alpha: 0.85),
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _DayChip(
                    label: l.mapItineraryCurrentDay,
                    selected: followCurrentDay,
                    onTap: onFollowCurrentDay,
                  ),
                  for (var i = 0; i < days.length; i++) ...[
                    const SizedBox(width: 8),
                    _DayChip(
                      label: catalogText(
                        context,
                        l.itineraryDayTab(days[i].dayNumber, days[i].label),
                      ),
                      selected: !followCurrentDay && selectedDayIndex == i,
                      locked: !FreemiumService.canAccessDay(i),
                      onTap: () => onDaySelected(i),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DayChip extends StatelessWidget {
  const _DayChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.locked = false,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    final display = locked ? '🔒 $label' : label;

    return FilterChip(
      selected: selected,
      showCheckmark: false,
      label: Text(
        display,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: selected ? tokens.onAccent : tokens.textPrimary,
        ),
      ),
      selectedColor: LuxColors.gold.withValues(alpha: 0.88),
      backgroundColor: tokens.panelFill,
      side: BorderSide(
        color: selected
            ? LuxColors.gold.withValues(alpha: 0.6)
            : tokens.borderSubtle,
      ),
      onSelected: (_) => onTap(),
    );
  }
}
