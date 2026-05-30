/// Prebuilt Orlando theme-park day route — maps to [LuxPlace] ids.
class OrlandoParkMoodRoute {
  const OrlandoParkMoodRoute({
    required this.routeId,
    required this.title,
    required this.description,
    required this.moodTags,
    required this.morningPlaceId,
    required this.afternoonPlaceId,
    required this.eveningPlaceId,
    required this.bestStartTime,
    required this.crowdSensitive,
  });

  final String routeId;
  final String title;
  final String description;
  final List<String> moodTags;
  final String morningPlaceId;
  final String afternoonPlaceId;
  final String eveningPlaceId;
  final String bestStartTime;
  final bool crowdSensitive;

  List<String> get orderedPlaceIds => [
        morningPlaceId,
        afternoonPlaceId,
        eveningPlaceId,
      ];
}
