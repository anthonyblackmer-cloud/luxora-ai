import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/orlando/orlando_park_mood_route.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/concierge_theme_park_planner.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/experience_moment_service.dart';
import 'package:luxora_ai/services/smart_itinerary/itinerary_day_schedule.dart';
import 'package:luxora_ai/services/smart_itinerary/itinerary_place_picker.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:luxora_ai/services/trip_name_generator.dart';
import 'package:luxora_ai/util/trip_duration.dart';
import 'package:intl/intl.dart';

/// Result of building a multi-day Concierge itinerary on-device.
class ConciergeMultiDayPlan {
  const ConciergeMultiDayPlan({
    required this.plan,
    required this.activeFlow,
    required this.flowsByDay,
  });

  final TripPlan plan;
  final DayFlow activeFlow;
  final List<DayFlow> flowsByDay;
}

/// Builds full trip length from profile dates, mixes park + explore days, and
/// assigns real dining stops — not theme-park-only agendas.
abstract final class ConciergeMultiDayPlanner {
  static int resolveDayCount(String message, TripProfile profile) {
    final fromMessage =
        ConciergeThemeParkPlanner.parseIntent(message).dayCount;
    final fromProfile = tripDaysFromProfile(profile);
    final best = [fromMessage, fromProfile].reduce((a, b) => a > b ? a : b);
    return best.clamp(1, 7);
  }

  static ConciergeMultiDayPlan build({
    required TripProfile profile,
    required List<LuxPlace> pool,
    required String userMessage,
    required String cityId,
    LuxPlace? homeBase,
    Set<String> savedIds = const {},
    required PlacesRepository repo,
  }) {
    final destination = PaywallCatalog.isSupported(cityId)
        ? PaywallCatalog.offerFor(cityId).cityName
        : PaywallCatalog.offerFor('orlando').cityName;
    final totalDays = resolveDayCount(userMessage, profile);
    final parkIntent = ConciergeThemeParkPlanner.parseIntent(userMessage);
    final usedIds = <String>{if (homeBase != null) homeBase.id};

    if (parkIntent.isExcursion && totalDays >= 1) {
      return _buildMixedParkPlan(
        profile: profile,
        pool: pool,
        totalDays: totalDays,
        parkIntent: parkIntent,
        cityId: cityId,
        destination: destination,
        homeBase: homeBase,
        savedIds: savedIds,
        usedIds: usedIds,
        repo: repo,
        intentText: userMessage,
      );
    }

    return _buildExplorePlan(
      profile: profile,
      pool: pool,
      totalDays: totalDays,
      cityId: cityId,
      destination: destination,
      homeBase: homeBase,
      savedIds: savedIds,
      usedIds: usedIds,
      intentText: userMessage,
    );
  }

