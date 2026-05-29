import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/util/place_distance.dart';

/// Result of a one-tap spontaneous reroute (crowd- or weather-aware).
class DayFlowRerouteResult {
  const DayFlowRerouteResult({
    required this.flow,
    required this.swappedStopCount,
    required this.rainAdjusted,
  });

  final DayFlow flow;
  final int swappedStopCount;
  final bool rainAdjusted;

  bool get changed => swappedStopCount > 0 || rainAdjusted;
}

/// Swaps crowded or rain-exposed stops for calmer alternatives — keeps the
/// same day phases and narrative shape.
abstract final class DayFlowRerouter {
  static DayFlowRerouteResult apply({
    required DayFlow flow,
    required List<LuxPlace> pool,
    required TripProfile? profile,
    bool rainLikely = false,
    Set<String> savedIds = const {},
  }) {
    if (flow.isEmpty) {
      return DayFlowRerouteResult(flow: flow, swappedStopCount: 0, rainAdjusted: false);
    }

    final used = <String>{for (final b in flow.blocks) b.place.id};
    final newBlocks = <DayBlock>[];
    var swaps = 0;
    var rainAdjusted = false;
    var cursor = flow.start;
    final now = DateTime.now();

    for (final block in flow.blocks) {
      final at = CrowdPredictionService.timeForPhase(block.phase, now);
      final crowd = CrowdPredictionService.levelFor(
        place: block.place,
        atLocal: at,
      );
      final rainExposed = rainLikely && _isRainExposed(block.place);

      final needsSwap = crowd.isHigh || rainExposed;
      LuxPlace? alt;
      if (needsSwap) {
        alt = _pickAlternative(
          block: block,
          pool: pool,
          used: used,
          cursor: cursor,
          profile: profile,
          savedIds: savedIds,
          preferIndoor: rainExposed,
        );
      }

      if (alt != null) {
        used.add(alt.id);
        newBlocks.add(DayBlock(
          phase: block.phase,
          place: alt,
          reason: rainExposed && block.reason != DayBlockReason.afternoonGem
              ? DayBlockReason.afternoonGem
              : block.reason,
        ));
        swaps++;
        if (rainExposed) rainAdjusted = true;
        cursor = LatLng(alt.latitude, alt.longitude);
      } else {
        newBlocks.add(block);
        cursor = LatLng(block.place.latitude, block.place.longitude);
      }
    }

    var total = 0.0;
    var prev = flow.start;
    for (final b in newBlocks) {
      final here = LatLng(b.place.latitude, b.place.longitude);
      total += PlaceDistance.milesBetween(prev, here);
      prev = here;
    }

    return DayFlowRerouteResult(
      flow: DayFlow(
        blocks: newBlocks,
        start: flow.start,
        totalMiles: total,
        homeBase: flow.homeBase,
        emphases: flow.emphases,
      ),
      swappedStopCount: swaps,
      rainAdjusted: rainAdjusted,
    );
  }

  static bool _isRainExposed(LuxPlace place) {
    if (place.category == LuxPlaceCategory.beach ||
        place.category == LuxPlaceCategory.springs) {
      return true;
    }
    return place.moodTags.any((t) {
      final lower = t.toLowerCase();
      return lower.contains('beach') ||
          lower.contains('springs') ||
          lower.contains('outdoor');
    });
  }

  static LuxPlace? _pickAlternative({
    required DayBlock block,
    required List<LuxPlace> pool,
    required Set<String> used,
    required LatLng cursor,
    required TripProfile? profile,
    required Set<String> savedIds,
    required bool preferIndoor,
  }) {
    final at = CrowdPredictionService.timeForPhase(block.phase);
    LuxPlace? best;
    var bestScore = double.negativeInfinity;

    for (final place in pool) {
      if (used.contains(place.id)) continue;
      if (preferIndoor && _isRainExposed(place)) continue;

      final crowd = CrowdPredictionService.scoreFor(place: place, atLocal: at);
      if (crowd >= 70) continue;

      var score = 100.0 - crowd;
      if (savedIds.contains(place.id)) score += 25;
      if (place.source == LuxPlaceSource.curated) score += 8;
      if (preferIndoor &&
          (place.category == LuxPlaceCategory.dining ||
              place.category == LuxPlaceCategory.wellness ||
              place.category == LuxPlaceCategory.family)) {
        score += 15;
      }
      final miles = PlaceDistance.milesBetween(
        cursor,
        LatLng(place.latitude, place.longitude),
      );
      score -= miles * 0.2;

      if (score > bestScore) {
        bestScore = score;
        best = place;
      }
    }
    return best;
  }
}
