import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';

String onboardingTravelerLabel(AppLocalizations l, TravelerType type) =>
    switch (type) {
      TravelerType.solo => l.onboardPrefTravelerSolo,
      TravelerType.couple => l.onboardPrefTravelerCouple,
      TravelerType.family => l.onboardPrefTravelerFamily,
      TravelerType.friends => l.onboardPrefTravelerFriends,
      TravelerType.business => l.onboardPrefTravelerBusiness,
    };

String onboardingChildrenLabel(AppLocalizations l, ChildrenType type) =>
    switch (type) {
      ChildrenType.none => l.onboardPrefChildrenNone,
      ChildrenType.toddlers => l.onboardPrefChildrenToddlers,
      ChildrenType.elementary => l.onboardPrefChildrenElementary,
      ChildrenType.teenagers => l.onboardPrefChildrenTeenagers,
    };

String onboardingTripStyleLabel(AppLocalizations l, TripStyle style) =>
    switch (style) {
      TripStyle.luxury => l.onboardPrefStyleLuxury,
      TripStyle.relaxation => l.onboardPrefStyleRelaxation,
      TripStyle.adventure => l.onboardPrefStyleAdventure,
      TripStyle.themeParks => l.onboardPrefStyleThemeParks,
      TripStyle.foodie => l.onboardPrefStyleFoodie,
      TripStyle.nightlife => l.onboardPrefStyleNightlife,
      TripStyle.romance => l.onboardPrefStyleRomance,
      TripStyle.shopping => l.onboardPrefStyleShopping,
      TripStyle.beaches => l.onboardPrefStyleBeaches,
      TripStyle.wellness => l.onboardPrefStyleWellness,
      TripStyle.nature => l.onboardPrefStyleNature,
      TripStyle.photography => l.onboardPrefStylePhotography,
      TripStyle.hiddenGems => l.onboardPrefStyleHiddenGems,
      TripStyle.familyActivities => l.onboardPrefStyleFamilyActivities,
      TripStyle.localExperiences => l.onboardPrefStyleLocalExperiences,
      TripStyle.entertainment => l.onboardPrefStyleEntertainment,
    };

String onboardingHotelTypeLabel(
  AppLocalizations l,
  HotelTypePreference type,
) =>
    switch (type) {
      HotelTypePreference.luxuryResort => l.onboardPrefHotelLuxuryResort,
      HotelTypePreference.boutiqueHotel => l.onboardPrefHotelBoutique,
      HotelTypePreference.familyResort => l.onboardPrefHotelFamilyResort,
      HotelTypePreference.budgetFriendly => l.onboardPrefHotelBudgetFriendly,
      HotelTypePreference.adultsOnly => l.onboardPrefHotelAdultsOnly,
      HotelTypePreference.spaResort => l.onboardPrefHotelSpaResort,
      HotelTypePreference.beachfront => l.onboardPrefHotelBeachfront,
      HotelTypePreference.downtown => l.onboardPrefHotelDowntown,
      HotelTypePreference.walkableArea => l.onboardPrefHotelWalkable,
      HotelTypePreference.themeParkArea => l.onboardPrefHotelThemeParkArea,
      HotelTypePreference.modernHotel => l.onboardPrefHotelModern,
      HotelTypePreference.historicHotel => l.onboardPrefHotelHistoric,
    };

String onboardingBudgetLabel(AppLocalizations l, HotelBudgetLevel level) =>
    switch (level) {
      HotelBudgetLevel.one => l.onboardPrefBudgetOne,
      HotelBudgetLevel.two => l.onboardPrefBudgetTwo,
      HotelBudgetLevel.three => l.onboardPrefBudgetThree,
      HotelBudgetLevel.four => l.onboardPrefBudgetFour,
    };

