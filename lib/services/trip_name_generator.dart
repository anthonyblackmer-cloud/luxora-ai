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

  /// Preference-aware title from onboarding choices — not a single luxury default.
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
      TripOccasion.general => _generalDescriptor(profile),
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

  static String _familyTitle(TripProfile profile) {
    if (profile.tripStyles.contains(TripStyle.themeParks)) {
      return isBudgetConscious(profile)
          ? 'Family Park Getaway'
          : 'Family Park Adventure';
    }
    return isBudgetConscious(profile) ? 'Family Getaway' : 'Family Wonder';
  }

  static String _disneyTitle(TripProfile profile) =>
      isBudgetConscious(profile) ? 'Disney Getaway' : 'Disney Adventure';

  static String _universalTitle(TripProfile profile) =>
      isBudgetConscious(profile) ? 'Universal Getaway' : 'Universal Thrills';

  static String _generalDescriptor(TripProfile profile) {
    if (isBudgetConscious(profile)) {
      return _budgetDescriptor(profile);
    }

    final fromOnboarding = _scoreOnboardingSignals(profile);
    if (fromOnboarding != null) return fromOnboarding;

    return _legacyMoodDescriptor(profile);
  }

  /// Weighted merge of onboarding 2.0 selections — styles/goals beat legacy moods.
  static String? _scoreOnboardingSignals(TripProfile profile) {
    final scores = <String, int>{};

    void add(String label, int points) {
      if (points <= 0) return;
      scores[label] = (scores[label] ?? 0) + points;
    }

    _scoreCombos(profile, add);
    _scoreTripStyles(profile, add);
    _scoreExperiencePreferences(profile, add);
    _scoreVacationGoals(profile, add);
    _scoreHotelTypes(profile, add);
    _scoreEmotion(profile, add);
    _scoreTravelParty(profile, add);

    if (scores.isEmpty) return null;

    return scores.entries
        .reduce((a, b) => a.value >= b.value ? a : b)
        .key;
  }

  static void _scoreCombos(
    TripProfile profile,
    void Function(String label, int points) add,
  ) {
    final styles = profile.tripStyles.toSet();
    final family = profile.travelerType == TravelerType.family ||
        styles.contains(TripStyle.familyActivities) ||
        profile.vacationGoals.contains(VacationGoal.familyTime);

    if (styles.contains(TripStyle.themeParks) && family) {
      add('Family Park Adventure', 120);
    }
    if (styles.contains(TripStyle.foodie) && styles.contains(TripStyle.romance)) {
      add('Romantic Foodie Escape', 115);
    }
    if (styles.contains(TripStyle.beaches) && styles.contains(TripStyle.relaxation)) {
      add('Beach Reset', 110);
    }
    if (styles.contains(TripStyle.hiddenGems) &&
        styles.contains(TripStyle.localExperiences)) {
      add('Local Discovery Escape', 110);
    }
    if (styles.contains(TripStyle.wellness) &&
        profile.hotelTypePreferences.contains(HotelTypePreference.spaResort)) {
      add('Wellness Retreat', 105);
    }
  }

  static void _scoreTripStyles(
    TripProfile profile,
    void Function(String label, int points) add,
  ) {
    for (final style in profile.tripStyles) {
      switch (style) {
        case TripStyle.themeParks:
          add('Theme Park Adventure', 95);
        case TripStyle.foodie:
          add('Foodie Journey', 92);
        case TripStyle.romance:
          add('Golden Escape', 90);
        case TripStyle.wellness:
          add('Wellness Retreat', 88);
        case TripStyle.beaches:
          add('Beach Escape', 88);
        case TripStyle.nightlife:
          add('Nightlife Escape', 86);
        case TripStyle.adventure:
          add('Adventure', 86);
        case TripStyle.hiddenGems:
          add('Hidden Gems Escape', 84);
        case TripStyle.familyActivities:
          add('Family Escape', 84);
        case TripStyle.nature:
          add('Nature Escape', 82);
        case TripStyle.photography:
          add('Photo Journey', 80);
        case TripStyle.localExperiences:
          add('Local Discovery Escape', 80);
        case TripStyle.entertainment:
          add('Entertainment Escape', 78);
        case TripStyle.shopping:
          add('Shopping Getaway', 76);
        case TripStyle.relaxation:
          add('Slow Escape', 74);
        case TripStyle.luxury:
          if (_explicitLuxurySignals(profile)) add('Luxury Escape', 70);
      }
    }
  }

  static void _scoreExperiencePreferences(
    TripProfile profile,
    void Function(String label, int points) add,
  ) {
    for (final exp in profile.experiencePreferences) {
      switch (exp) {
        case ExperiencePreference.themeParks:
        case ExperiencePreference.waterParks:
          add('Theme Park Adventure', 88);
        case ExperiencePreference.foodTours:
          add('Foodie Journey', 85);
        case ExperiencePreference.spas:
          add('Wellness Retreat', 82);
        case ExperiencePreference.sunsetCruises:
        case ExperiencePreference.boatTours:
          add('Coastal Escape', 80);
        case ExperiencePreference.museums:
        case ExperiencePreference.liveShows:
          add('Culture Escape', 78);
        case ExperiencePreference.nightclubs:
        case ExperiencePreference.rooftopBars:
          add('Nightlife Escape', 78);
        case ExperiencePreference.wildlifeExperiences:
        case ExperiencePreference.snorkeling:
        case ExperiencePreference.kayaking:
          add('Adventure', 76);
        default:
          add('Discovery Escape', 40);
      }
    }
  }

  static void _scoreVacationGoals(
    TripProfile profile,
    void Function(String label, int points) add,
  ) {
    for (final goal in profile.vacationGoals) {
      switch (goal) {
        case VacationGoal.saveMoney:
          add('Smart Getaway', 100);
        case VacationGoal.romance:
          add('Golden Escape', 88);
        case VacationGoal.familyTime:
          add('Family Escape', 88);
        case VacationGoal.adventure:
          add('Adventure', 86);
        case VacationGoal.relaxation:
          add('Slow Escape', 84);
        case VacationGoal.bestFood:
          add('Foodie Journey', 84);
        case VacationGoal.hiddenGems:
          add('Hidden Gems Escape', 82);
        case VacationGoal.bestPhotos:
          add('Photo Journey', 80);
        case VacationGoal.nightlife:
          add('Nightlife Escape', 80);
        case VacationGoal.localExperiences:
          add('Local Discovery Escape', 78);
        case VacationGoal.avoidCrowds:
          add('Quiet Escape', 72);
        case VacationGoal.stressFreePlanning:
          add('Easy Escape', 70);
        case VacationGoal.makeMemories:
          add('Memorable Escape', 68);
        case VacationGoal.luxuryExperiences:
          if (_explicitLuxurySignals(profile)) add('Luxury Escape', 65);
      }
    }
  }

  static void _scoreHotelTypes(
    TripProfile profile,
    void Function(String label, int points) add,
  ) {
    for (final hotel in profile.hotelTypePreferences) {
      switch (hotel) {
        case HotelTypePreference.budgetFriendly:
          add('Smart Getaway', 90);
        case HotelTypePreference.spaResort:
          add('Wellness Retreat', 82);
        case HotelTypePreference.beachfront:
          add('Beach Escape', 80);
        case HotelTypePreference.boutiqueHotel:
          add('Boutique Escape', 78);
        case HotelTypePreference.familyResort:
          add('Family Escape', 76);
        case HotelTypePreference.themeParkArea:
          add('Theme Park Adventure', 74);
        case HotelTypePreference.downtown:
        case HotelTypePreference.walkableArea:
          add('City Discovery Escape', 70);
        case HotelTypePreference.luxuryResort:
        case HotelTypePreference.adultsOnly:
          if (_explicitLuxurySignals(profile)) add('Luxury Escape', 68);
        default:
          continue;
      }
    }
  }

  static void _scoreEmotion(
    TripProfile profile,
    void Function(String label, int points) add,
  ) {
    switch (profile.desiredTripEmotion) {
      case DesiredTripEmotion.romantic:
        add('Golden Escape', 72);
      case DesiredTripEmotion.adventurous:
      case DesiredTripEmotion.excited:
        add('Adventure', 72);
      case DesiredTripEmotion.relaxed:
      case DesiredTripEmotion.stressFree:
        add('Slow Escape', 70);
      case DesiredTripEmotion.familyFocused:
        add('Family Escape', 70);
      case DesiredTripEmotion.inspiring:
        add('Discovery Escape', 68);
      case DesiredTripEmotion.memorable:
        add('Memorable Escape', 66);
      case DesiredTripEmotion.luxurious:
        if (_explicitLuxurySignals(profile)) add('Luxury Escape', 64);
    }
  }

  static void _scoreTravelParty(
    TripProfile profile,
    void Function(String label, int points) add,
  ) {
    switch (profile.pace) {
      case PacePreference.slow:
        add('Slow Escape', 30);
      case PacePreference.packed:
        add('Action-Packed Escape', 30);
      case PacePreference.balanced:
        break;
    }

    if (profile.travelerType == TravelerType.family) {
      add('Family Escape', 35);
    } else if (profile.travelerType == TravelerType.friends) {
      add('Friends Getaway', 30);
    } else if (profile.travelerType == TravelerType.solo) {
      add('Solo Escape', 28);
    }
  }

  static bool _explicitLuxurySignals(TripProfile profile) {
    if (isBudgetConscious(profile)) return false;
    return profile.tripStyles.contains(TripStyle.luxury) ||
        profile.vacationGoals.contains(VacationGoal.luxuryExperiences) ||
        profile.hotelTypePreferences.contains(HotelTypePreference.luxuryResort) ||
        profile.hotelTypePreferences.contains(HotelTypePreference.adultsOnly) ||
        profile.desiredTripEmotion == DesiredTripEmotion.luxurious ||
        profile.hotelBudgetLevel == HotelBudgetLevel.four ||
        profile.luxuryLevel == LuxuryLevel.ultraLuxury;
  }

  static String _budgetDescriptor(TripProfile profile) {
    if (profile.tripStyles.contains(TripStyle.themeParks) ||
        profile.experiencePreferences.contains(ExperiencePreference.themeParks)) {
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

  static String _legacyMoodDescriptor(TripProfile profile) {
    if (_explicitLuxurySignals(profile)) {
      return profile.luxuryLevel == LuxuryLevel.ultraLuxury
          ? 'Ultra Luxury Escape'
          : 'Luxury Escape';
    }
    if (profile.moods.isEmpty) {
      return 'Escape';
    }
    return switch (_primaryMood(profile)) {
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

  static TripMood _primaryMood(TripProfile profile) {
    if (isBudgetConscious(profile)) {
      for (final mood in profile.moods) {
        if (mood != TripMood.luxurious) return mood;
      }
    }
    return profile.moods.first;
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

  static String _sanitize(String raw) {
    final trimmed = raw.trim();
    if (trimmed.length <= maxCustomLength) return trimmed;
    return trimmed.substring(0, maxCustomLength).trim();
  }
}
