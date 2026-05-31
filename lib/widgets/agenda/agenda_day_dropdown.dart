import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/widgets/agenda/agenda_compact_dropdown.dart';

/// Switches which day is shown on Agenda — replaces horizontal day tabs.
class AgendaDayDropdown extends StatelessWidget {
  const AgendaDayDropdown({
    super.key,
    required this.days,
    required this.selectedIndex,
    required this.onChanged,
    this.onLockedDaySelected,
    this.lockedDayIndices = const {},
  });

  final List<TripDay> days;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final ValueChanged<int>? onLockedDaySelected;
  final Set<int> lockedDayIndices;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    if (days.isEmpty) return const SizedBox.shrink();

    final safeIndex = selectedIndex.clamp(0, days.length - 1);
    final selectedDay = days[safeIndex];

    String dayLabel(TripDay day, int index) {
      final base = l.itineraryDayTab(day.dayNumber, day.label);
      if (lockedDayIndices.contains(index)) return '🔒 $base';
      if (index == 0 && lockedDayIndices.isNotEmpty) return '✓ $base';
      return base;
    }

    return AgendaCompactDropdown(
      prominent: true,
      label: l.agendaDaySelectLabel,
      icon: Icons.calendar_today_rounded,
      value: '${selectedDay.dayNumber}',
      selectedItemBuilder: (context) => [
        for (var i = 0; i < days.length; i++)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              dayLabel(days[i], i),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
      ],
      items: [
        for (var i = 0; i < days.length; i++)
          DropdownMenuItem(
            value: '${days[i].dayNumber}',
            child: Text(
              dayLabel(days[i], i),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
      onChanged: (value) {
        if (value == null) return;
        final dayNum = int.tryParse(value);
        if (dayNum == null) return;
        final index = days.indexWhere((d) => d.dayNumber == dayNum);
        if (index < 0) return;
        if (lockedDayIndices.contains(index)) {
          onLockedDaySelected?.call(index);
          return;
        }
        onChanged(index);
      },
    );
  }
}
