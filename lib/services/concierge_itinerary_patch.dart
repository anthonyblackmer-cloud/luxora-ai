import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_multi_day_planner.dart';
import 'package:luxora_ai/services/concierge_theme_park_planner.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/smart_itinerary/concierge_intent_place_matcher.dart';
import 'package:luxora_ai/services/smart_itinerary/smart_itinerary_rule_engine.dart';
import 'package:luxora_ai/util/place_distance.dart';

/// Surgical Concierge edits — patch one day or inject stops without rebuilding the trip.
abstract final class ConciergeItineraryPatch {
  static const _fullRebuildPhrases = [
    'start over',
    'from scratch',
    'replan the whole',
    'replan my whole',
    'rebuild the trip',
    'rebuild my trip',
    'new trip',
    'whole trip',
    'entire trip',
    'all days',
    'every day',
  ];

  static bool shouldPatch(
    String message,
    TripPlan existing,
    TripProfile profile,
  ) {
    if (existing.days.isEmpty) return false;
    final lower = message.toLowerCase().replaceAll('ё', 'е').trim();
    if (lower.isEmpty) return false;
    if (_fullRebuildPhrases.any(lower.contains)) return false;

    final excursion = ConciergeThemeParkPlanner.parseIntent(message);
    if (excursion.isExcursion) {
      final requested =
          ConciergeMultiDayPlanner.resolveDayCount(message, profile);
      if (requested != existing.days.length) return false;
    }

    if (RegExp(
      r'\bplan a (\d+|one|two|three|four|five|six|seven)[\s-]*(day|night)\b',
    ).hasMatch(lower)) {
      return false;
    }

    return ConciergeIntentPlaceMatcher.hasActivitySchedulingIntent(message);
  }

  /// Applies a targeted edit to [existing] — untouched days stay on the saved plan.
  static ConciergeMultiDayPlan? patch({
    required TripPlan existing,
    required TripProfile profile,
    required List<LuxPlace> pool,
    required String userMessage,
    required String cityId,
    required Set<String> savedIds,
    required PlacesRepository repo,
  }) {
    final reconstructed = _multiDayFromStoredPlan(
      existing: existing,
      repo: repo,
      homeBaseId: HomeBaseStore.instance.placeId.value,
    );
    if (reconstructed == null) return null;

    final targetDay = ConciergeIntentPlaceMatcher.resolveTargetDayIndex(
      userMessage,
      reconstructed.flowsByDay.length,
    );
    final modifiedDays = <int>{};
    if (targetDay != null) modifiedDays.add(targetDay);

    var working = reconstructed;
    final lower = userMessage.toLowerCase();

    if (targetDay != null &&
        (lower.contains('replace') ||
            lower.contains('swap') ||
            lower.contains('instead of') ||
            lower.contains('change '))) {
      working = _clearTargetDayForReplace(working, targetDay, userMessage, pool);
      modifiedDays.add(targetDay);
    }

    if (targetDay != null && _shouldRebuildTargetDay(userMessage, pool)) {
      working = _rebuildSingleDay(
        plan: working,
        targetDayIndex: targetDay,
        profile: profile,
        pool: pool,
        savedIds: savedIds,
        userMessage: userMessage,
        repo: repo,
      );
      modifiedDays.add(targetDay);
    }

    final preserve = {
      for (var i = 0; i < working.flowsByDay.length; i++)
        if (!modifiedDays.contains(i)) i,
    };

    final validated = SmartItineraryRuleEngine.validateAndRepair(
      raw: working,
      profile: profile,
      pool: pool,
      userMessage: userMessage,
      repo: repo,
      cityId: cityId,
      savedIds: savedIds,
      preserveDayIndices: preserve.isEmpty ? null : preserve,
    );
    if (validated.confidenceScore < 0.35) return null;
    return validated.plan;
  }

