import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';
import 'package:luxora_ai/services/weather_service.dart';

/// Fun 0–100 score from weather, crowds, mood fit, and engagement.
class VacationScore {
  const VacationScore({
    required this.score,
    required this.weatherFactor,
    required this.crowdFactor,
    required this.moodFactor,
    required this.engagementFactor,
  });

  final int score;
  final int weatherFactor;
  final int crowdFactor;
  final int moodFactor;
  final int engagementFactor;
}

abstract final class VacationScoreService {
  static VacationScore compute({
    required LuxWeather? weather,
    required DayFlow flow,
    TripProfile? profile,
    int bookmarkCount = 0,
  }) {
    final p = TripOccasionInterpreter.apply(profile ?? const TripProfile());

    var weatherFactor = 18;
    if (weather != null) {
      weatherFactor = switch (weather.condition) {
        LuxWeatherCondition.clear => 25,
        LuxWeatherCondition.partlyCloudy => 22,
        LuxWeatherCondition.cloudy => 16,
        LuxWeatherCondition.fog => 14,
        LuxWeatherCondition.drizzle => 10,
        LuxWeatherCondition.rain => 6,
        LuxWeatherCondition.snow => 8,
        LuxWeatherCondition.thunder => 4,
      };
      if (weather.rainLikely) weatherFactor -= 4;
    }

    var crowdFactor = 20;
    if (!flow.isEmpty) {
      var total = 0;
      for (final b in flow.blocks) {
        total += CrowdPredictionService.scoreFor(
          place: b.place,
          atLocal: CrowdPredictionService.timeForPhase(b.phase),
        );
      }
      final avg = total / flow.blocks.length;
      crowdFactor = (25 - avg / 5).round().clamp(4, 25);
    }

    var moodFactor = 12;
    if (!flow.isEmpty && p.moods.isNotEmpty) {
      var hits = 0;
      for (final b in flow.blocks) {
        final tags = {for (final t in b.place.moodTags) t.toLowerCase()};
        for (final mood in p.moods) {
          if (_moodMatchesTags(mood, tags, b.place.category)) {
            hits++;
            break;
          }
        }
      }
      moodFactor = (10 + hits * 3).clamp(10, 25);
    }

    final engagementFactor =
        (8 + bookmarkCount * 2 + flow.stopCount).clamp(8, 25);

    final score =
        (weatherFactor + crowdFactor + moodFactor + engagementFactor)
            .clamp(0, 100);

    return VacationScore(
      score: score,
      weatherFactor: weatherFactor,
      crowdFactor: crowdFactor,
      moodFactor: moodFactor,
      engagementFactor: engagementFactor,
    );
  }

  static bool _moodMatchesTags(
    TripMood mood,
    Set<String> tags,
    LuxPlaceCategory category,
  ) {
    return switch (mood) {
      TripMood.romantic =>
        tags.contains('romantic') || category == LuxPlaceCategory.romantic,
      TripMood.relaxing =>
        tags.contains('relaxing') || category == LuxPlaceCategory.wellness,
      TripMood.adventurous =>
        tags.contains('adventure') || category == LuxPlaceCategory.adventure,
      TripMood.luxurious => tags.contains('luxury'),
      TripMood.familyBonding =>
        tags.contains('family') || category == LuxPlaceCategory.family,
      TripMood.social =>
        tags.contains('social') || category == LuxPlaceCategory.nightlife,
      TripMood.nature =>
        tags.contains('nature') || category == LuxPlaceCategory.nature,
      TripMood.wellness =>
        tags.contains('wellness') || category == LuxPlaceCategory.wellness,
      TripMood.foodie =>
        tags.contains('foodie') || category == LuxPlaceCategory.dining,
    };
  }
}
