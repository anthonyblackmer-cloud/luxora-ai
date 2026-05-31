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
  });

  final List<TripDay> days;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    if (days.isEmpty) return const SizedBox.shrink();

    final safeIndex = selectedIndex.clamp(0, days.length - 1);
    final selectedDay = days[safeIndex];

    return AgendaCompactDropdown(
      label: l.agendaDaySelectLabel,
      icon: Icons.calendar_today_rounded,
      value: '${selectedDay.dayNumber}',
      items: [
        for (final day in days)
          DropdownMenuItem(
            value: '${day.dayNumber}',
            child: Text(
              l.itineraryDayTab(day.dayNumber, day.label),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
      onChanged: (value) {
        if (value == null) return;
        final dayNum = int.tryParse(value);
        if (dayNum == null) return;
        final index = days.indexWhere((d) => d.dayNumber == dayNum);
        if (index >= 0) onChanged(index);
      },
    );
  }
}
