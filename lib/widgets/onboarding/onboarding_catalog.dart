import 'package:flutter/material.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';

class OnboardingOption<T> {
  const OnboardingOption({required this.value, required this.icon});

  final T value;
  final IconData icon;
}

abstract final class OnboardingCatalog {
  static const travelerTypes = [
    OnboardingOption(value: TravelerType.solo, icon: Icons.person_rounded),
    OnboardingOption(
      value: TravelerType.couple,
      icon: Icons.favorite_rounded,
    ),
    OnboardingOption(
      value: TravelerType.family,
      icon: Icons.family_restroom_rounded,
    ),
    OnboardingOption(
      value: TravelerType.friends,
      icon: Icons.groups_rounded,
    ),
    OnboardingOption(
      value: TravelerType.business,
      icon: Icons.business_center_rounded,
    ),
  ];

  static const childrenTypes = [
    OnboardingOption(value: ChildrenType.none, icon: Icons.block_rounded),
    OnboardingOption(
      value: ChildrenType.toddlers,
      icon: Icons.child_care_rounded,
    ),
    OnboardingOption(
      value: ChildrenType.elementary,
      icon: Icons.backpack_rounded,
    ),
    OnboardingOption(
      value: ChildrenType.teenagers,
      icon: Icons.sports_esports_rounded,
    ),
  ];

  static const tripStyles = [
    OnboardingOption(value: TripStyle.luxury, icon: Icons.diamond_rounded),
    OnboardingOption(
      value: TripStyle.relaxation,
      icon: Icons.spa_rounded,
    ),
    OnboardingOption(
      value: TripStyle.adventure,
      icon: Icons.terrain_rounded,
    ),
    OnboardingOption(
      value: TripStyle.themeParks,
      icon: Icons.attractions_rounded,
    ),
    OnboardingOption(value: TripStyle.foodie, icon: Icons.restaurant_rounded),
    OnboardingOption(
      value: TripStyle.nightlife,
      icon: Icons.nightlife_rounded,
    ),
    OnboardingOption(value: TripStyle.romance, icon: Icons.favorite_border),
    OnboardingOption(
      value: TripStyle.shopping,
      icon: Icons.shopping_bag_rounded,
    ),
    OnboardingOption(value: TripStyle.beaches, icon: Icons.beach_access_rounded),
    OnboardingOption(value: TripStyle.wellness, icon: Icons.self_improvement),
    OnboardingOption(value: TripStyle.nature, icon: Icons.park_rounded),
    OnboardingOption(
      value: TripStyle.photography,
      icon: Icons.photo_camera_rounded,
    ),
    OnboardingOption(
      value: TripStyle.hiddenGems,
      icon: Icons.auto_awesome_rounded,
    ),
    OnboardingOption(
      value: TripStyle.familyActivities,
      icon: Icons.celebration_rounded,
    ),
    OnboardingOption(
      value: TripStyle.localExperiences,
      icon: Icons.explore_rounded,
    ),
    OnboardingOption(
      value: TripStyle.entertainment,
      icon: Icons.theaters_rounded,
    ),
  ];

  static const hotelTypes = [
    OnboardingOption(
      value: HotelTypePreference.luxuryResort,
      icon: Icons.holiday_village_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.boutiqueHotel,
      icon: Icons.apartment_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.familyResort,
      icon: Icons.cottage_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.budgetFriendly,
      icon: Icons.savings_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.adultsOnly,
      icon: Icons.no_meals_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.spaResort,
      icon: Icons.hot_tub_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.beachfront,
      icon: Icons.waves_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.downtown,
      icon: Icons.location_city_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.walkableArea,
      icon: Icons.directions_walk_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.themeParkArea,
      icon: Icons.roller_skating_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.modernHotel,
      icon: Icons.architecture_rounded,
    ),
    OnboardingOption(
      value: HotelTypePreference.historicHotel,
      icon: Icons.museum_rounded,
    ),
  ];

  static const hotelBudgets = [
    OnboardingOption(value: HotelBudgetLevel.one, icon: Icons.payments_outlined),
    OnboardingOption(value: HotelBudgetLevel.two, icon: Icons.payments_rounded),
    OnboardingOption(
      value: HotelBudgetLevel.three,
      icon: Icons.account_balance_wallet_rounded,
    ),
    OnboardingOption(
      value: HotelBudgetLevel.four,
      icon: Icons.workspace_premium_rounded,
    ),
  ];

  static const hotelAmenities = [
    OnboardingOption(value: HotelAmenity.pool, icon: Icons.pool_rounded),
    OnboardingOption(value: HotelAmenity.spa, icon: Icons.spa_outlined),
    OnboardingOption(value: HotelAmenity.gym, icon: Icons.fitness_center_rounded),
    OnboardingOption(
      value: HotelAmenity.freeBreakfast,
      icon: Icons.free_breakfast_rounded,
    ),
    OnboardingOption(
      value: HotelAmenity.oceanView,
      icon: Icons.water_rounded,
    ),
    OnboardingOption(value: HotelAmenity.balcony, icon: Icons.balcony_rounded),
    OnboardingOption(value: HotelAmenity.kitchen, icon: Icons.kitchen_rounded),
    OnboardingOption(
      value: HotelAmenity.shuttleService,
      icon: Icons.airport_shuttle_rounded,
    ),
    OnboardingOption(
      value: HotelAmenity.petFriendly,
      icon: Icons.pets_rounded,
    ),
  ];

