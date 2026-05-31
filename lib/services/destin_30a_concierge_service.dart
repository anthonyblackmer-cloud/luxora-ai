import 'package:luxora_ai/data/destin_30a/destin_30a_content.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/destin_30a/destin_30a_mood_route.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// Destin & 30A beach & water intelligence — active when pack is selected.
abstract final class Destin30aBeachIntelligenceService {
  static BeachIntelligence? forPlace(String placeId) {
    if (!_isActive) return null;
    for (final b in Destin30aContent.beachIntelligence) {
      if (b.placeId == placeId) return b;
    }
    return null;
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == Destin30aContent.cityId;
}

abstract final class Destin30aMoodRouteService {
  static List<Destin30aMoodRoute> routesForActive() {
    if (!_isActive) return const [];
    return Destin30aContent.moodRoutes;
  }

  static Destin30aMoodRoute? byId(String routeId) {
    for (final r in routesForActive()) {
      if (r.routeId == routeId) return r;
    }
    return null;
  }

  static List<Destin30aMoodRoute> matchingTags(Set<String> tags) {
    if (tags.isEmpty) return routesForActive();
    return routesForActive()
        .where((r) => r.moodTags.any(tags.contains))
        .toList();
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == Destin30aContent.cityId;
}