  static ConciergeMultiDayPlan _buildMixedParkPlan({
    required TripProfile profile,
    required List<LuxPlace> pool,
    required int totalDays,
    required ThemeParkExcursionIntent parkIntent,
    required String cityId,
    required String destination,
    LuxPlace? homeBase,
    required Set<String> savedIds,
    required Set<String> usedIds,
    required PlacesRepository repo,
    required String intentText,
  }) {
    final parkDayCount = _parkDayBudget(totalDays, parkIntent);
    final exploreDayCount = totalDays - parkDayCount;

    final routes = ConciergeThemeParkPlanner.pickRoutes(
      dayCount: parkDayCount,
      disney: parkIntent.disney,
      universal: parkIntent.universal,
    );

    final parkDays = <TripDay>[];
    final parkFlows = <DayFlow>[];
    for (var i = 0; i < routes.length; i++) {
      final route = routes[i];
      final flow = ConciergeThemeParkPlanner.dayFlowFromRoute(
        route,
        repo,
        homeBase: homeBase,
        profile: profile,
      );
      if (flow == null || flow.isEmpty) continue;

      final dining = pickRestaurant(
        pool: pool,
        profile: profile,
        usedIds: usedIds,
        savedIds: savedIds,
        near: LatLng(flow.blocks.last.place.latitude, flow.blocks.last.place.longitude),
        rotationSeed: i * 19 + usedIds.length,
        intentText: intentText,
      );
      final items = _itemsFromParkRoute(route, repo, dining: dining);
      for (final item in items) {
        final id = item.placeId;
        if (id != null) usedIds.add(id);
      }

      parkDays.add(
        TripDay(
          dayNumber: i + 1,
          label: route.title,
          items: items,
        ),
      );
      parkFlows.add(
        dining == null
            ? flow
            : _appendDiningBlock(flow, dining),
      );
    }

    final explore = _buildExploreDays(
      profile: profile,
      pool: pool,
      dayCount: exploreDayCount,
      homeBase: homeBase,
      savedIds: savedIds,
      usedIds: usedIds,
      startDayNumber: parkDays.length + 1,
      intentText: intentText,
      cityId: cityId,
    );

    final mergedDays = _interleaveDays(parkDays, explore.days);
    final renumbered = [
      for (var i = 0; i < mergedDays.length; i++)
        TripDay(
          dayNumber: i + 1,
          label: mergedDays[i].label,
          items: mergedDays[i].items,
        ),
    ];

    final mergedFlows = _interleaveFlows(parkFlows, explore.flows);
    final title = TripNameGenerator.resolve(profile);
    return ConciergeMultiDayPlan(
      plan: TripPlan(
        id: 'concierge-$cityId-${renumbered.length}d',
        title: title,
        days: renumbered,
      ),
      activeFlow: mergedFlows.isNotEmpty ? mergedFlows.first : explore.flows.first,
      flowsByDay: mergedFlows,
    );
  }

  static ConciergeMultiDayPlan _buildExplorePlan({
    required TripProfile profile,
    required List<LuxPlace> pool,
    required int totalDays,
    required String cityId,
    required String destination,
    LuxPlace? homeBase,
    required Set<String> savedIds,
    required Set<String> usedIds,
    required String intentText,
  }) {
    final explore = _buildExploreDays(
      profile: profile,
      pool: pool,
      dayCount: totalDays,
      homeBase: homeBase,
      savedIds: savedIds,
      usedIds: usedIds,
      startDayNumber: 1,
      intentText: intentText,
      cityId: cityId,
    );

    final title = TripNameGenerator.resolve(profile);

    if (explore.days.isEmpty || explore.flows.isEmpty) {
      return ConciergeMultiDayPlan(
        plan: TripPlan(
          id: 'concierge-$cityId-empty',
          title: title,
          days: const [],
        ),
        activeFlow: DayFlow(
          blocks: const [],
          start: homeBase != null
              ? LatLng(homeBase.latitude, homeBase.longitude)
              : PlaceDistance.hubCenter,
          totalMiles: 0,
          homeBase: homeBase,
        ),
        flowsByDay: const [],
      );
    }

    return ConciergeMultiDayPlan(
      plan: TripPlan(
        id: 'concierge-$cityId-${explore.days.length}d',
        title: title,
        days: explore.days,
      ),
      activeFlow: explore.flows.first,
      flowsByDay: explore.flows,
    );
  }

