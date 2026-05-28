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
    this.discoveryStyle = DiscoveryStyle.balanced,
    this.tripFeel = '',
    this.moods = const [TripMood.luxurious, TripMood.relaxing],
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
  final int nightlifeInterest;
  final int relaxationVsAdventure;
  final int foodieInterest;
  final DiscoveryStyle discoveryStyle;
  final String tripFeel;
  final List<TripMood> moods;

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
    DiscoveryStyle? discoveryStyle,
    String? tripFeel,
    List<TripMood>? moods,
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
      discoveryStyle: discoveryStyle ?? this.discoveryStyle,
      tripFeel: tripFeel ?? this.tripFeel,
      moods: moods ?? this.moods,
    );
  }
}
