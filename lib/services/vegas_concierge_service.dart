import 'package:luxora_ai/data/vegas/vegas_content.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/vegas/vegas_mood_route.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// Las Vegas beach & water intelligence — active when pack is selected.
abstract final class VegasBeachIntelligenceService {
  static BeachIntelligence? forPlace(String placeId) {
    if (!_isActive) return null;
    for (final b in VegasContent.beachIntelligence) {
      if (b.placeId == placeId) return b;
    }
    return null;
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == VegasContent.cityId;
}

abstract final class VegasMoodRouteService {
  static List<VegasMoodRoute> routesForActive() {
    if (!_isActive) return const [];
    return VegasContent.moodRoutes;
  }

  static VegasMoodRoute? byId(String routeId) {
    for (final r in routesForActive()) {
      if (r.routeId == routeId) return r;
    }
    return null;
  }

  static List<VegasMoodRoute> matchingTags(Set<String> tags) {
    if (tags.isEmpty) return routesForActive();
    return routesForActive()
        .where((r) => r.moodTags.any(tags.contains))
        .toList();
  }

  static bool get _isActive =>
      CityPackRegistry.instance.active.cityId == VegasContent.cityId;
}
