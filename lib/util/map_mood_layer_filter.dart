import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/map_mood_layer.dart';

/// Filters map pins by the active mood layer.
abstract final class MapMoodLayerFilter {
  static List<LuxPlace> filterPlaces({
    required List<LuxPlace> places,
    required MapMoodLayer layer,
    required Set<String> gemPlaceIds,
    required bool rainLikely,
  }) {
    if (layer == MapMoodLayer.all) return places;
    return places.where((p) => matchesPlace(
          place: p,
          layer: layer,
          gemPlaceIds: gemPlaceIds,
          rainLikely: rainLikely,
        )).toList();
  }

  static List<String> filterRouteIds({
    required List<String> routeIds,
    required List<LuxPlace> visiblePlaces,
    required List<String> fallbackRouteIds,
  }) {
    final visible = visiblePlaces.map((p) => p.id).toSet();
    final filtered =
        routeIds.where((id) => visible.contains(id)).toList(growable: false);
    if (filtered.length >= 2) return filtered;
    return fallbackRouteIds.where((id) => visible.contains(id)).toList();
  }

  static bool matchesPlace({
    required LuxPlace place,
    required MapMoodLayer layer,
    required Set<String> gemPlaceIds,
    required bool rainLikely,
  }) {
    final tags = place.moodTags.map((t) => t.toLowerCase()).toSet();
    return switch (layer) {
      MapMoodLayer.all => true,
      MapMoodLayer.gems =>
        gemPlaceIds.contains(place.id) || _any(tags, ['hidden', 'gem', 'local', 'insider', 'secret']),
      MapMoodLayer.night =>
        place.category == LuxPlaceCategory.nightlife ||
            _any(tags, ['nightlife', 'night', 'bar', 'rooftop', 'speakeasy', 'club']),
      MapMoodLayer.dateNight =>
        place.category == LuxPlaceCategory.romantic ||
            _any(tags, ['romantic', 'couples', 'date-night', 'date_night']),
      MapMoodLayer.weather => rainLikely
          ? place.category == LuxPlaceCategory.wellness ||
              place.category == LuxPlaceCategory.springs ||
              _any(tags, ['indoor', 'museum', 'covered', 'spa', 'wellness'])
          : place.category == LuxPlaceCategory.beach ||
              place.category == LuxPlaceCategory.nature ||
              _any(tags, ['outdoor', 'beach', 'sunset', 'rooftop', 'nature', 'springs', 'water']),
    };
  }

  static bool _any(Set<String> tags, List<String> needles) =>
      needles.any(tags.contains);
}