  static const cuisines = [
    OnboardingOption(
      value: CuisinePreference.american,
      icon: Icons.lunch_dining_rounded,
    ),
    OnboardingOption(
      value: CuisinePreference.italian,
      icon: Icons.ramen_dining_rounded,
    ),
    OnboardingOption(
      value: CuisinePreference.mexican,
      icon: Icons.local_pizza_rounded,
    ),
    OnboardingOption(
      value: CuisinePreference.seafood,
      icon: Icons.set_meal_rounded,
    ),
    OnboardingOption(
      value: CuisinePreference.steakhouse,
      icon: Icons.outdoor_grill_rounded,
    ),
    OnboardingOption(value: CuisinePreference.sushi, icon: Icons.rice_bowl_rounded),
    OnboardingOption(value: CuisinePreference.cuban, icon: Icons.emoji_food_beverage),
    OnboardingOption(
      value: CuisinePreference.mediterranean,
      icon: Icons.egg_alt_rounded,
    ),
    OnboardingOption(value: CuisinePreference.asian, icon: Icons.ramen_dining),
    OnboardingOption(value: CuisinePreference.bbq, icon: Icons.outdoor_grill),
    OnboardingOption(
      value: CuisinePreference.fineDining,
      icon: Icons.wine_bar_rounded,
    ),
    OnboardingOption(
      value: CuisinePreference.localFavorites,
      icon: Icons.storefront_rounded,
    ),
    OnboardingOption(
      value: CuisinePreference.foodTrucks,
      icon: Icons.local_shipping_rounded,
    ),
    OnboardingOption(
      value: CuisinePreference.rooftopDining,
      icon: Icons.roofing_rounded,
    ),
    OnboardingOption(value: CuisinePreference.brunch, icon: Icons.brunch_dining),
    OnboardingOption(
      value: CuisinePreference.dessert,
      icon: Icons.icecream_rounded,
    ),
  ];

  static const diningStyles = [
    OnboardingOption(
      value: DiningPreference.quickService,
      icon: Icons.takeout_dining_rounded,
    ),
    OnboardingOption(
      value: DiningPreference.casualDining,
      icon: Icons.table_restaurant_rounded,
    ),
    OnboardingOption(
      value: DiningPreference.familyFriendly,
      icon: Icons.child_friendly_rounded,
    ),
    OnboardingOption(
      value: DiningPreference.dateNight,
      icon: Icons.candlestick_chart_rounded,
    ),
    OnboardingOption(
      value: DiningPreference.fineDining,
      icon: Icons.dinner_dining_rounded,
    ),
    OnboardingOption(
      value: DiningPreference.waterfront,
      icon: Icons.sailing_rounded,
    ),
    OnboardingOption(
      value: DiningPreference.hiddenGems,
      icon: Icons.auto_awesome,
    ),
    OnboardingOption(
      value: DiningPreference.localFavorites,
      icon: Icons.place_rounded,
    ),
  ];

  static const paceOptions = [
    OnboardingOption(value: PacePreference.slow, icon: Icons.wb_sunny_outlined),
    OnboardingOption(
      value: PacePreference.balanced,
      icon: Icons.timelapse_rounded,
    ),
    OnboardingOption(
      value: PacePreference.packed,
      icon: Icons.bolt_rounded,
    ),
  ];

  static const vacationGoals = [
    OnboardingOption(
      value: VacationGoal.makeMemories,
      icon: Icons.photo_library_rounded,
    ),
    OnboardingOption(
      value: VacationGoal.saveMoney,
      icon: Icons.savings_outlined,
    ),
    OnboardingOption(
      value: VacationGoal.avoidCrowds,
      icon: Icons.people_outline_rounded,
    ),
    OnboardingOption(
      value: VacationGoal.luxuryExperiences,
      icon: Icons.star_rounded,
    ),
    OnboardingOption(
      value: VacationGoal.bestFood,
      icon: Icons.restaurant_menu_rounded,
    ),
    OnboardingOption(
      value: VacationGoal.hiddenGems,
      icon: Icons.auto_awesome_outlined,
    ),
    OnboardingOption(
      value: VacationGoal.relaxation,
      icon: Icons.weekend_rounded,
    ),
    OnboardingOption(
      value: VacationGoal.adventure,
      icon: Icons.hiking_rounded,
    ),
    OnboardingOption(
      value: VacationGoal.bestPhotos,
      icon: Icons.camera_alt_rounded,
    ),
    OnboardingOption(
      value: VacationGoal.familyTime,
      icon: Icons.diversity_3_rounded,
    ),
    OnboardingOption(value: VacationGoal.romance, icon: Icons.favorite),
    OnboardingOption(
      value: VacationGoal.nightlife,
      icon: Icons.local_bar_rounded,
    ),
    OnboardingOption(
      value: VacationGoal.localExperiences,
      icon: Icons.map_rounded,
    ),
    OnboardingOption(
      value: VacationGoal.stressFreePlanning,
      icon: Icons.check_circle_outline_rounded,
    ),
  ];

