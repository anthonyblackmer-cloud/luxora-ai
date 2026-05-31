import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/active_day_flow_store.dart';
import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/concierge_multi_day_planner.dart';
import 'package:luxora_ai/services/concierge_theme_park_planner.dart';
import 'package:luxora_ai/services/concierge_ticket_sync.dart';
import 'package:luxora_ai/services/concierge_trip_save_sync.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/trip_feel_interpreter.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';
import 'package:luxora_ai/services/trip_profile_build_intent.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';

/// Outcome of turning a Concierge exchange into a persisted timeline plan.
class ConciergeItinerarySyncResult {
  const ConciergeItinerarySyncResult({
    required this.flow,
    required this.plan,
    required this.profile,
    this.attachedDeals = const [],
  });

  final DayFlow flow;
  final TripPlan plan;
  final TripProfile profile;
  final List<TicketDeal> attachedDeals;
}

/// Builds Day Flow + Timeline entries from what the traveler asked Luxora for.
abstract final class ConciergeItinerarySync {
  /// Builds a full itinerary from completed onboarding — no Concierge chat required.
  static Future<ConciergeItinerarySyncResult?> buildFromProfile(
    TripProfile profile,
  ) async {
    final message = TripProfileBuildIntent.planningMessage(profile);
    return _executeBuild(
      userMessage: message,
      baseProfile: profile,
      mergeMessageIntoFeel: false,
    );
  }

  static Future<ConciergeItinerarySyncResult?> applyAfterChat({
    required String userMessage,
    TripProfile? profile,
    bool forceRebuild = false,
  }) async {
    final trimmed = userMessage.trim();
    if (trimmed.isEmpty) return null;
    if (!forceRebuild && !ConciergeTripSaveSync.shouldRebuildItinerary(trimmed)) {
      return null;
    }

    final base = profile ?? TripProfileStore.instance.profile.value ?? const TripProfile();
    return _executeBuild(
      userMessage: trimmed,
      baseProfile: base,
      mergeMessageIntoFeel: true,
    );
  }

  static Future<ConciergeItinerarySyncResult?> _executeBuild({
    required String userMessage,
    required TripProfile baseProfile,
    required bool mergeMessageIntoFeel,
  }) async {
    PlacesRepository.instance.ensureLocalCatalogLoaded();
    await PlacesRepository.instance.initialize();

    final trimmed = userMessage.trim();
    if (trimmed.isEmpty) return null;

    final mergedFeel = mergeMessageIntoFeel
        ? _mergeTripFeel(baseProfile.tripFeel, trimmed)
        : baseProfile.tripFeel;
    var enriched = TripOccasionInterpreter.apply(
      ConciergeThemeParkPlanner.enrichProfile(
        mergeMessageIntoFeel
            ? TripFeelInterpreter.enrichFromText(
                TripFeelInterpreter.enrich(baseProfile.copyWith(tripFeel: mergedFeel)),
                trimmed,
              )
            : TripFeelInterpreter.enrich(baseProfile.copyWith(tripFeel: mergedFeel)),
        trimmed,
      ),
    );

    await TripProfileStore.instance.save(enriched);

    final repo = PlacesRepository.instance;
    final radius = DiscoverRadiusController.instance.radius;
    var pool = repo.placesWithinRadius(
      radius == DiscoverRadius.allFlorida ? DiscoverRadius.miles100 : radius,
    );
    final parkIntent = ConciergeThemeParkPlanner.parseIntent(trimmed);
    if (parkIntent.isExcursion) {
      pool = ConciergeThemeParkPlanner.ensureThemeParkPlacesInPool(pool, repo);
    }
    final homeBaseId = HomeBaseStore.instance.placeId.value;
    final homeBase = homeBaseId == null ? null : repo.byId(homeBaseId);
    final savedIds = SavedPlacesStorage.instance.savedIds.value;

    final cityId = _resolveCityId(enriched);

    final multiDay = _buildMultiDay(
      enriched: enriched,
      pool: pool,
      trimmed: trimmed,
      cityId: cityId,
      homeBase: homeBase,
      savedIds: savedIds,
      repo: repo,
    );
    if (multiDay == null) {
      return null;
    }

    final flow = multiDay.activeFlow;
    final plan = multiDay.plan;

    final deals = ConciergeTicketSync.dealsFor(
      userMessage: trimmed,
      plan: plan,
      profile: enriched,
    );
    final planWithDeals = ConciergeTicketSync.attachDealsToPlan(plan, deals);

    await ActiveTripPlanStore.instance.save(planWithDeals, cityId: cityId);
    await ActiveDayFlowStore.instance.save(flow, cityId: cityId);
    await _syncSavedTripCard(enriched, flow, planWithDeals);

    for (final block in flow.blocks) {
      await SavedPlacesStorage.instance.save(block.place.id);
    }
    for (final day in planWithDeals.days) {
      for (final item in day.items) {
        final placeId = item.placeId;
        if (placeId != null) {
          await SavedPlacesStorage.instance.save(placeId);
        }
      }
    }

    return ConciergeItinerarySyncResult(
      flow: flow,
      plan: planWithDeals,
      profile: enriched,
      attachedDeals: deals,
    );
  }

  static String _mergeTripFeel(String existing, String message) {
    final prior = existing.trim();
    if (prior.isEmpty) return message.trim();
    if (prior.toLowerCase().contains(message.trim().toLowerCase())) {
      return prior;
    }
    return '$prior · ${message.trim()}';
  }

  static String _resolveCityId(TripProfile profile) {
    final active = CityPackRegistry.instance.active.cityId;
    if (active.isNotEmpty) return active;
    return profile.cityId.isNotEmpty ? profile.cityId : 'orlando';
  }

  static ConciergeMultiDayPlan? _buildMultiDay({
    required TripProfile enriched,
    required List<LuxPlace> pool,
    required String trimmed,
    required String cityId,
    required LuxPlace? homeBase,
    required Set<String> savedIds,
    required PlacesRepository repo,
  }) {
    var multiDay = ConciergeMultiDayPlanner.build(
      profile: enriched,
      pool: pool,
      userMessage: trimmed,
      cityId: cityId,
      homeBase: homeBase,
      savedIds: savedIds,
      repo: repo,
    );
    if (!_planIsEmpty(multiDay)) return multiDay;

    final widePool = repo.placesWithinRadius(DiscoverRadius.miles100);
    if (widePool.length <= pool.length) return null;

    multiDay = ConciergeMultiDayPlanner.build(
      profile: enriched,
      pool: widePool,
      userMessage: trimmed,
      cityId: cityId,
      homeBase: homeBase,
      savedIds: savedIds,
      repo: repo,
    );
    if (_planIsEmpty(multiDay)) return null;
    return multiDay;
  }

  static bool _planIsEmpty(ConciergeMultiDayPlan plan) =>
      plan.activeFlow.isEmpty || plan.plan.days.isEmpty;

  static String timelineSnapshot(DayFlow flow, {TripPlan? plan}) {
    if (plan != null && plan.days.length > 1) {
      return plan.days.map((d) => d.label).join(' · ');
    }
    if (flow.isEmpty) return '';
    return flow.blocks.map((b) => b.place.title).join(' → ');
  }

  static Future<void> _syncSavedTripCard(
    TripProfile profile,
    DayFlow flow,
    TripPlan plan,
  ) async {
    await ConciergeTripSaveSync.upsertFromItinerary(
      profile: profile,
      plan: plan,
      timelineSnapshot: timelineSnapshot(flow, plan: plan),
      nextExperience: flow.blocks.isEmpty ? null : flow.blocks.first.place.title,
    );
  }
}
