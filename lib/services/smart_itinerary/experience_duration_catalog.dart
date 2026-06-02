import 'package:luxora_ai/models/lux_place.dart';

/// How draining an experience feels for daily energy budgeting.
enum ExperienceEnergyCost {
  low,
  medium,
  high,
  veryHigh;

  int get score => switch (this) {
        ExperienceEnergyCost.low => 1,
        ExperienceEnergyCost.medium => 2,
        ExperienceEnergyCost.high => 4,
        ExperienceEnergyCost.veryHigh => 6,
      };
}

/// Duration and energy metadata for itinerary validation.
class ExperienceProfile {
  const ExperienceProfile({
    required this.minDurationMinutes,
    required this.idealDurationMinutes,
    required this.maxDurationMinutes,
    required this.energyCost,
    this.isMajorThemePark = false,
    this.isFullDayDestination = false,
    this.weatherSensitive = false,
    this.crowdSensitive = false,
  });

  final int minDurationMinutes;
  final int idealDurationMinutes;
  final int maxDurationMinutes;
  final ExperienceEnergyCost energyCost;
  final bool isMajorThemePark;
  final bool isFullDayDestination;
  final bool weatherSensitive;
  final bool crowdSensitive;
}

/// Curated duration model — AI suggests, rules validate against this catalog.
abstract final class ExperienceDurationCatalog {
  static const majorThemeParkIds = {
    'place-magic-kingdom',
    'place-epcot',
    'place-hollywood-studios',
    'place-animal-kingdom',
    'place-universal-studios',
    'place-islands-of-adventure',
    'place-epic-universe',
    'place-kennedy-space-center',
    'place-seaworld-orlando',
    'place-legoland-florida',
  };

  static const waterParkIds = {
    'place-volcano-bay',
    'place-typhoon-lagoon',
    'place-blizzard-beach',
    'place-discovery-cove',
  };

  static const lightEveningIds = {
    'place-disney-springs',
  };

  static const disneyResortMajorIds = {
    'place-magic-kingdom',
    'place-epcot',
    'place-hollywood-studios',
    'place-animal-kingdom',
  };

  static const universalResortMajorIds = {
    'place-universal-studios',
    'place-islands-of-adventure',
    'place-epic-universe',
  };

  static bool isMajorThemePark(String placeId) =>
      majorThemeParkIds.contains(placeId);

  static bool isWaterPark(String placeId) => waterParkIds.contains(placeId);

  static bool allowsParkHopper(String message) {
    final lower = message.toLowerCase();
    return lower.contains('park hopper') ||
        lower.contains('park-hopper') ||
        lower.contains('park to park') ||
        lower.contains('park-to-park') ||
        lower.contains('two park') ||
        lower.contains('2 park') ||
        lower.contains('hopper');
  }

  static ExperienceProfile profileFor(LuxPlace place) {
    final override = _byPlaceId[place.id];
    if (override != null) return override;
    return _byCategory[place.category] ?? _defaultProfile;
  }

  static const _defaultProfile = ExperienceProfile(
    minDurationMinutes: 45,
    idealDurationMinutes: 90,
    maxDurationMinutes: 180,
    energyCost: ExperienceEnergyCost.medium,
    weatherSensitive: true,
  );

  static const _majorThemePark = ExperienceProfile(
    minDurationMinutes: 360,
    idealDurationMinutes: 480,
    maxDurationMinutes: 720,
    energyCost: ExperienceEnergyCost.veryHigh,
    isMajorThemePark: true,
    isFullDayDestination: true,
    weatherSensitive: true,
    crowdSensitive: true,
  );

  static const _waterPark = ExperienceProfile(
    minDurationMinutes: 180,
    idealDurationMinutes: 300,
    maxDurationMinutes: 480,
    energyCost: ExperienceEnergyCost.high,
    weatherSensitive: true,
    crowdSensitive: false,
  );

