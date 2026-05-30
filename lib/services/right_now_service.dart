import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/data/local_secrets_registry.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/golden_hour_service.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';
import 'package:luxora_ai/services/weather_service.dart';
import 'package:luxora_ai/util/place_distance.dart';

enum RightNowScenario {
  scenicCoffeeWalk,
  perfectWeatherExplore,
  goldenHourSoon,
  rainyIndoor,
  familyCalmWindow,
  romanticEvening,
  quietHiddenGem,
}

/// One concierge-quality "do this next" moment from live signals.
class RightNowMoment {
  const RightNowMoment({
    required this.scenario,
    required this.place,
    required this.driveMinutes,
    required this.crowd,
    required this.weatherGreat,
    this.districtLabel,
    this.localSecretL10nKey,
    this.companionPlace,
  });

  final RightNowScenario scenario;
  final LuxPlace place;
  final LuxPlace? companionPlace;
  final int driveMinutes;
  final CrowdLevel crowd;
  final bool weatherGreat;
  final String? districtLabel;
  final String? localSecretL10nKey;
}

abstract final class RightNowService {
  static RightNowMoment? suggest({
    required List<LuxPlace> pool,
    required LatLng origin,
    TripProfile? profile,
    LuxWeather? weather,
    DateTime? now,
  }) {
    if (pool.isEmpty) return null;

    final clock = now ?? DateTime.now();
    final hour = clock.hour;
    final p = TripOccasionInterpreter.apply(profile ?? const TripProfile());
    final rain = weather?.rainLikely ?? false;
    final weatherGreat = weather != null &&
        !rain &&
        (weather.condition == LuxWeatherCondition.clear ||
            weather.condition == LuxWeatherCondition.partlyCloudy);

    if (rain) {
      final indoor = _pickBest(
        pool,
        origin,
        categories: const [
          LuxPlaceCategory.dining,
          LuxPlaceCategory.wellness,
          LuxPlaceCategory.family,
        ],
        tags: const ['indoor', 'foodie'],
        profile: p,
      );
      if (indoor == null) return null;
      final (place, minutes) = indoor;
      return RightNowMoment(
        scenario: RightNowScenario.rainyIndoor,
        place: place,
        driveMinutes: minutes,
        crowd: CrowdPredictionService.levelFor(
          place: place,
          atLocal: clock,
        ),
        weatherGreat: false,
        districtLabel: _district(place),
        localSecretL10nKey: LocalSecretsRegistry.l10nKeyFor(place),
      );
    }

    final golden = GoldenHourService.plan(
      weather: weather,
      origin: origin,
      pool: pool,
      profile: p,
    );
    if (golden != null && golden.sunsetAt.difference(clock).inMinutes <= 120) {
      return RightNowMoment(
        scenario: RightNowScenario.goldenHourSoon,
        place: golden.place,
        driveMinutes: golden.driveMinutes,
        crowd: CrowdPredictionService.levelFor(
          place: golden.place,
          atLocal: golden.sunsetAt,
        ),
        weatherGreat: weatherGreat,
        districtLabel: _district(golden.place),
        localSecretL10nKey: LocalSecretsRegistry.l10nKeyFor(golden.place),
      );
    }

    if (p.occasion.isFamily || p.kids > 0) {
      if (hour >= 12 && hour <= 15) {
        final calm = _pickBest(
          pool,
          origin,
          categories: const [
            LuxPlaceCategory.wellness,
            LuxPlaceCategory.beach,
            LuxPlaceCategory.family,
          ],
          tags: const ['relaxing', 'family', 'pool'],
          profile: p,
          maxCrowdScore: 55,
        );
        if (calm != null) {
          final (place, minutes) = calm;
          return RightNowMoment(
            scenario: RightNowScenario.familyCalmWindow,
            place: place,
            driveMinutes: minutes,
            crowd: CrowdPredictionService.levelFor(
              place: place,
              atLocal: clock,
            ),
            weatherGreat: weatherGreat,
            districtLabel: _district(place),
            localSecretL10nKey: LocalSecretsRegistry.l10nKeyFor(place),
          );
        }
      }
    }

    if ((p.occasion.isCouple || p.moods.contains(TripMood.romantic)) &&
        hour >= 16) {
      final romantic = _pickBest(
        pool,
        origin,
        categories: const [
          LuxPlaceCategory.dining,
          LuxPlaceCategory.romantic,
          LuxPlaceCategory.nightlife,
        ],
        tags: const ['romantic', 'sunset', 'rooftop'],
        profile: p,
      );
      if (romantic != null) {
        final (place, minutes) = romantic;
        return RightNowMoment(
          scenario: RightNowScenario.romanticEvening,
          place: place,
          driveMinutes: minutes,
          crowd: CrowdPredictionService.levelFor(
            place: place,
            atLocal: clock,
          ),
          weatherGreat: weatherGreat,
          districtLabel: _district(place),
          localSecretL10nKey: LocalSecretsRegistry.l10nKeyFor(place),
        );
      }
    }

    if (hour >= 7 && hour <= 10) {
      var coffee = _pickBest(
        pool,
        origin,
        categories: const [LuxPlaceCategory.dining],
        tags: const ['coffee', 'foodie', 'cafe'],
        profile: p,
        maxCrowdScore: 60,
      );
      coffee ??= _pickBest(
        pool,
        origin,
        categories: const [LuxPlaceCategory.dining],
        tags: const ['foodie'],
        profile: p,
        maxCrowdScore: 55,
      );
      final scenic = _pickBest(
        pool,
        origin,
        categories: const [
          LuxPlaceCategory.nature,
          LuxPlaceCategory.romantic,
          LuxPlaceCategory.beach,
        ],
        tags: const ['scenic', 'walkable', 'hidden'],
        profile: p,
        excludeId: coffee?.$1.id,
        maxCrowdScore: 50,
      );
      if (coffee != null) {
        final (place, minutes) = coffee;
        return RightNowMoment(
          scenario: RightNowScenario.scenicCoffeeWalk,
          place: place,
          companionPlace: scenic?.$1,
          driveMinutes: minutes,
          crowd: CrowdPredictionService.levelFor(
            place: place,
            atLocal: clock,
          ),
          weatherGreat: weatherGreat,
          districtLabel: _district(place),
          localSecretL10nKey: LocalSecretsRegistry.l10nKeyFor(place),
        );
      }
    }

    if (p.discoveryStyle == DiscoveryStyle.hiddenGems) {
      final gem = _pickBest(
        pool,
        origin,
        categories: const [
          LuxPlaceCategory.nature,
          LuxPlaceCategory.springs,
          LuxPlaceCategory.beach,
        ],
        tags: const ['hidden', 'scenic'],
        profile: p,
        maxCrowdScore: 45,
      );
      if (gem != null) {
        final (place, minutes) = gem;
        return RightNowMoment(
          scenario: RightNowScenario.quietHiddenGem,
          place: place,
          driveMinutes: minutes,
          crowd: CrowdPredictionService.levelFor(
            place: place,
            atLocal: clock,
          ),
          weatherGreat: weatherGreat,
          districtLabel: _district(place),
          localSecretL10nKey: LocalSecretsRegistry.l10nKeyFor(place),
        );
      }
    }

    final explore = _pickBest(
      pool,
      origin,
      categories: const [
        LuxPlaceCategory.nature,
        LuxPlaceCategory.beach,
        LuxPlaceCategory.family,
        LuxPlaceCategory.adventure,
      ],
      tags: const ['scenic', 'iconic', 'trending'],
      profile: p,
    );
    if (explore == null) return null;
    final (best, bestMinutes) = explore;
    return RightNowMoment(
      scenario: weatherGreat
          ? RightNowScenario.perfectWeatherExplore
          : RightNowScenario.quietHiddenGem,
      place: best,
      driveMinutes: bestMinutes,
      crowd: CrowdPredictionService.levelFor(place: best, atLocal: clock),
      weatherGreat: weatherGreat,
      districtLabel: _district(best),
      localSecretL10nKey: LocalSecretsRegistry.l10nKeyFor(best),
    );
  }

