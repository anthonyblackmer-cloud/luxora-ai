import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';

/// Heuristic parking friction — category, tags, and time-of-day (no live API).
enum ParkingDifficulty { easy, moderate, difficult, limited }

extension ParkingDifficultyX on ParkingDifficulty {
  /// ARB key suffix: `mapParkingLevel_<name>`.
  String get l10nKey => 'mapParkingLevel_$name';
}

abstract final class ParkingDifficultyService {
  static const int _easyMax = 32;
  static const int _moderateMax = 52;
  static const int _difficultMax = 72;

  static ParkingDifficulty levelForScore(int score) {
    if (score <= _easyMax) return ParkingDifficulty.easy;
    if (score <= _moderateMax) return ParkingDifficulty.moderate;
    if (score <= _difficultMax) return ParkingDifficulty.difficult;
    return ParkingDifficulty.limited;
  }

  static int scoreFor({
    required LuxPlace place,
    required DateTime atLocal,
  }) {
    var score = 28.0;
    final hour = atLocal.hour;
    final weekend = atLocal.weekday >= DateTime.saturday;
    final tags = {for (final t in place.moodTags) t.toLowerCase()};

    score += switch (place.category) {
      LuxPlaceCategory.family => 28,
      LuxPlaceCategory.springs => 18,
      LuxPlaceCategory.beach => 16,
      LuxPlaceCategory.dining => hour >= 17 && hour <= 21 ? 14 : 8,
      LuxPlaceCategory.nightlife => hour >= 21 ? 20 : 6,
      LuxPlaceCategory.adventure => 12,
      LuxPlaceCategory.romantic => 6,
      LuxPlaceCategory.nature => 4,
      LuxPlaceCategory.wellness => -6,
      LuxPlaceCategory.hotel => -10,
    };

    if (tags.contains('iconic') || tags.contains('trending')) {
      score += 14;
    }
    if (tags.contains('hidden')) {
      score -= 10;
    }
    if (weekend) {
      score += 10;
    }
    if (place.category == LuxPlaceCategory.family &&
        hour >= 9 &&
        hour <= 11 &&
        weekend) {
      score += 16;
    }
    if (place.category == LuxPlaceCategory.springs &&
        hour >= 10 &&
        hour <= 14 &&
        weekend) {
      score += 18;
    }

    final crowd = CrowdPredictionService.scoreFor(
      place: place,
      atLocal: atLocal,
    );
    score += (crowd - 40) * 0.15;

    return score.round().clamp(0, 100);
  }

  static ParkingDifficulty levelFor({
    required LuxPlace place,
    required DateTime atLocal,
  }) =>
      levelForScore(scoreFor(place: place, atLocal: atLocal));

  static ParkingDifficulty levelForBlock(DayBlock block, [DateTime? anchor]) =>
      levelFor(
        place: block.place,
        atLocal: CrowdPredictionService.timeForPhase(block.phase, anchor),
      );
}
