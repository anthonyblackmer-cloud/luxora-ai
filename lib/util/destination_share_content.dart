import 'package:flutter/material.dart';
import 'package:luxora_ai/data/local_secrets_registry.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/l10n/travel_intel_l10n.dart';
import 'package:luxora_ai/models/attraction_detail.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/drive_friction_service.dart';
import 'package:luxora_ai/services/parking_difficulty_service.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:luxora_ai/widgets/luxora_branded_share_card.dart';
import 'package:luxora_ai/widgets/luxora_share_section.dart';

List<String> destinationTravelIntelLines(AppLocalizations l, LuxPlace place) {
  final at = DateTime.now();
  final crowd = CrowdPredictionService.levelFor(place: place, atLocal: at);
  final parking =
      ParkingDifficultyService.levelFor(place: place, atLocal: at);
  final friction = DriveFrictionService.scoreFromHub(place, at);
  return [
    l.detailCrowdOutlook(l.crowdLevelLabel(crowd)),
    l.detailParkingOutlook(l.parkingLevelLabel(parking)),
    l.detailDriveFrictionOutlook(friction),
  ];
}

String? localSecretForShare(AppLocalizations l, LuxPlace place) {
  final key = LocalSecretsRegistry.l10nKeyFor(place);
  if (key == null) return null;
  return switch (key) {
    'localSecretWinterParkParkAvenue' => l.localSecretWinterParkParkAvenue,
    'localSecretWorldFoodTrucks' => l.localSecretWorldFoodTrucks,
    'localSecretWekiwaSprings' => l.localSecretWekiwaSprings,
    'localSecretDisneySpringsParking' => l.localSecretDisneySpringsParking,
    'localSecretLakeEolaSunset' => l.localSecretLakeEolaSunset,
    'localSecretMiamiWynwoodAlley' => l.localSecretMiamiWynwoodAlley,
    'localSecretMiamiLittleHavanaDomino' => l.localSecretMiamiLittleHavanaDomino,
    'localSecretMiamiVizcayaMangrove' => l.localSecretMiamiVizcayaMangrove,
    'localSecretMiamiOceanDriveSunrise' => l.localSecretMiamiOceanDriveSunrise,
    'localSecretMiamiPantherAlley' => l.localSecretMiamiPantherAlley,
    _ => null,
  };
}

List<LuxoraShareSection> destinationShareSections(
  BuildContext context, {
  required LuxPlace place,
  required AttractionDetail detail,
}) {
  final l = context.l10n;
  final miles = PlaceDistance.milesFromHub(place);
  final driveTime = PlaceDistance.driveTimeFromHubLabel(place);
  final sections = <LuxoraShareSection>[
    LuxoraShareSection(
      body: catalogText(context, detail.emotionalHook),
    ),
    LuxoraShareSection(
      heading: l.detailLocation,
      body: catalogText(context, place.location),
      lines: [
        '${PlaceDistance.milesLabel(miles)} · ${l.detailDriveFromActiveHub(driveTime)}',
        ...destinationTravelIntelLines(l, place),
      ],
    ),
    LuxoraShareSection(
      heading: l.detailWhySpecial,
      body: catalogText(context, detail.whySpecial),
    ),
    LuxoraShareSection(
      heading: l.detailBestTime,
      body: catalogText(context, detail.bestTimeToGo),
    ),
    LuxoraShareSection(
      heading: l.detailInsiderTips,
      body: catalogText(context, detail.insiderTips),
    ),
  ];

  final secret = localSecretForShare(l, place);
  if (secret != null && secret.trim().isNotEmpty) {
    sections.add(
      LuxoraShareSection(
        heading: l.localSecretTitle,
        body: secret,
      ),
    );
  }

  final practical = detail.practicalDetails;
  sections.add(
    LuxoraShareSection(
      heading: l.detailPractical,
      lines: [
        '${l.detailDuration}: ${catalogText(context, practical.typicalDuration)}',
        '${l.detailCostRange}: ${catalogText(context, practical.costRange)}',
        '${l.detailBestFor}: ${practical.bestFor.map((v) => catalogText(context, v)).join(', ')}',
      ],
    ),
  );

  if (detail.menu.isNotEmpty) {
    final menuLines = <String>[];
    for (final item in detail.menu.take(8)) {
      menuLines.add(
        '${catalogText(context, item.name)} — ${item.price}',
      );
    }
    sections.add(
      LuxoraShareSection(
        heading: l.detailMenuTitle,
        lines: menuLines,
      ),
    );
  }

  return sections;
}

Widget buildDestinationShareCard(
  BuildContext context, {
  required LuxPlace place,
  required AttractionDetail detail,
}) {
  return LuxoraBrandedShareCard(
    title: catalogText(context, detail.title),
    subtitle: catalogText(context, place.location),
    chips: detail.vibeMatch.map((tag) => catalogText(context, tag)).toList(),
    sections: destinationShareSections(
      context,
      place: place,
      detail: detail,
    ),
  );
}
