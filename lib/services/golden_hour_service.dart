import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/util/place_distance.dart';

enum GoldenHourKind { beach, rooftop, scenic }

/// Best sunset window + leave-by time for a nearby spot.
class GoldenHourPlan {
  const GoldenHourPlan({
    required this.place,
    required this.kind,
    required this.leaveBy,
    required this.sunsetAt,
    required this.driveMinutes,
  });

  final LuxPlace place;
  final GoldenHourKind kind;
  final DateTime leaveBy;
  final DateTime sunsetAt;
  final int driveMinutes;
}

abstract final class GoldenHourService {
  static const _bufferBeforeSunset = Duration(minutes: 15);

  static GoldenHourPlan? plan({
    required LuxWeather? weather,
    required LatLng origin,
    required List<LuxPlace> pool,
    TripProfile? profile,
  }) {
    final sunset = weather?.sunset;
    if (sunset == null) return null;

    final now = DateTime.now();
    if (!sunset.isAfter(now)) return null;
    if (sunset.difference(now).inHours > 5) return null;

    final p = TripOccasionInterpreter.apply(profile ?? const TripProfile());
    LuxPlace? best;
    GoldenHourKind? kind;
    var bestScore = double.negativeInfinity;
    var bestMinutes = 0;

    for (final place in pool) {
      final miles = PlaceDistance.milesBetween(
        origin,
        LatLng(place.latitude, place.longitude),
      );
      final minutes = _driveMinutes(miles);
      final tags = {for (final t in place.moodTags) t.toLowerCase()};

      var score = 40.0;
      GoldenHourKind? placeKind;

      if (place.category == LuxPlaceCategory.beach ||
          tags.contains('beach') ||
          tags.contains('sunset')) {
        score += 28;
        placeKind = GoldenHourKind.beach;
      } else if (tags.contains('rooftop') ||
          place.category == LuxPlaceCategory.nightlife) {
        score += 22;
        placeKind = GoldenHourKind.rooftop;
      } else if (place.category == LuxPlaceCategory.romantic ||
          tags.contains('scenic')) {
        score += 18;
        placeKind = GoldenHourKind.scenic;
      } else if (place.category == LuxPlaceCategory.dining) {
        score += 12;
        placeKind = GoldenHourKind.rooftop;
      } else {
        continue;
      }

      if (p.moods.contains(TripMood.romantic)) score += 10;
      if (p.occasion.isCouple) score += 12;
      score -= minutes * 0.35;

      if (score > bestScore) {
        bestScore = score;
        best = place;
        kind = placeKind;
        bestMinutes = minutes;
      }
    }

    if (best == null || kind == null) return null;

    final arriveBy = sunset.subtract(_bufferBeforeSunset);
    final leaveBy = arriveBy.subtract(Duration(minutes: bestMinutes));

    return GoldenHourPlan(
      place: best,
      kind: kind,
      leaveBy: leaveBy.isBefore(now) ? now : leaveBy,
      sunsetAt: sunset,
      driveMinutes: bestMinutes,
    );
  }

  static int _driveMinutes(double miles) {
    const avgMph = 45.0;
    return (miles / avgMph * 60).round().clamp(1, 999);
  }
}
