import 'package:luxora_ai/data/naples/naples_content.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/naples/naples_mood_route.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// Naples beach & water intelligence — active when pack is selected.
abstract final class NaplesBeachIntelligenceService {
  static BeachIntelligence? forPlace(String placeId) {
    if (!_isActive) return null;
    for (final b in NaplesContent.beachIntelligence) {
      if (b.placeId == placeId) return b;
    }
    return null;
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == NaplesContent.cityId;
}

abstract final class NaplesMoodRouteService {
  static List<NaplesMoodRoute> routesForActive() {
    if (!_isActive) return const [];
    return NaplesContent.moodRoutes;
  }

  static NaplesMoodRoute? byId(String routeId) {
    for (final r in routesForActive()) {
      if (r.routeId == routeId) return r;
    }
    return null;
  }

  static List<NaplesMoodRoute> matchingTags(Set<String> tags) {
    if (tags.isEmpty) return routesForActive();
    return routesForActive()
        .where((r) => r.moodTags.any(tags.contains))
        .toList();
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == NaplesContent.cityId;
}