  static ({List<TripDay> days, List<DayFlow> flows}) _buildExploreDays({
    required TripProfile profile,
    required List<LuxPlace> pool,
    required int dayCount,
    LuxPlace? homeBase,
    required Set<String> savedIds,
    required Set<String> usedIds,
    required int startDayNumber,
    required String intentText,
    required String cityId,
  }) {
    final days = <TripDay>[];
    final flows = <DayFlow>[];
    if (dayCount <= 0) return (days: days, flows: flows);

    for (var d = 0; d < dayCount; d++) {
      var flow = DayFlowPlanner.plan(
        profile: profile,
        pool: pool,
        homeBase: homeBase,
        savedIds: savedIds,
        excludePlaceIds: usedIds,
        dayIndex: startDayNumber + d,
        intentText: intentText,
      );
      if (flow.isEmpty) break;

      final hasDining = flow.blocks.any(
        (b) => b.place.category == LuxPlaceCategory.dining,
      );
      if (!hasDining) {
        final dining = pickRestaurant(
          pool: pool,
          profile: profile,
          usedIds: usedIds,
          savedIds: savedIds,
          near: flow.blocks.isEmpty
              ? null
              : LatLng(
                  flow.blocks.last.place.latitude,
                  flow.blocks.last.place.longitude,
                ),
          rotationSeed: (startDayNumber + d) * 23 + usedIds.length,
          intentText: intentText,
        );
        if (dining != null) {
          flow = _appendDiningBlock(flow, dining);
        }
      }

      for (final block in flow.blocks) {
        usedIds.add(block.place.id);
      }

      final items = ItineraryDaySchedule.tripItemsFromBlocks(
        blocks: flow.blocks,
        dayStart: flow.start,
        dayNumber: startDayNumber + d,
        idPrefix: 'concierge',
        blockLine: blockLineForCity(cityId),
        categoryLabel: _categoryLabel,
      );

      days.add(
        TripDay(
          dayNumber: startDayNumber + d,
          label: dayCount == 1 ? 'Concierge day' : 'Explore & dine · Day ${d + 1}',
          items: items,
        ),
      );
      flows.add(flow);
    }

    return (days: days, flows: flows);
  }

  static int _parkDayBudget(int totalDays, ThemeParkExcursionIntent intent) {
    if (totalDays <= 1) return 1;
    if (totalDays == 2) return 1;
    final maxPark = totalDays - 1;
    final ideal = (totalDays / 2).ceil();
    return ideal.clamp(1, maxPark);
  }

  static List<TripDay> _interleaveDays(List<TripDay> park, List<TripDay> explore) {
    if (explore.isEmpty) return park;
    if (park.isEmpty) return explore;
    final out = <TripDay>[];
    var pi = 0;
    var ei = 0;
    while (pi < park.length || ei < explore.length) {
      if (pi < park.length) {
        out.add(park[pi++]);
      }
      if (ei < explore.length) {
        out.add(explore[ei++]);
      }
    }
    return out;
  }

  static List<DayFlow> _interleaveFlows(List<DayFlow> park, List<DayFlow> explore) {
    if (explore.isEmpty) return park;
    if (park.isEmpty) return explore;
    final out = <DayFlow>[];
    var pi = 0;
    var ei = 0;
    while (pi < park.length || ei < explore.length) {
      if (pi < park.length) {
        out.add(park[pi++]);
      }
      if (ei < explore.length) {
        out.add(explore[ei++]);
      }
    }
    return out;
  }

  static List<TripItem> _itemsFromParkRoute(
    OrlandoParkMoodRoute route,
    PlacesRepository repo, {
    LuxPlace? dining,
  }) {
    final items = <TripItem>[];
    final segments = <(DayPhase phase, String placeId, String label)>[
      (DayPhase.morning, route.morningPlaceId, 'Morning'),
      (DayPhase.midday, route.afternoonPlaceId, 'Afternoon'),
      (DayPhase.evening, route.eveningPlaceId, 'Evening'),
    ];
    var itemIdx = 0;
    for (final segment in segments) {
      final place = repo.byId(segment.$2);
      if (place == null) continue;
      items.add(
        TripItem(
          id: 'concierge-${route.routeId}-$itemIdx',
          time: _formatPhaseTime(segment.$1),
          title: place.title,
          emotionalLine: ExperienceMomentService.lineForSegment(
            placeId: place.id,
            phase: segment.$1,
            routeDescription: route.description,
            cityId: 'orlando',
          ),
          location: place.location,
          category: 'Theme parks',
          placeId: place.id,
        ),
      );
      itemIdx++;
    }
    if (dining != null) {
      items.add(
        TripItem(
          id: 'concierge-${route.routeId}-dining',
          time: _formatPhaseTime(DayPhase.evening),
          title: dining.title,
          emotionalLine:
              'Dinner off the park — a real meal to balance your theme-park days.',
          location: dining.location,
          category: 'Dining',
          placeId: dining.id,
        ),
      );
    }
    return items;
  }

