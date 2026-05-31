import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';

/// Resolves display titles for saved trips and Concierge-built itineraries.
abstract final class TripNameGenerator {
  static const int maxCustomLength = 60;

  /// User custom name when set; otherwise a Luxora-crafted title.
  static String resolve(TripProfile profile) {
    if (!profile.useAutoTripName) {
      final custom = _sanitize(profile.tripName);
      if (custom.isNotEmpty) return custom;
    }
    return suggest(profile);
  }

  /// Mood- and occasion-aware title (e.g. "Orlando Golden Escape").
  static String suggest(TripProfile profile) {
    final dest = _destination(profile);
    final descriptor = switch (profile.occasion) {
      TripOccasion.coupleAnniversary => 'Anniversary Escape',
      TripOccasion.coupleHoneymoon => 'Honeymoon Glow',
      TripOccasion.coupleDateNight => 'Date Night Escape',
      TripOccasion.coupleProposal => 'Proposal Escape',
      TripOccasion.familyWithKids => 'Family Wonder',
      TripOccasion.disneyAdventure => 'Disney Adventure',
      TripOccasion.universalAdventure => 'Universal Thrills',
      TripOccasion.general => _moodDescriptor(profile),
    };

    if (descriptor.toLowerCase().startsWith(dest.toLowerCase())) {
      return descriptor;
    }
    return '$dest $descriptor';
  }

  static String _destination(TripProfile profile) {
    final raw = profile.destination.trim();
    if (raw.isNotEmpty) return raw;
    return switch (profile.cityId) {
      'miami' => 'Miami',
      'florida-keys' => 'Florida Keys',
      _ => 'Orlando',
    };
  }

  static String _moodDescriptor(TripProfile profile) {
    if (profile.luxuryLevel == LuxuryLevel.ultraLuxury) {
      return 'Ultra Luxury Escape';
    }
    if (profile.moods.isEmpty) return 'Escape';
    return switch (profile.moods.first) {
      TripMood.romantic => 'Golden Escape',
      TripMood.relaxing => 'Slow Escape',
      TripMood.adventurous => 'Adventure',
      TripMood.luxurious => 'Luxury Escape',
      TripMood.familyBonding => 'Family Escape',
      TripMood.social => 'Social Escape',
      TripMood.nature => 'Nature Escape',
      TripMood.wellness => 'Wellness Retreat',
      TripMood.foodie => 'Foodie Journey',
    };
  }

  static String _sanitize(String raw) {
    final trimmed = raw.trim();
    if (trimmed.length <= maxCustomLength) return trimmed;
    return trimmed.substring(0, maxCustomLength).trim();
  }
}
