import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/data/orlando/disney_world_content.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/data/orlando/universal_orlando_content.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/orlando/orlando_park_mood_route.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:intl/intl.dart';

/// Parsed theme-park excursion intent from Concierge chat.
class ThemeParkExcursionIntent {
  const ThemeParkExcursionIntent({
    required this.dayCount,
    required this.disney,
    required this.universal,
  });

  final int dayCount;
  final bool disney;
  final bool universal;

  bool get isExcursion => disney || universal;
}

/// Builds multi-day Disney / Universal plans from curated mood routes.
abstract final class ConciergeThemeParkPlanner {
  static ThemeParkExcursionIntent parseIntent(String message) {
    final lower = message.toLowerCase();
    final disney = _mentionsDisney(lower);
    final universal = _mentionsUniversal(lower);
    return ThemeParkExcursionIntent(
      dayCount: _parseDayCount(lower),
      disney: disney,
      universal: universal,
    );
  }

  static TripProfile enrichProfile(TripProfile profile, String message) {
    final intent = parseIntent(message);
    if (!intent.isExcursion) return profile;

    var next = profile;
    if (intent.disney && intent.universal) {
      next = next.copyWith(
        occasion: TripOccasion.disneyAdventure,
        adventureInterest: _boost(next.adventureInterest, 25),
        discoveryStyle: DiscoveryStyle.iconic,
        pace: next.pace == PacePreference.packed
            ? PacePreference.balanced
            : next.pace,
      );
    } else if (intent.disney) {
      next = next.copyWith(
        occasion: TripOccasion.disneyAdventure,
        adventureInterest: _boost(next.adventureInterest, 20),
        discoveryStyle: DiscoveryStyle.iconic,
      );
    } else if (intent.universal) {
      next = next.copyWith(
        occasion: TripOccasion.universalAdventure,
        adventureInterest: _boost(next.adventureInterest, 25),
        discoveryStyle: DiscoveryStyle.balanced,
      );
    }
    return TripOccasionInterpreter.apply(next);
  }

  /// Theme-park stops for itinerary building — even when the add-on is locked.
  static List<LuxPlace> ensureThemeParkPlacesInPool(
    List<LuxPlace> pool,
    PlacesRepository repo,
  ) {
    final byId = {for (final p in pool) p.id: p};
    for (final id in OrlandoAddonCatalog.themeParkPlaceIds) {
      final place = repo.byId(id);
      if (place != null) {
        byId[id] = place;
      }
    }
    return byId.values.toList();
  }

  static List<OrlandoParkMoodRoute> pickRoutes({
    required int dayCount,
    required bool disney,
    required bool universal,
  }) {
    final disneyRoutes = DisneyWorldContent.moodRoutes;
    final universalRoutes = UniversalOrlandoContent.moodRoutes;
    final out = <OrlandoParkMoodRoute>[];
    var disneyIdx = 0;
    var universalIdx = 0;

    for (var day = 0; day < dayCount; day++) {
      if (disney && universal) {
        if (day.isEven) {
          out.add(disneyRoutes[disneyIdx % disneyRoutes.length]);
          disneyIdx++;
        } else {
          out.add(universalRoutes[universalIdx % universalRoutes.length]);
          universalIdx++;
        }
      } else if (disney) {
        out.add(disneyRoutes[disneyIdx % disneyRoutes.length]);
        disneyIdx++;
      } else if (universal) {
        out.add(universalRoutes[universalIdx % universalRoutes.length]);
        universalIdx++;
      }
    }
    return out;
  }

