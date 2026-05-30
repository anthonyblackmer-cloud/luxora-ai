import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/drive_friction_service.dart';
import 'package:luxora_ai/util/day_flow_labels.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:luxora_ai/widgets/luxora_branded_share_card.dart';
import 'package:luxora_ai/widgets/luxora_share_section.dart';
import 'package:luxora_ai/widgets/travel_stop_intel_card.dart';

String dayFlowTimeLabel(BuildContext context, DayPhase phase) {
  final at = CrowdPredictionService.timeForPhase(phase);
  final locale = Localizations.localeOf(context).toString();
  return DateFormat.jm(locale).format(at);
}

List<LuxoraShareSection> dayFlowShareSections(
  BuildContext context,
  DayFlow flow,
) {
  final l = context.l10n;
  final sections = <LuxoraShareSection>[];

  for (final (index, block) in flow.blocks.indexed) {
    final legOrigin = index == 0
        ? flow.start
        : LatLng(
            flow.blocks[index - 1].place.latitude,
            flow.blocks[index - 1].place.longitude,
          );
    final at = CrowdPredictionService.timeForPhase(block.phase);
    final friction = DriveFrictionService.scoreForLeg(
      from: legOrigin,
      to: block.place,
      atLocal: at,
    );
    final intelLines = travelStopIntelLines(
      l,
      place: block.place,
      atLocal: at,
      driveFriction: friction,
    );

    final lines = <String>[
      dayFlowReasonLabel(l, block.reason),
    ];

    if (index > 0) {
      final legMiles = PlaceDistance.milesBetween(
        legOrigin,
        LatLng(block.place.latitude, block.place.longitude),
      );
      lines.add(
        l.shareDayLegDrive(
          PlaceDistance.driveTimeLabel(legMiles),
          PlaceDistance.milesLabel(legMiles),
        ),
      );
    }

    lines.addAll(intelLines);

    sections.add(
      LuxoraShareSection(
        heading:
            '${dayFlowTimeLabel(context, block.phase)} · ${dayFlowPhaseLabel(l, block.phase)}',
        body: catalogText(context, block.place.title),
        lines: lines,
      ),
    );
  }

  return sections;
}

Widget buildDayAgendaShareCard(BuildContext context, DayFlow flow) {
  final l = context.l10n;
  final chips = [
    for (final e in flow.emphases) dayFlowVibeLabel(l, e),
  ];
  final summary = l.mapPlanDaySummary(
    flow.stopCount,
    flow.milesLabel,
    flow.driveTimeLabel,
  );
  final subtitleParts = <String>[l.dayFlowSubtitle, summary];
  if (flow.homeBase != null) {
    subtitleParts.add(
      l.mapPlanDayHomeBase(catalogText(context, flow.homeBase!.title)),
    );
  }

  return LuxoraBrandedShareCard(
    title: l.mapPlanDayTitle,
    subtitle: subtitleParts.join(' · '),
    chips: chips,
    sections: dayFlowShareSections(context, flow),
  );
}
