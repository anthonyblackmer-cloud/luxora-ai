import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';

/// Maps Onboarding 2.0 selections onto legacy engines + concierge memory text.
abstract final class OnboardingPreferenceMapper {
  static TripProfile enrichForPlanning(TripProfile profile) {
    var p = _syncTravelParty(profile);
    p = _syncBudgetAndLuxury(p);
    p = _syncPace(p);
    p = _syncInterestDials(p);
    p = _syncMoodsAndDiscovery(p);
    p = _syncOccasion(p);
    p = _syncTripFeel(p);
    return p;
  }

  static TripProfile _syncTravelParty(TripProfile p) {
    final (adults, kids, count) = switch (p.travelerType) {
      TravelerType.solo => (1, 0, 1),
      TravelerType.couple => (2, 0, 2),
      TravelerType.family => _familyParty(p.childrenTypes),
      TravelerType.friends => (p.travelerCount.clamp(2, 12), 0, p.travelerCount),
      TravelerType.business => (1, 0, 1),
    };
    return p.copyWith(adults: adults, kids: kids, travelerCount: count);
  }

  static (int adults, int kids, int count) _familyParty(
    List<ChildrenType> childrenTypes,
  ) {
    final ages = childrenTypes
        .where((t) => t != ChildrenType.none)
        .toSet()
        .toList();
    if (ages.isEmpty) {
      return (2, 0, 2);
    }
    final kids = ages.length.clamp(1, 6);
    return (2, kids, 2 + kids);
  }

  static TripProfile _syncBudgetAndLuxury(TripProfile p) {
    var hotelBudgetLevel = p.hotelBudgetLevel;
    var (budget, luxury) = switch (hotelBudgetLevel) {
      HotelBudgetLevel.one => (3000, LuxuryLevel.comfortable),
      HotelBudgetLevel.two => (5500, LuxuryLevel.comfortable),
      HotelBudgetLevel.three => (9000, LuxuryLevel.premium),
      HotelBudgetLevel.four => (16000, LuxuryLevel.ultraLuxury),
    };

    if (p.hotelTypePreferences.contains(HotelTypePreference.budgetFriendly)) {
      hotelBudgetLevel = HotelBudgetLevel.one;
      budget = 3000;
      luxury = LuxuryLevel.comfortable;
    } else if (p.vacationGoals.contains(VacationGoal.saveMoney) &&
        hotelBudgetLevel.index > HotelBudgetLevel.two.index) {
      hotelBudgetLevel = HotelBudgetLevel.two;
      budget = 5500;
      luxury = LuxuryLevel.comfortable;
    }

    return p.copyWith(
      budgetUsd: budget,
      luxuryLevel: luxury,
      hotelBudgetLevel: hotelBudgetLevel,
    );
  }

  static TripProfile _syncPace(TripProfile p) => p;

  static TripProfile _syncInterestDials(TripProfile p) {
    var nightlife = p.nightlifeInterest;
    var poolside = p.poolsideInterest;
    var adventure = p.adventureInterest;
    var culture = p.cultureInterest;
    var foodie = p.foodieInterest;

    for (final style in p.tripStyles) {
      switch (style) {
        case TripStyle.nightlife:
          nightlife = _boost(nightlife, 35);
        case TripStyle.foodie:
          foodie = _boost(foodie, 35);
        case TripStyle.adventure:
          adventure = _boost(adventure, 30);
        case TripStyle.relaxation:
        case TripStyle.beaches:
        case TripStyle.wellness:
          poolside = _boost(poolside, 30);
        case TripStyle.nature:
        case TripStyle.photography:
          culture = _boost(culture, 25);
          adventure = _boost(adventure, 15);
        case TripStyle.hiddenGems:
        case TripStyle.localExperiences:
          culture = _boost(culture, 20);
        case TripStyle.themeParks:
        case TripStyle.familyActivities:
        case TripStyle.entertainment:
          adventure = _boost(adventure, 20);
        default:
          break;
      }
    }

    for (final exp in p.experiencePreferences) {
      switch (exp) {
        case ExperiencePreference.nightclubs:
        case ExperiencePreference.rooftopBars:
          nightlife = _boost(nightlife, 20);
        case ExperiencePreference.foodTours:
          foodie = _boost(foodie, 20);
        case ExperiencePreference.museums:
        case ExperiencePreference.liveShows:
          culture = _boost(culture, 20);
        case ExperiencePreference.themeParks:
        case ExperiencePreference.waterParks:
          adventure = _boost(adventure, 25);
        case ExperiencePreference.spas:
          poolside = _boost(poolside, 20);
        default:
          adventure = _boost(adventure, 10);
      }
    }

    return p.copyWith(
      nightlifeInterest: nightlife,
      poolsideInterest: poolside,
      adventureInterest: adventure,
      cultureInterest: culture,
      foodieInterest: foodie,
    );
  }