  static DayFlow _appendDiningBlock(DayFlow flow, LuxPlace dining) {
    return DayFlow(
      blocks: [
        ...flow.blocks,
        DayBlock(
          phase: DayPhase.evening,
          place: dining,
          reason: DayBlockReason.eveningDining,
        ),
      ],
      start: flow.start,
      totalMiles: flow.totalMiles,
      homeBase: flow.homeBase,
      emphases: flow.emphases,
    );
  }

  /// Builds a timeline day from a validated [DayFlow].
  static TripDay tripDayFromFlow({
    required DayFlow flow,
    required int dayNumber,
    required String label,
    String? cityId,
  }) {
    final items = ItineraryDaySchedule.tripItemsFromBlocks(
      blocks: flow.blocks,
      dayStart: flow.start,
      dayNumber: dayNumber,
      idPrefix: 'validated',
      blockLine: blockLineForCity(cityId ?? 'orlando'),
      categoryLabel: _categoryLabel,
    );
    return TripDay(
      dayNumber: dayNumber,
      label: label,
      items: items,
    );
  }

  /// Picks a curated dining stop for the evening — used across park and explore days.
  static LuxPlace? pickRestaurant({
    required List<LuxPlace> pool,
    required TripProfile profile,
    required Set<String> usedIds,
    Set<String> savedIds = const {},
    LatLng? near,
    int rotationSeed = 0,
    String intentText = '',
  }) {
    final anchor = near ?? PlaceDistance.hubCenter;
    return ItineraryPlacePicker.pickDining(
      ctx: ItineraryPickContext(
        profile: profile,
        pool: pool,
        tripUsed: usedIds,
        dayUsed: const {},
        savedIds: savedIds,
        near: anchor,
        rotationSeed: rotationSeed,
        intentText: intentText.isNotEmpty ? intentText : profile.tripFeel,
      ),
    );
  }

  static String _formatPhaseTime(DayPhase phase) {
    final at = CrowdPredictionService.timeForPhase(phase);
    return DateFormat.jm('en_US').format(at);
  }

  static String _categoryLabel(String raw) =>
      raw.isEmpty ? 'Experience' : '${raw[0].toUpperCase()}${raw.substring(1)}';

  static String Function(DayBlock) blockLineForCity(String cityId) {
    return (block) => ExperienceMomentService.lineForBlock(
          block: block,
          fallback: _blockLine,
          cityId: cityId,
        );
  }

  @Deprecated('Use blockLineForCity')
  static String blockLineFor(DayBlock block) =>
      blockLineForCity('orlando')(block);

  static String _blockLine(DayBlockReason reason, String description) {
    final trimmed = description.trim();
    if (trimmed.isNotEmpty) {
      return trimmed.length > 120 ? '${trimmed.substring(0, 117)}…' : trimmed;
    }
    return switch (reason) {
      DayBlockReason.eveningDining => 'Your concierge dinner pick for tonight.',
      DayBlockReason.morningPool =>
        'A calm start — pool, spa, or easy morning energy before the day builds.',
      DayBlockReason.morningCalm =>
        'You ease in gently; this stop sets the mood without rushing you.',
      DayBlockReason.middayAdventure =>
        'Peak daylight for something memorable — movement and wow moments.',
      DayBlockReason.middayCulture =>
        'Culture and story when you are fresh enough to actually take it in.',
      DayBlockReason.middayIcon =>
        'The signature stop — the one you will remember from this trip.',
      DayBlockReason.afternoonDowntime =>
        'Breathing room before evening — reset, not more checklist tourism.',
      DayBlockReason.afternoonGem =>
        'A hidden-gem pause — quieter, prettier, more you.',
      DayBlockReason.nightOut =>
        'Optional night energy if you still want the city after dark.',
    };
  }
}
