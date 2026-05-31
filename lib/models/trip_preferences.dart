/// Onboarding 2.0 preference enums — persisted on [TripProfile].
library;

enum TravelerType { solo, couple, family, friends, business }

enum ChildrenType { none, toddlers, elementary, teenagers }

enum TripStyle {
  luxury,
  relaxation,
  adventure,
  themeParks,
  foodie,
  nightlife,
  romance,
  shopping,
  beaches,
  wellness,
  nature,
  photography,
  hiddenGems,
  familyActivities,
  localExperiences,
  entertainment,
}

enum HotelTypePreference {
  luxuryResort,
  boutiqueHotel,
  familyResort,
  budgetFriendly,
  adultsOnly,
  spaResort,
  beachfront,
  downtown,
  walkableArea,
  themeParkArea,
  modernHotel,
  historicHotel,
}

enum HotelBudgetLevel { one, two, three, four }

enum HotelAmenity {
  pool,
  spa,
  gym,
  freeBreakfast,
  oceanView,
  balcony,
  kitchen,
  shuttleService,
  petFriendly,
}

enum CuisinePreference {
  american,
  italian,
  mexican,
  seafood,
  steakhouse,
  sushi,
  cuban,
  mediterranean,
  asian,
  bbq,
  fineDining,
  localFavorites,
  foodTrucks,
  rooftopDining,
  brunch,
  dessert,
}

enum DiningPreference {
  quickService,
  casualDining,
  familyFriendly,
  dateNight,
  fineDining,
  waterfront,
  hiddenGems,
  localFavorites,
}

enum VacationGoal {
  makeMemories,
  saveMoney,
  avoidCrowds,
  luxuryExperiences,
  bestFood,
  hiddenGems,
  relaxation,
  adventure,
  bestPhotos,
  familyTime,
  romance,
  nightlife,
  localExperiences,
  stressFreePlanning,
}

enum ExperiencePreference {
  boatTours,
  sunsetCruises,
  airboatTours,
  themeParks,
  museums,
  liveShows,
  spas,
  shopping,
  waterParks,
  golf,
  fishing,
  kayaking,
  snorkeling,
  rooftopBars,
  nightclubs,
  wildlifeExperiences,
  foodTours,
  scenicDrives,
}

enum AvoidPreference {
  crowds,
  longLines,
  expensiveRestaurants,
  walkingLongDistances,
  nightlife,
  driving,
  touristTraps,
  earlyMornings,
  lateNights,
  familyAttractions,
  themeParks,
}

enum DesiredTripEmotion {
  relaxed,
  excited,
  adventurous,
  romantic,
  luxurious,
  familyFocused,
  memorable,
  stressFree,
  inspiring,
}

List<T> parseEnumList<T extends Enum>(
  List<dynamic>? raw,
  List<T> values,
) {
  if (raw == null || raw.isEmpty) return const [];
  final byName = {for (final v in values) v.name: v};
  return [
    for (final e in raw)
      if (e is String && byName.containsKey(e)) byName[e]!,
  ];
}
