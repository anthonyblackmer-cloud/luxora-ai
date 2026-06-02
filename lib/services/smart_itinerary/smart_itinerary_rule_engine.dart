import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_multi_day_planner.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/util/place_distance.dart';

import 'package:luxora_ai/services/smart_itinerary/experience_duration_catalog.dart';

export 'experience_duration_catalog.dart';
export 'smart_itinerary_prompt_guardrails.dart';

/// Outcome of validating and repairing a multi-day concierge plan.
class SmartItineraryResult {
  const SmartItineraryResult({
    required this.plan,
    required this.confidenceScore,
    required this.validationNotes,
  });

  final ConciergeMultiDayPlan plan;
  final double confidenceScore;
  final List<String> validationNotes;
}

/// Deterministic itinerary validator — AI suggests, rules validate, Luxora presents.
abstract final class SmartItineraryRuleEngine {
  static const _maxLegMilesRelaxed = 22.0;
  static const _maxLegMilesBalanced = 28.0;
  static const _maxLegMilesPacked = 35.0;

  static SmartItineraryResult validateAndRepair({
    required ConciergeMultiDayPlan raw,
    required TripProfile profile,
    required List<LuxPlace> pool,
    required String userMessage,
    required PlacesRepository repo,
    required String cityId,
    Set<String> savedIds = const {},
  }) {
    final notes = <String>[];
    var confidence = 1.0;
    final tripUsed = <String>{};
    final repairedFlows = <DayFlow>[];
    final repairedDays = <TripDay>[];
    final allowHopper =
        profile.pace == PacePreference.packed &&
        ExperienceDurationCatalog.allowsParkHopper(userMessage);

    for (var i = 0; i < raw.flowsByDay.length; i++) {
      final original = raw.flowsByDay[i];
      final dayLabel = i < raw.plan.days.length
          ? raw.plan.days[i].label
          : 'Day ${i + 1}';

      final dayResult = _repairDay(
        flow: original,
        profile: profile,
        pool: pool,
        savedIds: savedIds,
        tripUsed: tripUsed,
        allowParkHopper: allowHopper,
        cityId: cityId,
      );

      notes.addAll(dayResult.notes);
      confidence = confidence > dayResult.confidence
          ? dayResult.confidence
          : confidence;

      if (dayResult.flow.isEmpty) continue;

      for (final block in dayResult.flow.blocks) {
        tripUsed.add(block.place.id);
      }

      repairedFlows.add(dayResult.flow);
      repairedDays.add(
        ConciergeMultiDayPlanner.tripDayFromFlow(
          flow: dayResult.flow,
          dayNumber: repairedDays.length + 1,
          label: dayLabel,
        ),
      );
    }

    if (repairedFlows.isEmpty || repairedDays.isEmpty) {
      return SmartItineraryResult(
        plan: raw,
        confidenceScore: 0,
        validationNotes: const ['Could not produce a valid day after repair.'],
      );
    }

    return SmartItineraryResult(
      plan: ConciergeMultiDayPlan(
        plan: TripPlan(
          id: raw.plan.id,
          title: raw.plan.title,
          days: repairedDays,
        ),
        activeFlow: repairedFlows.first,
        flowsByDay: repairedFlows,
      ),
      confidenceScore: confidence.clamp(0, 1),
      validationNotes: notes,
    );
  }

  static _DayRepairResult _repairDay({
    required DayFlow flow,
    required TripProfile profile,
    required List<LuxPlace> pool,
    required Set<String> savedIds,
    required Set<String> tripUsed,
    required bool allowParkHopper,
    required String cityId,
  }) {
    final notes = <String>[];
    var confidence = 1.0;
    var blocks = List<DayBlock>.from(flow.blocks);

    void note(String message, {double penalty = 0.08}) {
      notes.add(message);
      confidence -= penalty;
    }

    blocks = _dedupeBlocks(blocks, note);
    blocks = _enforceThemeParkRules(
      blocks,
      allowParkHopper: allowParkHopper,
      note: note,
    );
    blocks = _trimEnergyBudget(blocks, profile, note);
    blocks = _enforceDriveTime(blocks, profile, flow.start, note);
    blocks = _reorderByProximity(blocks, flow.start);

    if (_needsMeal(blocks)) {
      final hasDining = blocks.any(
        (b) =>
            b.place.category == LuxPlaceCategory.dining ||
            b.place.category == LuxPlaceCategory.romantic,
      );
      if (!hasDining) {
        final anchor = blocks.isEmpty
            ? flow.start
            : LatLng(
                blocks.last.place.latitude,
                blocks.last.place.longitude,
              );
        final dining = ConciergeMultiDayPlanner.pickRestaurant(
          pool: pool,
          profile: profile,
          usedIds: tripUsed,
          savedIds: savedIds,
          near: anchor,
        );
        if (dining != null) {
          blocks.add(
            DayBlock(
              phase: DayPhase.evening,
              place: dining,
              reason: DayBlockReason.eveningDining,
            ),
          );
          note('Added dinner stop for a realistic full day.', penalty: 0.04);
        } else {
          note('Full day missing a meal stop.', penalty: 0.12);
        }
      }
    }

    blocks = _avoidTripRepeats(blocks, tripUsed, pool, savedIds, note);

    var totalMiles = _totalMiles(blocks, flow.start);

    return _DayRepairResult(
      flow: DayFlow(
        blocks: blocks,
        start: flow.start,
        totalMiles: totalMiles,
        homeBase: flow.homeBase,
        emphases: flow.emphases,
      ),
      confidence: confidence.clamp(0.35, 1),
      notes: notes,
    );
  }

