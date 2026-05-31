import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';

/// Resolved itinerary pins + route order for the map tab.
class ItineraryMapPins {
  const ItineraryMapPins({
    required this.places,
    required this.routePlaceIds,
  });

  final List<LuxPlace> places;
  final List<String> routePlaceIds;

  /// All unique geocoded stops across every day in the trip plan.
  static ItineraryMapPins? resolveFullPlan(
    TripPlan plan, {
    PlacesRepository? repo,
  }) {
    final repository = repo ?? PlacesRepository.instance;
    final places = <LuxPlace>[];
    final seen = <String>{};
    for (final day in plan.days) {
      for (final item in day.items) {
        final id = item.placeId;
        if (id == null || seen.contains(id)) continue;
        final place = repository.byId(id);
        if (place == null) continue;
        seen.add(id);
        places.add(place);
      }
    }
    if (places.isEmpty) return null;
    return ItineraryMapPins(
      places: places,
      routePlaceIds: [for (final p in places) p.id],
    );
  }

  /// Route for one agenda day — prefer concierge flow, else trip item order.
  static ItineraryMapPins? resolveDay({
    required TripDay day,
    DayFlow? dayFlow,
    PlacesRepository? repo,
  }) {
    final repository = repo ?? PlacesRepository.instance;

    if (dayFlow != null && !dayFlow.isEmpty) {
      return ItineraryMapPins(
        places: [for (final block in dayFlow.blocks) block.place],
        routePlaceIds: dayFlow.orderedPlaceIds,
      );
    }

    final places = <LuxPlace>[];
    final routeIds = <String>[];
    for (final item in day.items) {
      final id = item.placeId;
      if (id == null) continue;
      final place = repository.byId(id);
      if (place == null) continue;
      places.add(place);
      routeIds.add(id);
    }
    if (places.isEmpty) return null;
    return ItineraryMapPins(places: places, routePlaceIds: routeIds);
  }
}
