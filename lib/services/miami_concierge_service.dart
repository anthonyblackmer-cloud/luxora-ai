import 'package:luxora_ai/data/miami/miami_content.dart';
import 'package:luxora_ai/models/miami/beach_intelligence.dart';
import 'package:luxora_ai/models/miami/miami_mood_route.dart';
import 'package:luxora_ai/models/miami/nightlife_venue.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

/// Miami Beach Intelligence — active when Miami pack is selected.
abstract final class MiamiBeachIntelligenceService {
  static BeachIntelligence? forPlace(String placeId) {
    if (!_isMiamiActive) return null;
    for (final b in MiamiContent.beachIntelligence) {
      if (b.placeId == placeId) return b;
    }
    return null;
  }

  static bool get _isMiamiActive =>
      CityPackRegistry.instance.active.cityId == MiamiContent.cityId;
}

abstract final class MiamiNightlifeService {
  static List<NightlifeVenue> venuesForActive() {
    if (!_isMiamiActive) return const [];
    return MiamiContent.nightlife;
  }

  static NightlifeVenue? forPlace(String placeId) {
    for (final v in venuesForActive()) {
      if (v.placeId == placeId) return v;
    }
    return null;
  }

  static bool get _isMiamiActive =>
      CityPackRegistry.instance.active.cityId == MiamiContent.cityId;
}

abstract final class MiamiMoodRouteService {
  static List<MiamiMoodRoute> routesForActive() {
    if (!_isMiamiActive) return const [];
    return MiamiContent.moodRoutes;
  }

  static MiamiMoodRoute? byId(String routeId) {
    for (final r in routesForActive()) {
      if (r.routeId == routeId) return r;
    }
    return null;
  }

  static List<MiamiMoodRoute> matchingTags(Set<String> tags) {
    if (tags.isEmpty) return routesForActive();
    return routesForActive()
        .where((r) => r.moodTags.any(tags.contains))
        .toList();
  }

  static bool get _isMiamiActive =>
      CityPackRegistry.instance.active.cityId == MiamiContent.cityId;
}