  static List<DayBlock> _dedupeBlocks(
    List<DayBlock> blocks,
    void Function(String, {double penalty}) note,
  ) {
    final seen = <String>{};
    final out = <DayBlock>[];
    for (final block in blocks) {
      if (seen.add(block.place.id)) {
        out.add(block);
      } else {
        note('Removed duplicate ${block.place.title} on the same day.');
      }
    }
    return out;
  }

  static List<DayBlock> _enforceThemeParkRules(
    List<DayBlock> blocks, {
    required bool allowParkHopper,
    required void Function(String, {double penalty}) note,
  }) {
    final majors = blocks
        .where((b) => ExperienceDurationCatalog.isMajorThemePark(b.place.id))
        .toList();
    if (majors.length <= 1) return blocks;

    final maxMajors = allowParkHopper ? 2 : 1;
    if (majors.length <= maxMajors && allowParkHopper) {
      final resorts = majors.map((b) => _resortGroup(b.place)).toSet();
      if (resorts.length == 1) return blocks;
    }

    note(
      allowParkHopper
          ? 'Park hopper allowed but cross-resort stacking was trimmed.'
          : 'Trimmed to one major theme park for a realistic day.',
    );

    final keepIds = <String>{};
    if (allowParkHopper && majors.length >= 2) {
      keepIds
        ..add(majors.first.place.id)
        ..add(majors[1].place.id);
    } else {
      keepIds.add(majors.first.place.id);
    }

    return [
      for (final block in blocks)
        if (!ExperienceDurationCatalog.isMajorThemePark(block.place.id) ||
            keepIds.contains(block.place.id))
          block,
    ];
  }

  static String _resortGroup(LuxPlace place) {
    if (ExperienceDurationCatalog.disneyResortMajorIds
        .contains(place.id)) {
      return 'disney';
    }
    if (ExperienceDurationCatalog.universalResortMajorIds
        .contains(place.id)) {
      return 'universal';
    }
    return 'other';
  }

  static List<DayBlock> _trimEnergyBudget(
    List<DayBlock> blocks,
    TripProfile profile,
    void Function(String, {double penalty}) note,
  ) {
    final budget = switch (profile.pace) {
      PacePreference.slow => 10,
      PacePreference.balanced => 16,
      PacePreference.packed => 22,
    };
    final maxStops = switch (profile.pace) {
      PacePreference.slow => 3,
      PacePreference.balanced => 5,
      PacePreference.packed => 7,
    };

    int score(List<DayBlock> list) => list
        .map((b) => ExperienceDurationCatalog.profileFor(b.place).energyCost.score)
        .fold<int>(0, (a, b) => a + b);

    var working = List<DayBlock>.from(blocks);
    final dropOrder = [
      DayPhase.night,
      DayPhase.afternoon,
      DayPhase.midday,
      DayPhase.morning,
      DayPhase.evening,
    ];

    while ((score(working) > budget || working.length > maxStops) &&
        working.length > 1) {
      var removed = false;
      for (final phase in dropOrder) {
        final idx = working.lastIndexWhere((b) => b.phase == phase);
        if (idx < 0) continue;
        final block = working[idx];
        if (block.place.category == LuxPlaceCategory.dining &&
            _needsMeal(working)) {
          continue;
        }
        if (ExperienceDurationCatalog.isMajorThemePark(block.place.id) &&
            working
                    .where((w) =>
                        ExperienceDurationCatalog.isMajorThemePark(w.place.id))
                    .length ==
                1) {
          continue;
        }
        working.removeAt(idx);
        removed = true;
        note(
          'Removed ${block.place.title} to match ${profile.pace.name} pace.',
          penalty: 0.05,
        );
        break;
      }
      if (!removed) break;
    }

    return working;
  }