  static const _byPlaceId = <String, ExperienceProfile>{
    'place-magic-kingdom': _majorThemePark,
    'place-epcot': _majorThemePark,
    'place-hollywood-studios': _majorThemePark,
    'place-animal-kingdom': _majorThemePark,
    'place-universal-studios': _majorThemePark,
    'place-islands-of-adventure': _majorThemePark,
    'place-epic-universe': _majorThemePark,
    'place-kennedy-space-center': ExperienceProfile(
      minDurationMinutes: 360,
      idealDurationMinutes: 420,
      maxDurationMinutes: 540,
      energyCost: ExperienceEnergyCost.veryHigh,
      isFullDayDestination: true,
      weatherSensitive: false,
      crowdSensitive: true,
    ),
    'place-seaworld-orlando': ExperienceProfile(
      minDurationMinutes: 240,
      idealDurationMinutes: 360,
      maxDurationMinutes: 480,
      energyCost: ExperienceEnergyCost.high,
      isFullDayDestination: true,
      weatherSensitive: true,
      crowdSensitive: true,
    ),
    'place-disney-springs': ExperienceProfile(
      minDurationMinutes: 90,
      idealDurationMinutes: 150,
      maxDurationMinutes: 240,
      energyCost: ExperienceEnergyCost.low,
      weatherSensitive: false,
      crowdSensitive: false,
    ),
    'place-volcano-bay': _waterPark,
    'place-typhoon-lagoon': _waterPark,
    'place-blizzard-beach': _waterPark,
    'place-discovery-cove': _waterPark,
  };

  static const _byCategory = <LuxPlaceCategory, ExperienceProfile>{
    LuxPlaceCategory.dining: ExperienceProfile(
      minDurationMinutes: 60,
      idealDurationMinutes: 90,
      maxDurationMinutes: 150,
      energyCost: ExperienceEnergyCost.low,
    ),
    LuxPlaceCategory.beach: ExperienceProfile(
      minDurationMinutes: 120,
      idealDurationMinutes: 180,
      maxDurationMinutes: 300,
      energyCost: ExperienceEnergyCost.medium,
      weatherSensitive: true,
    ),
    LuxPlaceCategory.springs: ExperienceProfile(
      minDurationMinutes: 120,
      idealDurationMinutes: 180,
      maxDurationMinutes: 300,
      energyCost: ExperienceEnergyCost.medium,
      weatherSensitive: true,
    ),
    LuxPlaceCategory.wellness: ExperienceProfile(
      minDurationMinutes: 90,
      idealDurationMinutes: 150,
      maxDurationMinutes: 240,
      energyCost: ExperienceEnergyCost.low,
    ),
    LuxPlaceCategory.nightlife: ExperienceProfile(
      minDurationMinutes: 90,
      idealDurationMinutes: 150,
      maxDurationMinutes: 240,
      energyCost: ExperienceEnergyCost.medium,
    ),
    LuxPlaceCategory.family: ExperienceProfile(
      minDurationMinutes: 120,
      idealDurationMinutes: 240,
      maxDurationMinutes: 480,
      energyCost: ExperienceEnergyCost.high,
      crowdSensitive: true,
    ),
    LuxPlaceCategory.adventure: ExperienceProfile(
      minDurationMinutes: 120,
      idealDurationMinutes: 240,
      maxDurationMinutes: 480,
      energyCost: ExperienceEnergyCost.high,
      weatherSensitive: true,
    ),
    LuxPlaceCategory.nature: ExperienceProfile(
      minDurationMinutes: 90,
      idealDurationMinutes: 150,
      maxDurationMinutes: 240,
      energyCost: ExperienceEnergyCost.medium,
      weatherSensitive: true,
    ),
    LuxPlaceCategory.romantic: ExperienceProfile(
      minDurationMinutes: 90,
      idealDurationMinutes: 120,
      maxDurationMinutes: 180,
      energyCost: ExperienceEnergyCost.low,
    ),
    LuxPlaceCategory.hotel: ExperienceProfile(
      minDurationMinutes: 30,
      idealDurationMinutes: 60,
      maxDurationMinutes: 90,
      energyCost: ExperienceEnergyCost.low,
    ),
  };
}
