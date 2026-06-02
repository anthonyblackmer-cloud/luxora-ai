// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get settingsThemeIntro =>
      'Cinematic dark or resort light — pick the mood for your trip.';

  @override
  String get settingsThemeLabel => 'Theme';

  @override
  String get themeGoldenEmber => 'Golden Ember';

  @override
  String get themeGoldenEmberMood => 'Warm ultra-luxury';

  @override
  String get themeMidnightAmethyst => 'Midnight Amethyst';

  @override
  String get themeMidnightAmethystMood => 'Mysterious and exclusive';

  @override
  String get themeEmeraldHaven => 'Emerald Haven';

  @override
  String get themeEmeraldHavenMood => 'Serene tropical luxury';

  @override
  String get themeRivieraWhite => 'Riviera White';

  @override
  String get themeRivieraWhiteMood => 'Elegant luxury travel magazine';

  @override
  String get themeCoastalGlass => 'Coastal Glass';

  @override
  String get themeCoastalGlassMood => 'Clean premium vacation energy';

  @override
  String get themeChampagneLuxe => 'Champagne Luxe';

  @override
  String get themeChampagneLuxeMood => 'Private concierge elegance';

  @override
  String get themeBlackCard => 'Black Card';

  @override
  String get themeBlackCardMood => 'Private aviation prestige';

  @override
  String get settingsThemeSectionLuxury => 'Luxury cinematic';

  @override
  String get settingsThemeSectionReadable => 'Clean & readable';

  @override
  String get settingsMapSkinSection => 'Map basemap';

  @override
  String get settingsMapSkinIntro =>
      'Choose the look of map tiles on the Map tab.';

  @override
  String get mapSkinVoyager => 'Voyager';

  @override
  String get mapSkinVoyagerMood => 'Soft color — parks, water, roads';

  @override
  String get mapSkinOsm => 'OpenStreetMap';

  @override
  String get mapSkinOsmMood => 'Classic, natural tones';

  @override
  String get mapSkinCartoLight => 'Carto Light';

  @override
  String get mapSkinCartoLightMood => 'Minimal and bright';

  @override
  String get mapSkinCartoDark => 'Carto Dark';

  @override
  String get mapSkinCartoDarkMood => 'Night-friendly basemap';

  @override
  String get mapSkinMapboxStreets => 'Mapbox Streets';

  @override
  String get mapSkinMapboxStreetsMood => 'Rich detail, travel-app polish';

  @override
  String get mapSkinMapboxOutdoors => 'Mapbox Outdoors';

  @override
  String get mapSkinMapboxOutdoorsMood => 'Greens and terrain emphasis';

  @override
  String get dark_mode => 'Dark mode';

  @override
  String get light_mode => 'Light mode';

  @override
  String get language => 'Language';

  @override
  String get settings_language_picker_note => 'Changes apply immediately.';

  @override
  String get settings_regions_coming_title => 'Countries & cities';

  @override
  String get settings_regions_coming_subtitle =>
      'Home hub and city packs — coming soon.';

  @override
  String get commonSoon => 'Soon';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonNew => 'New';

  @override
  String get commonRoadmap => 'Roadmap';

  @override
  String get commonLive => 'Live';

  @override
  String get commonClose => 'Close';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonDelete => 'Delete';

  @override
  String get settingsStartOverSubtitle => 'Start a fresh trip from scratch';

  @override
  String get navConcierge => 'Concierge';

  @override
  String get navAgenda => 'Today';

  @override
  String get navDiscover => 'Discover';

  @override
  String get navMap => 'Map';

  @override
  String get navTrips => 'Trips';

  @override
  String get navMore => 'More';

  @override
  String get navRestaurants => 'Restaurants';

  @override
  String get navTimeline => 'Timeline';

  @override
  String get agendaTabItinerary => 'Days';

  @override
  String get agendaTabRestaurants => 'Restaurants';

  @override
  String get restaurantsPageTitle => 'Restaurants';

  @override
  String get restaurantsPageSubtitle =>
      'Browse dining Luxora knows — save favorites or let Concierge pick tonight\'s meal.';

  @override
  String get restaurantsConciergePick => 'Pick a restaurant for me';

  @override
  String restaurantsConciergePickDone(String name) {
    return 'Saved $name — ask Concierge to add it to your trip.';
  }

  @override
  String restaurantsSavedCount(int count) {
    return '$count saved for your trip';
  }

  @override
  String get restaurantsEmptyHint =>
      'No restaurants in your discover radius — widen radius on the map.';

  @override
  String get moreCardRestaurantsSub =>
      'Browse dining and let Concierge pick for you';

  @override
  String get agendaHotelSuggestionsTitle => 'Where to stay';

  @override
  String agendaHotelSuggestionsSubtitle(int budget) {
    return 'AI-matched to your ~$budget USD trip budget — tap to see all options.';
  }

  @override
  String agendaHotelTopPick(String name) {
    return 'Top pick: $name';
  }

  @override
  String get agendaStayDropdownHint => 'Select a hotel';

  @override
  String get agendaDiningDropdownHint => 'Select a restaurant';

  @override
  String get agendaDaySelectLabel => 'Which day';

  @override
  String get agendaDayDiningTitle => 'Where to eat tonight';

  @override
  String agendaDayDiningSubtitle(int budget, String tier) {
    return 'Suggestions for your ~$budget USD budget ($tier dining) based on today\'s plan.';
  }

  @override
  String get agendaDiningNearStops => 'Near today\'s stops';

  @override
  String get agendaDiningFitsBudget => 'Fits your trip budget';

  @override
  String get agendaDiningMatchesDay => 'Matches today\'s vibe';

  @override
  String get agendaDiningFoodiePick => 'Foodie favorite';

  @override
  String get browseCatRecommended => 'Recommended';

  @override
  String get browseCatDisneyHotels => 'Disney area';

  @override
  String get browseCatBudgetFriendly => 'Budget friendly';

  @override
  String get browseCatUpscaleLuxury => 'Upscale & luxury';

  @override
  String get browseCatUniversalHotels => 'Universal area';

  @override
  String get browseCatThemeParkDining => 'Theme park dining';

  @override
  String get browseCatUpscaleDining => 'Upscale & fine dining';

  @override
  String get browseSearchAllHotels => 'Search the full hotel catalog…';

  @override
  String get browseSearchAllRestaurants =>
      'Search the full restaurant catalog…';

  @override
  String get browseCategoryEmpty =>
      'No matches in this category for your radius — try search or widen discover.';

  @override
  String get browseFullCatalogHint =>
      'Use search above for the complete catalog — every hotel and restaurant Luxora knows.';

  @override
  String get agendaPageSubtitle => 'What am I doing right now?';

  @override
  String get navGems => 'Gems';

  @override
  String get navFeed => 'Feed';

  @override
  String get navTicketSavings => 'Savings';

  @override
  String get navStays => 'Stays';

  @override
  String get morePageTitle => 'More';

  @override
  String get morePageSubtitle =>
      'Travel tools, account, and preferences — curated for calm access.';

  @override
  String get moreSectionTravelTools => 'TRAVEL TOOLS';

  @override
  String get moreSectionAccount => 'ACCOUNT';

  @override
  String get moreSectionApp => 'APP';

  @override
  String get moreCardHotelsSub => 'Intelligent stays matched to your mood';

  @override
  String get moreCardGemsSub => 'Insider discoveries locals guard';

  @override
  String get moreCardTicketsSub => 'Compare authorized partner savings';

  @override
  String get moreCardWeatherSub => 'Forecast-aware day guidance';

  @override
  String get moreCardProfileTitle => 'Trip profile';

  @override
  String get moreCardProfileSub => 'Who travels, how it should feel';

  @override
  String get moreCardFavoritesSub => 'Destinations you\'ve bookmarked';

  @override
  String get moreCardNotificationsTitle => 'Notifications';

  @override
  String get moreCardNotificationsSub => 'Trip alerts and concierge updates';

  @override
  String get moreCardSettingsSub => 'Theme, city packs, and preferences';

  @override
  String get moreCardAboutSub => 'Why we\'re building Luxora';

  @override
  String get moreCardHelpSub => 'Guides and concierge support';

  @override
  String get moreCardCityPacksSub => 'Unlock destination concierges';

  @override
  String get moreCardPartnersSub => 'Featured partner experiences';

  @override
  String get moreCardItinerarySub => 'Your day-by-day golden escape';

  @override
  String get moreCardDiscoverSub =>
      'Trending dining, experiences, and live discovery';

  @override
  String get savedFavoritesTitle => 'Saved favorites';

  @override
  String get savedFavoritesEmpty =>
      'Bookmark destinations on the map or feed — they\'ll appear here.';

  @override
  String get helpCenterTitle => 'Help Center';

  @override
  String get helpCenterBody =>
      'Email support@luxora.ai for concierge help. In-app guides are coming soon.';

  @override
  String get notificationsComingSoon =>
      'Trip notifications are coming in a future update.';

  @override
  String get partnerOffersTitle => 'Partner offers';

  @override
  String get ticketSavingsTitle => 'Smart Ticket Savings';

  @override
  String get ticketSavingsBadgeLabel => 'PREMIUM SAVINGS';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora surfaces authorized resellers, bundles, and promotions so you feel like a luxury advisor — not a coupon site.';

  @override
  String ticketSavingsBadge(int percent) {
    return 'SAVE $percent%';
  }

  @override
  String get ticketOfficialPrice => 'Official';

  @override
  String get ticketDiscountPrice => 'Luxora price';

  @override
  String ticketSaveAmount(String amount) {
    return 'Save $amount';
  }

  @override
  String get ticketSaveAmountLabel => 'Savings';

  @override
  String ticketSavePerTicket(String amount) {
    return 'You could save $amount per ticket.';
  }

  @override
  String ticketFamilySave(String amount) {
    return 'Estimated family savings: $amount.';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return 'Estimated family savings: $amount.';
  }

  @override
  String ticketSource(String source) {
    return 'Source: $source';
  }

  @override
  String ticketExpires(String date) {
    return 'Offer through $date';
  }

  @override
  String get ticketBetterOption => 'Luxora found a better option.';

  @override
  String get ticketOverpaying => 'You may be overpaying at gate price.';

  @override
  String get ticketRecommendedSavings => 'Recommended savings available';

  @override
  String get ticketCalculatorTitle => 'Potential savings';

  @override
  String get ticketFilterLabel => 'Filter';

  @override
  String get ticketFilterAll => 'All';

  @override
  String get ticketFilterThemeParks => 'Theme parks';

  @override
  String get ticketFilterAttractions => 'Attractions';

  @override
  String get ticketFilterTours => 'Tours';

  @override
  String get ticketFilterDining => 'Dining experiences';

  @override
  String get ticketFilterWaterParks => 'Water parks';

  @override
  String get ticketFilterFamily => 'Family activities';

  @override
  String get ticketFilterEntertainment => 'Entertainment';

  @override
  String get ticketSortLabel => 'Sort by';

  @override
  String get ticketSortHighestSavings => 'Highest savings';

  @override
  String get ticketSortMostPopular => 'Most popular';

  @override
  String get ticketSortFamilyFriendly => 'Family friendly';

  @override
  String get ticketSortLuxury => 'Luxury experiences';

  @override
  String get ticketSortClosest => 'Closest to me';

  @override
  String get ticketDealsSectionTitle => 'Authorized deals';

  @override
  String ticketDealsPricesAsOf(String date) {
    return 'Prices as of $date';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'Couldn\'t refresh prices — showing cached deals.';

  @override
  String get ticketDealsUpdating => 'Updating prices…';

  @override
  String get ticketNoDeals => 'No deals in this filter — try another category.';

  @override
  String get ticketConfidenceHigh => 'High confidence';

  @override
  String get ticketConfidenceVerified => 'Verified reseller';

  @override
  String get ticketConfidenceLimited => 'Limited time';

  @override
  String get ticketAiInsightTitle => 'Luxora recommendation';

  @override
  String get ticketInsightDisneyPass =>
      'Based on your itinerary, a 3-day Walt Disney World pass instead of single-day tickets could save your family approximately 120 USD.';

  @override
  String get ticketInsightUniversalCombo =>
      'Your plan includes Universal — a 2-park ticket beats buying days separately for most families.';

  @override
  String get ticketInsightSeaworldCombo =>
      'SeaWorld on your route — the Aquatica combo often beats two separate admissions.';

  @override
  String get ticketInsightGeneric =>
      'Luxora matched savings to stops on your itinerary — compare before you buy at the gate.';

  @override
  String get ticketInsightMiamiCulture =>
      'Culture stops on your plan — Vizcaya and PAMM partner offers may beat gate pricing this week.';

  @override
  String get ticketInsightMiamiEverglades =>
      'Everglades day on your itinerary — morning airboat slots often run cheaper mid-week.';

  @override
  String get ticketInsightMiamiWynwood =>
      'Wynwood on your route — a guided art walk can beat walk-up booth pricing.';

  @override
  String get ticketItineraryMatchTitle => 'Itinerary savings check';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'Concierge';

  @override
  String conciergeTripFeel(String feel) {
    return 'Trip feel: “$feel”';
  }

  @override
  String get conciergeWelcome =>
      'Welcome to Luxora — your emotionally intelligent Florida companion.\n\nChoose a prompt below, or describe the feeling you want your trip to create.';

  @override
  String get conciergeQuickPrompts => 'Quick prompts';

  @override
  String get conciergeRemembering => 'Remembering for this trip';

  @override
  String get conciergeStyleMemory => 'Style memory';

  @override
  String get conciergeInputHint =>
      'Describe the feeling you want your trip to create…';

  @override
  String get conciergeGreetingMorning => 'Good morning.';

  @override
  String get conciergeGreetingAfternoon => 'Good afternoon.';

  @override
  String get conciergeGreetingEvening => 'Good evening.';

  @override
  String get conciergeWelcomeWarm =>
      'I\'m here to shape Florida around how you want to feel — not a checklist of sights. What are you craving today?';

  @override
  String get conciergeRefineStyle => 'Refine My Style';

  @override
  String get conciergeRecallReturning => 'Welcome back.';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'I remember you like $prefs.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'And you wanted this trip to feel: “$feel”.';
  }

  @override
  String get conciergePromptRomantic => 'Romantic getaway';

  @override
  String get conciergePromptWellness => 'Wellness reset';

  @override
  String get conciergePromptFamily => 'Family magic';

  @override
  String get conciergePromptHiddenLuxury => 'Hidden luxury';

  @override
  String get conciergePromptFoodie => 'Foodie adventure';

  @override
  String get conciergePromptSoftLuxury => 'Soft luxury escape';

  @override
  String get conciergePromptAdventure => 'Adventure mode';

  @override
  String get conciergePromptDisney => 'Disney after-dark';

  @override
  String get discoverSearchHint => 'Search destinations…';

  @override
  String get discoverSearchTitle => 'Find a destination';

  @override
  String get discoverFromOrlando => 'From Orlando';

  @override
  String discoverFromHub(String hub) {
    return 'From $hub';
  }

  @override
  String get discoverSearchScopeAll => 'Searching all Florida in catalog';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'Within $radius of Orlando';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return 'Within $radius of $hub';
  }

  @override
  String get discoverSearchEmpty =>
      'No matches in this radius — try a shorter name, widen your distance chip on Map or Feed, or search “beach”, “Disney”, or “springs”.';

  @override
  String get discoverFilterAll => 'All';

  @override
  String get discoverFilterHotels => 'Hotels';

  @override
  String get discoverFilterRestaurants => 'Restaurants';

  @override
  String get discoverFilterDestinations => 'Destinations';

  @override
  String get discoverPopularInRadius => 'Popular in your radius';

  @override
  String get discoverTrySearching => 'Try searching';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count destinations · within $radius of Orlando';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$count destinations · within $radius of $hub';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count destinations · all Florida';
  }

  @override
  String get radius25 => '25 mi';

  @override
  String get radius50 => '50 mi';

  @override
  String get radius100 => '100 mi';

  @override
  String get radiusAllFlorida => 'All Florida';

  @override
  String get radiusDesc25 => 'Day trips around Orlando core';

  @override
  String get radiusDesc50 => 'Springs, coast day trips, Space Coast';

  @override
  String get radiusDesc100 => 'Tampa Bay, Daytona, deeper Gulf';

  @override
  String get radiusDescAll => 'Keys, Miami, statewide highlights';

  @override
  String get radiusDesc25Miami =>
      'South Beach, Brickell, and core neighborhoods';

  @override
  String get radiusDesc50Miami => 'Wynwood, Coconut Grove, Key Biscayne';

  @override
  String get radiusDesc100Miami =>
      'Everglades, Fort Lauderdale, deeper South Florida';

  @override
  String get radiusDescAllMiami =>
      'Florida Keys trail and statewide highlights';

  @override
  String get radiusDesc25Keys =>
      'Key Largo, Islamorada, and upper reef corridor';

  @override
  String get radiusDesc50Keys => 'Marathon, Big Pine, and middle Keys beaches';

  @override
  String get radiusDesc100Keys => 'Full Overseas Highway through Key West';

  @override
  String get radiusDescAllKeys => 'Entire island chain and day-trip waters';

  @override
  String get feedBadge => 'LIVE DISCOVERY';

  @override
  String get feedTitle => 'Experience Feed';

  @override
  String get feedSubtitle =>
      'What’s moving right now — trending spots, new openings, creator picks, seasonal routes, and live updates.';

  @override
  String get feedSubtitleFamily =>
      'Family-friendly picks for your crew — parks, easy wins, and moments that land with kids (and parents).';

  @override
  String get feedPillTrending => 'Trending';

  @override
  String get feedPillNewOpenings => 'New openings';

  @override
  String get feedPillCreator => 'Creator picks';

  @override
  String get feedPillLive => 'Live updates';

  @override
  String get feedMoodPrompt => 'HOW DO YOU WANT TO FEEL?';

  @override
  String get feedMoodPromptFamily => 'HOW SHOULD TODAY FEEL FOR YOUR CREW?';

  @override
  String get feedMoodAll => 'Everything';

  @override
  String get feedMoodFamily => 'Family magic';

  @override
  String get feedMoodRomantic => 'Romantic';

  @override
  String get feedMoodCalm => 'Calm';

  @override
  String get feedMoodAdventurous => 'Adventurous';

  @override
  String get feedMoodPampered => 'Pampered';

  @override
  String get feedMoodSocial => 'Buzzing';

  @override
  String get feedMoodFoodie => 'Foodie';

  @override
  String get vibeSunsetReady => 'Sunset-ready';

  @override
  String get vibeViral => 'Viral';

  @override
  String get vibeFamilyApproved => 'Family-approved';

  @override
  String get vibeHiddenGem => 'Hidden gem';

  @override
  String get vibeRainSafe => 'Rain-safe';

  @override
  String get vibeDateNight => 'Date night';

  @override
  String get vibeNightVibe => 'Night vibe';

  @override
  String get vibeFoodie => 'Foodie';

  @override
  String get vibeLuxury => 'Luxury';

  @override
  String get vibeTrending => 'Trending';

  @override
  String get vibeLive => 'Live now';

  @override
  String get vibeSeasonal => 'Seasonal';

  @override
  String get vibeLocalPick => 'Local pick';

  @override
  String get vibeAdventure => 'Adventure';

  @override
  String get vibeWellness => 'Wellness';

  @override
  String get vibeBeachDay => 'Beach day';

  @override
  String get vibeLuxoraPick => 'Luxora pick';

  @override
  String get mapLayersTitle => 'MAP MOOD LAYERS';

  @override
  String get mapLayerAll => 'All pins';

  @override
  String get mapLayerGems => 'Gems';

  @override
  String get mapLayerNight => 'Night vibe';

  @override
  String get mapLayerDateNight => 'Date night';

  @override
  String get mapLayerWeather => 'Best weather';

  @override
  String get mapLayerItinerary => 'Itinerary';

  @override
  String get mapExpandMap => 'Expand map';

  @override
  String get mapFullscreenTitle => 'Map';

  @override
  String get mapCloseFullscreen => 'Close map';

  @override
  String get mapItineraryDayLabel => 'Show itinerary for';

  @override
  String get mapItineraryCurrentDay => 'Current day';

  @override
  String get feedFamilyMoodHint =>
      'Theme parks, character meals, and easy parent wins — filtered for family tags.';

  @override
  String get feedEmptyHint =>
      'No feed cards in this radius — try 50 mi or All Florida for Gulf coast and Keys highlights.';

  @override
  String get feedEmptyHintFamily =>
      'No family-tagged cards in this radius — try Adventurous or Everything, or widen the radius.';

  @override
  String get gemsBadge => 'INSIDER CURATION';

  @override
  String get gemsTitle => 'Hidden Gems';

  @override
  String get gemsSubtitle =>
      'Secret discoveries locals guard — why it’s special, when to go, how crowded it gets, and tips you won’t find on a postcard.';

  @override
  String get gemsPillHidden => 'Hidden places';

  @override
  String get gemsPillLocal => 'Local-only';

  @override
  String get gemsPillInsider => 'Insider tips';

  @override
  String get gemsPillCrowd => 'Crowd intel';

  @override
  String get gemsEmptyHint =>
      'No gems in this radius yet — widen to 50 mi or beyond for springs and Space Coast secrets.';

  @override
  String get gemsSearchHint => 'Search hidden gems & destinations…';

  @override
  String get gemLocalSecret => 'LOCAL SECRET';

  @override
  String get gemsMatchedBadge => 'Your style';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gems matched to your style',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
  }

  @override
  String get gemWhySpecial => 'Why it’s special';

  @override
  String get gemBestTime => 'Best time to go';

  @override
  String get gemCrowdLevel => 'Crowd level';

  @override
  String get gemInsiderTip => 'Insider tip';

  @override
  String get gemLocalNote => 'Local-only note';

  @override
  String get mapBadge => 'AI MAP';

  @override
  String get mapTitle => 'Your intelligent route';

  @override
  String get mapSubtitle =>
      'Pins for your curated day — gold diamonds are Gems, cyan markers are today’s timeline, gold line is the mood route.';

  @override
  String get mapPlanDayTitle => 'Today\'s agenda';

  @override
  String get mapPlanDaySuggested =>
      'Suggested from your trip mood — bookmark places to make it yours.';

  @override
  String get mapPlanDayEmpty =>
      'Bookmark destinations (♥) and Luxora builds an optimized route from your Orlando hub — least driving, most feeling.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count stops · $miles · $time drive';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'Starting from $hotel';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '$time drive · $miles from previous stop';
  }

  @override
  String get mapCrowdLevelQuiet => 'Quiet';

  @override
  String get mapCrowdLevelModerate => 'Moderate';

  @override
  String get mapCrowdLevelBusy => 'Busy';

  @override
  String get mapCrowdLevelPacked => 'Packed';

  @override
  String mapCrowdAtStop(String level) {
    return 'Crowd: $level';
  }

  @override
  String get mapParkingLevelEasy => 'Easy';

  @override
  String get mapParkingLevelModerate => 'Moderate';

  @override
  String get mapParkingLevelDifficult => 'Difficult';

  @override
  String get mapParkingLevelLimited => 'Limited · arrive early';

  @override
  String mapParkingAtStop(String level) {
    return 'Parking: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'Drive friction: $score/90';
  }

  @override
  String get mapRerouteButton => 'Reroute for calmer stops';

  @override
  String mapRerouteApplied(int count) {
    return 'Day adjusted — $count stops swapped for lighter crowds.';
  }

  @override
  String get mapRerouteNone => 'Your route already looks calm.';

  @override
  String get mapRerouteRainHint =>
      'Don\'t worry — I\'ve already found a few alternatives nearby so your day stays enjoyable and stress-free.';

  @override
  String get dayFlowSwapTitle => 'Change this stop';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'Tell Luxora what you\'d rather do instead of $current.';
  }

  @override
  String get dayFlowSwapTemplate => 'I was thinking something more like…';

  @override
  String get dayFlowSwapHint =>
      'e.g. a quiet park this morning, or seafood for dinner';

  @override
  String get dayFlowSwapApply => 'Update my day';

  @override
  String get dayFlowSwapViewPlace => 'View current stop';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return 'Updated — $newStop is now your $phase stop.';
  }

  @override
  String get dayFlowSwapNoMatch =>
      'Couldn\'t find a match nearby — try being more specific.';

  @override
  String get dayFlowSwapTapToChange => 'Change this stop';

  @override
  String get dayFlowSwapHoldSpeak => 'Hold to speak';

  @override
  String get dayFlowSwapListening => 'Listening…';

  @override
  String get rightNowButton => 'What should we do right now?';

  @override
  String get rightNowEmpty =>
      'No strong moment in your radius yet — widen discover or bookmark a few favorites.';

  @override
  String get rightNowResultTitle => 'RIGHT NOW';

  @override
  String get rightNowTapForDetails => 'Tap for details';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return 'You\'re $minutes minutes from $district. The weather is perfect — grab coffee at $place, then stroll $walkArea before crowds arrive ($crowd crowds).';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return 'You\'re $minutes minutes from $district. Skies look great — head to $place while crowds are still $crowd.';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return 'Golden hour is coming — leave in about $minutes minutes for $place ($crowd by sunset).';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return 'Rain on the radar — $minutes minutes to a cozy indoor pick: $place.';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return 'Nap-window calm — $minutes minutes to an easy family reset at $place.';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return 'Date-night energy — $minutes minutes to $place before the rush.';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return 'Quiet window — $minutes minutes to $place ($crowd right now).';
  }

  @override
  String get goldenHourTitle => 'Golden hour';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return 'Leave by $time ($minutes min drive) for $place — arrive ~15 minutes before sunset.';
  }

  @override
  String get goldenHourKindBeach => 'Beach sunset window';

  @override
  String get goldenHourKindRooftop => 'Rooftop golden hour';

  @override
  String get goldenHourKindScenic => 'Scenic photography timing';

  @override
  String get vacationScoreTitle => 'Vacation score';

  @override
  String vacationScoreSubtitle(int score) {
    return 'Today feels like a $score/100 kind of day.';
  }

  @override
  String get onboardOccasionLabel => 'What\'s the occasion?';

  @override
  String get onboardThemeParksOccasionHint =>
      'Unlock Orlando to reveal Disney & Universal theme-park occasions below.';

  @override
  String get occasionGeneral => 'Just exploring';

  @override
  String get occasionAnniversary => 'Anniversary';

  @override
  String get occasionHoneymoon => 'Honeymoon';

  @override
  String get occasionDateNight => 'Date night';

  @override
  String get occasionProposal => 'Proposal trip';

  @override
  String get occasionFamily => 'Family with kids';

  @override
  String get occasionDisneyAdventure => 'Disney adventure';

  @override
  String get occasionUniversalAdventure => 'Universal adventure';

  @override
  String get localSecretTitle => 'Local secret';

  @override
  String get localSecretWinterParkParkAvenue =>
      'Locals duck into the alley courtyard behind the bookstore — no street sign.';

  @override
  String get localSecretWorldFoodTrucks =>
      'Order the daily catch, not the burger — the line moves faster at the far window.';

  @override
  String get localSecretWekiwaSprings =>
      'Skip the main boardwalk after 2 PM — north trailhead stays quiet.';

  @override
  String get localSecretDisneySpringsParking =>
      'Best parking is the orange garage — walk the marina side, not the main entrance rush.';

  @override
  String get localSecretLakeEolaSunset =>
      'Face the amphitheater side for swan photos as the sky turns gold.';

  @override
  String get localSecretMiamiWynwoodAlley =>
      'Duck through the loading alley behind Panther Coffee — locals shoot murals without the main-line crowd.';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      'Buy cafecito at the window cart first — sideline bench regulars open up when you\'re holding a cortadito.';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      'Skip the main terrace rush — enter from the east garden and walk the mangrove boardwalk counter-clockwise.';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      'Face east at 7 AM on Lummus — art deco pastels glow before the brunch crowd arrives.';

  @override
  String get localSecretMiamiPantherAlley =>
      'Order at the window, walk the alley clockwise — best mural light hits the turquoise wall at 8:45 AM.';

  @override
  String get localSecretTampaBayRiverwalkParking =>
      'Use the Whiting Street garage — walk south along the river to skip event closures near the wharf.';

  @override
  String get localSecretTampaBayClearwaterSunset =>
      'Skip Pier 60 rail crowds — walk north Sand Key approach 40 minutes before sunset for Gulf color.';

  @override
  String get localSecretTampaBayDaliGarden =>
      'Book the last afternoon entry — east garden overlook catches bridge light without terrace gridlock.';

  @override
  String get localSecretTampaBayPierTiming =>
      'Weekday 4 PM pier entry — sunset without weekend stroller traffic on the new deck.';

  @override
  String get localSecretTampaBayYborCourtyard =>
      'Order Cuban sandwiches to go — eat in the brick courtyard side street locals use after 8 PM.';

  @override
  String get localSecretTampaBaySpongeDocks =>
      'Lunch at the dock first, sponge boats second — tour clusters thin after 1 PM on weekdays.';

  @override
  String get localSecretVegasBellagioFountains =>
      'Stand center-lawn 15 minutes before the show — front-rail crowds block the wide choreography view.';

  @override
  String get localSecretVegasFremontTiming =>
      'Weeknight 9 PM under the canopy — full Viva Vision loop without Saturday shoulder crush.';

  @override
  String get localSecretVegasCaesarsEntrance =>
      'Use the parking-garage connector — skip Strip sidewalk bottle-neck at peak dinner hours.';

  @override
  String get localSecretVegasVenetianWalk =>
      'Indoor canal walk at noon — air-conditioned Strip crossing without heat advisory exposure.';

  @override
  String get nycMoodRoutesTitle => 'New York City Mood Routes';

  @override
  String get localSecretNycTimesSquareStrategy =>
      'Enter from 7th Ave side streets — avoid crossroads crush and keep Broadway sightlines open.';

  @override
  String get localSecretNycObservationDeck =>
      'Book the last slot before sunset — golden light without midday queue heat.';

  @override
  String get localSecretNycCentralParkEntrance =>
      'Use the 72nd Street transverse — faster path to Bethesda without Columbus Circle crowds.';

  @override
  String get localSecretNycBroadwayTickets =>
      'TKTS same-day matinee line opens early — rush seats beat tourist markups.';

  @override
  String get localSecretNycBrooklynBridgePhoto =>
      'Washington Street DUMBO at 8 AM — empty cobblestone frame before tour groups arrive.';

  @override
  String get localSecretNycFerryGoldenHour =>
      'Staten Island Ferry outbound at sunset — free harbor loop without tour boat fees.';

  @override
  String get momentsTitle => 'LUXORA MOMENTS';

  @override
  String get momentsSubtitle => 'Search for a feeling — not a place.';

  @override
  String get momentFeelRelaxed => 'Feel relaxed';

  @override
  String get momentImpressSpouse => 'Impress my spouse';

  @override
  String get momentPerfectSunset => 'Perfect sunset';

  @override
  String get momentFamilyMemory => 'Family memory';

  @override
  String get momentLuxuryValue => 'Luxury without overspending';

  @override
  String get momentPromptRelaxed =>
      'I want to feel completely relaxed for the next few hours — slow, beautiful, no crowds.';

  @override
  String get momentPromptImpressSpouse =>
      'I want to impress my spouse with something romantic and unexpected tonight.';

  @override
  String get momentPromptPerfectSunset =>
      'I want the perfect Florida sunset moment — where should we be and when should we leave?';

  @override
  String get momentPromptFamilyMemory =>
      'I want a memorable family moment that\'s easy on parents and magical for kids.';

  @override
  String get momentPromptLuxuryValue =>
      'I want luxury that feels special without spending a fortune.';

  @override
  String get visualShareImageButton => 'Share image card';

  @override
  String get tripStoryTitle => 'Your trip story';

  @override
  String tripStoryHeading(String title) {
    return '$title — your Florida story';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return 'You came for $moods.';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return 'This chapter: $title.';
  }

  @override
  String get tripStoryBeatClosing =>
      'Luxora shaped the moments — you lived them.';

  @override
  String get tripsOpenStory => 'Your story';

  @override
  String get conciergeVoiceHold => 'Hold to speak';

  @override
  String get conciergeVoiceSoon =>
      'Allow microphone access so Luxora can hear you.';

  @override
  String get conciergeVoiceListening => 'Luxora is listening…';

  @override
  String get conciergeVoiceSpeaking => 'Luxora is speaking…';

  @override
  String get conciergeVoiceRelease => 'Release to send';

  @override
  String get conciergeVoiceSend => 'Send to Luxora';

  @override
  String get conciergeVoiceProcessing => 'Sending to Luxora…';

  @override
  String get conciergeVoiceNoSpeech =>
      'I didn\'t catch that — hold the button, speak, then release.';

  @override
  String get conciergeVoicePreviewFailed =>
      'Couldn\'t play a preview. Check your volume and try again.';

  @override
  String get conciergeVoiceUnavailable =>
      'Voice isn\'t available on this device.';

  @override
  String get conciergeVoiceSettingsTitle => 'Luxora voice';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Choose how Luxora sounds when she speaks — accent, tone, and pace. Uses your device\'s built-in voices.';

  @override
  String get conciergeVoiceRateLabel => 'Speaking pace';

  @override
  String get conciergeVoiceRateSlow => 'Slow';

  @override
  String get conciergeVoiceRateNatural => 'Natural';

  @override
  String get conciergeVoiceRateFast => 'Fast';

  @override
  String get conciergeVoicePreview => 'Preview voice';

  @override
  String get conciergeVoicePreviewCurrent => 'Preview current voice';

  @override
  String get conciergeVoicePreviewSample =>
      'Hello — I\'m Luxora. Tell me how you want this trip to feel.';

  @override
  String get conciergeVoiceDeviceNote =>
      'Download more voices in iPhone Settings → Accessibility → Spoken Content → Voices. Return here and tap Refresh.';

  @override
  String get conciergeVoiceDeviceSection => 'Voices on this iPhone';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'Includes voices you downloaded — tap one to use it for Luxora.';

  @override
  String get conciergeVoiceRefreshList => 'Refresh voice list';

  @override
  String get conciergeVoiceShowAllLanguages => 'Show all languages';

  @override
  String get conciergeVoiceOpenSettings => 'Open iPhone voice settings';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'No voices found — download packs in Settings, then refresh.';

  @override
  String get conciergeVoicePresetSection => 'Quick personas';

  @override
  String get conciergeVoiceRegionRecommended => 'Recommended';

  @override
  String get conciergeVoiceRegionEnglish => 'English';

  @override
  String get conciergeVoiceRegionRussian => 'Russian';

  @override
  String get conciergeVoiceRegionSpanish => 'Spanish';

  @override
  String get conciergeVoiceRegionFrench => 'French';

  @override
  String get conciergeVoiceRegionGerman => 'German';

  @override
  String get conciergeVoiceRegionOther => 'Other';

  @override
  String get conciergeVoicePresetMatchApp => 'Luxora default · Kate (Premium)';

  @override
  String get conciergeVoicePresetEnUsF => 'American · Female';

  @override
  String get conciergeVoicePresetEnUsM => 'American · Male';

  @override
  String get conciergeVoicePresetEnGbF => 'British · Female';

  @override
  String get conciergeVoicePresetEnGbM => 'British · Male';

  @override
  String get conciergeVoicePresetRuF => 'Russian · Female';

  @override
  String get conciergeVoicePresetRuM => 'Russian · Male';

  @override
  String get conciergeVoicePresetEsF => 'Spanish · Female';

  @override
  String get conciergeVoicePresetEsM => 'Spanish · Male';

  @override
  String get conciergeVoicePresetFrF => 'French · Female';

  @override
  String get conciergeVoicePresetFrM => 'French · Male';

  @override
  String get conciergeVoicePresetDeF => 'German · Female';

  @override
  String get conciergeVoicePresetDeM => 'German · Male';

  @override
  String get conciergeThinking => 'Luxora is thinking…';

  @override
  String get conciergeItinerarySynced =>
      'I\'ve added that to your Agenda — same stops on Map, ready to share.';

  @override
  String get conciergeAgendaUpdatedSnack =>
      'Your agenda is ready on Map and Agenda';

  @override
  String get conciergeAgendaSyncFailed =>
      'Map and Agenda did not update. Try one clear request, for example: Plan a 4-day Disney and Universal trip.';

  @override
  String get conciergeViewAgendaOnMap => 'View Agenda';

  @override
  String get conciergeAgendaDealsIntro =>
      'I matched authorized ticket deals to stops on your agenda — compare before you buy at the gate:';

  @override
  String get conciergeAgendaDealsSnack => 'Ticket deals matched to your agenda';

  @override
  String get conciergeViewTicketDeals => 'View deals';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · est. save $amount via $source';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return '$count stops on your agenda have partner deals — compare authorized offers before you buy at the gate.';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return 'Est. family savings · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals => 'Browse deals for your agenda →';

  @override
  String get conciergeFreshThread =>
      'Your agenda is on Map and Agenda. I\'ve archived this chat and started fresh — tweak the day, find deals, or ask something new.';

  @override
  String get conciergeThreadArchivedSnack =>
      'Chat archived — fresh thread started';

  @override
  String get conciergeNewConversationTooltip => 'New conversation';

  @override
  String get itinerarySameAsMapAgenda =>
      'Today\'s Concierge plan — also pinned on Map. Share the day card below.';

  @override
  String get conciergeTicketsFoundIntro =>
      'I found authorized ticket deals for your trip — tap Book tickets on Agenda for direct links:';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title: $price via $source (save $savings)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'Each matching stop on Agenda now has a Book tickets button with the reseller link.';

  @override
  String itineraryBookTickets(String amount) {
    return 'Book tickets · Save $amount';
  }

  @override
  String get itineraryOpenTicketDeal => 'Book tickets';

  @override
  String conciergeTripSaved(String title) {
    return 'Saved “$title” to your Trips — open the Trips tab anytime to revisit it.';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return 'Saved “$title” with $count experiences on your timeline.';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return 'You have $count saved trip(s):';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title ($dates) — $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      'You don\'t have any saved trips yet — ask me to plan something, then say “save my trip.”';

  @override
  String get conciergeSavedTripsHint =>
      'Open the Trips tab to view cards, share, or edit dates.';

  @override
  String get conciergeAiError =>
      'I couldn\'t reach Luxora right now. Check your connection and try again.';

  @override
  String get conciergeAiErrorVoice =>
      'Sorry — I couldn\'t connect to Luxora\'s concierge just now.';

  @override
  String get conciergeAiNotConfigured =>
      'Luxora\'s live concierge isn\'t wired up on this build yet — Supabase URL and anon key need to be baked into the app, and the edge function deployed. Map and itinerary still work; see docs/CONCIERGE_AI.md for setup.';

  @override
  String get conciergeAiOpenAiNotReady =>
      'Luxora heard you, but the concierge brain isn\'t online yet. Set OPENAI_API_KEY in Supabase secrets for the edge function (bright-processor), then try again.';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'Luxora couldn\'t find the concierge edge function \"$function\". Deploy it in Supabase or fix SUPABASE_CONCIERGE_FUNCTION on this build.';
  }

  @override
  String get conciergeAiAuthFailed =>
      'Luxora couldn\'t authenticate with Supabase — double-check SUPABASE_ANON_KEY matches your project.';

  @override
  String get mapAiPowers => 'AI map powers';

  @override
  String get mapNavLayerTitle => 'Stop friction intelligence';

  @override
  String get mapNavLayerSubtitle =>
      'Crowd, parking, and drive-stress outlook on each Plan my day stop — plus one-tap reroute.';

  @override
  String get mapBookingTitle => 'Seamless booking (partners)';

  @override
  String get mapCapMoodTitle => 'Mood-based routes';

  @override
  String get mapCapMoodDesc =>
      'Paths that match romantic, wellness, family, or adventure — not just shortest drive time.';

  @override
  String get mapCapDriveTitle => 'Drive-time optimization';

  @override
  String get mapCapDriveDesc =>
      'Smart sequencing so you spend time feeling, not sitting in traffic between highlights.';

  @override
  String get mapCapWeatherTitle => 'Weather-aware suggestions';

  @override
  String get mapCapWeatherDesc =>
      'Rain backup routes and live windows for beaches, rooftops, and springs.';

  @override
  String get mapCapSunsetTitle => 'Best sunset right now';

  @override
  String get mapCapSunsetDesc =>
      'Where golden hour hits best in the next 90 minutes based on sky and crowd patterns.';

  @override
  String get mapCapCrowdTitle => 'Crowd prediction';

  @override
  String get mapCapCrowdDesc =>
      'When parks, springs, and viral spots quiet down — before you arrive.';

  @override
  String get mapCapGemsTitle => 'Nearby hidden gems';

  @override
  String get mapCapGemsDesc =>
      'Insider pins surfaced along your route — not just top-10 tourist stops.';

  @override
  String get mapCapPersonalTitle => 'Route personalization';

  @override
  String get mapCapPersonalDesc =>
      'Your trip feel, pace, and budget reshape the map in real time.';

  @override
  String get mapFutureCrowdTitle => 'Crowd outlook';

  @override
  String get mapFutureCrowdDesc =>
      'Predicted quiet-to-packed windows on each stop in Plan my day.';

  @override
  String get mapFutureParkingTitle => 'Parking outlook';

  @override
  String get mapFutureParkingDesc =>
      'Estimated valet, garage, and arrival friction before you go.';

  @override
  String get mapFutureTrafficTitle => 'Drive friction score';

  @override
  String get mapFutureTrafficDesc =>
      'Stress-weighted leg scores on your day plan — not just drive minutes.';

  @override
  String get mapFutureRerouteTitle => 'Spontaneous reroute';

  @override
  String get mapFutureRerouteDesc =>
      'Weather shift or crowd spike? One tap to reshape the rest of your day.';

  @override
  String affiliateReserve(String category) {
    return 'Reserve · $category · premium partner (soon)';
  }

  @override
  String get affiliateHotels => 'Hotels & staycations';

  @override
  String get affiliateExperiences => 'Experiences & tours';

  @override
  String get affiliateRestaurants => 'Restaurant reservations';

  @override
  String get affiliateThemeParks => 'Theme park tickets';

  @override
  String get affiliateDayPasses => 'ResortPass / day passes';

  @override
  String get affiliateCarRentals => 'Car rentals';

  @override
  String get affiliateWellness => 'Wellness bookings';

  @override
  String get tripsBadge => 'COLLECTIONS';

  @override
  String get tripsTitle => 'Saved trips';

  @override
  String get tripsSubtitle =>
      'Tap a trip for a live snapshot — next moment, weather, sunset, and timeline.';

  @override
  String get tripsFooter =>
      'Trip covers from mood catalog · Cloud backup when signed in';

  @override
  String get tripsPlanNew => 'Plan a new trip';

  @override
  String get tripsEmptyTitle => 'No saved trips yet';

  @override
  String get tripsEmptyBody =>
      'Plan your first trip and it will appear here, ready to revisit anytime.';

  @override
  String get tripsDeleteTitle => 'Delete trip?';

  @override
  String tripsDeleteBody(String title) {
    return 'This removes “$title” from your saved trips. This can’t be undone.';
  }

  @override
  String get tripsDeleted => 'Trip deleted';

  @override
  String get tripsEditDates => 'Trip dates';

  @override
  String get tripsSaveDates => 'Save dates';

  @override
  String get tripsDatesUpdated => 'Trip dates updated';

  @override
  String get tripsDatesFlexible => 'Dates flexible';

  @override
  String get tripsLiveWeather => 'Live weather';

  @override
  String get tripsNextUp => 'Next up';

  @override
  String get tripsSunsetWindow => 'Sunset window';

  @override
  String get tripsTimelineSnapshot => 'Timeline snapshot';

  @override
  String get tripsOpenAgenda => 'Open full agenda';

  @override
  String get tripsOpenTimeline => 'Open full timeline';

  @override
  String get tripsShare => 'Share';

  @override
  String get shareItineraryFooter =>
      'Planned with Luxora — your emotionally intelligent Florida companion.';

  @override
  String get shareCardCta => 'Plan yours in Luxora';

  @override
  String get shareCardDownloadHint =>
      'Free on iOS & Android · luxora.ai/download';

  @override
  String shareCardShareMessage(String title, String url) {
    return '$title\n\nPlanned with Luxora AI — emotionally intelligent Florida travel.\nGet the app: $url';
  }

  @override
  String get conciergeLocalTryPlanning =>
      'Tell me how you want the trip to feel — e.g. \"Plan a relaxed 2-day Orlando trip with springs and food.\" I\'ll build a real agenda on your device (no cloud required).';

  @override
  String conciergeLocalPlanBuilt(String city, int count) {
    return 'I built your $city day — $count stops sequenced by mood and drive time. Open Agenda or Map to see your route.';
  }

  @override
  String get conciergeLocalNoIntent =>
      'Describe the feeling you want — or say \"Plan my Orlando day\" — and I\'ll build a real route on-device.';

  @override
  String get ticketConciergeIntelBadge => 'Concierge intel';

  @override
  String get ticketConciergeIntelAgenda =>
      'Matched to your agenda stops — not a generic coupon list.';

  @override
  String get agendaFixAfternoonRain => 'Rain incoming — fix my afternoon';

  @override
  String agendaRainRerouteDone(int count, int score) {
    return 'Afternoon updated — $count stops moved indoors. Vacation score $score/100.';
  }

  @override
  String get agendaRainRerouteNone =>
      'Your plan already works for this weather.';

  @override
  String get cloudTripsTitle => 'Cloud backup';

  @override
  String get cloudTripsSubtitle =>
      'Your saved trips sync across devices when you sign in — included with any city unlock.';

  @override
  String get cloudTripsMoreSubSignedOut => 'Sign in to back up saved trips';

  @override
  String cloudTripsMoreSubSignedIn(String email) {
    return 'Signed in as $email';
  }

  @override
  String get cloudTripsMoreSubSyncing => 'Syncing…';

  @override
  String get cloudTripsUnlockRequired =>
      'Unlock a city pack to enable cloud backup';

  @override
  String get cloudTripsUnlockCta => 'Unlock concierge';

  @override
  String get cloudTripsEmailHint => 'Email address';

  @override
  String get cloudTripsSendCode => 'Send sign-in code';

  @override
  String get cloudTripsCodeHint => '6-digit code from email';

  @override
  String get cloudTripsVerify => 'Verify & sign in';

  @override
  String get cloudTripsCodeSent => 'Check your email for a sign-in code';

  @override
  String get cloudTripsSignOut => 'Sign out';

  @override
  String get cloudTripsSyncNow => 'Sync now';

  @override
  String get cloudTripsSyncSuccess => 'Trips synced';

  @override
  String get cloudTripsSyncError => 'Sync failed — try again';

  @override
  String get cloudTripsBannerTitle => 'Back up your trips';

  @override
  String get cloudTripsBannerBody =>
      'Sign in to restore trips on a new phone or tablet.';

  @override
  String get cloudTripsBannerCta => 'Set up cloud backup';

  @override
  String get cloudTripsNotConfigured =>
      'Cloud backup requires Supabase (dev setup)';

  @override
  String get paywallFeatureCloudBackup => 'Cloud Trip Backup';

  @override
  String shareSubject(String title) {
    return 'My $title';
  }

  @override
  String get itineraryBadge => 'YOUR AGENDA';

  @override
  String get itineraryTagline =>
      'Every moment connected — anticipation built in, stress left out.';

  @override
  String itineraryDayTab(int day, String label) {
    return 'Day $day · $label';
  }

  @override
  String get detailWhySpecial => 'Why It’s Special';

  @override
  String get detailBestTime => 'Best Time to Go';

  @override
  String get detailInsiderTips => 'Insider Tips';

  @override
  String get detailReserve => 'Reserve Experience';

  @override
  String get detailReserveSoon => 'Reservation partners coming soon.';

  @override
  String get detailNearbyGems => 'Nearby Gems';

  @override
  String get detailDuration => 'Duration';

  @override
  String get detailPractical => 'Practical Details';

  @override
  String get detailCostRange => 'Cost range';

  @override
  String get detailBestFor => 'Best for';

  @override
  String get detailVibeMatch => 'Vibe Match';

  @override
  String get detailCrowd => 'Crowd';

  @override
  String get detailTravelIntelTitle => 'Trip friction outlook';

  @override
  String get detailTravelIntelSubtitle =>
      'Predicted from category, time, and distance — not live sensors.';

  @override
  String detailCrowdOutlook(String level) {
    return 'Crowd: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'Parking: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'Drive friction: $score/90';
  }

  @override
  String get detailPrice => 'Price';

  @override
  String get detailLocation => 'Location';

  @override
  String get detailGetDirections => 'Get Directions';

  @override
  String get detailParkMap => 'Park map';

  @override
  String get detailViewOnMap => 'View on map';

  @override
  String get detailMapsError => 'Couldn’t open maps on this device.';

  @override
  String get detailGoogleMaps => 'Google Maps';

  @override
  String get detailAppleMaps => 'Apple Maps';

  @override
  String get detailOpenInMaps => 'Open in maps';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time drive from Orlando';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$time drive from $hub';
  }

  @override
  String get detailSaveToItinerary => 'Save to itinerary';

  @override
  String get detailSaved => 'Saved';

  @override
  String get detailSavedSnack => 'Saved to your itinerary';

  @override
  String get detailRemovedSnack => 'Removed from your itinerary';

  @override
  String get detailSetHomeBase => 'Set as home base';

  @override
  String get detailHomeBaseActive => 'Your trip home base';

  @override
  String get detailHomeBaseHint => 'Your day’s route starts and ends here.';

  @override
  String get detailHomeBaseSetSnack => 'Set as your trip home base';

  @override
  String get detailHomeBaseClearedSnack => 'Home base cleared';

  @override
  String get detailMenuTitle => 'Menu highlights';

  @override
  String get detailMenuDisclaimer =>
      'Selected highlights — full menu and prices may vary at the venue.';

  @override
  String get detailMenuComingSoon =>
      'We’re still curating this menu. View the latest menu and prices online in the meantime.';

  @override
  String get detailViewMenuOnline => 'View menu online';

  @override
  String get photoClose => 'Close';

  @override
  String get photoViewDestination => 'View destination';

  @override
  String get photoBy => 'Photo by';

  @override
  String get photoOn => 'on';

  @override
  String milesFromOrlando(String distance) {
    return '$distance from Orlando';
  }

  @override
  String milesFromHub(String distance, String hub) {
    return '$distance from $hub';
  }

  @override
  String get landingBadge => 'FLORIDA · ORLANDO MVP';

  @override
  String get landingTitle1 => 'The vacation';

  @override
  String get landingTitle2 => 'already started.';

  @override
  String get landingSubtitle =>
      'Luxora AI is your emotionally intelligent concierge — hidden gems, rooftop sunsets, and moments designed to feel unforgettable before you even pack.';

  @override
  String get landingBegin => 'Begin My Journey';

  @override
  String get landingTalk => 'Talk to Luxora';

  @override
  String get landingWhy => 'Why we’re building this';

  @override
  String get storyTitle => 'Our story';

  @override
  String get storyHeroBadge => 'BUILT WITH INTENTION';

  @override
  String get storyHeroCreator => 'Creator, Luxora AI';

  @override
  String get storyHeroSubtitle => 'Florida · emotion-first travel';

  @override
  String get storyHeading => 'Why we’re building Luxora';

  @override
  String get storyProblemLead =>
      'We realized that planning a Florida / Orlando trip is surprisingly fragmented and overwhelming.';

  @override
  String get storyJumpingBetween => 'People usually jump between';

  @override
  String get storyProblemTail =>
      '…and still end up with generic tourist plans.';

  @override
  String get storyDifferentLead => 'We want to build something different.';

  @override
  String get storyNotPlannerTitle => 'Not just a travel planner';

  @override
  String get storyNotPlannerBody => 'An emotion-first AI travel companion.';

  @override
  String get storyInsteadOfAsking => 'Instead of asking';

  @override
  String get storyAppAsks => 'The app asks';

  @override
  String get storyInsteadQuestion => '“Where should I go?”';

  @override
  String get storyFeelQuestion => '“How do you want this trip to feel?”';

  @override
  String get storyMoodBuildLine =>
      'Then AI builds a personalized experience around that mood.';

  @override
  String get storyFloridaFirstTitle => 'Why Florida / Orlando first?';

  @override
  String get storyFloridaFirstLead => 'Orlando is a perfect test market:';

  @override
  String get storyVisionTitle => 'Our vision';

  @override
  String get storyVisionLead => 'Combine:';

  @override
  String get storyVisionCard =>
      'So the app feels closer to a luxury AI concierge — not another boring itinerary tool.';

  @override
  String get storyLongTermTitle => 'Long-term opportunity';

  @override
  String get storySourceGoogleMaps => 'Google Maps';

  @override
  String get storySourceTikTok => 'TikTok';

  @override
  String get storySourceInstagram => 'Instagram Reels';

  @override
  String get storySourceTravelBlogs => 'travel blogs';

  @override
  String get storySourceRestaurantApps => 'restaurant apps';

  @override
  String get storySourceWeatherApps => 'weather apps';

  @override
  String get storySourceTicketSites => 'ticket websites';

  @override
  String get storySourceTop10 => 'random “top 10 Orlando” articles';

  @override
  String get storyBulletMarket => 'Huge tourism market';

  @override
  String get storyBulletAudience =>
      'Families, couples, luxury travelers, and wellness travelers';

  @override
  String get storyBulletOptions =>
      'Endless restaurants, resorts, hidden gems, theme parks, springs, and nightlife';

  @override
  String get storyBulletRepeat => 'High repeat-visit behavior';

  @override
  String get storyBulletLogisticsGap =>
      'Most travel apps focus on logistics — not experience design';

  @override
  String get storyPillarAiItinerary => 'AI itinerary generation';

  @override
  String get storyPillarMoodPlanning => 'Mood-based travel planning';

  @override
  String get storyPillarLiveDiscovery =>
      'Live discovery & trending experiences';

  @override
  String get storyPillarHiddenGems => 'Hidden local gems';

  @override
  String get storyPillarRouting => 'Smart routing';

  @override
  String get storyPillarWeatherSunset => 'Weather & sunset intelligence';

  @override
  String get storyPillarPremiumUx => 'Premium aesthetic UX';

  @override
  String get storyOpportunityMultilingual => 'Multilingual expansion';

  @override
  String get storyOpportunityAffiliate => 'Affiliate & booking partnerships';

  @override
  String get storyOpportunityInventory =>
      'Restaurants, experiences, and tickets';

  @override
  String get storyOpportunitySubscriptions => 'Premium subscriptions';

  @override
  String get storyOpportunityScale =>
      'Scalable beyond Florida → other destinations later';

  @override
  String get landingValues => 'Memories · Emotion · Escape · Connection';

  @override
  String get landingRegionBadge => 'Launch region';

  @override
  String get landingRegionTitle => 'Orlando & Florida — curated for feeling';

  @override
  String get onboardFinish => 'Build my trip';

  @override
  String get onboardBuilding => 'Building your adventure…';

  @override
  String get onboardStep1Title => 'Where dreams land first';

  @override
  String get onboardStep1Subtitle => 'Where are you headed?';

  @override
  String get onboardDestination => 'Destination';

  @override
  String get onboardRegion => 'Region';

  @override
  String get onboardCityLabel => 'Choose your city';

  @override
  String get onboardCityUnlockNote =>
      'Each destination has its own concierge unlock — one-time purchase per city. Orlando theme parks are one add-on pack (Disney & Universal together).';

  @override
  String get landingCityLabel => 'Where are you going?';

  @override
  String get paywallSwitchCity => 'Destination';

  @override
  String get paywallUnlockingDestination => 'Unlocking for this trip';

  @override
  String paywallUnifiedPriceHeadline(String price) {
    return 'Every City Pack unlocks for $price each';
  }

  @override
  String get paywallUnifiedPriceBody =>
      'Orlando (includes Disney & Universal), Miami, and Florida Keys — one-time purchase each at the same price. No subscription.';

  @override
  String paywallSelectedPackToday(String packName) {
    return 'Unlocking today: $packName';
  }

  @override
  String paywallAddonUnifiedHeadline(String price) {
    return 'Disney & Universal — $price one time';
  }

  @override
  String get paywallAddonUnifiedBody =>
      'Same simple pricing as every Florida city pack — one unlock, lifetime access.';

  @override
  String get cityPickerUnlocked => 'Unlocked';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Unlock $price';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Orlando add-on · Disney & Universal together';

  @override
  String get onboardStep2Title => 'Time to feel free';

  @override
  String get onboardStep2Subtitle => 'When does your escape begin?';

  @override
  String get onboardStartDateLabel => 'Start date';

  @override
  String get onboardEndDateLabel => 'End date';

  @override
  String get onboardPickDate => 'Tap to choose';

  @override
  String get onboardSelectStartDate => 'Choose start date';

  @override
  String get onboardSelectEndDate => 'Choose end date';

  @override
  String get onboardDatesHint =>
      'You can change these anytime from your Trips tab.';

  @override
  String get onboardStepBudgetTitle => 'Plan with ease';

  @override
  String get onboardStepBudgetSubtitle => 'What feels right for this escape?';

  @override
  String get onboardBudget => 'Trip budget (USD)';

  @override
  String get onboardStep3Title => 'Who shares the story';

  @override
  String get onboardStep3Subtitle => 'Who\'s traveling with you?';

  @override
  String get onboardTravelers => 'Travelers';

  @override
  String get onboardStep4Title => 'Your rhythm';

  @override
  String get onboardStep4Subtitle => 'How should your days flow?';

  @override
  String get onboardNightlife => 'Nightlife interest';

  @override
  String get onboardFoodie => 'Foodie passion';

  @override
  String get onboardPoolside => 'Poolside & downtime';

  @override
  String get onboardAdventure => 'Adventure & outdoors';

  @override
  String get onboardCulture => 'Culture & sightseeing';

  @override
  String get dayFlowSubtitle =>
      'A day shaped around how you want to feel — not a checklist.';

  @override
  String get dayFlowMorning => 'MORNING';

  @override
  String get dayFlowMidday => 'MIDDAY';

  @override
  String get dayFlowAfternoon => 'AFTERNOON';

  @override
  String get dayFlowEvening => 'EVENING';

  @override
  String get dayFlowNight => 'NIGHT';

  @override
  String get dayFlowReasonMorningPool =>
      'Ease in slowly — poolside or spa before the day begins.';

  @override
  String get dayFlowReasonMorningCalm => 'A gentle start to set the tone.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Peak energy hours — the big adventure while you\'re fresh.';

  @override
  String get dayFlowReasonMiddayCulture =>
      'Sightseeing while the light is bright.';

  @override
  String get dayFlowReasonMiddayIcon => 'The signature moment of the day.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Afternoon downtime to recharge.';

  @override
  String get dayFlowReasonAfternoonGem => 'A hidden gem away from the crowds.';

  @override
  String get dayFlowReasonEveningDining =>
      'The meal of the day — your foodie pick.';

  @override
  String get dayFlowReasonNightOut => 'One last glow — a night out.';

  @override
  String weatherToday(String place) {
    return 'Right now in $place';
  }

  @override
  String weatherSunset(String time) {
    return 'Sunset $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% chance of rain — pack a light layer.';
  }

  @override
  String get weatherConditionClear => 'Clear';

  @override
  String get weatherConditionPartlyCloudy => 'Partly cloudy';

  @override
  String get weatherConditionCloudy => 'Cloudy';

  @override
  String get weatherConditionFog => 'Fog';

  @override
  String get weatherConditionDrizzle => 'Drizzle';

  @override
  String get weatherConditionRain => 'Rain';

  @override
  String get weatherConditionSnow => 'Snow';

  @override
  String get weatherConditionThunder => 'Thunderstorms';

  @override
  String get weatherConciergeTitle => 'Weather Concierge';

  @override
  String get weatherConciergeTapHint => 'Tap for travel-aware forecast';

  @override
  String get weatherConciergeAdviceTitle => 'Luxora Weather Advice';

  @override
  String weatherFeelsLike(String temp) {
    return 'Feels like $temp';
  }

  @override
  String get weatherHumidity => 'Humidity';

  @override
  String get weatherWind => 'Wind';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir at $speed mph';
  }

  @override
  String get weatherUv => 'UV index';

  @override
  String get weatherCloudCover => 'Cloud cover';

  @override
  String get weatherVisibility => 'Visibility';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles mi';
  }

  @override
  String weatherSunrise(String time) {
    return 'Sunrise $time';
  }

  @override
  String get weatherStatRain => 'Rain';

  @override
  String get weatherWhatToBring => 'What to Bring Today';

  @override
  String get weatherPlanImpact => 'Impact on Your Plan';

  @override
  String get weatherHourlyTitle => 'Hourly outlook';

  @override
  String get weatherHourlyUnavailable =>
      'Hourly forecast will appear when data loads.';

  @override
  String get weatherLiveRadar => 'Live Radar';

  @override
  String get weatherRadarComingSoon => 'Live radar coming soon.';

  @override
  String get weatherRadarPlay => 'Play loop';

  @override
  String get weatherRadarPause => 'Pause loop';

  @override
  String get weatherRadarTapToExpand => 'Tap for full screen';

  @override
  String get weatherRadarNow => 'Now';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return '$minutes min ago';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes min';
  }

  @override
  String get weatherRadarStepBack => 'Earlier frame';

  @override
  String get weatherRadarStepForward => 'Later frame';

  @override
  String get weatherRadarJumpNow => 'Now';

  @override
  String get weatherRadarJump1h => '−1 hr';

  @override
  String get weatherRadarJump2h => '−2 hr';

  @override
  String get weatherRadarJump30m => '+30 min';

  @override
  String get weatherRadarSpeedSlow => 'Slow';

  @override
  String get weatherRadarSpeedNormal => 'Normal';

  @override
  String get weatherRadarSpeedFast => 'Fast';

  @override
  String get weatherRadarLoopNote =>
      'Radar loop: past ~2 hours in 10‑minute steps, plus short-range nowcast when available — not a 4‑hour forecast.';

  @override
  String get shareMapPreviewCaption =>
      'Map preview · open in Luxora for live directions';

  @override
  String get shareRadarPreviewCaption =>
      'Live Doppler radar · open in Luxora for the full loop';

  @override
  String get weatherMapOverlays => 'Map overlays';

  @override
  String get weatherOverlayPrecip => 'Precipitation';

  @override
  String get weatherOverlayTemp => 'Temperature';

  @override
  String get weatherOverlayWind => 'Wind';

  @override
  String get weatherOverlayCloud => 'Cloud cover';

  @override
  String get weatherComingSoon => 'Coming soon';

  @override
  String get weatherAdjustDay => 'Adjust My Day for Weather';

  @override
  String get weatherBestOutdoorWindow => 'Best outdoor window';

  @override
  String get weatherRainWindow => 'Rain likely';

  @override
  String get weatherSunsetRec => 'Sunset recommendation';

  @override
  String weatherOutdoorAtRisk(int count) {
    return '$count outdoor stops may be affected';
  }

  @override
  String get weatherIndoorBackup => 'Indoor backup ideas';

  @override
  String get weatherAdviceLightJacket => 'Bring a light jacket this evening.';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return 'Plan outdoor activities before $time.';
  }

  @override
  String get weatherAdviceHighUv =>
      'High UV today — bring sunscreen and avoid long direct sun exposure midday.';

  @override
  String get weatherAdviceRainLater =>
      'Rain risk increases later today, so move indoor experiences to the afternoon.';

  @override
  String get weatherAdviceWindBeach =>
      'Wind may make beach or boat activities less comfortable today.';

  @override
  String get weatherAdviceGreatSunset =>
      'Great sunset conditions tonight — consider a rooftop dinner or lake walk.';

  @override
  String get weatherAdviceDefault =>
      'Skies look manageable — follow your plan and keep a light layer handy.';

  @override
  String weatherSunsetRecRooftop(String time) {
    return 'Clear skies near $time — rooftop dinner or a lake walk could shine.';
  }

  @override
  String get weatherPackSunscreen => 'Sunscreen';

  @override
  String get weatherPackSunglasses => 'Sunglasses';

  @override
  String get weatherPackUmbrella => 'Umbrella';

  @override
  String get weatherPackLightJacket => 'Light jacket';

  @override
  String get weatherPackShoes => 'Comfortable shoes';

  @override
  String get weatherPackWater => 'Water bottle';

  @override
  String get weatherPackHat => 'Hat';

  @override
  String get weatherPackPoncho => 'Poncho';

  @override
  String get weatherPackSwimwear => 'Swimwear';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return 'Rain risk rises after $time. Consider moving $outdoorStop earlier and saving $indoorStop for later.';
  }

  @override
  String weatherImpactHeat(String time) {
    return 'High heat midday — plan outdoor walks before $time.';
  }

  @override
  String get weatherImpactClear =>
      'Skies look friendly for your outdoor plans this morning.';

  @override
  String weatherImpactMixed(int count) {
    return '$count outdoor stops may need timing tweaks today.';
  }

  @override
  String get weatherImpactNoPlanRain =>
      'Rain is in the mix — build your day with indoor anchors first.';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return 'Best outdoor window looks like $start–$end before heat or showers build.';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      'Weather looks steady — tap Plan My Day when you\'re ready to sequence stops.';

  @override
  String get weatherImpactIndoorFallback => 'a spa or museum';

  @override
  String get hotelIntelBadge => 'HOTEL INTELLIGENCE';

  @override
  String get hotelIntelTitle => 'Find Your Home Base';

  @override
  String get hotelIntelSubtitle =>
      'Based on the trip you want to have, Luxora selects stays that shape your days — not a booking grid.';

  @override
  String get hotelDiscoveryTitle => 'Curated for Orlando';

  @override
  String get hotelMatchmakerTeaser =>
      'Tell Luxora your trip style and get three concierge-picked stays with honest tradeoffs.';

  @override
  String get hotelMatchmakerCta => 'AI Hotel Matchmaker';

  @override
  String get hotelMatchmakerTitle => 'Hotel Matchmaker';

  @override
  String get hotelMatchmakerSubtitle =>
      'Share how you travel — Luxora recommends where to anchor your days.';

  @override
  String get hotelMatchmakerRun => 'Find My Top 3 Stays';

  @override
  String get hotelMatchBudget => 'Budget comfort zone';

  @override
  String get hotelMatchTravelers => 'Travelers';

  @override
  String get hotelMatchAdults => 'Adults';

  @override
  String get hotelMatchKids => 'Kids';

  @override
  String get hotelMatchAttractions => 'Attractions on your list';

  @override
  String get hotelMatchLuxuryLevel => 'Desired luxury level';

  @override
  String get hotelMatchTransport => 'Getting around';

  @override
  String get hotelTransportCar => 'Rental car';

  @override
  String get hotelTransportRideshare => 'Rideshare';

  @override
  String get hotelTransportShuttle => 'Resort shuttle';

  @override
  String get hotelTransportWalkable => 'Walkable neighborhood';

  @override
  String get hotelMatchResultsTitle => 'Your top 3 matches';

  @override
  String hotelMatchWhyTitle(int score) {
    return 'Match score $score';
  }

  @override
  String get hotelMatchBestForLabel => 'Best for:';

  @override
  String get hotelMatchItineraryLabel => 'Itinerary:';

  @override
  String get hotelMatchTradeoffsLabel => 'Tradeoffs:';

  @override
  String get hotelMatchNearbyLabel => 'Nearby:';

  @override
  String get hotelLuxoraScore => 'Luxora';

  @override
  String get hotelHomeBaseBadge => 'HOME BASE';

  @override
  String get hotelScoreLuxury => 'Luxury';

  @override
  String get hotelScoreFamily => 'Family';

  @override
  String get hotelScoreRomance => 'Romance';

  @override
  String get hotelScoreWalkability => 'Walk';

  @override
  String get hotelWhyRecommendTitle => 'Why Luxora Recommends This';

  @override
  String get hotelItineraryImpactTitle => 'How this shapes your days';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return 'Rough drive from hub: $driveTime. Travel friction score: $friction/90 (lower is calmer).';
  }

  @override
  String get hotelAddHomeBase => 'Add as Home Base';

  @override
  String get hotelHomeBaseActive => 'Home Base Active';

  @override
  String get hotelViewOnMap => 'View on Map';

  @override
  String get hotelGetDirections => 'Get Directions';

  @override
  String get hotelCheckRates => 'Check Rates';

  @override
  String get hotelVisitWebsite => 'Visit Website';

  @override
  String get hotelLinkUnavailable =>
      'Booking link not available for this stay yet.';

  @override
  String get hotelLinkOpenFailed =>
      'Couldn\'t open link — check your browser or try again.';

  @override
  String get hotelSave => 'Save Hotel';

  @override
  String get hotelSaved => 'Saved';

  @override
  String get hotelDistanceTitle => 'Distance to key spots';

  @override
  String get hotelCompareTitle => 'Compare Stays';

  @override
  String get hotelCompareSubtitle =>
      'Side-by-side concierge view — up to three hotels.';

  @override
  String hotelCompareSelected(int count) {
    return '$count selected';
  }

  @override
  String get hotelComparePrice => 'Price range';

  @override
  String get hotelCompareDriveImpact => 'Drive impact';

  @override
  String get hotelCompareNearby => 'Nearby highlights';

  @override
  String get hotelPriceBudget => 'Budget';

  @override
  String get hotelPriceModerate => 'Moderate';

  @override
  String get hotelPriceUpscale => 'Upscale';

  @override
  String get hotelPriceLuxury => 'Luxury';

  @override
  String get hotelTagCouples => 'Best for couples';

  @override
  String get hotelTagDisney => 'Best for Disney';

  @override
  String get hotelTagUniversal => 'Best for Universal';

  @override
  String get hotelTagLuxuryStaycation => 'Luxury staycation';

  @override
  String get hotelTagFamily => 'Family friendly';

  @override
  String get hotelTagQuiet => 'Quiet escape';

  @override
  String get hotelTagWalkableDining => 'Walkable dining';

  @override
  String get hotelTagResort => 'Resort feel';

  @override
  String get hotelTagBudget => 'Budget friendly';

  @override
  String get hotelReasonMatchesMood => 'Matches your trip mood and pace.';

  @override
  String get hotelReasonCloseStops =>
      'Close to planned stops on your timeline.';

  @override
  String hotelReasonSavesDrive(String time) {
    return 'Saves drive time vs. a generic hub — about $time from center.';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return 'Fits a $range comfort zone without overspending on the wrong resort.';
  }

  @override
  String get hotelReasonBetterGroup =>
      'Better suited to your group type and energy level.';

  @override
  String get hotelReasonNearbyDining =>
      'Strong nearby dining for effortless evenings.';

  @override
  String get hotelReasonLowStress =>
      'Resort-style calm — less logistics, more vacation.';

  @override
  String get hotelMatchAttractionsGeneral => 'your planned attractions';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return 'Based on your $attractions itinerary, $hotel reduces drive time and keeps evenings easy.';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$hotel in $neighborhood fits how you want this trip to feel.';
  }

  @override
  String get hotelMatchBestForFamily =>
      'Families who want pool days without sacrificing park access.';

  @override
  String get hotelMatchBestForCouple =>
      'Couples who want romance without theme-park chaos.';

  @override
  String get hotelMatchBestForGroup =>
      'Groups balancing comfort, access, and calm logistics.';

  @override
  String hotelMatchImpactDisney(String time) {
    return 'Shorter Disney runs — about $time to the parks from your door.';
  }

  @override
  String get hotelMatchImpactUniversal =>
      'Universal Express perks or water-taxi access can reclaim hours from your day.';

  @override
  String get hotelMatchImpactWalkable =>
      'Walk to dinner — less parking stress after long park days.';

  @override
  String hotelMatchImpactDefault(String time) {
    return 'Keeps average drives around $time so your day flow stays relaxed.';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      'Premium resort pricing — budget more for the room, less elsewhere.';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      'You\'ll rely on a car or rideshare — not a walk-everywhere base.';

  @override
  String get hotelMatchTradeoffLessFamily =>
      'Less focused on kid-centric amenities than dedicated family resorts.';

  @override
  String get hotelMatchTradeoffLessRomantic =>
      'More theme-park energy than a quiet couples retreat.';

  @override
  String get hotelMatchTradeoffDefault =>
      'Every stay has tradeoffs — Luxora picked this for your priorities first.';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return 'Dining and experiences around $neighborhood.';
  }

  @override
  String get mapHotelIntelBannerTitle => 'Choose the right home base';

  @override
  String get mapHotelIntelBannerBody =>
      'Your hotel shapes drive times, day flow, and where you eat. Luxora helps you pick — without booking pressure.';

  @override
  String get mapHotelIntelBannerCta => 'Explore Hotel Intelligence';

  @override
  String get sponsorLuxoraRecommended => 'Luxora Recommended';

  @override
  String get sponsorBadgeFeaturedPartner => 'Featured Partner';

  @override
  String get sponsorBadgeSponsored => 'Sponsored';

  @override
  String get sponsorBadgePromoted => 'Promoted';

  @override
  String get sponsorBadgePartnerOffer => 'Partner Offer';

  @override
  String get sponsorCtaVisitWebsite => 'Visit Website';

  @override
  String get sponsorCtaBookNow => 'Book Now';

  @override
  String get sponsorCtaCheckRates => 'Check Rates';

  @override
  String get sponsorCtaGetTickets => 'Get Tickets';

  @override
  String get sponsorCtaViewOffer => 'View Offer';

  @override
  String get featuredStaysTitle => 'Featured Stays';

  @override
  String get featuredStaysSubtitle =>
      'Partner placements — separate from Luxora\'s organic hotel match scores.';

  @override
  String get featuredExperiencesTitle => 'Featured Experiences';

  @override
  String get featuredExperiencesSubtitle =>
      'Promoted picks for your mood — always labeled, never disguised as AI rank.';

  @override
  String get featuredDiningTitle => 'Featured Dining';

  @override
  String get featuredDiningSubtitle =>
      'Partner restaurants Luxora highlights — your organic gem list stays independent.';

  @override
  String get featuredTicketPartnersTitle => 'Featured Ticket Partners';

  @override
  String get featuredTicketPartnersSubtitle =>
      'Authorized partner offers — compare with organic savings below.';

  @override
  String get featuredCityHomeTitle => 'Featured Partners';

  @override
  String get featuredCityHomeSubtitle =>
      'Helpful partner options for Orlando — clearly marked, never hidden as AI picks.';

  @override
  String get dayFlowVibeFoodie => 'Foodie-forward';

  @override
  String get dayFlowVibeNightlife => 'Nightlife';

  @override
  String get dayFlowVibePoolside => 'Poolside';

  @override
  String get dayFlowVibeAdventure => 'Adventurous';

  @override
  String get dayFlowVibeCulture => 'Culture';

  @override
  String get onboardStep5Title => 'The heart of Luxora';

  @override
  String get onboardStep5Subtitle => 'What do you want this trip to FEEL like?';

  @override
  String get onboardTripFeelHint =>
      'Sunset dinners, slow mornings, laughter with my partner…';

  @override
  String get onboardStepNameEyebrow => 'Your story starts with a name';

  @override
  String get onboardStepNameTitle => 'What should we call this trip?';

  @override
  String get onboardStepNameSubtitle =>
      'Luxora can craft a title from your vibe — or type your own.';

  @override
  String get onboardTripNameLuxora => 'Let Luxora name it';

  @override
  String get onboardTripNameYours => 'I\'ll name it';

  @override
  String get onboardTripNameHint => 'Our spring anniversary escape…';

  @override
  String onboardTripNameSuggested(String name) {
    return 'Luxora suggests: $name';
  }

  @override
  String get conciergeTripNameLabel => 'Trip name';

  @override
  String get moodRomantic => 'Romantic';

  @override
  String get moodRelaxing => 'Relaxing';

  @override
  String get moodAdventurous => 'Adventurous';

  @override
  String get moodLuxurious => 'Luxurious';

  @override
  String get moodFamily => 'Family bonding';

  @override
  String get moodSocial => 'Social';

  @override
  String get moodNature => 'Nature-focused';

  @override
  String get moodWellness => 'Wellness retreat';

  @override
  String get moodFoodie => 'Foodie experience';

  @override
  String get catHiddenGems => 'Hidden gems';

  @override
  String get catLuxuryStay => 'Luxury staycations';

  @override
  String get catBeaches => 'Beaches';

  @override
  String get catRooftop => 'Rooftop dining';

  @override
  String get catSpas => 'Spas';

  @override
  String get catNightlife => 'Nightlife';

  @override
  String get catFamily => 'Family';

  @override
  String get catEco => 'Eco tourism';

  @override
  String get catThemeParks => 'Theme parks';

  @override
  String get catRomantic => 'Romantic getaways';

  @override
  String get catFood => 'Food experiences';

  @override
  String get catSprings => 'Springs';

  @override
  String get catIslands => 'Island hopping';

  @override
  String get catInfluencer => 'Influencer-worthy';

  @override
  String get placeCatBeach => 'Beach';

  @override
  String get placeCatDining => 'Dining';

  @override
  String get placeCatNature => 'Nature';

  @override
  String get placeCatNightlife => 'Nightlife';

  @override
  String get placeCatWellness => 'Wellness';

  @override
  String get placeCatFamily => 'Family';

  @override
  String get placeCatSprings => 'Springs';

  @override
  String get placeCatRomantic => 'Romantic';

  @override
  String get placeCatAdventure => 'Adventure';

  @override
  String get placeCatHotel => 'Hotel';

  @override
  String get styleLessCrowded => 'Less crowded';

  @override
  String get styleLuxurySubtle => 'Luxury but not flashy';

  @override
  String get styleHiddenLuxury => 'Hidden luxury';

  @override
  String get styleWalkable => 'Walkable when possible';

  @override
  String get styleSlowMornings => 'Slow mornings';

  @override
  String get styleNoTraps => 'No tourist traps';

  @override
  String get styleNatureHeavy => 'Nature heavy';

  @override
  String get styleNatureWellness => 'Nature + wellness only';

  @override
  String get styleAestheticDining => 'Aesthetic dining';

  @override
  String get styleFamilyEasy => 'Family-easy logistics';

  @override
  String get paywallHeroEyebrow => 'YOUR PERSONAL CONCIERGE';

  @override
  String get paywallHeroHeadline => 'DON\'T WASTE YOUR VACATION';

  @override
  String get paywallHeroSubheadline =>
      'Your AI concierge plans every day, finds the gems, and keeps you out of tourist traps — so you actually enjoy the trip.';

  @override
  String get paywallEmotionalLine =>
      'You\'re already spending thousands on flights, hotels, and tickets. Don\'t waste the trip on bad restaurants, crowded traps, and last-minute guesswork.';

  @override
  String paywallHeadlineCouples(String cityName) {
    return 'Your perfect $cityName getaway starts here.';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return 'Spend less time planning and more time making memories in $cityName.';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return 'Experience $cityName differently.';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return 'Discover the $cityName most tourists never see.';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return 'Taste $cityName like a local insider.';
  }

  @override
  String get paywallWhatYouUnlock => 'What You Unlock';

  @override
  String get paywallFeatureAiConcierge => 'AI Concierge';

  @override
  String get paywallFeatureItineraries => 'Personalized Itineraries';

  @override
  String get paywallFeatureHiddenGems => 'Hidden Gems';

  @override
  String get paywallFeatureHotelIntel => 'Hotel Intelligence';

  @override
  String get paywallFeatureTicketSavings => 'Smart Ticket Savings';

  @override
  String get paywallFeatureWeatherConcierge => 'Weather Concierge';

  @override
  String get paywallFeatureCrowdIntel => 'Crowd Intelligence';

  @override
  String get paywallFeatureGpsNav => 'GPS Navigation';

  @override
  String get paywallFeatureLocalSecrets => 'Local Secrets';

  @override
  String get paywallFeatureDining => 'Dining Recommendations';

  @override
  String get paywallFeatureUnlimitedPlanning => 'Unlimited City Planning';

  @override
  String get paywallWhyTravelersUnlock => 'Why Travelers Unlock Luxora';

  @override
  String get paywallBenefitSaveTimeTitle => 'Save Hours of Planning';

  @override
  String get paywallBenefitSaveTimeBody =>
      'Skip the spreadsheets and endless tabs. Luxora builds day-by-day routes tailored to your style in minutes.';

  @override
  String get paywallBenefitSaveMoneyTitle => 'Save Real Money';

  @override
  String get paywallBenefitSaveMoneyBody =>
      'Ticket deals, smarter dining picks, and crowd-aware timing — small choices that add up on a Florida vacation.';

  @override
  String get paywallBenefitAvoidTrapsTitle => 'Skip Tourist Traps';

  @override
  String get paywallBenefitAvoidTrapsBody =>
      'Get the spots locals love — not the overpriced stops every guidebook pushes to first-time visitors.';

  @override
  String get paywallBenefitTravelSmarterTitle => 'Travel With Confidence';

  @override
  String get paywallBenefitTravelSmarterBody =>
      'Weather shifts, crowd spikes, and \"what should we do now?\" — your concierge adapts before and during the trip.';

  @override
  String paywallValueStory(String cityName, String price) {
    return 'Every Florida city pack — including Disney & Universal — unlocks for $price. You\'re getting the full concierge for $cityName: itineraries, hidden gems, hotel intel, and unlimited AI guidance.';
  }

  @override
  String get paywallRoiHook =>
      'One bad meal, overpriced ticket booth, or wasted afternoon costs more than this one-time unlock.';

  @override
  String get paywallPeaceOfMindTitle => 'Peace of mind, built in';

  @override
  String get paywallPeaceOfMindBody =>
      'You\'re not buying another subscription. You\'re buying a smarter vacation — planned before you land and supported while you\'re there.';

  @override
  String get paywallLockedPreviewTitle => 'Waiting Inside Your Concierge';

  @override
  String get paywallLockedPreviewSubtitle =>
      'Unlock to reveal routes and secrets tailored to your trip.';

  @override
  String get paywallLockedDateNight => 'Romantic Date Night Routes';

  @override
  String get paywallLockedHiddenLuxury => 'Hidden Luxury Experiences';

  @override
  String get paywallLockedVipSecrets => 'VIP Local Secrets';

  @override
  String get paywallLockedConciergeRecs => 'Concierge Recommendations';

  @override
  String get paywallLockedFamilyPlans => 'Family Stress-Free Plans';

  @override
  String get paywallLockedWeatherReroute => 'Weather-Aware Rerouting';

  @override
  String get paywallLockedHotelMatchmaker => 'Smart Hotel Matchmaker';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return 'Unlock $cityName Concierge';
  }

  @override
  String get paywallOneTimePurchase => 'One-Time Purchase';

  @override
  String get paywallNoSubscription => 'No Subscription';

  @override
  String get paywallNoMonthlyFees => 'No Monthly Fees';

  @override
  String paywallLifetimeAccess(String cityName) {
    return 'Lifetime $cityName access — yours forever, no monthly bill';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return 'Future $cityName Updates Included';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return 'Most $cityName vacations cost $minUsd–$maxUsd+';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price One Time';
  }

  @override
  String get paywallLessThanDinner =>
      'Less than one forgettable tourist-trap dinner — for planning that pays off all week.';

  @override
  String get paywallSocialProofTitle => 'Travelers Who Unlocked Luxora';

  @override
  String get paywallSocialProofHeading => 'Worth it before they even landed';

  @override
  String get paywallReview1 => '\"Saved us hours of planning.\"';

  @override
  String get paywallReview2 =>
      '\"Found places we never would have discovered.\"';

  @override
  String get paywallReview3 => '\"Worth it for the hidden gems alone.\"';

  @override
  String paywallCtaUnlock(String cityName) {
    return 'Unlock $cityName Concierge';
  }

  @override
  String get paywallContinueExploring => 'Continue Exploring';

  @override
  String get paywallConciergePromise =>
      'One payment · Lifetime city access · No subscription · Future updates included';

  @override
  String get paywallRestorePurchases => 'Restore purchases';

  @override
  String get paywallRestorePreviewDisabled =>
      'Restore is disabled in preview mode — use a full build to test restore.';

  @override
  String get paywallPurchaseSuccess =>
      'Purchase complete — your concierge is unlocked.';

  @override
  String get paywallPurchasePending => 'Completing purchase…';

  @override
  String get paywallPurchaseFailed =>
      'Purchase couldn\'t be completed. Try again or restore purchases.';

  @override
  String get paywallPurchaseCanceled => 'Purchase canceled.';

  @override
  String get paywallRestoreComplete => 'Purchases restored.';

  @override
  String get paywallRestoreNone =>
      'No previous purchases found for this Apple ID or Google account.';

  @override
  String get paywallStoreUnavailable =>
      'App Store billing isn\'t available on this device.';

  @override
  String get paywallProductUnavailable =>
      'This pack isn\'t available in the store yet.';

  @override
  String get settingsUnlockConciergeTitle => 'Unlock city concierge';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'One-time city pack — not a subscription';

  @override
  String get settingsOpenConciergeSubtitle => 'Open your AI concierge tab';

  @override
  String get weatherMiamiHumidityIndoor =>
      'High humidity today. Hit the beach or pool earlier, then Wynwood or Brickell for indoor dining and galleries during the hottest hours.';

  @override
  String get weatherMiamiHeatAdvisory =>
      'Heat advisory conditions — light fabrics, hydration, and shade breaks between outdoor stops.';

  @override
  String get weatherMiamiBeachMorning =>
      'Strong UV on the sand — sunscreen, hat, and beach time before midday.';

  @override
  String get weatherMiamiBoatWind =>
      'Wind is elevated — reconsider boat or yacht activities; rooftop dining may still work.';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return 'Rain window ahead — swap outdoor plans for $indoorSpot or gallery time.';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      'Sunset looks strong — waterfront or rooftop with an east-to-west view.';

  @override
  String get miamiBeachIntelTitle => 'Beach Intelligence';

  @override
  String miamiBeachBestTime(String time) {
    return 'Best time: $time';
  }

  @override
  String get miamiBeachFamilyScore => 'Family';

  @override
  String get miamiBeachCrowdScore => 'Crowd';

  @override
  String get miamiBeachPhotoScore => 'Photo';

  @override
  String get miamiBeachRomanceScore => 'Romance';

  @override
  String get miamiBeachSunsetScore => 'Sunset';

  @override
  String miamiBeachParking(String level) {
    return 'Parking: $level';
  }

  @override
  String get miamiNightlifeTitle => 'Nightlife Concierge';

  @override
  String miamiNightlifeDressCode(String code) {
    return 'Dress code: $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return 'Best arrival: $time';
  }

  @override
  String get miamiNightlifeReservation => 'Reservation recommended';

  @override
  String get miamiMoodRoutesTitle => 'Miami Mood Routes';

  @override
  String get tampaBayMoodRoutesTitle => 'Tampa Bay Mood Routes';

  @override
  String get stAugustineMoodRoutesTitle => 'St. Augustine Mood Routes';

  @override
  String get naplesMoodRoutesTitle => 'Naples Mood Routes';

  @override
  String get destin30aMoodRoutesTitle => 'Destin & 30A Mood Routes';

  @override
  String get vegasMoodRoutesTitle => 'Las Vegas Mood Routes';

  @override
  String miamiMoodRouteStart(String time) {
    return 'Start around $time';
  }

  @override
  String get keysWaterIntelTitle => 'Keys Water Intelligence';

  @override
  String keysWaterBestTime(String time) {
    return 'Best window: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Water: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Snorkel';

  @override
  String get keysWaterDivingScore => 'Dive';

  @override
  String get keysWaterBoatingScore => 'Boat';

  @override
  String get keysWaterFishingScore => 'Fish';

  @override
  String get keysWaterWindScore => 'Wind';

  @override
  String get keysWaterSunsetScore => 'Sunset';

  @override
  String get keysWaterCrowdScore => 'Crowd';

  @override
  String get keysMoodRoutesTitle => 'Keys Island Routes';

  @override
  String keysMoodRouteStart(String time) {
    return 'Start $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'EXPERIENCE MIAMI DIFFERENTLY';

  @override
  String get paywallHeadlineMiamiWeekend => 'DON\'T WASTE YOUR MIAMI WEEKEND';

  @override
  String get paywallOrlandoAddonsHeading => 'Theme park pack';

  @override
  String get paywallOrlandoBaseIncludes =>
      'Orlando unlock includes dining, hidden gems, hotels, and non-park experiences. Add the theme park pack for Disney and Universal together.';

  @override
  String get paywallAddonThemeParksTitle => 'Disney & Universal Pack';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World and Universal Orlando — all parks, deals, routes, and crowd intel in one unlock.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return 'Unlock $packName · $price';
  }

  @override
  String get paywallAddonUnlocked => 'Unlocked';

  @override
  String get paywallAddonRequiresOrlando => 'Requires Orlando unlock first';

  @override
  String paywallUnlockAddonPack(String packName) {
    return 'Unlock $packName';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return 'Unlock $packName';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      'Unlock Disney & Universal for Orlando?';

  @override
  String get orlandoThemeParksPromptBody =>
      'Add the theme park pack for Walt Disney World and Universal Orlando — all parks, ticket deals, routes, and crowd intel in one unlock.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Unlock · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Not now';

  @override
  String get onboardV2Eyebrow => 'Let\'s design your perfect trip';

  @override
  String get onboardV2StepTravelerEyebrow => 'Step 1';

  @override
  String get onboardV2StepTravelerTitle => 'Who are you traveling with?';

  @override
  String get onboardV2StepTravelerSubtitle =>
      'Luxora tailors stays, dining, and pacing to your crew.';

  @override
  String get onboardV2ChildrenLabel => 'Children traveling?';

  @override
  String get onboardV2StepStyleEyebrow => 'Step 2';

  @override
  String get onboardV2StepStyleTitle =>
      'What kind of trip are you looking for?';

  @override
  String get onboardV2StepStyleSubtitle =>
      'Choose everything that excites you.';

  @override
  String get onboardV2StepHotelEyebrow => 'Step 3';

  @override
  String get onboardV2StepHotelTitle =>
      'What type of place would you like to stay?';

  @override
  String get onboardV2StepHotelSubtitle =>
      'We will match boutique gems and resort icons.';

  @override
  String get onboardV2HotelBudgetLabel => 'Hotel budget';

  @override
  String get onboardV2HotelAmenitiesLabel => 'Must-have amenities';

  @override
  String get onboardV2StepFoodEyebrow => 'Step 4';

  @override
  String get onboardV2StepFoodTitle =>
      'What types of restaurants do you enjoy?';

  @override
  String get onboardV2StepFoodSubtitle =>
      'Cuisine and dining style — pick all you love.';

  @override
  String get onboardV2CuisineLabel => 'Cuisine types';

  @override
  String get onboardV2DiningStyleLabel => 'Dining style';

  @override
  String get onboardV2StepPaceEyebrow => 'Step 5';

  @override
  String get onboardV2StepPaceTitle => 'How would you like your days planned?';

  @override
  String get onboardV2StepPaceSubtitle =>
      'Relaxed mornings or packed adventure — you choose.';

  @override
  String get onboardV2PaceRelaxedTitle => 'Relaxed';

  @override
  String get onboardV2PaceRelaxedBody => '2–3 activities per day';

  @override
  String get onboardV2PaceBalancedTitle => 'Balanced';

  @override
  String get onboardV2PaceBalancedBody => '4–5 activities per day';

  @override
  String get onboardV2PacePackedTitle => 'Packed';

  @override
  String get onboardV2PacePackedBody => 'Maximize every day';

  @override
  String get onboardV2StepGoalsEyebrow => 'Step 6';

  @override
  String get onboardV2StepGoalsTitle => 'What matters most on this trip?';

  @override
  String get onboardV2StepGoalsSubtitle => 'Choose up to five priorities.';

  @override
  String get onboardV2StepExperienceEyebrow => 'Step 7';

  @override
  String get onboardV2StepExperienceTitle =>
      'What experiences would you enjoy?';

  @override
  String get onboardV2StepExperienceSubtitle =>
      'We will weave these into your itinerary.';

  @override
  String get onboardV2StepAvoidEyebrow => 'Step 8';

  @override
  String get onboardV2StepAvoidTitle => 'What would you prefer to avoid?';

  @override
  String get onboardV2StepAvoidSubtitle =>
      'Luxora steers clear of what drains your trip.';

  @override
  String get onboardV2StepEmotionEyebrow => 'Step 9';

  @override
  String get onboardV2StepEmotionTitle =>
      'What would make this trip feel successful?';

  @override
  String get onboardV2StepEmotionSubtitle => 'Choose one primary feeling.';

  @override
  String get onboardV2StepSummaryEyebrow => 'LUXORA';

  @override
  String onboardV2StepSummaryTitle(String name) {
    return 'Perfect, $name.';
  }

  @override
  String get onboardV2StepSummarySubtitle =>
      'I\'ve learned a little about the kind of traveler you are.\n\nNow I\'ll use your preferences to recommend places, experiences, restaurants, and hidden gems that fit your style.\n\nEvery recommendation I make will be tailored specifically to you.\n\nLet\'s see what we can discover.';

  @override
  String get onboardSummaryHotels => 'Hotels';

  @override
  String get onboardSummaryRestaurants => 'Restaurants';

  @override
  String get onboardSummaryHiddenGems => 'Hidden gems';

  @override
  String get onboardSummaryExperiences => 'Experiences';

  @override
  String get onboardSummaryHotelDefault =>
      'Curated stays matched to your budget';

  @override
  String onboardSummaryHotelType(String type) {
    return '$type stay';
  }

  @override
  String get onboardSummaryRooftopDining => 'Rooftop dining experiences';

  @override
  String onboardSummaryCuisine(String cuisine) {
    return '$cuisine favorites';
  }

  @override
  String onboardSummaryPace(String pace) {
    return '$pace daily pace';
  }

  @override
  String get onboardSummaryRomantic => 'Romantic sunset experiences';

  @override
  String onboardSummaryEmotion(String emotion) {
    return '$emotion-focused journey';
  }

  @override
  String get onboardSummaryPremiumGems => 'Premium hidden gems';

  @override
  String get agendaSuggestionsForYou => 'Picked for you';

  @override
  String get agendaSuggestionsAlternates => 'Also great';

  @override
  String get agendaSuggestionsBrowseAll => 'Browse all';

  @override
  String get onboardPrefTravelerSolo => 'Solo';

  @override
  String get onboardPrefTravelerCouple => 'Couple';

  @override
  String get onboardPrefTravelerFamily => 'Family';

  @override
  String get onboardPrefTravelerFriends => 'Friends';

  @override
  String get onboardPrefTravelerBusiness => 'Business';

  @override
  String get onboardPrefChildrenNone => 'No children';

  @override
  String get onboardPrefChildrenToddlers => 'Toddlers';

  @override
  String get onboardPrefChildrenElementary => 'Elementary age';

  @override
  String get onboardPrefChildrenTeenagers => 'Teenagers';

  @override
  String get onboardPrefStyleLuxury => 'Luxury';

  @override
  String get onboardPrefStyleRelaxation => 'Relaxation';

  @override
  String get onboardPrefStyleAdventure => 'Adventure';

  @override
  String get onboardPrefStyleThemeParks => 'Theme Parks';

  @override
  String get onboardPrefStyleFoodie => 'Foodie';

  @override
  String get onboardPrefStyleNightlife => 'Nightlife';

  @override
  String get onboardPrefStyleRomance => 'Romance';

  @override
  String get onboardPrefStyleShopping => 'Shopping';

  @override
  String get onboardPrefStyleBeaches => 'Beaches';

  @override
  String get onboardPrefStyleWellness => 'Wellness';

  @override
  String get onboardPrefStyleNature => 'Nature';

  @override
  String get onboardPrefStylePhotography => 'Photography';

  @override
  String get onboardPrefStyleHiddenGems => 'Hidden Gems';

  @override
  String get onboardPrefStyleFamilyActivities => 'Family Activities';

  @override
  String get onboardPrefStyleLocalExperiences => 'Local Experiences';

  @override
  String get onboardPrefStyleEntertainment => 'Entertainment';

  @override
  String get onboardPrefHotelLuxuryResort => 'Luxury Resort';

  @override
  String get onboardPrefHotelBoutique => 'Boutique Hotel';

  @override
  String get onboardPrefHotelFamilyResort => 'Family Resort';

  @override
  String get onboardPrefHotelBudgetFriendly => 'Budget Friendly';

  @override
  String get onboardPrefHotelAdultsOnly => 'Adults Only';

  @override
  String get onboardPrefHotelSpaResort => 'Spa Resort';

  @override
  String get onboardPrefHotelBeachfront => 'Beachfront';

  @override
  String get onboardPrefHotelDowntown => 'Downtown';

  @override
  String get onboardPrefHotelWalkable => 'Walkable Area';

  @override
  String get onboardPrefHotelThemeParkArea => 'Theme Park Area';

  @override
  String get onboardPrefHotelModern => 'Modern Hotel';

  @override
  String get onboardPrefHotelHistoric => 'Historic Hotel';

  @override
  String get onboardPrefBudgetOne => '\$';

  @override
  String get onboardPrefBudgetTwo => '\$\$';

  @override
  String get onboardPrefBudgetThree => '\$\$\$';

  @override
  String get onboardPrefBudgetFour => '\$\$\$\$';

  @override
  String get onboardPrefAmenityPool => 'Pool';

  @override
  String get onboardPrefAmenitySpa => 'Spa';

  @override
  String get onboardPrefAmenityGym => 'Gym';

  @override
  String get onboardPrefAmenityBreakfast => 'Free Breakfast';

  @override
  String get onboardPrefAmenityOceanView => 'Ocean View';

  @override
  String get onboardPrefAmenityBalcony => 'Balcony';

  @override
  String get onboardPrefAmenityKitchen => 'Kitchen';

  @override
  String get onboardPrefAmenityShuttle => 'Shuttle Service';

  @override
  String get onboardPrefAmenityPetFriendly => 'Pet Friendly';

  @override
  String get onboardPrefCuisineAmerican => 'American';

  @override
  String get onboardPrefCuisineItalian => 'Italian';

  @override
  String get onboardPrefCuisineMexican => 'Mexican';

  @override
  String get onboardPrefCuisineSeafood => 'Seafood';

  @override
  String get onboardPrefCuisineSteakhouse => 'Steakhouse';

  @override
  String get onboardPrefCuisineSushi => 'Sushi';

  @override
  String get onboardPrefCuisineCuban => 'Cuban';

  @override
  String get onboardPrefCuisineMediterranean => 'Mediterranean';

  @override
  String get onboardPrefCuisineAsian => 'Asian';

  @override
  String get onboardPrefCuisineBbq => 'BBQ';

  @override
  String get onboardPrefCuisineFineDining => 'Fine Dining';

  @override
  String get onboardPrefCuisineLocalFavorites => 'Local Favorites';

  @override
  String get onboardPrefCuisineFoodTrucks => 'Food Trucks';

  @override
  String get onboardPrefCuisineRooftop => 'Rooftop Dining';

  @override
  String get onboardPrefCuisineBrunch => 'Brunch';

  @override
  String get onboardPrefCuisineDessert => 'Dessert';

  @override
  String get onboardPrefDiningQuick => 'Quick Service';

  @override
  String get onboardPrefDiningCasual => 'Casual Dining';

  @override
  String get onboardPrefDiningFamily => 'Family Friendly';

  @override
  String get onboardPrefDiningDateNight => 'Date Night';

  @override
  String get onboardPrefDiningFine => 'Fine Dining';

  @override
  String get onboardPrefDiningWaterfront => 'Waterfront';

  @override
  String get onboardPrefDiningHiddenGems => 'Hidden Gems';

  @override
  String get onboardPrefDiningLocal => 'Local Favorites';

  @override
  String get onboardPrefGoalMakeMemories => 'Make Memories';

  @override
  String get onboardPrefGoalSaveMoney => 'Save Money';

  @override
  String get onboardPrefGoalAvoidCrowds => 'Avoid Crowds';

  @override
  String get onboardPrefGoalLuxury => 'Luxury Experiences';

  @override
  String get onboardPrefGoalBestFood => 'Best Food';

  @override
  String get onboardPrefGoalHiddenGems => 'Hidden Gems';

  @override
  String get onboardPrefGoalRelaxation => 'Relaxation';

  @override
  String get onboardPrefGoalAdventure => 'Adventure';

  @override
  String get onboardPrefGoalBestPhotos => 'Best Photos';

  @override
  String get onboardPrefGoalFamilyTime => 'Family Time';

  @override
  String get onboardPrefGoalRomance => 'Romance';

  @override
  String get onboardPrefGoalNightlife => 'Nightlife';

  @override
  String get onboardPrefGoalLocal => 'Local Experiences';

  @override
  String get onboardPrefGoalStressFree => 'Stress-Free Planning';

  @override
  String get onboardPrefExpBoatTours => 'Boat Tours';

  @override
  String get onboardPrefExpSunsetCruises => 'Sunset Cruises';

  @override
  String get onboardPrefExpAirboat => 'Airboat Tours';

  @override
  String get onboardPrefExpThemeParks => 'Theme Parks';

  @override
  String get onboardPrefExpMuseums => 'Museums';

  @override
  String get onboardPrefExpLiveShows => 'Live Shows';

  @override
  String get onboardPrefExpSpas => 'Spas';

  @override
  String get onboardPrefExpShopping => 'Shopping';

  @override
  String get onboardPrefExpWaterParks => 'Water Parks';

  @override
  String get onboardPrefExpGolf => 'Golf';

  @override
  String get onboardPrefExpFishing => 'Fishing';

  @override
  String get onboardPrefExpKayaking => 'Kayaking';

  @override
  String get onboardPrefExpSnorkeling => 'Snorkeling';

  @override
  String get onboardPrefExpRooftopBars => 'Rooftop Bars';

  @override
  String get onboardPrefExpNightclubs => 'Nightclubs';

  @override
  String get onboardPrefExpWildlife => 'Wildlife Experiences';

  @override
  String get onboardPrefExpFoodTours => 'Food Tours';

  @override
  String get onboardPrefExpScenicDrives => 'Scenic Drives';

  @override
  String get onboardPrefAvoidCrowds => 'Crowds';

  @override
  String get onboardPrefAvoidLongLines => 'Long Lines';

  @override
  String get onboardPrefAvoidExpensiveRestaurants => 'Expensive Restaurants';

  @override
  String get onboardPrefAvoidWalking => 'Walking Long Distances';

  @override
  String get onboardPrefAvoidNightlife => 'Nightlife';

  @override
  String get onboardPrefAvoidDriving => 'Driving';

  @override
  String get onboardPrefAvoidTouristTraps => 'Tourist Traps';

  @override
  String get onboardPrefAvoidEarlyMornings => 'Early Mornings';

  @override
  String get onboardPrefAvoidLateNights => 'Late Nights';

  @override
  String get onboardPrefAvoidFamilyAttractions => 'Family Attractions';

  @override
  String get onboardPrefAvoidThemeParks => 'Theme Parks';

  @override
  String get onboardPrefEmotionRelaxed => 'Relaxed';

  @override
  String get onboardPrefEmotionExcited => 'Excited';

  @override
  String get onboardPrefEmotionAdventurous => 'Adventurous';

  @override
  String get onboardPrefEmotionRomantic => 'Romantic';

  @override
  String get onboardPrefEmotionLuxurious => 'Luxurious';

  @override
  String get onboardPrefEmotionFamilyFocused => 'Family-Focused';

  @override
  String get onboardPrefEmotionMemorable => 'Memorable';

  @override
  String get onboardPrefEmotionStressFree => 'Stress-Free';

  @override
  String get onboardPrefEmotionInspiring => 'Inspiring';

  @override
  String get onboardPrefPaceSlow => 'Relaxed';

  @override
  String get onboardPrefPaceBalanced => 'Balanced';

  @override
  String get onboardPrefPacePacked => 'Packed';

  @override
  String get onboardSummaryHiddenGemsInsight =>
      'Hidden local restaurants & gems';

  @override
  String get onboardBuildFailedHint =>
      'We saved your preferences, but the itinerary needs another moment. Pull to refresh on Agenda or open Concierge.';

  @override
  String get onboardV2ChildrenSubtitle => 'Select all age groups that apply.';

  @override
  String get onboardTravelerNameEyebrow => 'First things first';

  @override
  String get onboardTravelerNameTitle => 'What should Luxora call you?';

  @override
  String get onboardTravelerNameSubtitle =>
      'Your first name is enough — Luxora will use it when you chat.';

  @override
  String get onboardTravelerNameLabel => 'Your first name';

  @override
  String get onboardTravelerNameHint => 'e.g. Maria';

  @override
  String conciergeWelcomeNamed(String name) {
    return 'Welcome, $name — your emotionally intelligent Florida companion.\n\nChoose a prompt below, or describe the feeling you want your trip to create.';
  }

  @override
  String conciergeWelcomeWarmNamed(String name) {
    return '$name, I\'m here to shape Florida around how you want to feel — not a checklist of sights. What are you craving today?';
  }

  @override
  String get onboardWelcomeEyebrow => 'LUXORA';

  @override
  String get onboardWelcomeTitle => 'Hi, I\'m Luxora.';

  @override
  String get onboardWelcomeTagline => 'Your personal travel concierge.';

  @override
  String get onboardWelcomeBody =>
      'I\'m here to help you discover incredible places, avoid the tourist traps, and create a vacation you\'ll remember for years.\n\nLet\'s start planning something unforgettable.';

  @override
  String get onboardWelcomeCta => 'Begin My Journey';

  @override
  String get onboardLuxoraGuideBody =>
      'From this moment on, I\'ll help guide your trip every step of the way.\n\nWhether you\'re looking for hidden gems, incredible food, unforgettable experiences, or simply a stress-free vacation, I\'ve got you covered.';

  @override
  String get onboardLuxoraReplyClosing =>
      'Let\'s create your perfect adventure together.';

  @override
  String onboardBuildingTitle(String name) {
    return 'Wonderful choice, $name.';
  }

  @override
  String get onboardBuildingBody =>
      'I\'m building a personalized itinerary based on your travel style, interests, preferred pace, dining preferences, and vacation goals.\n\nThis may take a moment.';

  @override
  String get onboardBuildingTagline =>
      'Good vacations happen by chance.\n\nGreat vacations happen with a plan.';

  @override
  String get onboardItineraryReadyTitle => 'Your adventure is ready.';

  @override
  String get onboardItineraryReadyBody =>
      'I\'ve carefully selected experiences, restaurants, attractions, and hidden gems that match the trip you described.\n\nOf course, we can adjust anything along the way.\n\nAfter all, the best vacations evolve as they unfold.';

  @override
  String weatherRerouteLuxoraIntro(String name) {
    return '$name, it looks like weather conditions may impact part of today\'s plans.';
  }

  @override
  String get weatherRerouteLuxoraClosing =>
      'Sometimes the unexpected creates the best memories.';

  @override
  String rightNowLuxoraIntro(String name) {
    return '$name, based on your location, the current weather, and your preferences, here\'s what I would do right now.';
  }

  @override
  String get rightNowLuxoraClosing =>
      'Trust me on this one.\n\nI think you\'re going to love it.';

  @override
  String paywallPersonalPitch(String name, String cityName) {
    return '$name, your personalized vacation plan is already taking shape.\n\nDay 1 is ready.\n\nThe rest of your journey is waiting.\n\nUnlock $cityName Concierge to access your complete itinerary, hidden gems, local secrets, weather intelligence, and unlimited concierge guidance.\n\nLet\'s make this vacation unforgettable.';
  }

  @override
  String get onboardLuxoraReplyEyebrow => 'LUXORA';

  @override
  String onboardLuxoraReplyTitle(String name) {
    return 'Lovely to meet you, $name.';
  }

  @override
  String onboardLuxoraGuideNamed(String name) {
    return 'From this moment on, I\'ll help guide your trip every step of the way.\n\nWhether you\'re looking for hidden gems, incredible food, unforgettable experiences, or simply a stress-free vacation, I\'ve got you covered.';
  }

  @override
  String get onboardLuxoraItineraryPromise =>
      'Let\'s create your perfect adventure together.';

  @override
  String get onboardReturningEyebrow => 'WELCOME BACK';

  @override
  String onboardReturningTitle(String name) {
    return 'Welcome back, $name.';
  }

  @override
  String get onboardReturningTitleGeneric => 'Welcome back.';

  @override
  String get onboardReturningSubtitle =>
      'Ready to continue your adventure?\n\nI\'ve saved your preferences, favorite places, and trip plans so we can pick up right where we left off.\n\nLet\'s see what\'s waiting for you today.';

  @override
  String get todayPlanSectionTitle => 'Today\'s plan';

  @override
  String get todayNextActivityLabel => 'Up next';

  @override
  String get todayStaysDiningSection => 'Stays & dining picks';

  @override
  String get todayStaysDiningCollapsedHint =>
      'Hotel and restaurant ideas — tap to expand';

  @override
  String get todayPlanDetailsTitle => 'Full schedule';

  @override
  String todayPlanStopCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stops today',
      one: '1 stop today',
    );
    return '$_temp0';
  }

  @override
  String todayDayHeading(int day) {
    return 'Day $day';
  }

  @override
  String get todayHappeningNowLabel => 'Happening now';

  @override
  String get todayPlanComplete => 'Today\'s plan is complete';

  @override
  String todayStartsIn(String duration) {
    return 'Starts in $duration';
  }

  @override
  String get todayRainRerouteTitle => 'Weather reroute';

  @override
  String get todayExtrasSection => 'Tickets & sharing';

  @override
  String get todayExtrasCollapsedHint => 'Deals, share card, and more';

  @override
  String freemiumVacationTitle(String cityName) {
    return 'Your $cityName vacation';
  }

  @override
  String get freemiumDay1Ready => '✓ Day 1 ready';

  @override
  String get freemiumUnlockFullPlan => 'Unlock your full vacation plan';

  @override
  String freemiumLockedDayConcierge(int day) {
    return 'Day $day · Concierge optimized';
  }

  @override
  String get freemiumLockedDayGems => 'Day 3 · Hidden gems route';

  @override
  String get freemiumLockedDayWeather => 'Day 4 · Weather-aware planning';

  @override
  String get freemiumLockedDayDeparture => 'Day 5 · Departure strategy';

  @override
  String freemiumConciergeRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count free questions remaining',
      one: '1 free question remaining',
    );
    return '$_temp0';
  }

  @override
  String get freemiumConciergeLimitReached =>
      'Free concierge limit reached — unlock for unlimited planning.';

  @override
  String freemiumLockedHotels(int count) {
    return '🔒 $count+ additional hotels available';
  }

  @override
  String freemiumLockedRestaurants(int count) {
    return '🔒 $count+ additional restaurants available';
  }

  @override
  String freemiumLockedGems(int count) {
    return '🔒 $count+ hidden gems available';
  }

  @override
  String freemiumLockedSecrets(int count) {
    return '🔒 $count+ local secrets available';
  }

  @override
  String freemiumLockedExperiences(int count) {
    return '🔒 $count+ experiences available';
  }

  @override
  String get freemiumLockedAttractions => '🔒 Additional attractions available';

  @override
  String freemiumUnlockExplore(String cityName) {
    return 'Unlock $cityName Concierge to continue exploring.';
  }

  @override
  String freemiumUnlockConcierge(String cityName) {
    return 'Unlock $cityName Concierge';
  }

  @override
  String freemiumHeadlineDayTwoPlus(String cityName) {
    return 'Your next days are ready — unlock the full $cityName plan.';
  }

  @override
  String get freemiumHeadlineConciergeLimit =>
      'Continue planning with unlimited concierge access.';

  @override
  String freemiumHeadlineHotels(String cityName) {
    return 'Unlock $cityName Concierge for every stay recommendation.';
  }

  @override
  String freemiumHeadlineRestaurants(String cityName) {
    return 'Unlock the complete restaurant collection for $cityName.';
  }

  @override
  String get freemiumHeadlineGems =>
      'Local favorites and insider gems are waiting.';

  @override
  String get freemiumHeadlineSecrets =>
      'Unlock resident-only timing and parking secrets.';

  @override
  String freemiumHeadlineExperiences(String cityName) {
    return 'Unlock curated experiences across $cityName.';
  }

  @override
  String get freemiumHeadlineAttractions =>
      'Unlock the complete attraction collection.';

  @override
  String get freemiumHeadlineHotelMatchmaker =>
      'Unlock Hotel Intelligence to compare every stay.';

  @override
  String get freemiumHeadlineFullItinerary => 'Unlock your full vacation plan.';

  @override
  String get freemiumLocalSecretsTitle => 'Local secrets';

  @override
  String get freemiumLocalSecretsSubtitle =>
      'Insider timing, parking, and viewing spots locals guard.';
}