  static TripPlan planFromRoutes({
    required List<OrlandoParkMoodRoute> routes,
    required String cityId,
    required String destination,
    required PlacesRepository repo,
  }) {
    final days = <TripDay>[];
    for (var i = 0; i < routes.length; i++) {
      final route = routes[i];
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
            emotionalLine: route.description,
            location: place.location,
            category: 'Theme parks',
            placeId: place.id,
          ),
        );
        itemIdx++;
      }
      days.add(
        TripDay(
          dayNumber: i + 1,
          label: route.title,
          items: items,
        ),
      );
    }

    final parkLabel = _planTitle(routes);
    return TripPlan(
      id: 'concierge-$cityId-${routes.length}d',
      title: '$destination · $parkLabel',
      days: days,
    );
  }

  static DayFlow? dayFlowFromRoute(
    OrlandoParkMoodRoute route,
    PlacesRepository repo, {
    LuxPlace? homeBase,
    TripProfile? profile,
  }) {
    final start = homeBase != null
        ? LatLng(homeBase.latitude, homeBase.longitude)
        : PlaceDistance.hubCenter;

    final blocks = <DayBlock>[];
    void add(DayPhase phase, String placeId, DayBlockReason reason) {
      final place = repo.byId(placeId);
      if (place == null) return;
      blocks.add(DayBlock(phase: phase, place: place, reason: reason));
    }

    add(DayPhase.morning, route.morningPlaceId, DayBlockReason.middayIcon);
    add(DayPhase.midday, route.afternoonPlaceId, DayBlockReason.middayAdventure);
    add(DayPhase.evening, route.eveningPlaceId, DayBlockReason.eveningDining);
    if (blocks.isEmpty) return null;

    var total = 0.0;
    var prev = start;
    for (final block in blocks) {
      final here = LatLng(block.place.latitude, block.place.longitude);
      total += PlaceDistance.milesBetween(prev, here);
      prev = here;
    }

    final p = profile ?? const TripProfile();
    return DayFlow(
      blocks: blocks,
      start: start,
      totalMiles: total,
      homeBase: homeBase,
      emphases: _emphases(p),
    );
  }

  static String _planTitle(List<OrlandoParkMoodRoute> routes) {
    if (routes.isEmpty) return 'Your excursion';
    if (routes.length == 1) return 'Theme park day';
    return '${routes.length}-day park excursion';
  }

  static String _formatPhaseTime(DayPhase phase) {
    final at = CrowdPredictionService.timeForPhase(phase);
    return DateFormat.jm('en_US').format(at);
  }

  static int _parseDayCount(String lower) {
    var maxCount = 1;

    for (final match in RegExp(r'(\d+)\s*[- ]?\s*(day|night)s?').allMatches(lower)) {
      final n = int.tryParse(match.group(1) ?? '') ?? 0;
      if (n > maxCount) maxCount = n;
    }

    const wordDays = {
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
    };
    for (final entry in wordDays.entries) {
      if (RegExp('${entry.key}[\\s-]*(day|night)').hasMatch(lower)) {
        if (entry.value > maxCount) maxCount = entry.value;
      }
    }

    return maxCount.clamp(1, 7);
  }

  static bool _mentionsDisney(String lower) =>
      lower.contains('disney') ||
      lower.contains('magic kingdom') ||
      lower.contains('epcot') ||
      lower.contains('hollywood studios') ||
      lower.contains('animal kingdom');

  static bool _mentionsUniversal(String lower) =>
      lower.contains('universal') ||
      lower.contains('islands of adventure') ||
      lower.contains('volcano bay') ||
      lower.contains('epic universe');

  static int _boost(int value, int delta) => (value + delta).clamp(0, 100);

  static List<DayInterest> _emphases(TripProfile profile) {
    const threshold = 60;
    final scored = <(DayInterest, int)>[
      (DayInterest.foodie, profile.foodieInterest),
      (DayInterest.poolside, profile.poolsideInterest),
      (DayInterest.adventure, profile.adventureInterest),
      (DayInterest.culture, profile.cultureInterest),
      (DayInterest.nightlife, profile.nightlifeInterest),
    ]..sort((a, b) => b.$2.compareTo(a.$2));
    return [
      for (final s in scored)
        if (s.$2 >= threshold) s.$1,
    ].take(3).toList();
  }
}
