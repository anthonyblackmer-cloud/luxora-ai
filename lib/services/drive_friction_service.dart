import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/parking_difficulty_service.dart';
import 'package:luxora_ai/util/place_distance.dart';

/// Stress-weighted drive score for a leg — distance, venue type, crowd, parking.
abstract final class DriveFrictionService {
  static int scoreForLeg({
    required LatLng from,
    required LuxPlace to,
    DateTime? atLocal,
  }) {
    final at = atLocal ?? DateTime.now();
    final miles = PlaceDistance.milesBetween(
      from,
      LatLng(to.latitude, to.longitude),
    );

    var friction = 30 + (miles * 1.75).round().clamp(0, 28);

    friction += switch (to.category) {
      LuxPlaceCategory.family => 14,
      LuxPlaceCategory.springs => 10,
      LuxPlaceCategory.beach => 8,
      LuxPlaceCategory.dining => 6,
      LuxPlaceCategory.nightlife => 8,
      LuxPlaceCategory.adventure => 6,
      LuxPlaceCategory.nature => 2,
      LuxPlaceCategory.wellness => -4,
      LuxPlaceCategory.hotel => -6,
      LuxPlaceCategory.romantic => 4,
    };

    final crowd = CrowdPredictionService.scoreFor(place: to, atLocal: at);
    friction += (crowd - 40) ~/ 5;

    final parking = ParkingDifficultyService.scoreFor(place: to, atLocal: at);
    friction += (parking - 35) ~/ 4;

    if (miles < 2) {
      friction -= 10;
    } else if (miles > 35) {
      friction += 6;
    }

    return friction.clamp(10, 90);
  }

  static int scoreFromHub(LuxPlace place, [DateTime? atLocal]) =>
      scoreForLeg(
        from: PlaceDistance.hubCenter,
        to: place,
        atLocal: atLocal,
      );

  static int scoreForBlock({
    required LatLng from,
    required DayBlock block,
    DateTime? anchor,
  }) =>
      scoreForLeg(
        from: from,
        to: block.place,
        atLocal: CrowdPredictionService.timeForPhase(block.phase, anchor),
      );
}
