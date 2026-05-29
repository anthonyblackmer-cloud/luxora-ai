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
    this.officialMapUrl,
    this.menu = const [],
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

  /// Link to a publicly available official park/guide map, when one exists
  /// (e.g. Disney's maps hub or Universal's printable PDF). `null` otherwise.
  final String? officialMapUrl;

  /// Curated signature/highlight menu items for restaurants. Empty for
  /// non-dining places. Prices are representative and may change at the venue.
  final List<MenuItem> menu;

  AttractionDetail copyWith({String? officialMapUrl, List<MenuItem>? menu}) {
    return AttractionDetail(
      placeId: placeId,
      title: title,
      emotionalHook: emotionalHook,
      whySpecial: whySpecial,
      bestTimeToGo: bestTimeToGo,
      insiderTips: insiderTips,
      practicalDetails: practicalDetails,
      vibeMatch: vibeMatch,
      nearbyGemPlaceIds: nearbyGemPlaceIds,
      officialMapUrl: officialMapUrl ?? this.officialMapUrl,
      menu: menu ?? this.menu,
    );
  }
}

/// A single curated menu highlight. [course] groups items (e.g. "Starters",
/// "Mains", "Desserts", "Drinks"). [price] is a display string (e.g. "\$18").
class MenuItem {
  const MenuItem({
    required this.course,
    required this.name,
    required this.description,
    required this.price,
  });

  final String course;
  final String name;
  final String description;
  final String price;
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