  static (LuxPlace place, int minutes)? _pickBest(
    List<LuxPlace> pool,
    LatLng origin, {
    required List<LuxPlaceCategory> categories,
    List<String> tags = const [],
    required TripProfile profile,
    String? excludeId,
    int maxCrowdScore = 100,
  }) {
    final lowerTags = {for (final t in tags) t.toLowerCase()};
    LuxPlace? best;
    var bestScore = double.negativeInfinity;
    var bestMinutes = 0;
    final at = DateTime.now();

    for (final place in pool) {
      if (place.id == excludeId) continue;
      final crowdScore = CrowdPredictionService.scoreFor(
        place: place,
        atLocal: at,
      );
      if (crowdScore > maxCrowdScore) continue;

      var score = 0.0;
      final catIdx = categories.indexOf(place.category);
      if (catIdx >= 0) {
        score += (categories.length - catIdx) * 8.0;
      }
      final tagHits = place.moodTags
          .where((t) => lowerTags.contains(t.toLowerCase()))
          .length;
      score += tagHits * 6.0;
      if (score <= 0 && catIdx < 0) continue;

      score += (100 - crowdScore) * 0.15;
      if (place.source == LuxPlaceSource.curated) score += 6;
      final miles = PlaceDistance.milesBetween(
        origin,
        LatLng(place.latitude, place.longitude),
      );
      final minutes = _driveMinutes(miles);
      score -= minutes * 0.4;

      if (score > bestScore) {
        bestScore = score;
        best = place;
        bestMinutes = minutes;
      }
    }

    if (best == null) return null;
    return (best, bestMinutes);
  }

  static int _driveMinutes(double miles) {
    const avgMph = 45.0;
    final m = (miles / avgMph * 60).round();
    return m < 1 ? 1 : m;
  }

  static String? _district(LuxPlace place) {
    final loc = place.location.trim();
    if (loc.isEmpty) return null;
    final parts = loc.split('·');
    final head = parts.first.trim();
    if (head.contains(',')) {
      return head.split(',').first.trim();
    }
    return head;
  }
}
