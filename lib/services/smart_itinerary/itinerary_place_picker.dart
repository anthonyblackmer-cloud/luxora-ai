import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/smart_itinerary/experience_duration_catalog.dart';
import 'package:luxora_ai/services/smart_itinerary/trip_preference_gates.dart';
import 'package:luxora_ai/util/place_distance.dart';

/// Inputs shared by explore-day, dining, and repair pickers.
class ItineraryPickContext {
  const ItineraryPickContext({
    required this.profile,
    required this.pool,
    required this.tripUsed,
    required this.dayUsed,
    required this.savedIds,
    required this.near,
    required this.rotationSeed,
    this.intentText = '',
  });

  final TripProfile profile;
  final List<LuxPlace> pool;
  final Set<String> tripUsed;
  final Set<String> dayUsed;
  final Set<String> savedIds;
  final LatLng near;
  final int rotationSeed;
  final String intentText;
}

/// Diversity-aware place selection across curated + OSM catalog entries.
abstract final class ItineraryPlacePicker {
  static const _topPoolSize = 18;
  static const _diningTopPoolSize = 24;

  static const _experienceCategories = [
    LuxPlaceCategory.family,
    LuxPlaceCategory.adventure,
    LuxPlaceCategory.nature,
    LuxPlaceCategory.springs,
    LuxPlaceCategory.beach,
    LuxPlaceCategory.wellness,
    LuxPlaceCategory.romantic,
  ];

  static LuxPlace? pickExperience({
    required ItineraryPickContext ctx,
    required List<LuxPlaceCategory> categories,
    List<String> tags = const [],
    bool requireTagHit = true,
    bool allowBroadFallback = true,
  }) {
    final pick = _pickFromScored(
      ctx: ctx,
      categories: categories,
      tags: tags,
      requireTagHit: requireTagHit,
      requireCategory: true,
    );
    if (pick != null) return pick;

    if (requireTagHit) {
      final relaxed = _pickFromScored(
        ctx: ctx,
        categories: categories,
        tags: tags,
        requireTagHit: false,
        requireCategory: true,
      );
      if (relaxed != null) return relaxed;
    }

    if (!allowBroadFallback) return null;

    return _pickFromScored(
      ctx: ctx,
      categories: _experienceCategories,
      tags: const [],
      requireTagHit: false,
      requireCategory: false,
    );
  }

  static LuxPlace? pickDining({required ItineraryPickContext ctx}) {
    final scored = <({LuxPlace place, double score})>[];
    for (final place in ctx.pool) {
      if (!_isDiningCandidate(place)) continue;
      final score = _scoreDining(place, ctx);
      if (score <= double.negativeInfinity) continue;
      scored.add((place: place, score: score));
    }
    return _rotatePick(scored, ctx.rotationSeed, topN: _diningTopPoolSize);
  }

  static LuxPlace? pickReplacement({
    required ItineraryPickContext ctx,
    required LuxPlaceCategory category,
  }) {
    return _pickFromScored(
      ctx: ctx,
      categories: [category],
      tags: const [],
      requireTagHit: false,
      requireCategory: true,
    );
  }

  static LuxPlace? pickDayFiller({
    required ItineraryPickContext ctx,
    int majorParksOnDay = 0,
  }) {
    final scored = <({LuxPlace place, double score})>[];
    for (final place in ctx.pool) {
      if (!_isExperienceCandidate(place)) continue;
      if (ctx.dayUsed.contains(place.id)) continue;
      if (!TripPreferenceGates.allowsPlace(ctx.profile, place.id)) continue;
      if (!TripPreferenceGates.allowsWellnessPlace(ctx.profile, place)) continue;
      if (ExperienceDurationCatalog.isMajorThemePark(place.id) &&
          majorParksOnDay >= 1) {
        continue;
      }

      var score = 14.0;
      score += _intentBoost(place, ctx);
      score += _diversityAdjust(place, ctx);
      score += _freshnessAdjust(place, ctx);

      if (ExperienceDurationCatalog.isWaterPark(place.id)) {
        score += ctx.profile.adventureInterest >= 35 ? 18 : 8;
      } else if (ExperienceDurationCatalog.isMajorThemePark(place.id)) {
        score += ctx.profile.adventureInterest >= 50 ? 12 : -6;
      } else if (ExperienceDurationCatalog.profileFor(place)
          .isFullDayDestination) {
        score -= 10;
      }

      if (place.moodTags.any(
        (t) => const {'iconic', 'trending', 'family', 'adventure'}.contains(t),
      )) {
        score += 8;
      }

      score -= _milesFrom(ctx.near, place) * 0.2;
      if (score <= double.negativeInfinity) continue;
      scored.add((place: place, score: score));
    }
    return _rotatePick(scored, ctx.rotationSeed);
  }

