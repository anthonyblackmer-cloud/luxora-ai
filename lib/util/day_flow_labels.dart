import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';

IconData dayFlowPhaseIcon(DayPhase phase) => switch (phase) {
      DayPhase.morning => Icons.wb_twilight_rounded,
      DayPhase.midday => Icons.wb_sunny_rounded,
      DayPhase.afternoon => Icons.beach_access_rounded,
      DayPhase.evening => Icons.restaurant_rounded,
      DayPhase.night => Icons.nightlife_rounded,
    };

String dayFlowPhaseLabel(AppLocalizations l, DayPhase phase) => switch (phase) {
      DayPhase.morning => l.dayFlowMorning,
      DayPhase.midday => l.dayFlowMidday,
      DayPhase.afternoon => l.dayFlowAfternoon,
      DayPhase.evening => l.dayFlowEvening,
      DayPhase.night => l.dayFlowNight,
    };

String dayFlowReasonLabel(AppLocalizations l, DayBlockReason reason) =>
    switch (reason) {
      DayBlockReason.morningPool => l.dayFlowReasonMorningPool,
      DayBlockReason.morningCalm => l.dayFlowReasonMorningCalm,
      DayBlockReason.middayAdventure => l.dayFlowReasonMiddayAdventure,
      DayBlockReason.middayCulture => l.dayFlowReasonMiddayCulture,
      DayBlockReason.middayIcon => l.dayFlowReasonMiddayIcon,
      DayBlockReason.afternoonDowntime => l.dayFlowReasonAfternoonDowntime,
      DayBlockReason.afternoonGem => l.dayFlowReasonAfternoonGem,
      DayBlockReason.eveningDining => l.dayFlowReasonEveningDining,
      DayBlockReason.nightOut => l.dayFlowReasonNightOut,
    };

String dayFlowVibeLabel(AppLocalizations l, DayInterest interest) =>
    switch (interest) {
      DayInterest.foodie => l.dayFlowVibeFoodie,
      DayInterest.nightlife => l.dayFlowVibeNightlife,
      DayInterest.poolside => l.dayFlowVibePoolside,
      DayInterest.adventure => l.dayFlowVibeAdventure,
      DayInterest.culture => l.dayFlowVibeCulture,
    };

List<String> dayFlowShareLines(BuildContext context, DayFlow flow) {
  final l = context.l10n;
  return [
    for (final block in flow.blocks)
      '${dayFlowPhaseLabel(l, block.phase)} · '
      '${catalogText(context, block.place.title)} — '
      '${dayFlowReasonLabel(l, block.reason)}',
  ];
}
