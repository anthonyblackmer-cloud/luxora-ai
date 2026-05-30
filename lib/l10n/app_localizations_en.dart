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
      'Luxury cinematic or clean readability — pick what fits your day.';

  @override
  String get settingsThemeSectionLuxury => 'Luxury cinematic';

  @override
  String get settingsThemeSectionReadable => 'Clean & readable';

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
  String get navDiscover => 'Discover';

  @override
  String get navMap => 'Map';

  @override
  String get navTrips => 'Trips';

  @override
  String get navMore => 'More';

  @override
  String get navTimeline => 'Timeline';

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
  String get feedBadge => 'LIVE DISCOVERY';

  @override
  String get feedTitle => 'Experience Feed';

  @override
  String get feedSubtitle =>
      'What’s moving right now — trending spots, new openings, creator picks, seasonal routes, and live updates.';

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
  String get feedMoodAll => 'Everything';

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
  String get feedEmptyHint =>
      'No feed cards in this radius — try 50 mi or All Florida for Gulf coast and Keys highlights.';

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
  String get mapPlanDayTitle => 'Plan my day';

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
  String get mapRerouteButton => 'Reroute for calmer stops';

  @override
  String mapRerouteApplied(int count) {
    return 'Day adjusted — $count stops swapped for lighter crowds.';
  }

  @override
  String get mapRerouteNone => 'Your route already looks calm.';

  @override
  String get mapRerouteRainHint =>
      'Rain likely — tap reroute for indoor backups.';

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
      'Voice concierge is coming soon — for now, tap a moment or type how you want to feel.';

  @override
  String get mapAiPowers => 'AI map powers';

  @override
  String get mapNavLayerTitle => 'AI navigation layer (next)';

  @override
  String get mapNavLayerSubtitle =>
      'Beyond discovery — live intelligence on whether a stop is worth it right now.';

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
  String get mapFutureCrowdTitle => 'Live crowd heat';

  @override
  String get mapFutureCrowdDesc =>
      'Real-time density on springs, parks, and viral rooftops — worth it right now?';

  @override
  String get mapFutureParkingTitle => 'Parking difficulty';

  @override
  String get mapFutureParkingDesc =>
      'Friction score before you commit — valet, garage, or rideshare sweet spot.';

  @override
  String get mapFutureTrafficTitle => 'Drive friction score';

  @override
  String get mapFutureTrafficDesc =>
      'Stress-weighted routing — not just minutes, but how the drive will feel.';

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
      'Trip covers from mood catalog · Supabase sync Phase 2';

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
  String get tripsLiveWeather => 'Live weather';

  @override
  String get tripsNextUp => 'Next up';

  @override
  String get tripsSunsetWindow => 'Sunset window';

  @override
  String get tripsTimelineSnapshot => 'Timeline snapshot';

  @override
  String get tripsOpenTimeline => 'Open full timeline';

  @override
  String get tripsShare => 'Share';

  @override
  String get shareItineraryFooter =>
      'Planned with Luxora — your emotionally intelligent Florida companion.';

  @override
  String shareSubject(String title) {
    return 'My $title';
  }

  @override
  String get itineraryBadge => 'YOUR TIMELINE';

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
  String get landingBegin => 'Begin your journey';

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
  String get onboardFinish => 'Meet your concierge';

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
      'Each destination has its own concierge unlock — one-time purchase per city.';

  @override
  String get landingCityLabel => 'Where are you going?';

  @override
  String get paywallSwitchCity => 'Destination';

  @override
  String get cityPickerUnlocked => 'Unlocked';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Unlock $price';
  }

  @override
  String get onboardStep2Title => 'Time to feel free';

  @override
  String get onboardStep2Subtitle => 'When does your escape begin?';

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
      'Luxora plans the trip so you can enjoy it.';

  @override
  String get paywallEmotionalLine =>
      'You\'re already spending thousands on your vacation. Don\'t leave the experience to chance.';

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
  String get paywallBenefitSaveTimeTitle => 'Save Time';

  @override
  String get paywallBenefitSaveTimeBody =>
      'Skip hours of research and planning.';

  @override
  String get paywallBenefitSaveMoneyTitle => 'Save Money';

  @override
  String get paywallBenefitSaveMoneyBody =>
      'Discover ticket savings, local deals, and smarter choices.';

  @override
  String get paywallBenefitAvoidTrapsTitle => 'Avoid Tourist Traps';

  @override
  String get paywallBenefitAvoidTrapsBody =>
      'Find experiences locals actually recommend.';

  @override
  String get paywallBenefitTravelSmarterTitle => 'Travel Smarter';

  @override
  String get paywallBenefitTravelSmarterBody =>
      'Get recommendations based on weather, crowds, and your trip style.';

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
    return 'Lifetime $cityName Access';
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
      'Less than the cost of a vacation dinner.';

  @override
  String get paywallSocialProofTitle => 'Travelers Who Unlocked Luxora';

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
      'One-time purchase · Personal concierge · No subscription';

  @override
  String get settingsUnlockConciergeTitle => 'Unlock city concierge';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'One-time city pack — not a subscription';

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
  String miamiMoodRouteStart(String time) {
    return 'Start around $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'EXPERIENCE MIAMI DIFFERENTLY';

  @override
  String get paywallHeadlineMiamiWeekend => 'DON\'T WASTE YOUR MIAMI WEEKEND';
}
