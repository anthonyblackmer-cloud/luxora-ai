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
  String get navTimeline => 'Timeline';

  @override
  String get navMap => 'Map';

  @override
  String get navGems => 'Gems';

  @override
  String get navFeed => 'Feed';

  @override
  String get navTrips => 'Trips';

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
  String get discoverSearchScopeAll => 'Searching all Florida in catalog';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'Within $radius of Orlando';
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
}
