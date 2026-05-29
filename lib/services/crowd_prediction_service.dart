import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';

/// Heuristic crowd bucket for a place at a given local time (no live API).
enum CrowdLevel { quiet, moderate, busy, packed }

extension CrowdLevelX on CrowdLevel {
  bool get isHigh => this == CrowdLevel.busy || this == CrowdLevel.packed;

  /// ARB key suffix: `mapCrowdLevel_<name>`.
  String get l10nKey => 'mapCrowdLevel_$name';
}

/// Keyless crowd outlook from category, tags, and time-of-day patterns.
abstract final class CrowdPredictionService {
  static const int _quietMax = 35;
  static const int _moderateMax = 55;
  static const int _busyMax = 75;

  static CrowdLevel levelForScore(int score) {
    if (score <= _quietMax) return CrowdLevel.quiet;
    if (score <= _moderateMax) return CrowdLevel.moderate;
    if (score <= _busyMax) return CrowdLevel.busy;
    return CrowdLevel.packed;
  }

  static int scoreFor({
    required LuxPlace place,
    required DateTime atLocal,
  }) {
    var score = 32.0;
    final hour = atLocal.hour;
    final weekend = atLocal.weekday >= DateTime.saturday;
    final tags = {for (final t in place.moodTags) t.toLowerCase()};

    score += switch (place.category) {
      LuxPlaceCategory.family => 22,
      LuxPlaceCategory.adventure => 14,
      LuxPlaceCategory.nightlife => hour >= 21 ? 18 : -12,
      LuxPlaceCategory.springs => 16,
      LuxPlaceCategory.beach => 12,
      LuxPlaceCategory.dining => hour >= 18 && hour <= 21 ? 14 : 4,
      LuxPlaceCategory.wellness => -8,
      LuxPlaceCategory.romantic => 6,
      LuxPlaceCategory.nature => 8,
      LuxPlaceCategory.hotel => 4,
    };

    if (tags.contains('iconic') || tags.contains('trending')) {
      score += 16;
    }
    if (tags.contains('hidden')) {
      score -= 12;
    }
    if (weekend) {
      score += 12;
    }
    if (hour >= 10 && hour <= 16) {
      score += 8;
    }
    if (place.category == LuxPlaceCategory.family &&
        hour >= 10 &&
        hour <= 17) {
      score += weekend ? 18 : 10;
    }
    if (place.category == LuxPlaceCategory.springs &&
        hour >= 11 &&
        hour <= 15 &&
        weekend) {
      score += 20;
    }

    return score.round().clamp(0, 100);
  }

  static CrowdLevel levelFor({
    required LuxPlace place,
    required DateTime atLocal,
  }) =>
      levelForScore(scoreFor(place: place, atLocal: atLocal));

  /// Typical local time for a day-flow phase (today).
  static DateTime timeForPhase(DayPhase phase, [DateTime? anchor]) {
    final now = anchor ?? DateTime.now();
    final hour = switch (phase) {
      DayPhase.morning => 9,
      DayPhase.midday => 12,
      DayPhase.afternoon => 15,
      DayPhase.evening => 18,
      DayPhase.night => 21,
    };
    return DateTime(now.year, now.month, now.day, hour);
  }

  static CrowdLevel levelForBlock(DayBlock block, [DateTime? anchor]) =>
      levelFor(
        place: block.place,
        atLocal: timeForPhase(block.phase, anchor),
      );
}