  static LuxPlace? _pickFromScored({
    required ItineraryPickContext ctx,
    required List<LuxPlaceCategory> categories,
    required List<String> tags,
    required bool requireTagHit,
    required bool requireCategory,
  }) {
    final scored = <({LuxPlace place, double score})>[];
    for (final place in ctx.pool) {
      if (!_isExperienceCandidate(place)) continue;
      final score = _scoreExperience(
        place,
        ctx,
        categories: categories,
        tags: tags,
        requireTagHit: requireTagHit,
        requireCategory: requireCategory,
      );
      if (score <= double.negativeInfinity) continue;
      scored.add((place: place, score: score));
    }
    return _rotatePick(scored, ctx.rotationSeed);
  }

  static double _scoreExperience(
    LuxPlace place,
    ItineraryPickContext ctx, {
    required List<LuxPlaceCategory> categories,
    required List<String> tags,
    required bool requireTagHit,
    required bool requireCategory,
  }) {
    if (ctx.dayUsed.contains(place.id)) {
      return double.negativeInfinity;
    }
    if (!TripPreferenceGates.allowsPlace(ctx.profile, place.id)) {
      return double.negativeInfinity;
    }
    if (!TripPreferenceGates.allowsWellnessPlace(ctx.profile, place)) {
      return double.negativeInfinity;
    }

    var score = 6.0;
    if (categories.isNotEmpty) {
      final catIndex = categories.indexOf(place.category);
      if (catIndex < 0) {
        if (requireCategory) return double.negativeInfinity;
      } else {
        score += (categories.length - catIndex) * 10.0;
      }
    }

    final lowerTags = {for (final t in tags) t.toLowerCase()};
    final tagHits = place.moodTags
        .where((t) => lowerTags.contains(t.toLowerCase()))
        .length;
    score += tagHits * 5.0;

    if (requireTagHit && tags.isNotEmpty && tagHits == 0) {
      return double.negativeInfinity;
    }
    if (score <= 0 && requireCategory) {
      return double.negativeInfinity;
    }

    score += _intentBoost(place, ctx);
    score += _diversityAdjust(place, ctx);
    score += _freshnessAdjust(place, ctx);
    score -= _milesFrom(ctx.near, place) * 0.18;

    return score;
  }

  static double _scoreDining(LuxPlace place, ItineraryPickContext ctx) {
    if (ctx.dayUsed.contains(place.id)) {
      return double.negativeInfinity;
    }

    var score = ctx.profile.foodieInterest.toDouble();
    score += _diversityAdjust(place, ctx);
    score += _freshnessAdjust(place, ctx);

    for (final cuisine in ctx.profile.cuisinePreferences) {
      if (place.moodTags.any((t) => t.toLowerCase().contains(cuisine.name)) ||
          place.title.toLowerCase().contains(cuisine.name)) {
        score += 14;
      }
    }
    for (final style in ctx.profile.diningPreferences) {
      score += switch (style) {
        DiningPreference.fineDining =>
          place.moodTags.any((t) => t.contains('luxury')) ? 12 : 0,
        DiningPreference.dateNight =>
          place.moodTags.any((t) => t.contains('romantic')) ? 12 : 0,
        DiningPreference.hiddenGems =>
          place.moodTags.any((t) => t.contains('hidden')) ? 10 : 0,
        DiningPreference.waterfront =>
          place.location.toLowerCase().contains('water') ? 10 : 0,
        _ => 0,
      };
    }
    if (ctx.savedIds.contains(place.id)) score += 22;
    if (place.moodTags.any(
      (t) => const {'foodie', 'dining', 'romantic'}.contains(t),
    )) {
      score += 8;
    }
    score -= _milesFrom(ctx.near, place) * 0.22;
    return score;
  }

