import 'package:luxora_ai/data/nyc/nyc_content.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/nyc/nyc_mood_route.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// New York City beach & water intelligence — active when pack is selected.
abstract final class NycBeachIntelligenceService {
  static BeachIntelligence? forPlace(String placeId) {
    if (!_isActive) return null;
    for (final b in NycContent.beachIntelligence) {
      if (b.placeId == placeId) return b;
    }
    return null;
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == NycContent.cityId;
}

abstract final class NycMoodRouteService {
  static List<NycMoodRoute> routesForActive() {
    if (!_isActive) return const [];
    return NycContent.moodRoutes;
  }

  static NycMoodRoute? byId(String routeId) {
    for (final r in routesForActive()) {
      if (r.routeId == routeId) return r;
    }
    return null;
  }

  static List<NycMoodRoute> matchingTags(Set<String> tags) {
    if (tags.isEmpty) return routesForActive();
    return routesForActive()
        .where((r) => r.moodTags.any(tags.contains))
        .toList();
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == NycContent.cityId;
}
