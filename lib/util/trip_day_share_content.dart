import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/widgets/luxora_branded_share_card.dart';
import 'package:luxora_ai/widgets/luxora_share_section.dart';

List<LuxoraShareSection> tripDayShareSections(
  BuildContext context,
  TripDay day,
) {
  final sections = <LuxoraShareSection>[];

  for (final item in day.items) {
    final lines = <String>[];
    if (item.emotionalLine.trim().isNotEmpty) {
      lines.add(catalogText(context, item.emotionalLine));
    }
    final location = catalogText(context, item.location);
    final category = catalogText(context, item.category);
    if (location.isNotEmpty || category.isNotEmpty) {
      lines.add(
        [location, category].where((part) => part.isNotEmpty).join(' · '),
      );
    }

    sections.add(
      LuxoraShareSection(
        heading: item.time,
        body: catalogText(context, item.title),
        lines: lines,
      ),
    );
  }

  return sections;
}

String tripDayShareSubject(
  BuildContext context,
  TripPlan plan,
  TripDay day,
) {
  final l = context.l10n;
  final title = catalogText(context, plan.title);
  return l.shareSubject('$title · ${l.todayDayHeading(day.dayNumber)}');
}

String tripDayShareText(
  BuildContext context,
  TripPlan plan,
  TripDay day,
) {
  final l = context.l10n;
  final title = catalogText(context, plan.title);
  final lines = <String>[
    '\u2728 $title',
    '${l.todayDayHeading(day.dayNumber)} · ${catalogText(context, day.label)}',
    '',
  ];

  for (final item in day.items) {
    lines.add('${item.time} — ${catalogText(context, item.title)}');
    if (item.emotionalLine.trim().isNotEmpty) {
      lines.add(catalogText(context, item.emotionalLine));
    }
    lines.add(
      '${catalogText(context, item.location)} · ${catalogText(context, item.category)}',
    );
    lines.add('');
  }

  lines.add(l.shareItineraryFooter);
  return lines.join('\n');
}

Widget buildTripDayShareCard(
  BuildContext context,
  TripPlan plan,
  TripDay day,
) {
  final l = context.l10n;
  return LuxoraBrandedShareCard(
    title: catalogText(context, plan.title),
    subtitle:
        '${l.todayDayHeading(day.dayNumber)} · ${catalogText(context, day.label)} · ${l.todayPlanStopCount(day.items.length)}',
    sections: tripDayShareSections(context, day),
  );
}