String onboardingAmenityLabel(AppLocalizations l, HotelAmenity amenity) =>
    switch (amenity) {
      HotelAmenity.pool => l.onboardPrefAmenityPool,
      HotelAmenity.spa => l.onboardPrefAmenitySpa,
      HotelAmenity.gym => l.onboardPrefAmenityGym,
      HotelAmenity.freeBreakfast => l.onboardPrefAmenityBreakfast,
      HotelAmenity.oceanView => l.onboardPrefAmenityOceanView,
      HotelAmenity.balcony => l.onboardPrefAmenityBalcony,
      HotelAmenity.kitchen => l.onboardPrefAmenityKitchen,
      HotelAmenity.shuttleService => l.onboardPrefAmenityShuttle,
      HotelAmenity.petFriendly => l.onboardPrefAmenityPetFriendly,
    };

String onboardingCuisineLabel(AppLocalizations l, CuisinePreference c) =>
    switch (c) {
      CuisinePreference.american => l.onboardPrefCuisineAmerican,
      CuisinePreference.italian => l.onboardPrefCuisineItalian,
      CuisinePreference.mexican => l.onboardPrefCuisineMexican,
      CuisinePreference.seafood => l.onboardPrefCuisineSeafood,
      CuisinePreference.steakhouse => l.onboardPrefCuisineSteakhouse,
      CuisinePreference.sushi => l.onboardPrefCuisineSushi,
      CuisinePreference.cuban => l.onboardPrefCuisineCuban,
      CuisinePreference.mediterranean => l.onboardPrefCuisineMediterranean,
      CuisinePreference.asian => l.onboardPrefCuisineAsian,
      CuisinePreference.bbq => l.onboardPrefCuisineBbq,
      CuisinePreference.fineDining => l.onboardPrefCuisineFineDining,
      CuisinePreference.localFavorites => l.onboardPrefCuisineLocalFavorites,
      CuisinePreference.foodTrucks => l.onboardPrefCuisineFoodTrucks,
      CuisinePreference.rooftopDining => l.onboardPrefCuisineRooftop,
      CuisinePreference.brunch => l.onboardPrefCuisineBrunch,
      CuisinePreference.dessert => l.onboardPrefCuisineDessert,
    };

String onboardingDiningLabel(AppLocalizations l, DiningPreference d) =>
    switch (d) {
      DiningPreference.quickService => l.onboardPrefDiningQuick,
      DiningPreference.casualDining => l.onboardPrefDiningCasual,
      DiningPreference.familyFriendly => l.onboardPrefDiningFamily,
      DiningPreference.dateNight => l.onboardPrefDiningDateNight,
      DiningPreference.fineDining => l.onboardPrefDiningFine,
      DiningPreference.waterfront => l.onboardPrefDiningWaterfront,
      DiningPreference.hiddenGems => l.onboardPrefDiningHiddenGems,
      DiningPreference.localFavorites => l.onboardPrefDiningLocal,
    };

String onboardingGoalLabel(AppLocalizations l, VacationGoal goal) =>
    switch (goal) {
      VacationGoal.makeMemories => l.onboardPrefGoalMakeMemories,
      VacationGoal.saveMoney => l.onboardPrefGoalSaveMoney,
      VacationGoal.avoidCrowds => l.onboardPrefGoalAvoidCrowds,
      VacationGoal.luxuryExperiences => l.onboardPrefGoalLuxury,
      VacationGoal.bestFood => l.onboardPrefGoalBestFood,
      VacationGoal.hiddenGems => l.onboardPrefGoalHiddenGems,
      VacationGoal.relaxation => l.onboardPrefGoalRelaxation,
      VacationGoal.adventure => l.onboardPrefGoalAdventure,
      VacationGoal.bestPhotos => l.onboardPrefGoalBestPhotos,
      VacationGoal.familyTime => l.onboardPrefGoalFamilyTime,
      VacationGoal.romance => l.onboardPrefGoalRomance,
      VacationGoal.nightlife => l.onboardPrefGoalNightlife,
      VacationGoal.localExperiences => l.onboardPrefGoalLocal,
      VacationGoal.stressFreePlanning => l.onboardPrefGoalStressFree,
    };