  static bool _shouldRebuildTargetDay(String message, List<LuxPlace> pool) {
    final lower = message.toLowerCase();
    if (lower.contains('replace') ||
        lower.contains('swap') ||
        lower.contains('redo day') ||
        lower.contains('rebuild day')) {
      return true;
    }
    if (RegExp(r'\b(change|redo|refresh)\b.*\bday\b').hasMatch(lower) &&
        ConciergeIntentPlaceMatcher.placesMentionedIn(message, pool).isEmpty) {
      return true;
    }
    return false;
  }

  static ConciergeMultiDayPlan _clearTargetDayForReplace(
    ConciergeMultiDayPlan plan,
    int targetDay,
    String userMessage,
    List<LuxPlace> pool,
  ) {
    if (targetDay < 0 || targetDay >= plan.flowsByDay.length) return plan;

    final removeTitles = ConciergeIntentPlaceMatcher.placesMentionedIn(
      userMessage,
      pool,
    ).map((p) => p.title.toLowerCase()).toSet();

    final flow = plan.flowsByDay[targetDay];
    final kept = flow.blocks.where((block) {
      if (removeTitles.contains(block.place.title.toLowerCase())) {
        return false;
      }
      if (removeTitles.isEmpty &&
          userMessage.toLowerCase().contains('dinner') &&
          (block.reason == DayBlockReason.eveningDining ||
              block.place.category == LuxPlaceCategory.dining)) {
        return false;
      }
      if (removeTitles.isEmpty &&
          userMessage.toLowerCase().contains('lunch') &&
          block.reason == DayBlockReason.middayLunch) {
        return false;
      }
      return true;
    }).toList();

    final flows = List<DayFlow>.from(plan.flowsByDay);
    flows[targetDay] = DayFlow(
      blocks: kept,
      start: flow.start,
      totalMiles: flow.totalMiles,
      homeBase: flow.homeBase,
      emphases: flow.emphases,
    );

    return ConciergeMultiDayPlan(
      plan: plan.plan,
      activeFlow: flows.first,
      flowsByDay: flows,
    );
  }

  static ConciergeMultiDayPlan _rebuildSingleDay({
    required ConciergeMultiDayPlan plan,
    required int targetDayIndex,
    required TripProfile profile,
    required List<LuxPlace> pool,
    required Set<String> savedIds,
    required String userMessage,
    required PlacesRepository repo,
  }) {
    final tripUsed = <String>{};
    LuxPlace? homeBase;
    for (var i = 0; i < plan.flowsByDay.length; i++) {
      if (i == targetDayIndex) continue;
      for (final block in plan.flowsByDay[i].blocks) {
        tripUsed.add(block.place.id);
      }
    }
    final homeBaseId = HomeBaseStore.instance.placeId.value;
    if (homeBaseId != null) {
      homeBase = repo.byId(homeBaseId);
      if (homeBase != null) tripUsed.add(homeBase.id);
    }

    var newFlow = DayFlowPlanner.plan(
      profile: profile,
      pool: pool,
      homeBase: homeBase,
      savedIds: savedIds,
      excludePlaceIds: tripUsed,
      dayIndex: targetDayIndex + 1,
      intentText: userMessage,
    );

    if (newFlow.isEmpty) return plan;

    final dayUsed = <String>{};
    bool hasMealAt(DayPhase phase) => newFlow.blocks.any(
          (b) =>
              b.phase == phase &&
              (b.place.category == LuxPlaceCategory.dining ||
                  b.place.category == LuxPlaceCategory.romantic),
        );

    if (!hasMealAt(DayPhase.midday)) {
      final lunch = ConciergeMultiDayPlanner.pickRestaurant(
        pool: pool,
        profile: profile,
        usedIds: tripUsed,
        dayUsed: dayUsed,
        savedIds: savedIds,
        near: newFlow.blocks.isEmpty
            ? null
            : LatLng(
                newFlow.blocks.last.place.latitude,
                newFlow.blocks.last.place.longitude,
              ),
        rotationSeed: targetDayIndex * 23 + tripUsed.length,
        intentText: userMessage,
      );
      if (lunch != null) {
        tripUsed.add(lunch.id);
        dayUsed.add(lunch.id);
        newFlow = _appendDining(newFlow, lunch, DayPhase.midday);
      }
    }

    if (!hasMealAt(DayPhase.evening)) {
      final dinner = ConciergeMultiDayPlanner.pickRestaurant(
        pool: pool,
        profile: profile,
        usedIds: tripUsed,
        dayUsed: dayUsed,
        savedIds: savedIds,
        near: newFlow.blocks.isEmpty
            ? null
            : LatLng(
                newFlow.blocks.last.place.latitude,
                newFlow.blocks.last.place.longitude,
              ),
        rotationSeed: targetDayIndex * 29 + tripUsed.length,
        intentText: userMessage,
      );
      if (dinner != null) {
        newFlow = _appendDining(newFlow, dinner, DayPhase.evening);
      }
    }

    final flows = List<DayFlow>.from(plan.flowsByDay);
    flows[targetDayIndex] = newFlow;

    return ConciergeMultiDayPlan(
      plan: plan.plan,
      activeFlow: flows.first,
      flowsByDay: flows,
    );
  }

