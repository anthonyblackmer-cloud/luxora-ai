/// Prebuilt Destin & 30A mood route — maps to [LuxPlace] ids in the active pack.
class Destin30aMoodRoute {
  const Destin30aMoodRoute({
    required this.routeId,
    required this.title,
    required this.description,
    required this.moodTags,
    required this.morningPlaceId,
    required this.lunchPlaceId,
    required this.afternoonPlaceId,
    required this.dinnerPlaceId,
    required this.eveningPlaceId,
    required this.bestStartTime,
    required this.weatherSensitive,
    required this.crowdSensitive,
    required this.estimatedDriveMinutes,
  });

  final String routeId;
  final String title;
  final String description;
  final List<String> moodTags;
  final String morningPlaceId;
  final String lunchPlaceId;
  final String afternoonPlaceId;
  final String dinnerPlaceId;
  final String eveningPlaceId;
  final String bestStartTime;
  final bool weatherSensitive;
  final bool crowdSensitive;
  final int estimatedDriveMinutes;

  List<String> get orderedPlaceIds => [
        morningPlaceId,
        lunchPlaceId,
        afternoonPlaceId,
        dinnerPlaceId,
        eveningPlaceId,
      ];
}