  static TripProfile _syncMoodsAndDiscovery(TripProfile p) {
    final moods = <TripMood>{...p.moods};

    for (final style in p.tripStyles) {
      switch (style) {
        case TripStyle.romance:
          moods.add(TripMood.romantic);
        case TripStyle.luxury:
          moods.add(TripMood.luxurious);
        case TripStyle.relaxation:
        case TripStyle.beaches:
        case TripStyle.wellness:
          moods.add(TripMood.relaxing);
        case TripStyle.adventure:
          moods.add(TripMood.adventurous);
        case TripStyle.foodie:
          moods.add(TripMood.foodie);
        case TripStyle.nightlife:
          moods.add(TripMood.social);
        case TripStyle.nature:
          moods.add(TripMood.nature);
        case TripStyle.familyActivities:
          moods.add(TripMood.familyBonding);
        default:
          break;
      }
    }

    switch (p.desiredTripEmotion) {
      case DesiredTripEmotion.relaxed:
        moods.addAll([TripMood.relaxing, TripMood.wellness]);
      case DesiredTripEmotion.romantic:
        moods.add(TripMood.romantic);
      case DesiredTripEmotion.adventurous:
      case DesiredTripEmotion.excited:
        moods.add(TripMood.adventurous);
      case DesiredTripEmotion.luxurious:
        moods.add(TripMood.luxurious);
      case DesiredTripEmotion.familyFocused:
        moods.add(TripMood.familyBonding);
      case DesiredTripEmotion.stressFree:
        moods.add(TripMood.relaxing);
      case DesiredTripEmotion.inspiring:
        moods.add(TripMood.nature);
      case DesiredTripEmotion.memorable:
        break;
    }

    var discovery = p.discoveryStyle;
    if (p.tripStyles.contains(TripStyle.hiddenGems) ||
        p.vacationGoals.contains(VacationGoal.hiddenGems)) {
      discovery = DiscoveryStyle.hiddenGems;
    } else if (p.tripStyles.contains(TripStyle.themeParks)) {
      discovery = DiscoveryStyle.iconic;
    }

    return p.copyWith(
      moods: moods.isEmpty ? p.moods : moods.toList(),
      discoveryStyle: discovery,
    );
  }

  static TripProfile _syncOccasion(TripProfile p) {
    if (p.travelerType == TravelerType.family &&
        p.childrenTypes.any((t) => t != ChildrenType.none)) {
      return p.copyWith(occasion: TripOccasion.familyWithKids);
    }
    if (p.travelerType == TravelerType.couple &&
        (p.tripStyles.contains(TripStyle.romance) ||
            p.desiredTripEmotion == DesiredTripEmotion.romantic)) {
      if (p.occasion == TripOccasion.general) {
        return p.copyWith(occasion: TripOccasion.coupleDateNight);
      }
    }
    if (p.tripStyles.contains(TripStyle.themeParks) &&
        p.occasion == TripOccasion.general) {
      return p.copyWith(occasion: TripOccasion.disneyAdventure);
    }
    return p;
  }

  static TripProfile _syncTripFeel(TripProfile p) {
    if (p.tripFeel.trim().isNotEmpty) return p;
    final parts = <String>[
      p.desiredTripEmotion.name,
      if (p.travelerType != TravelerType.couple) p.travelerType.name,
      ...p.tripStyles.take(3).map((s) => s.name),
      if (p.vacationGoals.isNotEmpty) p.vacationGoals.first.name,
    ];
    return p.copyWith(tripFeel: parts.join(', '));
  }

  static int _boost(int current, int delta) => (current + delta).clamp(0, 100);

  /// Concierge memory strings merged into style prefs.
  static List<String> conciergeMemoryLines(TripProfile p) {
    return [
      'traveler:${p.travelerType.name}',
      if (p.childrenTypes.isNotEmpty)
        'children:${p.childrenTypes.map((e) => e.name).join(',')}',
      'emotion:${p.desiredTripEmotion.name}',
      'pace:${p.pace.name}',
      if (p.tripStyles.isNotEmpty)
        'styles:${p.tripStyles.map((e) => e.name).join(',')}',
      if (p.hotelTypePreferences.isNotEmpty)
        'hotels:${p.hotelTypePreferences.map((e) => e.name).join(',')}',
      'hotelBudget:${p.hotelBudgetLevel.name}',
      if (p.hotelAmenities.isNotEmpty)
        'amenities:${p.hotelAmenities.map((e) => e.name).join(',')}',
      if (p.cuisinePreferences.isNotEmpty)
        'cuisines:${p.cuisinePreferences.map((e) => e.name).join(',')}',
      if (p.diningPreferences.isNotEmpty)
        'dining:${p.diningPreferences.map((e) => e.name).join(',')}',
      if (p.vacationGoals.isNotEmpty)
        'goals:${p.vacationGoals.map((e) => e.name).join(',')}',
      if (p.experiencePreferences.isNotEmpty)
        'experiences:${p.experiencePreferences.map((e) => e.name).join(',')}',
      if (p.avoidPreferences.isNotEmpty)
        'avoid:${p.avoidPreferences.map((e) => e.name).join(',')}',
    ];
  }
}