  static List<DayBlock> _enforceDriveTime(
    List<DayBlock> blocks,
    TripProfile profile,
    LatLng start,
    void Function(String, {double penalty}) note,
  ) {
    final maxLeg = switch (profile.pace) {
      PacePreference.slow => _maxLegMilesRelaxed,
      PacePreference.balanced => _maxLegMilesBalanced,
      PacePreference.packed => _maxLegMilesPacked,
    };

    if (blocks.length < 2) return blocks;

    var prev = start;
    final out = <DayBlock>[];
    for (final block in blocks) {
      final here = LatLng(block.place.latitude, block.place.longitude);
      final miles = PlaceDistance.milesBetween(prev, here);
      if (miles > maxLeg &&
          !ExperienceDurationCatalog.profileFor(block.place)
              .isFullDayDestination) {
        note(
          'Skipped ${block.place.title} — too far from the previous stop.',
          penalty: 0.06,
        );
        continue;
      }
      out.add(block);
      prev = here;
    }
    return out.isEmpty ? blocks.take(1).toList() : out;
  }

  static List<DayBlock> _reorderByProximity(
    List<DayBlock> blocks,
    LatLng start,
  ) {
    if (blocks.length < 3) return blocks;

    final major = blocks.where(
      (b) =>
          ExperienceDurationCatalog.isMajorThemePark(b.place.id) ||
          ExperienceDurationCatalog.profileFor(b.place).isFullDayDestination,
    );
    if (major.isNotEmpty) {
      final anchor = major.first;
      final rest = blocks.where((b) => b != anchor).toList();
      return [anchor, ..._nearestNeighborOrder(rest, start)];
    }
    return _nearestNeighborOrder(blocks, start);
  }

  static List<DayBlock> _nearestNeighborOrder(
    List<DayBlock> blocks,
    LatLng start,
  ) {
    final remaining = List<DayBlock>.from(blocks);
    final ordered = <DayBlock>[];
    var cursor = start;
    while (remaining.isNotEmpty) {
      remaining.sort((a, b) {
        final ma = PlaceDistance.milesBetween(
          cursor,
          LatLng(a.place.latitude, a.place.longitude),
        );
        final mb = PlaceDistance.milesBetween(
          cursor,
          LatLng(b.place.latitude, b.place.longitude),
        );
        return ma.compareTo(mb);
      });
      final next = remaining.removeAt(0);
      ordered.add(next);
      cursor = LatLng(next.place.latitude, next.place.longitude);
    }
    return ordered;
  }

  static List<DayBlock> _avoidTripRepeats(
    List<DayBlock> blocks,
    Set<String> tripUsed,
    List<LuxPlace> pool,
    Set<String> savedIds,
    void Function(String, {double penalty}) note,
  ) {
    final out = <DayBlock>[];
    for (final block in blocks) {
      if (tripUsed.contains(block.place.id) &&
          !savedIds.contains(block.place.id) &&
          block.place.category != LuxPlaceCategory.dining) {
        final replacement = _pickReplacement(
          pool: pool,
          tripUsed: tripUsed,
          category: block.place.category,
        );
        if (replacement != null) {
          note('Swapped repeated ${block.place.title} for variety.');
          out.add(
            DayBlock(
              phase: block.phase,
              place: replacement,
              reason: block.reason,
            ),
          );
          continue;
        }
        note('Kept repeat ${block.place.title} — no equivalent alternative.');
      }
      out.add(block);
    }
    return out;
  }

  static bool _needsMeal(List<DayBlock> blocks) {
    if (blocks.isEmpty) return false;
    if (blocks.any(
      (b) => ExperienceDurationCatalog.isMajorThemePark(b.place.id),
    )) {
      return true;
    }
    return blocks.length >= 3;
  }

  static double _totalMiles(List<DayBlock> blocks, LatLng start) {
    var total = 0.0;
    var prev = start;
    for (final block in blocks) {
      final here = LatLng(block.place.latitude, block.place.longitude);
      total += PlaceDistance.milesBetween(prev, here);
      prev = here;
    }
    return total;
  }

  static LuxPlace? _pickReplacement({
    required List<LuxPlace> pool,
    required Set<String> tripUsed,
    required LuxPlaceCategory category,
  }) {
    for (final place in pool) {
      if (tripUsed.contains(place.id)) continue;
      if (place.category == category) return place;
    }
    return null;
  }
}

class _DayRepairResult {
  const _DayRepairResult({
    required this.flow,
    required this.confidence,
    required this.notes,
  });

  final DayFlow flow;
  final double confidence;
  final List<String> notes;
}