  static const experiences = [
    OnboardingOption(
      value: ExperiencePreference.boatTours,
      icon: Icons.directions_boat_rounded,
    ),
    OnboardingOption(
      value: ExperiencePreference.sunsetCruises,
      icon: Icons.wb_twilight_rounded,
    ),
    OnboardingOption(
      value: ExperiencePreference.airboatTours,
      icon: Icons.air_rounded,
    ),
    OnboardingOption(
      value: ExperiencePreference.themeParks,
      icon: Icons.attractions_rounded,
    ),
    OnboardingOption(
      value: ExperiencePreference.museums,
      icon: Icons.museum_outlined,
    ),
    OnboardingOption(
      value: ExperiencePreference.liveShows,
      icon: Icons.music_note_rounded,
    ),
    OnboardingOption(value: ExperiencePreference.spas, icon: Icons.spa),
    OnboardingOption(
      value: ExperiencePreference.shopping,
      icon: Icons.shopping_cart_rounded,
    ),
    OnboardingOption(
      value: ExperiencePreference.waterParks,
      icon: Icons.water_drop_rounded,
    ),
    OnboardingOption(value: ExperiencePreference.golf, icon: Icons.golf_course),
    OnboardingOption(value: ExperiencePreference.fishing, icon: Icons.phishing),
    OnboardingOption(
      value: ExperiencePreference.kayaking,
      icon: Icons.kayaking_rounded,
    ),
    OnboardingOption(
      value: ExperiencePreference.snorkeling,
      icon: Icons.scuba_diving_rounded,
    ),
    OnboardingOption(
      value: ExperiencePreference.rooftopBars,
      icon: Icons.roofing,
    ),
    OnboardingOption(
      value: ExperiencePreference.nightclubs,
      icon: Icons.nightlife,
    ),
    OnboardingOption(
      value: ExperiencePreference.wildlifeExperiences,
      icon: Icons.cruelty_free_rounded,
    ),
    OnboardingOption(
      value: ExperiencePreference.foodTours,
      icon: Icons.tour_rounded,
    ),
    OnboardingOption(
      value: ExperiencePreference.scenicDrives,
      icon: Icons.directions_car_rounded,
    ),
  ];

  static const avoidOptions = [
    OnboardingOption(value: AvoidPreference.crowds, icon: Icons.groups_2_rounded),
    OnboardingOption(
      value: AvoidPreference.longLines,
      icon: Icons.hourglass_top_rounded,
    ),
    OnboardingOption(
      value: AvoidPreference.expensiveRestaurants,
      icon: Icons.money_off_rounded,
    ),
    OnboardingOption(
      value: AvoidPreference.walkingLongDistances,
      icon: Icons.directions_walk,
    ),
    OnboardingOption(
      value: AvoidPreference.nightlife,
      icon: Icons.do_not_disturb_on_rounded,
    ),
    OnboardingOption(
      value: AvoidPreference.driving,
      icon: Icons.no_crash_rounded,
    ),
    OnboardingOption(
      value: AvoidPreference.touristTraps,
      icon: Icons.warning_amber_rounded,
    ),
    OnboardingOption(
      value: AvoidPreference.earlyMornings,
      icon: Icons.wb_sunny,
    ),
    OnboardingOption(
      value: AvoidPreference.lateNights,
      icon: Icons.nightlight_round,
    ),
    OnboardingOption(
      value: AvoidPreference.familyAttractions,
      icon: Icons.not_interested_rounded,
    ),
    OnboardingOption(
      value: AvoidPreference.themeParks,
      icon: Icons.block,
    ),
  ];

  static const emotions = [
    OnboardingOption(
      value: DesiredTripEmotion.relaxed,
      icon: Icons.beach_access,
    ),
    OnboardingOption(
      value: DesiredTripEmotion.excited,
      icon: Icons.celebration,
    ),
    OnboardingOption(
      value: DesiredTripEmotion.adventurous,
      icon: Icons.explore,
    ),
    OnboardingOption(
      value: DesiredTripEmotion.romantic,
      icon: Icons.favorite,
    ),
    OnboardingOption(
      value: DesiredTripEmotion.luxurious,
      icon: Icons.diamond,
    ),
    OnboardingOption(
      value: DesiredTripEmotion.familyFocused,
      icon: Icons.family_restroom,
    ),
    OnboardingOption(
      value: DesiredTripEmotion.memorable,
      icon: Icons.auto_awesome,
    ),
    OnboardingOption(
      value: DesiredTripEmotion.stressFree,
      icon: Icons.sentiment_satisfied_alt_rounded,
    ),
    OnboardingOption(
      value: DesiredTripEmotion.inspiring,
      icon: Icons.lightbulb_rounded,
    ),
  ];
}
