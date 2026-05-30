import 'package:intl/intl.dart';
import 'package:luxora_ai/data/paywall_catalog.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/active_day_flow_store.dart';
import 'package:luxora_ai/services/active_trip_plan_store.dart';
import 'package:luxora_ai/services/concierge_ticket_sync.dart';
import 'package:luxora_ai/services/concierge_trip_save_sync.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/trip_feel_interpreter.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';
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
  static Future<ConciergeItinerarySyncResult?> applyAfterChat({
    required String userMessage,
    TripProfile? profile,
  }) async {
    final trimmed = userMessage.trim();
    if (trimmed.isEmpty) return null;
    if (ConciergeTripSaveSync.shouldSkipItineraryRebuild(trimmed)) return null;

    final base = profile ?? TripProfileStore.instance.profile.value ?? const TripProfile();
    final mergedFeel = _mergeTripFeel(base.tripFeel, trimmed);
    final enriched = TripOccasionInterpreter.apply(
      TripFeelInterpreter.enrichFromText(
        TripFeelInterpreter.enrich(base.copyWith(tripFeel: mergedFeel)),
        trimmed,
      ),
    );

    await TripProfileStore.instance.save(enriched);

    final repo = PlacesRepository.instance;
    final radius = DiscoverRadiusController.instance.radius;
    final pool = repo.placesWithinRadius(
      radius == DiscoverRadius.allFlorida ? DiscoverRadius.miles100 : radius,
    );
    final homeBaseId = HomeBaseStore.instance.placeId.value;
    final homeBase = homeBaseId == null ? null : repo.byId(homeBaseId);
    final savedIds = SavedPlacesStorage.instance.savedIds.value;

    final flow = DayFlowPlanner.plan(
      profile: enriched,
      pool: pool,
      homeBase: homeBase,
      savedIds: savedIds,
    );
    if (flow.isEmpty) return null;

    final cityId = enriched.cityId.isNotEmpty ? enriched.cityId : 'orlando';
    final offer = PaywallCatalog.isSupported(cityId)
        ? PaywallCatalog.offerFor(cityId)
        : PaywallCatalog.offerFor('orlando');
    final plan = _planFromFlow(
      flow: flow,
      cityId: cityId,
      destination: offer.cityName,
    );

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

  static TripPlan _planFromFlow({
    required DayFlow flow,
    required String cityId,
    required String destination,
  }) {
    final items = <TripItem>[];
    for (var i = 0; i < flow.blocks.length; i++) {
      final block = flow.blocks[i];
      final place = block.place;
      items.add(
        TripItem(
          id: 'concierge-${place.id}-$i',
          time: _formatPhaseTime(block.phase),
          title: place.title,
          emotionalLine: _emotionalLine(block.reason, place.description),
          location: place.location,
          category: _categoryLabel(place.category.name),
          placeId: place.id,
        ),
      );
    }

    return TripPlan(
      id: 'concierge-$cityId',
      title: '$destination · Your day',
      days: [
        TripDay(
          dayNumber: 1,
          label: 'Concierge day',
          items: items,
        ),
      ],
    );
  }

  static String _formatPhaseTime(DayPhase phase) {
    final at = CrowdPredictionService.timeForPhase(phase);
    return DateFormat.jm('en_US').format(at);
  }

  static String _categoryLabel(String raw) =>
      raw.isEmpty ? 'Experience' : '${raw[0].toUpperCase()}${raw.substring(1)}';

  static String _emotionalLine(DayBlockReason reason, String description) {
    final trimmed = description.trim();
    if (trimmed.isNotEmpty) {
      return trimmed.length > 120 ? '${trimmed.substring(0, 117)}…' : trimmed;
    }
    return switch (reason) {
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
      DayBlockReason.eveningDining =>
        'Dinner timed for how you want tonight to feel, not just where to eat.',
      DayBlockReason.nightOut =>
        'Optional night energy if you still want the city after dark.',
    };
  }

  static String timelineSnapshot(DayFlow flow) {
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
      timelineSnapshot: timelineSnapshot(flow),
      nextExperience: flow.blocks.isEmpty ? null : flow.blocks.first.place.title,
    );
  }
}
