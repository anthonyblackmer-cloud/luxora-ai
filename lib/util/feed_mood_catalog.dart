import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';

/// Emotional filters for the Experience Feed — how the traveler wants to feel.
enum FeedMood {
  all,
  family,
  romantic,
  calm,
  adventurous,
  pampered,
  social,
  foodie,
}

extension FeedMoodX on FeedMood {
  List<String> get tags => switch (this) {
        FeedMood.all => const [],
        FeedMood.family => const ['family', 'iconic'],
        FeedMood.romantic => const ['romantic'],
        FeedMood.calm => const ['relaxing', 'wellness', 'springs', 'beach'],
        FeedMood.adventurous => const ['adventure', 'nature', 'water'],
        FeedMood.pampered => const ['luxury', 'wellness'],
        FeedMood.social => const ['nightlife', 'trending', 'social'],
        FeedMood.foodie => const ['foodie', 'dining'],
      };

  IconData get icon => switch (this) {
        FeedMood.all => Icons.auto_awesome_rounded,
        FeedMood.family => Icons.family_restroom_rounded,
        FeedMood.romantic => Icons.favorite_rounded,
        FeedMood.calm => Icons.spa_rounded,
        FeedMood.adventurous => Icons.explore_rounded,
        FeedMood.pampered => Icons.diamond_rounded,
        FeedMood.social => Icons.celebration_rounded,
        FeedMood.foodie => Icons.restaurant_rounded,
      };

  String label(AppLocalizations l) => switch (this) {
        FeedMood.all => l.feedMoodAll,
        FeedMood.family => l.feedMoodFamily,
        FeedMood.romantic => l.feedMoodRomantic,
        FeedMood.calm => l.feedMoodCalm,
        FeedMood.adventurous => l.feedMoodAdventurous,
        FeedMood.pampered => l.feedMoodPampered,
        FeedMood.social => l.feedMoodSocial,
        FeedMood.foodie => l.feedMoodFoodie,
      };

  bool matches(LuxPlace place) {
    if (this == FeedMood.all) return true;
    if (this == FeedMood.family) {
      if (place.category == LuxPlaceCategory.family) return true;
      return place.moodTags.any((t) {
        final lower = t.toLowerCase();
        return lower == 'family' || lower == 'iconic';
      });
    }
    final wanted = tags;
    return place.moodTags.any((t) => wanted.contains(t.toLowerCase()));
  }
}

/// True when the active trip profile is a family / kids trip.
bool feedTripIsFamily(TripProfile? profile) {
  if (profile == null) return false;
  final p = TripOccasionInterpreter.apply(profile);
  return p.kids > 0 ||
      p.occasion.isFamily ||
      p.moods.contains(TripMood.familyBonding);
}

/// Mood chips shown on the feed — family trips hide couple-first moods.
List<FeedMood> visibleFeedMoods(TripProfile? profile) {
  if (!feedTripIsFamily(profile)) {
    return FeedMood.values.where((m) => m != FeedMood.family).toList();
  }
  return FeedMood.values.where((m) {
    return m != FeedMood.romantic && m != FeedMood.social;
  }).toList();
}

/// Sensible default when switching into family mode or an invalid mood is active.
FeedMood defaultFeedMoodForProfile(TripProfile? profile) {
  if (feedTripIsFamily(profile)) return FeedMood.family;
  return FeedMood.all;
}

String feedMoodPromptForProfile(AppLocalizations l, TripProfile? profile) {
  if (feedTripIsFamily(profile)) return l.feedMoodPromptFamily;
  return l.feedMoodPrompt;
}

/// Keeps the selected mood valid when the profile changes.
FeedMood normalizeFeedMood(FeedMood current, TripProfile? profile) {
  final visible = visibleFeedMoods(profile);
  if (visible.contains(current)) return current;
  return defaultFeedMoodForProfile(profile);
}
