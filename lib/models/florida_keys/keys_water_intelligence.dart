/// Florida Keys water & beach intelligence — reef, wind, and sunset scoring.
class KeysWaterIntelligence {
  const KeysWaterIntelligence({
    required this.placeId,
    required this.bestTimeToVisit,
    required this.waterTemperatureNote,
    required this.snorkelingQuality,
    required this.divingConditions,
    required this.boatingSuitability,
    required this.fishingOutlook,
    required this.windSensitivity,
    required this.sunsetQuality,
    required this.crowdLevel,
    this.nearbyRestaurantPlaceIds = const [],
    this.parkingDifficulty = 'moderate',
  });

  final String placeId;
  final String bestTimeToVisit;
  final String waterTemperatureNote;
  final int snorkelingQuality;
  final int divingConditions;
  final int boatingSuitability;
  final int fishingOutlook;
  final int windSensitivity;
  final int sunsetQuality;
  final int crowdLevel;
  final List<String> nearbyRestaurantPlaceIds;
  final String parkingDifficulty;
}
