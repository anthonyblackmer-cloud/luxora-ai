import 'package:luxora_ai/models/trip_profile.dart';

/// Turns the free-text "trip feel" (and chosen moods) into concrete signal:
/// nudges the interest dials and adds the moods the words imply, so the
/// emotional description the traveler typed actually reshapes the Day Flow and
/// recommendations instead of being decorative.
abstract final class TripFeelInterpreter {
  /// Keyword → effect table. Each entry can boost dials and/or add moods.
  static const List<_FeelRule> _rules = [
    _FeelRule(
      keywords: ['romantic', 'romance', 'sunset', 'honeymoon', 'partner',
          'anniversary', 'intimate', 'candlelit'],
      foodie: 15,
      moods: [TripMood.romantic],
    ),
    _FeelRule(
      keywords: ['relax', 'slow', 'calm', 'unwind', 'spa', 'pool', 'lazy',
          'restful', 'decompress', 'peaceful', 'quiet'],
      poolside: 25,
      moods: [TripMood.relaxing],
    ),
    _FeelRule(
      keywords: ['adventure', 'adventurous', 'hike', 'explore', 'thrill',
          'kayak', 'dive', 'snorkel', 'paddle', 'wild', 'active'],
      adventure: 25,
      moods: [TripMood.adventurous],
    ),
    _FeelRule(
      keywords: ['food', 'foodie', 'dinner', 'restaurant', 'culinary', 'chef',
          'tasting', 'wine', 'cuisine', 'eat'],
      foodie: 20,
      moods: [TripMood.foodie],
    ),
    _FeelRule(
      keywords: ['party', 'nightlife', 'bar', 'club', 'dance', 'cocktail',
          'rooftop', 'live music', 'night out'],
      nightlife: 25,
      moods: [TripMood.social],
    ),
    _FeelRule(
      keywords: ['museum', 'history', 'historic', 'art', 'culture', 'cultural',
          'gallery', 'architecture'],
      culture: 25,
      moods: [],
    ),
    _FeelRule(
      keywords: ['family', 'kids', 'children', 'grandkids', 'toddler'],
      moods: [TripMood.familyBonding],
    ),
    _FeelRule(
      keywords: ['luxury', 'luxe', 'five-star', '5-star', 'opulent', 'lavish',
          'premium'],
      moods: [TripMood.luxurious],
    ),
    _FeelRule(
      keywords: ['nature', 'wildlife', 'springs', 'beach', 'ocean', 'forest',
          'outdoors', 'scenic'],
      poolside: 10,
      adventure: 10,
      moods: [TripMood.nature],
    ),
    _FeelRule(
      keywords: ['wellness', 'yoga', 'meditate', 'mindful', 'reset', 'detox',
          'rejuvenate'],
      poolside: 15,
      moods: [TripMood.wellness],
    ),
  ];

  /// Returns a copy of [profile] with dials/moods enriched from its trip feel.
  /// Idempotent enough for repeated saves (boosts clamp at 100; moods dedupe).
  static TripProfile enrich(TripProfile profile) {
    final feel = profile.tripFeel.toLowerCase();
    if (feel.trim().isEmpty) return profile;

    var foodie = profile.foodieInterest;
    var nightlife = profile.nightlifeInterest;
    var poolside = profile.poolsideInterest;
    var adventure = profile.adventureInterest;
    var culture = profile.cultureInterest;
    final moods = <TripMood>{...profile.moods};

    for (final rule in _rules) {
      if (!rule.keywords.any(feel.contains)) continue;
      foodie += rule.foodie;
      nightlife += rule.nightlife;
      poolside += rule.poolside;
      adventure += rule.adventure;
      culture += rule.culture;
      moods.addAll(rule.moods);
    }

    int clamp(int v) => v < 0 ? 0 : (v > 100 ? 100 : v);

    return profile.copyWith(
      foodieInterest: clamp(foodie),
      nightlifeInterest: clamp(nightlife),
      poolsideInterest: clamp(poolside),
      adventureInterest: clamp(adventure),
      cultureInterest: clamp(culture),
      moods: moods.toList(),
    );
  }

  /// Applies the same keyword rules to any natural-language request (Concierge
  /// chat, voice, etc.) so the Day Flow reshapes immediately.
  static TripProfile enrichFromText(TripProfile profile, String text) {
    final lower = text.toLowerCase().trim();
    if (lower.isEmpty) return profile;
    final boosted = enrich(
      profile.copyWith(tripFeel: '$lower ${profile.tripFeel}'.trim()),
    );
    return profile.copyWith(
      foodieInterest: boosted.foodieInterest,
      nightlifeInterest: boosted.nightlifeInterest,
      poolsideInterest: boosted.poolsideInterest,
      adventureInterest: boosted.adventureInterest,
      cultureInterest: boosted.cultureInterest,
      moods: boosted.moods,
    );
  }
}

class _FeelRule {
  const _FeelRule({
    required this.keywords,
    this.foodie = 0,
    this.nightlife = 0,
    this.poolside = 0,
    this.adventure = 0,
    this.culture = 0,
    this.moods = const [],
  });

  final List<String> keywords;
  final int foodie;
  final int nightlife;
  final int poolside;
  final int adventure;
  final int culture;
  final List<TripMood> moods;
}
