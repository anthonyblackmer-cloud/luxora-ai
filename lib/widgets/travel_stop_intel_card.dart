import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/l10n/travel_intel_l10n.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/drive_friction_service.dart';
import 'package:luxora_ai/services/parking_difficulty_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Predicted crowd, parking, and drive friction for a destination.
class TravelStopIntelCard extends StatelessWidget {
  const TravelStopIntelCard({
    super.key,
    required this.place,
    this.atLocal,
  });

  final LuxPlace place;
  final DateTime? atLocal;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final at = atLocal ?? DateTime.now();
    final crowd = CrowdPredictionService.levelFor(place: place, atLocal: at);
    final parking =
        ParkingDifficultyService.levelFor(place: place, atLocal: at);
    final friction = DriveFrictionService.scoreFromHub(place, at);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white.withValues(alpha: 0.04),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.detailTravelIntelTitle,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
              color: LuxColors.gold.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l.detailTravelIntelSubtitle,
            style: const TextStyle(
              fontSize: 11.5,
              height: 1.35,
              color: LuxColors.stone500,
            ),
          ),
          const SizedBox(height: 10),
          _IntelRow(
            icon: Icons.groups_outlined,
            label: l.detailCrowdOutlook(l.crowdLevelLabel(crowd)),
          ),
          const SizedBox(height: 6),
          _IntelRow(
            icon: Icons.local_parking_outlined,
            label: l.detailParkingOutlook(l.parkingLevelLabel(parking)),
          ),
          const SizedBox(height: 6),
          _IntelRow(
            icon: Icons.traffic_outlined,
            label: l.detailDriveFrictionOutlook(friction),
          ),
        ],
      ),
    );
  }
}

class _IntelRow extends StatelessWidget {
  const _IntelRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 15, color: LuxColors.stone400),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12.5,
              height: 1.35,
              color: LuxColors.stone300,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

/// Compact intel lines for the map day-flow timeline.
List<String> travelStopIntelLines(
  AppLocalizations l, {
  required LuxPlace place,
  required DateTime atLocal,
  required int driveFriction,
}) {
  final crowd = CrowdPredictionService.levelFor(place: place, atLocal: atLocal);
  final parking =
      ParkingDifficultyService.levelFor(place: place, atLocal: atLocal);
  return [
    l.mapCrowdAtStop(l.crowdLevelLabel(crowd)),
    l.mapParkingAtStop(l.parkingLevelLabel(parking)),
    l.mapDriveFrictionAtStop(driveFriction),
  ];
}
