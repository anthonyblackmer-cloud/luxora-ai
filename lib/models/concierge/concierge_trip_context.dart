/// Context payload sent to the concierge AI backend.
class ConciergeTripContext {
  const ConciergeTripContext({
    required this.cityId,
    required this.cityName,
    required this.region,
    required this.locale,
    this.tripFeel,
    this.moods = const [],
    this.stylePrefs = const [],
    this.budgetUsd,
    this.adults,
    this.kids,
    this.occasion,
    this.places = const [],
  });

  final String cityId;
  final String cityName;
  final String region;
  final String locale;
  final String? tripFeel;
  final List<String> moods;
  final List<String> stylePrefs;
  final int? budgetUsd;
  final int? adults;
  final int? kids;
  final String? occasion;
  final List<ConciergePlaceHint> places;

  Map<String, dynamic> toJson() => {
        'cityId': cityId,
        'cityName': cityName,
        'region': region,
        'locale': locale,
        if (tripFeel != null && tripFeel!.trim().isNotEmpty)
          'tripFeel': tripFeel!.trim(),
        if (moods.isNotEmpty) 'moods': moods,
        if (stylePrefs.isNotEmpty) 'stylePrefs': stylePrefs,
        if (budgetUsd != null) 'budgetUsd': budgetUsd,
        if (adults != null) 'adults': adults,
        if (kids != null) 'kids': kids,
        if (occasion != null) 'occasion': occasion,
        if (places.isNotEmpty)
          'places': places.map((p) => p.toJson()).toList(),
      };
}

class ConciergePlaceHint {
  const ConciergePlaceHint({
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    this.moodTags = const [],
  });

  final String id;
  final String title;
  final String category;
  final String location;
  final List<String> moodTags;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'location': location,
        if (moodTags.isNotEmpty) 'moodTags': moodTags,
      };
}

class ConciergeChatMessage {
  const ConciergeChatMessage({required this.role, required this.content});

  final String role;
  final String content;

  Map<String, dynamic> toJson() => {'role': role, 'content': content};
}
