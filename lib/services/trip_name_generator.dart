import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
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

  /// Preference-aware title (e.g. "Orlando Smart Park Getaway" for budget + theme parks).
  static String suggest(TripProfile profile) {
    final dest = _destination(profile);
    final descriptor = switch (profile.occasion) {
      TripOccasion.coupleAnniversary => 'Anniversary Escape',
      TripOccasion.coupleHoneymoon => 'Honeymoon Glow',
      TripOccasion.coupleDateNight => 'Date Night Escape',
      TripOccasion.coupleProposal => 'Proposal Escape',
      TripOccasion.familyWithKids => _familyTitle(profile),
      TripOccasion.disneyAdventure => _disneyTitle(profile),
      TripOccasion.universalAdventure => _universalTitle(profile),
      TripOccasion.general => _generalTitle(profile),
    };

    if (descriptor.toLowerCase().startsWith(dest.toLowerCase())) {
      return descriptor;
    }
    return '$dest $descriptor';
  }

  static bool isBudgetConscious(TripProfile profile) =>
      profile.hotelTypePreferences.contains(HotelTypePreference.budgetFriendly) ||
      profile.vacationGoals.contains(VacationGoal.saveMoney) ||
      profile.hotelBudgetLevel == HotelBudgetLevel.one;

  static String _familyTitle(TripProfile profile) =>
      isBudgetConscious(profile) ? 'Family Getaway' : 'Family Wonder';

  static String _disneyTitle(TripProfile profile) =>
      isBudgetConscious(profile) ? 'Disney Getaway' : 'Disney Adventure';

  static String _universalTitle(TripProfile profile) =>
      isBudgetConscious(profile) ? 'Universal Getaway' : 'Universal Thrills';

  static String _generalTitle(TripProfile profile) =>
      _onboardingDescriptor(profile) ?? _moodDescriptor(profile);

  static String? _onboardingDescriptor(TripProfile profile) {
    if (isBudgetConscious(profile)) {
      return _budgetDescriptor(profile);
    }

    if (_wantsLuxury(profile)) {
      if (profile.luxuryLevel == LuxuryLevel.ultraLuxury ||
          profile.hotelBudgetLevel == HotelBudgetLevel.four) {
        return 'Ultra Luxury Escape';
      }
      return 'Luxury Escape';
    }

    final fromStyles = _styleDescriptor(profile);
    if (fromStyles != null) return fromStyles;

    final fromGoals = _goalDescriptor(profile);
    if (fromGoals != null) return fromGoals;

    final fromEmotion = _emotionDescriptor(profile);
    if (fromEmotion != null) return fromEmotion;

    return _hotelTypeDescriptor(profile);
  }

  static bool _wantsLuxury(TripProfile profile) =>
      profile.hotelTypePreferences.contains(HotelTypePreference.luxuryResort) ||
      profile.hotelTypePreferences.contains(HotelTypePreference.adultsOnly) ||
      profile.vacationGoals.contains(VacationGoal.luxuryExperiences) ||
      profile.hotelBudgetLevel == HotelBudgetLevel.four ||
      profile.luxuryLevel == LuxuryLevel.ultraLuxury;

  static String _budgetDescriptor(TripProfile profile) {
    if (profile.tripStyles.contains(TripStyle.themeParks)) {
      return 'Smart Park Getaway';
    }
    if (profile.tripStyles.contains(TripStyle.foodie) ||
        profile.vacationGoals.contains(VacationGoal.bestFood)) {
      return 'Foodie on a Budget';
    }
    if (profile.tripStyles.contains(TripStyle.adventure) ||
        profile.vacationGoals.contains(VacationGoal.adventure)) {
      return 'Budget Adventure';
    }
    if (profile.tripStyles.contains(TripStyle.hiddenGems) ||
        profile.vacationGoals.contains(VacationGoal.hiddenGems)) {
      return 'Hidden Gems Getaway';
    }
    if (profile.travelerType == TravelerType.family ||
        profile.tripStyles.contains(TripStyle.familyActivities) ||
        profile.vacationGoals.contains(VacationGoal.familyTime)) {
      return 'Family Value Trip';
    }
    if (profile.tripStyles.contains(TripStyle.relaxation) ||
        profile.vacationGoals.contains(VacationGoal.relaxation)) {
      return 'Easy Getaway';
    }
    return 'Smart Getaway';
  }

  static String? _styleDescriptor(TripProfile profile) {
    final styles = profile.tripStyles;
    if (styles.contains(TripStyle.themeParks)) return 'Theme Park Adventure';
    if (styles.contains(TripStyle.foodie)) return 'Foodie Journey';
    if (styles.contains(TripStyle.romance)) return 'Golden Escape';
    if (styles.contains(TripStyle.wellness)) return 'Wellness Retreat';
    if (styles.contains(TripStyle.beaches)) return 'Beach Escape';
    if (styles.contains(TripStyle.nightlife)) return 'Nightlife Escape';
    if (styles.contains(TripStyle.adventure)) return 'Adventure';
    if (styles.contains(TripStyle.hiddenGems)) return 'Hidden Gems Escape';
    if (styles.contains(TripStyle.familyActivities)) return 'Family Escape';
    if (styles.contains(TripStyle.luxury)) return 'Luxury Escape';
    if (styles.contains(TripStyle.relaxation)) return 'Slow Escape';
    return null;
  }

  static String? _goalDescriptor(TripProfile profile) {
    for (final goal in profile.vacationGoals) {
      switch (goal) {
        case VacationGoal.romance:
          return 'Golden Escape';
        case VacationGoal.familyTime:
          return 'Family Escape';
        case VacationGoal.adventure:
          return 'Adventure';
        case VacationGoal.relaxation:
          return 'Slow Escape';
        case VacationGoal.bestFood:
          return 'Foodie Journey';
        case VacationGoal.hiddenGems:
          return 'Hidden Gems Escape';
        case VacationGoal.bestPhotos:
          return 'Photo Journey';
        case VacationGoal.nightlife:
          return 'Nightlife Escape';
        case VacationGoal.luxuryExperiences:
          return 'Luxury Escape';
        case VacationGoal.saveMoney:
          return 'Smart Getaway';
        default:
          continue;
      }
    }
    return null;
  }

  static String? _emotionDescriptor(TripProfile profile) {
    if (isBudgetConscious(profile) &&
        profile.desiredTripEmotion == DesiredTripEmotion.luxurious) {
      return null;
    }
    return switch (profile.desiredTripEmotion) {
      DesiredTripEmotion.romantic => 'Golden Escape',
      DesiredTripEmotion.adventurous => 'Adventure',
      DesiredTripEmotion.relaxed => 'Slow Escape',
      DesiredTripEmotion.luxurious => 'Luxury Escape',
      DesiredTripEmotion.familyFocused => 'Family Escape',
      DesiredTripEmotion.excited => 'Adventure',
      DesiredTripEmotion.memorable => 'Memorable Escape',
      DesiredTripEmotion.stressFree => 'Easy Escape',
      DesiredTripEmotion.inspiring => 'Discovery Escape',
    };
  }

  static String? _hotelTypeDescriptor(TripProfile profile) {
    if (profile.hotelTypePreferences.contains(HotelTypePreference.spaResort)) {
      return 'Wellness Retreat';
    }
    if (profile.hotelTypePreferences.contains(HotelTypePreference.beachfront)) {
      return 'Beach Escape';
    }
    if (profile.hotelTypePreferences.contains(HotelTypePreference.boutiqueHotel)) {
      return 'Boutique Escape';
    }
    if (profile.hotelTypePreferences.contains(HotelTypePreference.familyResort)) {
      return 'Family Escape';
    }
    return null;
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
    if (!isBudgetConscious(profile) &&
        profile.luxuryLevel == LuxuryLevel.ultraLuxury) {
      return 'Ultra Luxury Escape';
    }
    if (profile.moods.isEmpty) {
      return isBudgetConscious(profile) ? 'Smart Getaway' : 'Escape';
    }
    return switch (_primaryMood(profile)) {
      TripMood.romantic => 'Golden Escape',
      TripMood.relaxing => 'Slow Escape',
      TripMood.adventurous => 'Adventure',
      TripMood.luxurious =>
        isBudgetConscious(profile) ? 'Smart Getaway' : 'Luxury Escape',
      TripMood.familyBonding => 'Family Escape',
      TripMood.social => 'Social Escape',
      TripMood.nature => 'Nature Escape',
      TripMood.wellness => 'Wellness Retreat',
      TripMood.foodie => 'Foodie Journey',
    };
  }

  static TripMood _primaryMood(TripProfile profile) {
    if (isBudgetConscious(profile)) {
      for (final mood in profile.moods) {
        if (mood != TripMood.luxurious) return mood;
      }
    }
    return profile.moods.first;
  }

  static String _sanitize(String raw) {
    final trimmed = raw.trim();
    if (trimmed.length <= maxCustomLength) return trimmed;
    return trimmed.substring(0, maxCustomLength).trim();
  }
}
