import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_preferences.dart';

enum TripMood {
  romantic,
  relaxing,
  adventurous,
  luxurious,
  familyBonding,
  social,
  nature,
  wellness,
  foodie,
}

enum PacePreference { slow, balanced, packed }

enum LuxuryLevel { comfortable, premium, ultraLuxury }

enum DiscoveryStyle { hiddenGems, balanced, iconic }

class TripProfile {
  const TripProfile({
    this.cityId = 'orlando',
    this.destination = 'Orlando',
    this.region = 'Florida',
    this.startDate = '',
    this.endDate = '',
    this.budgetUsd = 3500,
    this.travelerCount = 2,
    this.adults = 2,
    this.kids = 0,
    this.pace = PacePreference.balanced,
    this.luxuryLevel = LuxuryLevel.premium,
    this.nightlifeInterest = 40,
    this.relaxationVsAdventure = 50,
    this.foodieInterest = 70,
    this.poolsideInterest = 55,
    this.adventureInterest = 50,
    this.cultureInterest = 40,
    this.discoveryStyle = DiscoveryStyle.balanced,
    this.tripFeel = '',
    this.tripName = '',
    this.travelerName = '',
    this.useAutoTripName = true,
    this.moods = const [],
    this.occasion = TripOccasion.general,
    this.travelerType = TravelerType.couple,
    this.childrenTypes = const [],
    this.tripStyles = const [],
    this.hotelTypePreferences = const [],
    this.hotelBudgetLevel = HotelBudgetLevel.two,
    this.hotelAmenities = const [],
    this.cuisinePreferences = const [],
    this.diningPreferences = const [],
    this.vacationGoals = const [],
    this.experiencePreferences = const [],
    this.avoidPreferences = const [],
    this.desiredTripEmotion = DesiredTripEmotion.memorable,
  });

  final String cityId;
  final String destination;
  final String region;
  final String startDate;
  final String endDate;
  final int budgetUsd;
  final int travelerCount;
  final int adults;
  final int kids;
  final PacePreference pace;
  final LuxuryLevel luxuryLevel;

  /// Interest dials (0–100). These shape how the Day Flow engine sequences a
  /// day across time-of-day blocks rather than acting as abstract percentages.
  final int nightlifeInterest;

  /// Legacy single relaxation↔adventure axis (0 = relax, 100 = adventure).
  /// Retained for back-compat; superseded by [poolsideInterest] +
  /// [adventureInterest] which split that seesaw into independent dials.
  final int relaxationVsAdventure;
  final int foodieInterest;

  /// Poolside / downtime appetite — pool, spa, slow mornings, easy beaches.
  final int poolsideInterest;

  /// Adventure / outdoors appetite — thrills, water sports, hikes, springs.
  final int adventureInterest;

  /// Culture & sightseeing appetite — museums, historic sites, arts, icons.
  final int cultureInterest;

  final DiscoveryStyle discoveryStyle;
  final String tripFeel;
  final String tripName;

  /// Traveler's first name — Luxora uses this in concierge chat.
  final String travelerName;

  /// When true, [TripNameGenerator] crafts the title from mood and occasion.
  final bool useAutoTripName;
  final List<TripMood> moods;

  /// Anniversary, honeymoon, family, etc. — drives couple/family engines.
  final TripOccasion occasion;

  // —— Onboarding 2.0 concierge memory ——

  final TravelerType travelerType;

  /// Age bands for children on a family trip — empty means no children.
  final List<ChildrenType> childrenTypes;
  final List<TripStyle> tripStyles;
  final List<HotelTypePreference> hotelTypePreferences;
  final HotelBudgetLevel hotelBudgetLevel;
  final List<HotelAmenity> hotelAmenities;
  final List<CuisinePreference> cuisinePreferences;
  final List<DiningPreference> diningPreferences;
  final List<VacationGoal> vacationGoals;
  final List<ExperiencePreference> experiencePreferences;
  final List<AvoidPreference> avoidPreferences;
  final DesiredTripEmotion desiredTripEmotion;

  TripProfile copyWith({
    String? cityId,
    String? destination,
    String? region,
    String? startDate,
    String? endDate,
    int? budgetUsd,
    int? travelerCount,
    int? adults,
    int? kids,
    PacePreference? pace,
    LuxuryLevel? luxuryLevel,
    int? nightlifeInterest,
    int? relaxationVsAdventure,
    int? foodieInterest,
    int? poolsideInterest,
    int? adventureInterest,
    int? cultureInterest,
    DiscoveryStyle? discoveryStyle,
    String? tripFeel,
    String? tripName,
    String? travelerName,
    bool? useAutoTripName,
    List<TripMood>? moods,
    TripOccasion? occasion,
    TravelerType? travelerType,
    List<ChildrenType>? childrenTypes,
    List<TripStyle>? tripStyles,
    List<HotelTypePreference>? hotelTypePreferences,
    HotelBudgetLevel? hotelBudgetLevel,
    List<HotelAmenity>? hotelAmenities,
    List<CuisinePreference>? cuisinePreferences,
    List<DiningPreference>? diningPreferences,
    List<VacationGoal>? vacationGoals,
    List<ExperiencePreference>? experiencePreferences,
    List<AvoidPreference>? avoidPreferences,
    DesiredTripEmotion? desiredTripEmotion,
  }) {
    return TripProfile(
      cityId: cityId ?? this.cityId,
      destination: destination ?? this.destination,
      region: region ?? this.region,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      budgetUsd: budgetUsd ?? this.budgetUsd,
      travelerCount: travelerCount ?? this.travelerCount,
      adults: adults ?? this.adults,
      kids: kids ?? this.kids,
      pace: pace ?? this.pace,
      luxuryLevel: luxuryLevel ?? this.luxuryLevel,
      nightlifeInterest: nightlifeInterest ?? this.nightlifeInterest,
      relaxationVsAdventure:
          relaxationVsAdventure ?? this.relaxationVsAdventure,
      foodieInterest: foodieInterest ?? this.foodieInterest,
      poolsideInterest: poolsideInterest ?? this.poolsideInterest,
      adventureInterest: adventureInterest ?? this.adventureInterest,
      cultureInterest: cultureInterest ?? this.cultureInterest,
      discoveryStyle: discoveryStyle ?? this.discoveryStyle,
      tripFeel: tripFeel ?? this.tripFeel,
      tripName: tripName ?? this.tripName,
      travelerName: travelerName ?? this.travelerName,
      useAutoTripName: useAutoTripName ?? this.useAutoTripName,
      moods: moods ?? this.moods,
      occasion: occasion ?? this.occasion,
      travelerType: travelerType ?? this.travelerType,
      childrenTypes: childrenTypes ?? this.childrenTypes,
      tripStyles: tripStyles ?? this.tripStyles,
      hotelTypePreferences:
          hotelTypePreferences ?? this.hotelTypePreferences,
      hotelBudgetLevel: hotelBudgetLevel ?? this.hotelBudgetLevel,
      hotelAmenities: hotelAmenities ?? this.hotelAmenities,
      cuisinePreferences: cuisinePreferences ?? this.cuisinePreferences,
      diningPreferences: diningPreferences ?? this.diningPreferences,
      vacationGoals: vacationGoals ?? this.vacationGoals,
      experiencePreferences:
          experiencePreferences ?? this.experiencePreferences,
      avoidPreferences: avoidPreferences ?? this.avoidPreferences,
      desiredTripEmotion: desiredTripEmotion ?? this.desiredTripEmotion,
    );
  }
}
