class AttractionDetail {
  const AttractionDetail({
    required this.placeId,
    required this.title,
    required this.emotionalHook,
    required this.whySpecial,
    required this.bestTimeToGo,
    required this.insiderTips,
    required this.practicalDetails,
    required this.vibeMatch,
    required this.nearbyGemPlaceIds,
  });

  final String placeId;
  final String title;
  final String emotionalHook;
  final String whySpecial;
  final String bestTimeToGo;
  final String insiderTips;
  final AttractionPracticalDetails practicalDetails;
  final List<String> vibeMatch;
  final List<String> nearbyGemPlaceIds;
}

class AttractionPracticalDetails {
  const AttractionPracticalDetails({
    required this.typicalDuration,
    required this.costRange,
    required this.bestFor,
  });

  final String typicalDuration;
  final String costRange;
  final List<String> bestFor;
}
