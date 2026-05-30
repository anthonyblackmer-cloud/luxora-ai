import 'package:luxora_ai/models/trip_occasion.dart';

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
    this.moods = const [TripMood.luxurious, TripMood.relaxing],
    this.occasion = TripOccasion.general,
  });

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
  final List<TripMood> moods;

  /// Anniversary, honeymoon, family, etc. — drives couple/family engines.
  final TripOccasion occasion;

  TripProfile copyWith({
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
    List<TripMood>? moods,
    TripOccasion? occasion,
  }) {
    return TripProfile(
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
      moods: moods ?? this.moods,
      occasion: occasion ?? this.occasion,
    );
  }
}
