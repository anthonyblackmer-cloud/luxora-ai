import 'package:luxora_ai/data/tampa_bay/tampa_bay_content.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/tampa_bay/tampa_bay_mood_route.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// Tampa Bay beach & water intelligence — active when Tampa Bay pack is selected.
abstract final class TampaBayBeachIntelligenceService {
  static BeachIntelligence? forPlace(String placeId) {
    if (!_isActive) return null;
    for (final b in TampaBayContent.beachIntelligence) {
      if (b.placeId == placeId) return b;
    }
    return null;
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == TampaBayContent.cityId;
}

abstract final class TampaBayMoodRouteService {
  static List<TampaBayMoodRoute> routesForActive() {
    if (!_isActive) return const [];
    return TampaBayContent.moodRoutes;
  }

  static TampaBayMoodRoute? byId(String routeId) {
    for (final r in routesForActive()) {
      if (r.routeId == routeId) return r;
    }
    return null;
  }

  static List<TampaBayMoodRoute> matchingTags(Set<String> tags) {
    if (tags.isEmpty) return routesForActive();
    return routesForActive()
        .where((r) => r.moodTags.any(tags.contains))
        .toList();
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == TampaBayContent.cityId;
}