  static DayFlow _appendDining(
    DayFlow flow,
    LuxPlace dining,
    DayPhase phase,
  ) {
    final reason = phase == DayPhase.midday
        ? DayBlockReason.middayLunch
        : DayBlockReason.eveningDining;
    return DayFlow(
      blocks: [
        ...flow.blocks,
        DayBlock(phase: phase, place: dining, reason: reason),
      ],
      start: flow.start,
      totalMiles: flow.totalMiles,
      homeBase: flow.homeBase,
      emphases: flow.emphases,
    );
  }

  static ConciergeMultiDayPlan? _multiDayFromStoredPlan({
    required TripPlan existing,
    required PlacesRepository repo,
    String? homeBaseId,
  }) {
    final homeBase = homeBaseId == null ? null : repo.byId(homeBaseId);
    final start = homeBase != null
        ? LatLng(homeBase.latitude, homeBase.longitude)
        : PlaceDistance.hubCenter;

    final flows = <DayFlow>[];
    for (final day in existing.days) {
      final blocks = <DayBlock>[];
      for (final item in day.items) {
        final placeId = item.placeId;
        if (placeId == null) continue;
        final place = repo.byId(placeId);
        if (place == null) continue;
        blocks.add(
          DayBlock(
            phase: _phaseForItem(item),
            place: place,
            reason: _reasonForItem(item),
          ),
        );
      }
      flows.add(
        DayFlow(
          blocks: blocks,
          start: start,
          totalMiles: 0,
          homeBase: homeBase,
        ),
      );
    }

    if (flows.isEmpty) return null;

    return ConciergeMultiDayPlan(
      plan: existing,
      activeFlow: flows.firstWhere((f) => !f.isEmpty, orElse: () => flows.first),
      flowsByDay: flows,
    );
  }

  static DayPhase _phaseForItem(TripItem item) {
    if (item.category.toLowerCase() == 'dining') {
      final hour = _hourFromTimeLabel(item.time);
      if (hour != null && hour < 15) return DayPhase.midday;
      return DayPhase.evening;
    }
    return DayPhase.midday;
  }

  static DayBlockReason _reasonForItem(TripItem item) {
    if (item.category.toLowerCase() == 'dining') {
      final hour = _hourFromTimeLabel(item.time);
      if (hour != null && hour < 15) return DayBlockReason.middayLunch;
      return DayBlockReason.eveningDining;
    }
    return DayBlockReason.middayAdventure;
  }

  static int? _hourFromTimeLabel(String time) {
    final match = RegExp(r'(\d{1,2})').firstMatch(time);
    if (match == null) return null;
    var hour = int.tryParse(match.group(1)!);
    if (hour == null) return null;
    final lower = time.toLowerCase();
    if (lower.contains('pm') && hour < 12) hour += 12;
    if (lower.contains('am') && hour == 12) hour = 0;
    return hour;
  }
}
