import 'package:luxora_ai/data/florida_keys/florida_keys_content.dart';
import 'package:luxora_ai/models/florida_keys/keys_mood_route.dart';
import 'package:luxora_ai/models/florida_keys/keys_water_intelligence.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// Florida Keys water intelligence — active when Keys pack is selected.
abstract final class KeysWaterIntelligenceService {
  static KeysWaterIntelligence? forPlace(String placeId) {
    if (!_isKeysActive) return null;
    for (final w in FloridaKeysContent.waterIntelligence) {
      if (w.placeId == placeId) return w;
    }
    return null;
  }

  static bool get _isKeysActive =>
      CityPackRegistry.instance.active.cityId == FloridaKeysContent.cityId;
}

abstract final class KeysMoodRouteService {
  static List<KeysMoodRoute> routesForActive() {
    if (!_isKeysActive) return const [];
    return FloridaKeysContent.moodRoutes;
  }

  static KeysMoodRoute? byId(String routeId) {
    for (final r in routesForActive()) {
      if (r.routeId == routeId) return r;
    }
    return null;
  }

  static List<KeysMoodRoute> matchingTags(Set<String> tags) {
    if (tags.isEmpty) return routesForActive();
    return routesForActive()
        .where((r) => r.moodTags.any(tags.contains))
        .toList();
  }

  static bool get _isKeysActive =>
      CityPackRegistry.instance.active.cityId == FloridaKeysContent.cityId;
}
