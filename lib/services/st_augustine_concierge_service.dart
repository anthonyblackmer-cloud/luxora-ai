import 'package:luxora_ai/data/st_augustine/st_augustine_content.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/st_augustine/st_augustine_mood_route.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// St. Augustine beach & water intelligence — active when pack is selected.
abstract final class StAugustineBeachIntelligenceService {
  static BeachIntelligence? forPlace(String placeId) {
    if (!_isActive) return null;
    for (final b in StAugustineContent.beachIntelligence) {
      if (b.placeId == placeId) return b;
    }
    return null;
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == StAugustineContent.cityId;
}

abstract final class StAugustineMoodRouteService {
  static List<StAugustineMoodRoute> routesForActive() {
    if (!_isActive) return const [];
    return StAugustineContent.moodRoutes;
  }

  static StAugustineMoodRoute? byId(String routeId) {
    for (final r in routesForActive()) {
      if (r.routeId == routeId) return r;
    }
    return null;
  }

  static List<StAugustineMoodRoute> matchingTags(Set<String> tags) {
    if (tags.isEmpty) return routesForActive();
    return routesForActive()
        .where((r) => r.moodTags.any(tags.contains))
        .toList();
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == StAugustineContent.cityId;
}
