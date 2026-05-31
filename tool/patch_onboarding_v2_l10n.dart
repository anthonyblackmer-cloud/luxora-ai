// ignore_for_file: avoid_print
//
// Adds Onboarding 2.0 strings to all locale ARBs.
// Run: dart run tool/patch_onboarding_v2_l10n.dart

import 'dart:convert';
import 'dart:io';

void main() {
  const locales = [
    'en',
    'de',
    'es',
    'fr',
    'it',
    'pt',
    'ru',
    'hi',
    'tr',
    'ja',
    'ko',
    'zh',
  ];

  final entries = _englishEntries();
  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map.addAll(entries);
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path (${entries.length} keys)');
  }
}

Map<String, dynamic> _englishEntries() {
  final m = <String, dynamic>{
    'onboardV2Eyebrow': "Let's design your perfect trip",
    'onboardV2StepTravelerEyebrow': 'Step 1',
    'onboardV2StepTravelerTitle': 'Who are you traveling with?',
    'onboardV2StepTravelerSubtitle':
        'Luxora tailors stays, dining, and pacing to your crew.',
    'onboardV2ChildrenLabel': 'Children traveling?',
    'onboardV2ChildrenSubtitle': 'Select all age groups that apply.',
    'onboardV2StepStyleEyebrow': 'Step 2',
    'onboardV2StepStyleTitle': 'What kind of trip are you looking for?',
    'onboardV2StepStyleSubtitle': 'Choose everything that excites you.',
    'onboardV2StepHotelEyebrow': 'Step 3',
    'onboardV2StepHotelTitle': 'What type of place would you like to stay?',
    'onboardV2StepHotelSubtitle':
        'We will match boutique gems and resort icons.',
    'onboardV2HotelBudgetLabel': 'Hotel budget',
    'onboardV2HotelAmenitiesLabel': 'Must-have amenities',
    'onboardV2StepFoodEyebrow': 'Step 4',
    'onboardV2StepFoodTitle': 'What types of restaurants do you enjoy?',
    'onboardV2StepFoodSubtitle': 'Cuisine and dining style — pick all you love.',
    'onboardV2CuisineLabel': 'Cuisine types',
    'onboardV2DiningStyleLabel': 'Dining style',
    'onboardV2StepPaceEyebrow': 'Step 5',
    'onboardV2StepPaceTitle': 'How would you like your days planned?',
    'onboardV2StepPaceSubtitle': 'Relaxed mornings or packed adventure — you choose.',
    'onboardV2PaceRelaxedTitle': 'Relaxed',
    'onboardV2PaceRelaxedBody': '2–3 activities per day',
    'onboardV2PaceBalancedTitle': 'Balanced',
    'onboardV2PaceBalancedBody': '4–5 activities per day',
    'onboardV2PacePackedTitle': 'Packed',
    'onboardV2PacePackedBody': 'Maximize every day',
    'onboardV2StepGoalsEyebrow': 'Step 6',
    'onboardV2StepGoalsTitle': 'What matters most on this trip?',
    'onboardV2StepGoalsSubtitle': 'Choose up to five priorities.',
    'onboardV2StepExperienceEyebrow': 'Step 7',
    'onboardV2StepExperienceTitle': 'What experiences would you enjoy?',
    'onboardV2StepExperienceSubtitle':
        'We will weave these into your itinerary.',
    'onboardV2StepAvoidEyebrow': 'Step 8',
    'onboardV2StepAvoidTitle': 'What would you prefer to avoid?',
    'onboardV2StepAvoidSubtitle': 'Luxora steers clear of what drains your trip.',
    'onboardV2StepEmotionEyebrow': 'Step 9',
    'onboardV2StepEmotionTitle': 'What would make this trip feel successful?',
    'onboardV2StepEmotionSubtitle': 'Choose one primary feeling.',
    'onboardV2StepSummaryEyebrow': 'Your concierge preview',
    'onboardV2StepSummaryTitle': 'Based on your selections, Luxora recommends',
    'onboardV2StepSummarySubtitle':
        "We're building your perfect trip now.",
    'onboardSummaryHotels': 'Hotels',
    'onboardSummaryRestaurants': 'Restaurants',
    'onboardSummaryHiddenGems': 'Hidden gems',
    'onboardSummaryExperiences': 'Experiences',
    'onboardSummaryHotelDefault': 'Curated stays matched to your budget',
    'onboardSummaryHotelType': '{type} stay',
    '@onboardSummaryHotelType': {
      'placeholders': {'type': {'type': 'String'}},
    },
    'onboardSummaryRooftopDining': 'Rooftop dining experiences',
    'onboardSummaryCuisine': '{cuisine} favorites',
    '@onboardSummaryCuisine': {
      'placeholders': {'cuisine': {'type': 'String'}},
    },
    'onboardSummaryHiddenGemsInsight': 'Hidden local restaurants & gems',
    'onboardSummaryPace': '{pace} daily pace',
    '@onboardSummaryPace': {
      'placeholders': {'pace': {'type': 'String'}},
    },
    'onboardSummaryRomantic': 'Romantic sunset experiences',
    'onboardSummaryEmotion': '{emotion}-focused journey',
    '@onboardSummaryEmotion': {
      'placeholders': {'emotion': {'type': 'String'}},
    },
    'onboardSummaryPremiumGems': 'Premium hidden gems',
    'agendaSuggestionsForYou': 'Picked for you',
    'agendaSuggestionsAlternates': 'Also great',
    'agendaSuggestionsBrowseAll': 'Browse all',
    'onboardBuildFailedHint':
        'We saved your preferences, but the itinerary needs another moment. Pull to refresh on Agenda or open Concierge.',
  };

  void pref(String key, String label) => m['onboardPref$key'] = label;

  pref('TravelerSolo', 'Solo');
  pref('TravelerCouple', 'Couple');
  pref('TravelerFamily', 'Family');
  pref('TravelerFriends', 'Friends');
  pref('TravelerBusiness', 'Business');
  pref('ChildrenNone', 'No children');
  pref('ChildrenToddlers', 'Toddlers');
  pref('ChildrenElementary', 'Elementary age');
  pref('ChildrenTeenagers', 'Teenagers');

  pref('StyleLuxury', 'Luxury');
  pref('StyleRelaxation', 'Relaxation');
  pref('StyleAdventure', 'Adventure');
  pref('StyleThemeParks', 'Theme Parks');
  pref('StyleFoodie', 'Foodie');
  pref('StyleNightlife', 'Nightlife');
  pref('StyleRomance', 'Romance');
  pref('StyleShopping', 'Shopping');
  pref('StyleBeaches', 'Beaches');
  pref('StyleWellness', 'Wellness');
  pref('StyleNature', 'Nature');
  pref('StylePhotography', 'Photography');
  pref('StyleHiddenGems', 'Hidden Gems');
  pref('StyleFamilyActivities', 'Family Activities');
  pref('StyleLocalExperiences', 'Local Experiences');
  pref('StyleEntertainment', 'Entertainment');

  pref('HotelLuxuryResort', 'Luxury Resort');
  pref('HotelBoutique', 'Boutique Hotel');
  pref('HotelFamilyResort', 'Family Resort');
  pref('HotelBudgetFriendly', 'Budget Friendly');
  pref('HotelAdultsOnly', 'Adults Only');
  pref('HotelSpaResort', 'Spa Resort');
  pref('HotelBeachfront', 'Beachfront');
  pref('HotelDowntown', 'Downtown');
  pref('HotelWalkable', 'Walkable Area');
  pref('HotelThemeParkArea', 'Theme Park Area');
  pref('HotelModern', 'Modern Hotel');
  pref('HotelHistoric', 'Historic Hotel');

  pref('BudgetOne', r'$');
  pref('BudgetTwo', r'$$');
  pref('BudgetThree', r'$$$');
  pref('BudgetFour', r'$$$$');

  pref('AmenityPool', 'Pool');
  pref('AmenitySpa', 'Spa');
  pref('AmenityGym', 'Gym');
  pref('AmenityBreakfast', 'Free Breakfast');
  pref('AmenityOceanView', 'Ocean View');
  pref('AmenityBalcony', 'Balcony');
  pref('AmenityKitchen', 'Kitchen');
  pref('AmenityShuttle', 'Shuttle Service');
  pref('AmenityPetFriendly', 'Pet Friendly');

  pref('CuisineAmerican', 'American');
  pref('CuisineItalian', 'Italian');
  pref('CuisineMexican', 'Mexican');
  pref('CuisineSeafood', 'Seafood');
  pref('CuisineSteakhouse', 'Steakhouse');
  pref('CuisineSushi', 'Sushi');
  pref('CuisineCuban', 'Cuban');
  pref('CuisineMediterranean', 'Mediterranean');
  pref('CuisineAsian', 'Asian');
  pref('CuisineBbq', 'BBQ');
  pref('CuisineFineDining', 'Fine Dining');
  pref('CuisineLocalFavorites', 'Local Favorites');
  pref('CuisineFoodTrucks', 'Food Trucks');
  pref('CuisineRooftop', 'Rooftop Dining');
  pref('CuisineBrunch', 'Brunch');
  pref('CuisineDessert', 'Dessert');

  pref('DiningQuick', 'Quick Service');
  pref('DiningCasual', 'Casual Dining');
  pref('DiningFamily', 'Family Friendly');
  pref('DiningDateNight', 'Date Night');
  pref('DiningFine', 'Fine Dining');
  pref('DiningWaterfront', 'Waterfront');
  pref('DiningHiddenGems', 'Hidden Gems');
  pref('DiningLocal', 'Local Favorites');

  pref('GoalMakeMemories', 'Make Memories');
  pref('GoalSaveMoney', 'Save Money');
  pref('GoalAvoidCrowds', 'Avoid Crowds');
  pref('GoalLuxury', 'Luxury Experiences');
  pref('GoalBestFood', 'Best Food');
  pref('GoalHiddenGems', 'Hidden Gems');
  pref('GoalRelaxation', 'Relaxation');
  pref('GoalAdventure', 'Adventure');
  pref('GoalBestPhotos', 'Best Photos');
  pref('GoalFamilyTime', 'Family Time');
  pref('GoalRomance', 'Romance');
  pref('GoalNightlife', 'Nightlife');
  pref('GoalLocal', 'Local Experiences');
  pref('GoalStressFree', 'Stress-Free Planning');

  pref('ExpBoatTours', 'Boat Tours');
  pref('ExpSunsetCruises', 'Sunset Cruises');
  pref('ExpAirboat', 'Airboat Tours');
  pref('ExpThemeParks', 'Theme Parks');
  pref('ExpMuseums', 'Museums');
  pref('ExpLiveShows', 'Live Shows');
  pref('ExpSpas', 'Spas');
  pref('ExpShopping', 'Shopping');
  pref('ExpWaterParks', 'Water Parks');
  pref('ExpGolf', 'Golf');
  pref('ExpFishing', 'Fishing');
  pref('ExpKayaking', 'Kayaking');
  pref('ExpSnorkeling', 'Snorkeling');
  pref('ExpRooftopBars', 'Rooftop Bars');
  pref('ExpNightclubs', 'Nightclubs');
  pref('ExpWildlife', 'Wildlife Experiences');
  pref('ExpFoodTours', 'Food Tours');
  pref('ExpScenicDrives', 'Scenic Drives');

  pref('AvoidCrowds', 'Crowds');
  pref('AvoidLongLines', 'Long Lines');
  pref('AvoidExpensiveRestaurants', 'Expensive Restaurants');
  pref('AvoidWalking', 'Walking Long Distances');
  pref('AvoidNightlife', 'Nightlife');
  pref('AvoidDriving', 'Driving');
  pref('AvoidTouristTraps', 'Tourist Traps');
  pref('AvoidEarlyMornings', 'Early Mornings');
  pref('AvoidLateNights', 'Late Nights');
  pref('AvoidFamilyAttractions', 'Family Attractions');
  pref('AvoidThemeParks', 'Theme Parks');

  pref('EmotionRelaxed', 'Relaxed');
  pref('EmotionExcited', 'Excited');
  pref('EmotionAdventurous', 'Adventurous');
  pref('EmotionRomantic', 'Romantic');
  pref('EmotionLuxurious', 'Luxurious');
  pref('EmotionFamilyFocused', 'Family-Focused');
  pref('EmotionMemorable', 'Memorable');
  pref('EmotionStressFree', 'Stress-Free');
  pref('EmotionInspiring', 'Inspiring');

  pref('PaceSlow', 'Relaxed');
  pref('PaceBalanced', 'Balanced');
  pref('PacePacked', 'Packed');

  return m;
}
