/// Miami Beach Intelligence — lifestyle scores for beach pins.
class BeachIntelligence {
  const BeachIntelligence({
    required this.placeId,
    required this.bestTimeToVisit,
    required this.familyFriendlyScore,
    required this.crowdScore,
    required this.photoScore,
    required this.romanceScore,
    required this.walkabilityScore,
    required this.windSensitivity,
    required this.sunsetValue,
    required this.sunriseValue,
    this.nearbyRestaurantPlaceIds = const [],
    this.parkingDifficulty = 'moderate',
  });

  final String placeId;
  final String bestTimeToVisit;
  final int familyFriendlyScore;
  final int crowdScore;
  final int photoScore;
  final int romanceScore;
  final int walkabilityScore;
  final int windSensitivity;
  final int sunsetValue;
  final int sunriseValue;
  final List<String> nearbyRestaurantPlaceIds;
  final String parkingDifficulty;
}