String onboardingExperienceLabel(
  AppLocalizations l,
  ExperiencePreference exp,
) =>
    switch (exp) {
      ExperiencePreference.boatTours => l.onboardPrefExpBoatTours,
      ExperiencePreference.sunsetCruises => l.onboardPrefExpSunsetCruises,
      ExperiencePreference.airboatTours => l.onboardPrefExpAirboat,
      ExperiencePreference.themeParks => l.onboardPrefExpThemeParks,
      ExperiencePreference.museums => l.onboardPrefExpMuseums,
      ExperiencePreference.liveShows => l.onboardPrefExpLiveShows,
      ExperiencePreference.spas => l.onboardPrefExpSpas,
      ExperiencePreference.shopping => l.onboardPrefExpShopping,
      ExperiencePreference.waterParks => l.onboardPrefExpWaterParks,
      ExperiencePreference.golf => l.onboardPrefExpGolf,
      ExperiencePreference.fishing => l.onboardPrefExpFishing,
      ExperiencePreference.kayaking => l.onboardPrefExpKayaking,
      ExperiencePreference.snorkeling => l.onboardPrefExpSnorkeling,
      ExperiencePreference.rooftopBars => l.onboardPrefExpRooftopBars,
      ExperiencePreference.nightclubs => l.onboardPrefExpNightclubs,
      ExperiencePreference.wildlifeExperiences => l.onboardPrefExpWildlife,
      ExperiencePreference.foodTours => l.onboardPrefExpFoodTours,
      ExperiencePreference.scenicDrives => l.onboardPrefExpScenicDrives,
    };

String onboardingAvoidLabel(AppLocalizations l, AvoidPreference avoid) =>
    switch (avoid) {
      AvoidPreference.crowds => l.onboardPrefAvoidCrowds,
      AvoidPreference.longLines => l.onboardPrefAvoidLongLines,
      AvoidPreference.expensiveRestaurants =>
        l.onboardPrefAvoidExpensiveRestaurants,
      AvoidPreference.walkingLongDistances => l.onboardPrefAvoidWalking,
      AvoidPreference.nightlife => l.onboardPrefAvoidNightlife,
      AvoidPreference.driving => l.onboardPrefAvoidDriving,
      AvoidPreference.touristTraps => l.onboardPrefAvoidTouristTraps,
      AvoidPreference.earlyMornings => l.onboardPrefAvoidEarlyMornings,
      AvoidPreference.lateNights => l.onboardPrefAvoidLateNights,
      AvoidPreference.familyAttractions => l.onboardPrefAvoidFamilyAttractions,
      AvoidPreference.themeParks => l.onboardPrefAvoidThemeParks,
    };

String onboardingEmotionLabel(AppLocalizations l, DesiredTripEmotion emotion) =>
    switch (emotion) {
      DesiredTripEmotion.relaxed => l.onboardPrefEmotionRelaxed,
      DesiredTripEmotion.excited => l.onboardPrefEmotionExcited,
      DesiredTripEmotion.adventurous => l.onboardPrefEmotionAdventurous,
      DesiredTripEmotion.romantic => l.onboardPrefEmotionRomantic,
      DesiredTripEmotion.luxurious => l.onboardPrefEmotionLuxurious,
      DesiredTripEmotion.familyFocused => l.onboardPrefEmotionFamilyFocused,
      DesiredTripEmotion.memorable => l.onboardPrefEmotionMemorable,
      DesiredTripEmotion.stressFree => l.onboardPrefEmotionStressFree,
      DesiredTripEmotion.inspiring => l.onboardPrefEmotionInspiring,
    };

String onboardingPaceLabel(AppLocalizations l, PacePreference pace) =>
    switch (pace) {
      PacePreference.slow => l.onboardPrefPaceSlow,
      PacePreference.balanced => l.onboardPrefPaceBalanced,
      PacePreference.packed => l.onboardPrefPacePacked,
    };
