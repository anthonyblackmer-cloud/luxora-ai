import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_multi_day_planner.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/util/place_distance.dart';

import 'concierge_intent_place_matcher.dart';
import 'experience_duration_catalog.dart';
import 'trip_preference_gates.dart';
import 'itinerary_day_schedule.dart';
import 'itinerary_place_picker.dart';

export 'experience_duration_catalog.dart';
export 'itinerary_day_schedule.dart';
export 'itinerary_place_picker.dart';
export 'trip_preference_gates.dart';
export 'venue_hours_catalog.dart';
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
        intentText: userMessage,
        dayIndex: i,
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
          cityId: cityId,
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

    final injected = _injectRequestedPlaces(
      plan: ConciergeMultiDayPlan(
        plan: TripPlan(
          id: raw.plan.id,
          title: raw.plan.title,
          days: repairedDays,
        ),
        activeFlow: repairedFlows.first,
        flowsByDay: repairedFlows,
      ),
      userMessage: userMessage,
      pool: pool,
      profile: profile,
      cityId: cityId,
      savedIds: savedIds,
      notes: notes,
    );

    return SmartItineraryResult(
      plan: injected,
      confidenceScore: confidence.clamp(0, 1),
      validationNotes: notes,
    );
  }

  static ConciergeMultiDayPlan _injectRequestedPlaces({
    required ConciergeMultiDayPlan plan,
    required String userMessage,
    required List<LuxPlace> pool,
    required TripProfile profile,
    required String cityId,
    required Set<String> savedIds,
    required List<String> notes,
  }) {
    final requested =
        ConciergeIntentPlaceMatcher.placesMentionedIn(userMessage, pool);
    if (requested.isEmpty) return plan;

    final flows = List<DayFlow>.from(plan.flowsByDay);
    final labels = List<String>.from(plan.plan.days.map((d) => d.label));
    final tripUsed = <String>{
      for (final flow in flows)
        for (final block in flow.blocks) block.place.id,
    };
    final targetDay = ConciergeIntentPlaceMatcher.resolveTargetDayIndex(
      userMessage,
      flows.length,
    );

    var changed = false;
    for (final place in requested) {
      if (tripUsed.contains(place.id)) continue;
      if (!TripPreferenceGates.allowsPlace(profile, place.id)) continue;
      if (!TripPreferenceGates.allowsWellnessPlace(profile, place)) continue;

      final dayIndex = targetDay ?? _bestDayIndexForInjection(flows, place);
      if (dayIndex < 0 || dayIndex >= flows.length) continue;

      final flow = flows[dayIndex];
      final phase = _phaseForInjectedPlace(place);
      final reason = _reasonForInjectedPlace(place);
      final updatedBlocks = [
        ...flow.blocks,
        DayBlock(phase: phase, place: place, reason: reason),
      ];
      var workingBlocks = _trimToFeasibleSchedule(
        updatedBlocks,
        flow.start,
        profile,
        (_, {penalty = 0.08}) {},
      );

      if (!workingBlocks.any((b) => b.place.id == place.id)) {
        continue;
      }

      flows[dayIndex] = DayFlow(
        blocks: workingBlocks,
        start: flow.start,
        totalMiles: flow.totalMiles,
        homeBase: flow.homeBase,
        emphases: flow.emphases,
      );
      tripUsed.add(place.id);
      changed = true;
      notes.add('Added ${place.title} from your Concierge request.');
    }

    if (!changed) return plan;

    final days = <TripDay>[];
    for (var i = 0; i < flows.length; i++) {
      days.add(
        ConciergeMultiDayPlanner.tripDayFromFlow(
          flow: flows[i],
          dayNumber: i + 1,
          label: i < labels.length ? labels[i] : 'Day ${i + 1}',
          cityId: cityId,
        ),
      );
    }

    return ConciergeMultiDayPlan(
      plan: TripPlan(
        id: plan.plan.id,
        title: plan.plan.title,
        days: days,
      ),
      activeFlow: flows.first,
      flowsByDay: flows,
    );
  }

  static int _bestDayIndexForInjection(List<DayFlow> flows, LuxPlace place) {
    var bestIndex = 0;
    var bestScore = double.negativeInfinity;
    for (var i = 0; i < flows.length; i++) {
      final flow = flows[i];
      if (flow.blocks.any(
        (b) => ExperienceDurationCatalog.isMajorThemePark(b.place.id),
      )) {
        continue;
      }
      final anchor = flow.blocks.isEmpty
          ? flow.start
          : LatLng(
              flow.blocks.last.place.latitude,
              flow.blocks.last.place.longitude,
            );
      final miles = PlaceDistance.milesBetween(
        anchor,
        LatLng(place.latitude, place.longitude),
      );
      final score = 100 - miles - flow.blocks.length * 3;
      if (score > bestScore) {
        bestScore = score;
        bestIndex = i;
      }
    }
    return bestIndex;
  }

  static DayPhase _phaseForInjectedPlace(LuxPlace place) {
    return switch (place.category) {
      LuxPlaceCategory.dining || LuxPlaceCategory.romantic => DayPhase.evening,
      LuxPlaceCategory.nightlife => DayPhase.night,
      LuxPlaceCategory.wellness || LuxPlaceCategory.beach => DayPhase.afternoon,
      _ => DayPhase.midday,
    };
  }

  static DayBlockReason _reasonForInjectedPlace(LuxPlace place) {
    return switch (place.category) {
      LuxPlaceCategory.dining || LuxPlaceCategory.romantic =>
        DayBlockReason.eveningDining,
      LuxPlaceCategory.nightlife => DayBlockReason.nightOut,
      LuxPlaceCategory.wellness => DayBlockReason.afternoonDowntime,
      LuxPlaceCategory.beach => DayBlockReason.afternoonDowntime,
      LuxPlaceCategory.nature ||
      LuxPlaceCategory.springs =>
        DayBlockReason.middayIcon,
      LuxPlaceCategory.adventure || LuxPlaceCategory.family =>
        DayBlockReason.middayAdventure,
      _ => DayBlockReason.middayIcon,
    };
  }

  static _DayRepairResult _repairDay({
    required DayFlow flow,
    required TripProfile profile,
    required List<LuxPlace> pool,
    required Set<String> savedIds,
    required Set<String> tripUsed,
    required bool allowParkHopper,
    required String cityId,
    required String intentText,
    required int dayIndex,
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
      blocks = _ensureMeals(
        blocks: blocks,
        profile: profile,
        pool: pool,
        tripUsed: tripUsed,
        savedIds: savedIds,
        flow: flow,
        intentText: intentText,
        dayIndex: dayIndex,
        note: note,
      );
    }

    blocks = _avoidTripRepeats(
      blocks,
      tripUsed,
      pool,
      savedIds,
      profile,
      intentText,
      note,
    );

    blocks = _ensureMinimumStops(
      blocks: blocks,
      profile: profile,
      pool: pool,
      tripUsed: tripUsed,
      savedIds: savedIds,
      start: flow.start,
      intentText: intentText,
      dayIndex: dayIndex,
      note: note,
    );

    blocks = _trimToFeasibleSchedule(
      blocks,
      flow.start,
      profile,
      note,
    );

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
    TripProfile profile,
    String intentText,
    void Function(String, {double penalty}) note,
  ) {
    final out = <DayBlock>[];
    for (final block in blocks) {
      if (tripUsed.contains(block.place.id) &&
          !savedIds.contains(block.place.id)) {
        final replacement = ItineraryPlacePicker.pickReplacement(
          ctx: ItineraryPickContext(
            profile: profile,
            pool: pool,
            tripUsed: tripUsed,
            dayUsed: {for (final b in out) b.place.id, block.place.id},
            savedIds: savedIds,
            near: LatLng(block.place.latitude, block.place.longitude),
            rotationSeed: tripUsed.length + out.length,
            intentText: intentText,
          ),
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
        if (block.place.category != LuxPlaceCategory.dining) {
          note('Kept repeat ${block.place.title} — no equivalent alternative.');
        }
      }
      out.add(block);
    }
    return out;
  }

  static bool _isDiningBlock(DayBlock block) =>
      block.place.category == LuxPlaceCategory.dining ||
      block.place.category == LuxPlaceCategory.romantic ||
      block.reason == DayBlockReason.eveningDining ||
      block.reason == DayBlockReason.middayLunch;

  static int _diningStopCount(List<DayBlock> blocks) =>
      blocks.where(_isDiningBlock).length;

  static bool _isParkDay(List<DayBlock> blocks) => blocks.any(
        (b) => ExperienceDurationCatalog.isMajorThemePark(b.place.id),
      );

  static bool _needsMeal(List<DayBlock> blocks) {
    if (blocks.isEmpty) return false;
    if (_isParkDay(blocks)) {
      return _diningStopCount(blocks) < 1;
    }
    if (blocks.length >= 2) {
      return _diningStopCount(blocks) < 2;
    }
    return _diningStopCount(blocks) < 1;
  }

  static List<DayBlock> _ensureMeals({
    required List<DayBlock> blocks,
    required TripProfile profile,
    required List<LuxPlace> pool,
    required Set<String> tripUsed,
    required Set<String> savedIds,
    required DayFlow flow,
    required String intentText,
    required int dayIndex,
    required void Function(String, {double penalty}) note,
  }) {
    var working = List<DayBlock>.from(blocks);
    final target = _isParkDay(working)
        ? 1
        : (working.length >= 2 ? 2 : 1);

    while (_diningStopCount(working) < target) {
      final hasLunch = working.any(
        (b) => b.phase == DayPhase.midday && _isDiningBlock(b),
      );
      final hasDinner = working.any(
        (b) => b.phase == DayPhase.evening && _isDiningBlock(b),
      );
      final DayPhase phase;
      final DayBlockReason reason;
      if (!_isParkDay(working) && !hasLunch) {
        phase = DayPhase.midday;
        reason = DayBlockReason.middayLunch;
      } else if (!hasDinner) {
        phase = DayPhase.evening;
        reason = DayBlockReason.eveningDining;
      } else {
        break;
      }

      final anchor = working.isEmpty
          ? flow.start
          : LatLng(
              working.last.place.latitude,
              working.last.place.longitude,
            );
      final dining = ItineraryPlacePicker.pickDining(
        ctx: ItineraryPickContext(
          profile: profile,
          pool: pool,
          tripUsed: tripUsed,
          dayUsed: {for (final b in working) b.place.id},
          savedIds: savedIds,
          near: anchor,
          rotationSeed: dayIndex * 53 + working.length,
          intentText: intentText,
        ),
      );
      if (dining == null) {
        note('Full day missing a meal stop.', penalty: 0.12);
        break;
      }
      working.add(
        DayBlock(
          phase: phase,
          place: dining,
          reason: reason,
        ),
      );
      note(
        phase == DayPhase.midday
            ? 'Added lunch stop for a realistic full day.'
            : 'Added dinner stop for a realistic full day.',
        penalty: 0.04,
      );
    }
    return working;
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

  static int _minStopsForPace(PacePreference pace) => switch (pace) {
        PacePreference.slow => 2,
        PacePreference.balanced => 3,
        PacePreference.packed => 4,
      };

  static List<DayBlock> _trimToFeasibleSchedule(
    List<DayBlock> blocks,
    LatLng start,
    TripProfile profile,
    void Function(String, {double penalty}) note,
  ) {
    if (blocks.isEmpty) return blocks;
    final minStops = _minStopsForPace(profile.pace);

    if (ItineraryDaySchedule.isFeasible(blocks: blocks, dayStart: start)) {
      return blocks;
    }
    if (ItineraryDaySchedule.isFeasible(
      blocks: blocks,
      dayStart: start,
      compactDurations: true,
    )) {
      note('Compressed visit windows so every stop fits in one day.', penalty: 0.03);
      return blocks;
    }

    if (blocks.length < 2) return blocks;

    var working = List<DayBlock>.from(blocks);
    final dropPhases = [
      DayPhase.night,
      DayPhase.afternoon,
      DayPhase.midday,
      DayPhase.evening,
      DayPhase.morning,
    ];

    while (working.length > minStops &&
        !ItineraryDaySchedule.isFeasible(
          blocks: working,
          dayStart: start,
          compactDurations: true,
        )) {
      var removed = false;
      for (final phase in dropPhases) {
        final candidates = working
            .where((b) => b.phase == phase)
            .toList(growable: false);
        if (candidates.isEmpty) continue;
        DayBlock? victim;
        if (phase == DayPhase.evening && candidates.length > 1) {
          victim = candidates.firstWhere(
            (b) => !_isDiningBlock(b),
            orElse: () => candidates.last,
          );
        } else {
          victim = candidates.last;
        }
        if (ExperienceDurationCatalog.isMajorThemePark(victim.place.id) &&
            working
                    .where((w) =>
                        ExperienceDurationCatalog.isMajorThemePark(w.place.id))
                    .length ==
                1) {
          continue;
        }
        working = [
          for (final b in working)
            if (b != victim) b,
        ];
        note(
          'Removed ${victim.place.title} — could not fit travel and visit windows in one day.',
          penalty: 0.06,
        );
        removed = true;
        break;
      }
      if (!removed) break;
    }

    return working;
  }

  static List<DayBlock> _ensureMinimumStops({
    required List<DayBlock> blocks,
    required TripProfile profile,
    required List<LuxPlace> pool,
    required Set<String> tripUsed,
    required Set<String> savedIds,
    required LatLng start,
    required String intentText,
    required int dayIndex,
    required void Function(String, {double penalty}) note,
  }) {
    final minStops = _minStopsForPace(profile.pace);
    if (blocks.length >= minStops) return blocks;

    var working = List<DayBlock>.from(blocks);
    final dayUsed = {for (final b in working) b.place.id};
    final fillPhases = [
      DayPhase.morning,
      DayPhase.midday,
      DayPhase.afternoon,
    ];

    while (working.length < minStops) {
      final phase = fillPhases.firstWhere(
        (p) => !working.any((b) => b.phase == p),
        orElse: () => DayPhase.afternoon,
      );
      final anchor = working.isEmpty
          ? start
          : LatLng(
              working.last.place.latitude,
              working.last.place.longitude,
            );
      final filler = ItineraryPlacePicker.pickDayFiller(
        ctx: ItineraryPickContext(
          profile: profile,
          pool: pool,
          tripUsed: tripUsed,
          dayUsed: dayUsed,
          savedIds: savedIds,
          near: anchor,
          rotationSeed: dayIndex * 67 + working.length,
          intentText: intentText,
        ),
        majorParksOnDay: working
            .where((b) => ExperienceDurationCatalog.isMajorThemePark(b.place.id))
            .length,
      );
      if (filler == null) break;

      working.add(
        DayBlock(
          phase: phase,
          place: filler,
          reason: DayBlockReason.middayIcon,
        ),
      );
      dayUsed.add(filler.id);
      note('Added ${filler.title} to round out the day.', penalty: 0.04);

      if (!ItineraryDaySchedule.isFeasible(
        blocks: working,
        dayStart: start,
        compactDurations: true,
      )) {
        working.removeLast();
        dayUsed.remove(filler.id);
        note(
          'Skipped ${filler.title} — could not fit within open hours today.',
          penalty: 0.05,
        );
        break;
      }
    }

    return working;
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