  static double _intentBoost(LuxPlace place, ItineraryPickContext ctx) {
    final blob = '${ctx.intentText} ${ctx.profile.tripFeel}'.toLowerCase();
    final id = place.id.toLowerCase();
    final title = place.title.toLowerCase();
    var boost = 0.0;

    if (blob.contains('water park') ||
        blob.contains('waterpark') ||
        blob.contains('volcano')) {
      if (ExperienceDurationCatalog.isWaterPark(place.id)) boost += 28;
    }
    if (blob.contains('seaworld') ||
        blob.contains('aquatica') ||
        blob.contains('discovery cove')) {
      if (id.contains('seaworld') ||
          id.contains('aquatica') ||
          id.contains('discovery-cove')) {
        boost += 28;
      }
    }
    if (blob.contains('disney') || blob.contains('magic kingdom')) {
      if (ExperienceDurationCatalog.disneyResortMajorIds.contains(place.id) ||
          id.contains('disney') ||
          title.contains('disney')) {
        boost += 18;
      }
    }
    if (blob.contains('universal') || blob.contains('islands of adventure')) {
      if (ExperienceDurationCatalog.universalResortMajorIds.contains(place.id) ||
          id.contains('universal') ||
          title.contains('universal')) {
        boost += 18;
      }
    }
    if (blob.contains('theme park')) {
      if (ExperienceDurationCatalog.isMajorThemePark(place.id) ||
          ExperienceDurationCatalog.isWaterPark(place.id)) {
        boost += 14;
      }
    }
    if (ctx.profile.adventureInterest >= 55) {
      if (ExperienceDurationCatalog.isMajorThemePark(place.id) ||
          ExperienceDurationCatalog.isWaterPark(place.id)) {
        boost += 6;
      }
    }
    if (TripPreferenceGates.isFriendsOrAdultSocialTrip(ctx.profile) &&
        place.moodTags.contains('family') &&
        !TripPreferenceGates.wantsFamilyAttractions(ctx.profile)) {
      boost -= 35;
    }
    if (ctx.profile.discoveryStyle == DiscoveryStyle.hiddenGems &&
        place.moodTags.any((t) => t.contains('hidden'))) {
      boost += 10;
    }
    for (final token in _titleMatchTokens(place)) {
      if (blob.contains(token)) {
        boost += 22;
      }
    }
    return boost;
  }

  static List<String> _titleMatchTokens(LuxPlace place) {
    const stop = {
      'the',
      'and',
      'for',
      'with',
      'from',
      'at',
      'orlando',
      'miami',
      'tampa',
      'florida',
      'park',
      'world',
      'resort',
      'hotel',
    };
    return place.title
        .toLowerCase()
        .split(RegExp(r'[^\w]+'))
        .where((t) => t.length >= 4 && !stop.contains(t))
        .toList();
  }

  static double _diversityAdjust(LuxPlace place, ItineraryPickContext ctx) {
    if (ctx.tripUsed.contains(place.id)) return -75;
    return 0;
  }

  static double _freshnessAdjust(LuxPlace place, ItineraryPickContext ctx) {
    final curatedUsed = ctx.tripUsed
        .where((id) => id.startsWith('place-') || id.startsWith('dining-'))
        .length;

    if (place.source == LuxPlaceSource.osm) {
      var boost = 6.0;
      if (curatedUsed >= 3) boost += 14;
      if (curatedUsed >= 6) boost += 10;
      return boost;
    }
    if (place.source == LuxPlaceSource.curated) {
      return curatedUsed >= 8 ? -4 : 4;
    }
    return 0;
  }

  static LuxPlace? _rotatePick(
    List<({LuxPlace place, double score})> scored,
    int rotationSeed, {
    int topN = _topPoolSize,
  }) {
    if (scored.isEmpty) return null;
    scored.sort((a, b) => b.score.compareTo(a.score));
    final viable = scored.take(topN).toList();
    if (viable.isEmpty) return null;
    return viable[rotationSeed.abs() % viable.length].place;
  }

  static bool _isExperienceCandidate(LuxPlace place) {
    if (place.moodTags.contains('trip-cover')) return false;
    return place.category != LuxPlaceCategory.dining &&
        place.category != LuxPlaceCategory.nightlife &&
        place.category != LuxPlaceCategory.hotel;
  }

  static bool _isDiningCandidate(LuxPlace place) {
    if (place.moodTags.contains('trip-cover')) return false;
    return place.category == LuxPlaceCategory.dining ||
        place.category == LuxPlaceCategory.romantic;
  }

  static double _milesFrom(LatLng from, LuxPlace place) =>
      PlaceDistance.milesBetween(from, LatLng(place.latitude, place.longitude));
}
