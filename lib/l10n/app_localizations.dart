import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Luxora AI'**
  String get appTitle;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get dark_mode;

  /// No description provided for @light_mode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get light_mode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @settings_language_picker_note.
  ///
  /// In en, this message translates to:
  /// **'Changes apply immediately.'**
  String get settings_language_picker_note;

  /// No description provided for @settings_regions_coming_title.
  ///
  /// In en, this message translates to:
  /// **'Countries & cities'**
  String get settings_regions_coming_title;

  /// No description provided for @settings_regions_coming_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Home hub and city packs — coming soon.'**
  String get settings_regions_coming_subtitle;

  /// No description provided for @commonSoon.
  ///
  /// In en, this message translates to:
  /// **'Soon'**
  String get commonSoon;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @commonNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get commonNew;

  /// No description provided for @commonRoadmap.
  ///
  /// In en, this message translates to:
  /// **'Roadmap'**
  String get commonRoadmap;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @settingsStartOverSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start a fresh trip from scratch'**
  String get settingsStartOverSubtitle;

  /// No description provided for @navConcierge.
  ///
  /// In en, this message translates to:
  /// **'Concierge'**
  String get navConcierge;

  /// No description provided for @navTimeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get navTimeline;

  /// No description provided for @navMap.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get navMap;

  /// No description provided for @navGems.
  ///
  /// In en, this message translates to:
  /// **'Gems'**
  String get navGems;

  /// No description provided for @navFeed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get navFeed;

  /// No description provided for @navTrips.
  ///
  /// In en, this message translates to:
  /// **'Trips'**
  String get navTrips;

  /// No description provided for @conciergeBrand.
  ///
  /// In en, this message translates to:
  /// **'LUXORA'**
  String get conciergeBrand;

  /// No description provided for @conciergeTitle.
  ///
  /// In en, this message translates to:
  /// **'Concierge'**
  String get conciergeTitle;

  /// No description provided for @conciergeTripFeel.
  ///
  /// In en, this message translates to:
  /// **'Trip feel: “{feel}”'**
  String conciergeTripFeel(String feel);

  /// No description provided for @conciergeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Luxora — your emotionally intelligent Florida companion.\n\nChoose a prompt below, or describe the feeling you want your trip to create.'**
  String get conciergeWelcome;

  /// No description provided for @conciergeQuickPrompts.
  ///
  /// In en, this message translates to:
  /// **'Quick prompts'**
  String get conciergeQuickPrompts;

  /// No description provided for @conciergeRemembering.
  ///
  /// In en, this message translates to:
  /// **'Remembering for this trip'**
  String get conciergeRemembering;

  /// No description provided for @conciergeStyleMemory.
  ///
  /// In en, this message translates to:
  /// **'Style memory'**
  String get conciergeStyleMemory;

  /// No description provided for @conciergeInputHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the feeling you want your trip to create…'**
  String get conciergeInputHint;

  /// No description provided for @conciergePromptRomantic.
  ///
  /// In en, this message translates to:
  /// **'Romantic getaway'**
  String get conciergePromptRomantic;

  /// No description provided for @conciergePromptWellness.
  ///
  /// In en, this message translates to:
  /// **'Wellness reset'**
  String get conciergePromptWellness;

  /// No description provided for @conciergePromptFamily.
  ///
  /// In en, this message translates to:
  /// **'Family magic'**
  String get conciergePromptFamily;

  /// No description provided for @conciergePromptHiddenLuxury.
  ///
  /// In en, this message translates to:
  /// **'Hidden luxury'**
  String get conciergePromptHiddenLuxury;

  /// No description provided for @conciergePromptFoodie.
  ///
  /// In en, this message translates to:
  /// **'Foodie adventure'**
  String get conciergePromptFoodie;

  /// No description provided for @conciergePromptSoftLuxury.
  ///
  /// In en, this message translates to:
  /// **'Soft luxury escape'**
  String get conciergePromptSoftLuxury;

  /// No description provided for @conciergePromptAdventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure mode'**
  String get conciergePromptAdventure;

  /// No description provided for @conciergePromptDisney.
  ///
  /// In en, this message translates to:
  /// **'Disney after-dark'**
  String get conciergePromptDisney;

  /// No description provided for @discoverSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search destinations…'**
  String get discoverSearchHint;

  /// No description provided for @discoverSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Find a destination'**
  String get discoverSearchTitle;

  /// No description provided for @discoverFromOrlando.
  ///
  /// In en, this message translates to:
  /// **'From Orlando'**
  String get discoverFromOrlando;

  /// No description provided for @discoverSearchScopeAll.
  ///
  /// In en, this message translates to:
  /// **'Searching all Florida in catalog'**
  String get discoverSearchScopeAll;

  /// No description provided for @discoverSearchScopeRadius.
  ///
  /// In en, this message translates to:
  /// **'Within {radius} of Orlando'**
  String discoverSearchScopeRadius(String radius);

  /// No description provided for @discoverSearchEmpty.
  ///
  /// In en, this message translates to:
  /// **'No matches in this radius — try a shorter name, widen your distance chip on Map or Feed, or search “beach”, “Disney”, or “springs”.'**
  String get discoverSearchEmpty;

  /// No description provided for @discoverFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get discoverFilterAll;

  /// No description provided for @discoverFilterHotels.
  ///
  /// In en, this message translates to:
  /// **'Hotels'**
  String get discoverFilterHotels;

  /// No description provided for @discoverFilterRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get discoverFilterRestaurants;

  /// No description provided for @discoverFilterDestinations.
  ///
  /// In en, this message translates to:
  /// **'Destinations'**
  String get discoverFilterDestinations;

  /// No description provided for @discoverPopularInRadius.
  ///
  /// In en, this message translates to:
  /// **'Popular in your radius'**
  String get discoverPopularInRadius;

  /// No description provided for @discoverTrySearching.
  ///
  /// In en, this message translates to:
  /// **'Try searching'**
  String get discoverTrySearching;

  /// No description provided for @scopeDestinationsRadius.
  ///
  /// In en, this message translates to:
  /// **'{count} destinations · within {radius} of Orlando'**
  String scopeDestinationsRadius(int count, String radius);

  /// No description provided for @scopeDestinationsAll.
  ///
  /// In en, this message translates to:
  /// **'{count} destinations · all Florida'**
  String scopeDestinationsAll(int count);

  /// No description provided for @radius25.
  ///
  /// In en, this message translates to:
  /// **'25 mi'**
  String get radius25;

  /// No description provided for @radius50.
  ///
  /// In en, this message translates to:
  /// **'50 mi'**
  String get radius50;

  /// No description provided for @radius100.
  ///
  /// In en, this message translates to:
  /// **'100 mi'**
  String get radius100;

  /// No description provided for @radiusAllFlorida.
  ///
  /// In en, this message translates to:
  /// **'All Florida'**
  String get radiusAllFlorida;

  /// No description provided for @radiusDesc25.
  ///
  /// In en, this message translates to:
  /// **'Day trips around Orlando core'**
  String get radiusDesc25;

  /// No description provided for @radiusDesc50.
  ///
  /// In en, this message translates to:
  /// **'Springs, coast day trips, Space Coast'**
  String get radiusDesc50;

  /// No description provided for @radiusDesc100.
  ///
  /// In en, this message translates to:
  /// **'Tampa Bay, Daytona, deeper Gulf'**
  String get radiusDesc100;

  /// No description provided for @radiusDescAll.
  ///
  /// In en, this message translates to:
  /// **'Keys, Miami, statewide highlights'**
  String get radiusDescAll;

  /// No description provided for @feedBadge.
  ///
  /// In en, this message translates to:
  /// **'LIVE DISCOVERY'**
  String get feedBadge;

  /// No description provided for @feedTitle.
  ///
  /// In en, this message translates to:
  /// **'Experience Feed'**
  String get feedTitle;

  /// No description provided for @feedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What’s moving right now — trending spots, new openings, creator picks, seasonal routes, and live updates.'**
  String get feedSubtitle;

  /// No description provided for @feedPillTrending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get feedPillTrending;

  /// No description provided for @feedPillNewOpenings.
  ///
  /// In en, this message translates to:
  /// **'New openings'**
  String get feedPillNewOpenings;

  /// No description provided for @feedPillCreator.
  ///
  /// In en, this message translates to:
  /// **'Creator picks'**
  String get feedPillCreator;

  /// No description provided for @feedPillLive.
  ///
  /// In en, this message translates to:
  /// **'Live updates'**
  String get feedPillLive;

  /// No description provided for @feedEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'No feed cards in this radius — try 50 mi or All Florida for Gulf coast and Keys highlights.'**
  String get feedEmptyHint;

  /// No description provided for @gemsBadge.
  ///
  /// In en, this message translates to:
  /// **'INSIDER CURATION'**
  String get gemsBadge;

  /// No description provided for @gemsTitle.
  ///
  /// In en, this message translates to:
  /// **'Hidden Gems'**
  String get gemsTitle;

  /// No description provided for @gemsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Secret discoveries locals guard — why it’s special, when to go, how crowded it gets, and tips you won’t find on a postcard.'**
  String get gemsSubtitle;

  /// No description provided for @gemsPillHidden.
  ///
  /// In en, this message translates to:
  /// **'Hidden places'**
  String get gemsPillHidden;

  /// No description provided for @gemsPillLocal.
  ///
  /// In en, this message translates to:
  /// **'Local-only'**
  String get gemsPillLocal;

  /// No description provided for @gemsPillInsider.
  ///
  /// In en, this message translates to:
  /// **'Insider tips'**
  String get gemsPillInsider;

  /// No description provided for @gemsPillCrowd.
  ///
  /// In en, this message translates to:
  /// **'Crowd intel'**
  String get gemsPillCrowd;

  /// No description provided for @gemsEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'No gems in this radius yet — widen to 50 mi or beyond for springs and Space Coast secrets.'**
  String get gemsEmptyHint;

  /// No description provided for @gemsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search hidden gems & destinations…'**
  String get gemsSearchHint;

  /// No description provided for @gemLocalSecret.
  ///
  /// In en, this message translates to:
  /// **'LOCAL SECRET'**
  String get gemLocalSecret;

  /// No description provided for @gemWhySpecial.
  ///
  /// In en, this message translates to:
  /// **'Why it’s special'**
  String get gemWhySpecial;

  /// No description provided for @gemBestTime.
  ///
  /// In en, this message translates to:
  /// **'Best time to go'**
  String get gemBestTime;

  /// No description provided for @gemCrowdLevel.
  ///
  /// In en, this message translates to:
  /// **'Crowd level'**
  String get gemCrowdLevel;

  /// No description provided for @gemInsiderTip.
  ///
  /// In en, this message translates to:
  /// **'Insider tip'**
  String get gemInsiderTip;

  /// No description provided for @gemLocalNote.
  ///
  /// In en, this message translates to:
  /// **'Local-only note'**
  String get gemLocalNote;

  /// No description provided for @mapBadge.
  ///
  /// In en, this message translates to:
  /// **'AI MAP'**
  String get mapBadge;

  /// No description provided for @mapTitle.
  ///
  /// In en, this message translates to:
  /// **'Your intelligent route'**
  String get mapTitle;

  /// No description provided for @mapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pins for your curated day — gold diamonds are Gems, cyan markers are today’s timeline, gold line is the mood route.'**
  String get mapSubtitle;

  /// No description provided for @mapPlanDayTitle.
  ///
  /// In en, this message translates to:
  /// **'Plan my day'**
  String get mapPlanDayTitle;

  /// No description provided for @mapPlanDaySuggested.
  ///
  /// In en, this message translates to:
  /// **'Suggested from your trip mood — bookmark places to make it yours.'**
  String get mapPlanDaySuggested;

  /// No description provided for @mapPlanDayEmpty.
  ///
  /// In en, this message translates to:
  /// **'Bookmark destinations (♥) and Luxora builds an optimized route from your Orlando hub — least driving, most feeling.'**
  String get mapPlanDayEmpty;

  /// No description provided for @mapPlanDaySummary.
  ///
  /// In en, this message translates to:
  /// **'{count} stops · {miles} · {time} drive'**
  String mapPlanDaySummary(int count, String miles, String time);

  /// No description provided for @mapPlanDayHomeBase.
  ///
  /// In en, this message translates to:
  /// **'Starting from {hotel}'**
  String mapPlanDayHomeBase(String hotel);

  /// No description provided for @mapAiPowers.
  ///
  /// In en, this message translates to:
  /// **'AI map powers'**
  String get mapAiPowers;

  /// No description provided for @mapNavLayerTitle.
  ///
  /// In en, this message translates to:
  /// **'AI navigation layer (next)'**
  String get mapNavLayerTitle;

  /// No description provided for @mapNavLayerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Beyond discovery — live intelligence on whether a stop is worth it right now.'**
  String get mapNavLayerSubtitle;

  /// No description provided for @mapBookingTitle.
  ///
  /// In en, this message translates to:
  /// **'Seamless booking (partners)'**
  String get mapBookingTitle;

  /// No description provided for @mapCapMoodTitle.
  ///
  /// In en, this message translates to:
  /// **'Mood-based routes'**
  String get mapCapMoodTitle;

  /// No description provided for @mapCapMoodDesc.
  ///
  /// In en, this message translates to:
  /// **'Paths that match romantic, wellness, family, or adventure — not just shortest drive time.'**
  String get mapCapMoodDesc;

  /// No description provided for @mapCapDriveTitle.
  ///
  /// In en, this message translates to:
  /// **'Drive-time optimization'**
  String get mapCapDriveTitle;

  /// No description provided for @mapCapDriveDesc.
  ///
  /// In en, this message translates to:
  /// **'Smart sequencing so you spend time feeling, not sitting in traffic between highlights.'**
  String get mapCapDriveDesc;

  /// No description provided for @mapCapWeatherTitle.
  ///
  /// In en, this message translates to:
  /// **'Weather-aware suggestions'**
  String get mapCapWeatherTitle;

  /// No description provided for @mapCapWeatherDesc.
  ///
  /// In en, this message translates to:
  /// **'Rain backup routes and live windows for beaches, rooftops, and springs.'**
  String get mapCapWeatherDesc;

  /// No description provided for @mapCapSunsetTitle.
  ///
  /// In en, this message translates to:
  /// **'Best sunset right now'**
  String get mapCapSunsetTitle;

  /// No description provided for @mapCapSunsetDesc.
  ///
  /// In en, this message translates to:
  /// **'Where golden hour hits best in the next 90 minutes based on sky and crowd patterns.'**
  String get mapCapSunsetDesc;

  /// No description provided for @mapCapCrowdTitle.
  ///
  /// In en, this message translates to:
  /// **'Crowd prediction'**
  String get mapCapCrowdTitle;

  /// No description provided for @mapCapCrowdDesc.
  ///
  /// In en, this message translates to:
  /// **'When parks, springs, and viral spots quiet down — before you arrive.'**
  String get mapCapCrowdDesc;

  /// No description provided for @mapCapGemsTitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby hidden gems'**
  String get mapCapGemsTitle;

  /// No description provided for @mapCapGemsDesc.
  ///
  /// In en, this message translates to:
  /// **'Insider pins surfaced along your route — not just top-10 tourist stops.'**
  String get mapCapGemsDesc;

  /// No description provided for @mapCapPersonalTitle.
  ///
  /// In en, this message translates to:
  /// **'Route personalization'**
  String get mapCapPersonalTitle;

  /// No description provided for @mapCapPersonalDesc.
  ///
  /// In en, this message translates to:
  /// **'Your trip feel, pace, and budget reshape the map in real time.'**
  String get mapCapPersonalDesc;

  /// No description provided for @mapFutureCrowdTitle.
  ///
  /// In en, this message translates to:
  /// **'Live crowd heat'**
  String get mapFutureCrowdTitle;

  /// No description provided for @mapFutureCrowdDesc.
  ///
  /// In en, this message translates to:
  /// **'Real-time density on springs, parks, and viral rooftops — worth it right now?'**
  String get mapFutureCrowdDesc;

  /// No description provided for @mapFutureParkingTitle.
  ///
  /// In en, this message translates to:
  /// **'Parking difficulty'**
  String get mapFutureParkingTitle;

  /// No description provided for @mapFutureParkingDesc.
  ///
  /// In en, this message translates to:
  /// **'Friction score before you commit — valet, garage, or rideshare sweet spot.'**
  String get mapFutureParkingDesc;

  /// No description provided for @mapFutureTrafficTitle.
  ///
  /// In en, this message translates to:
  /// **'Drive friction score'**
  String get mapFutureTrafficTitle;

  /// No description provided for @mapFutureTrafficDesc.
  ///
  /// In en, this message translates to:
  /// **'Stress-weighted routing — not just minutes, but how the drive will feel.'**
  String get mapFutureTrafficDesc;

  /// No description provided for @mapFutureRerouteTitle.
  ///
  /// In en, this message translates to:
  /// **'Spontaneous reroute'**
  String get mapFutureRerouteTitle;

  /// No description provided for @mapFutureRerouteDesc.
  ///
  /// In en, this message translates to:
  /// **'Weather shift or crowd spike? One tap to reshape the rest of your day.'**
  String get mapFutureRerouteDesc;

  /// No description provided for @affiliateReserve.
  ///
  /// In en, this message translates to:
  /// **'Reserve · {category} · premium partner (soon)'**
  String affiliateReserve(String category);

  /// No description provided for @affiliateHotels.
  ///
  /// In en, this message translates to:
  /// **'Hotels & staycations'**
  String get affiliateHotels;

  /// No description provided for @affiliateExperiences.
  ///
  /// In en, this message translates to:
  /// **'Experiences & tours'**
  String get affiliateExperiences;

  /// No description provided for @affiliateRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurant reservations'**
  String get affiliateRestaurants;

  /// No description provided for @affiliateThemeParks.
  ///
  /// In en, this message translates to:
  /// **'Theme park tickets'**
  String get affiliateThemeParks;

  /// No description provided for @affiliateDayPasses.
  ///
  /// In en, this message translates to:
  /// **'ResortPass / day passes'**
  String get affiliateDayPasses;

  /// No description provided for @affiliateCarRentals.
  ///
  /// In en, this message translates to:
  /// **'Car rentals'**
  String get affiliateCarRentals;

  /// No description provided for @affiliateWellness.
  ///
  /// In en, this message translates to:
  /// **'Wellness bookings'**
  String get affiliateWellness;

  /// No description provided for @tripsBadge.
  ///
  /// In en, this message translates to:
  /// **'COLLECTIONS'**
  String get tripsBadge;

  /// No description provided for @tripsTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved trips'**
  String get tripsTitle;

  /// No description provided for @tripsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap a trip for a live snapshot — next moment, weather, sunset, and timeline.'**
  String get tripsSubtitle;

  /// No description provided for @tripsFooter.
  ///
  /// In en, this message translates to:
  /// **'Trip covers from mood catalog · Supabase sync Phase 2'**
  String get tripsFooter;

  /// No description provided for @tripsPlanNew.
  ///
  /// In en, this message translates to:
  /// **'Plan a new trip'**
  String get tripsPlanNew;

  /// No description provided for @tripsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No saved trips yet'**
  String get tripsEmptyTitle;

  /// No description provided for @tripsEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Plan your first trip and it will appear here, ready to revisit anytime.'**
  String get tripsEmptyBody;

  /// No description provided for @tripsDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete trip?'**
  String get tripsDeleteTitle;

  /// No description provided for @tripsDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'This removes “{title}” from your saved trips. This can’t be undone.'**
  String tripsDeleteBody(String title);

  /// No description provided for @tripsDeleted.
  ///
  /// In en, this message translates to:
  /// **'Trip deleted'**
  String get tripsDeleted;

  /// No description provided for @tripsLiveWeather.
  ///
  /// In en, this message translates to:
  /// **'Live weather'**
  String get tripsLiveWeather;

  /// No description provided for @tripsNextUp.
  ///
  /// In en, this message translates to:
  /// **'Next up'**
  String get tripsNextUp;

  /// No description provided for @tripsSunsetWindow.
  ///
  /// In en, this message translates to:
  /// **'Sunset window'**
  String get tripsSunsetWindow;

  /// No description provided for @tripsTimelineSnapshot.
  ///
  /// In en, this message translates to:
  /// **'Timeline snapshot'**
  String get tripsTimelineSnapshot;

  /// No description provided for @tripsOpenTimeline.
  ///
  /// In en, this message translates to:
  /// **'Open full timeline'**
  String get tripsOpenTimeline;

  /// No description provided for @itineraryBadge.
  ///
  /// In en, this message translates to:
  /// **'YOUR TIMELINE'**
  String get itineraryBadge;

  /// No description provided for @itineraryTagline.
  ///
  /// In en, this message translates to:
  /// **'Every moment connected — anticipation built in, stress left out.'**
  String get itineraryTagline;

  /// No description provided for @itineraryDayTab.
  ///
  /// In en, this message translates to:
  /// **'Day {day} · {label}'**
  String itineraryDayTab(int day, String label);

  /// No description provided for @detailWhySpecial.
  ///
  /// In en, this message translates to:
  /// **'Why It’s Special'**
  String get detailWhySpecial;

  /// No description provided for @detailBestTime.
  ///
  /// In en, this message translates to:
  /// **'Best Time to Go'**
  String get detailBestTime;

  /// No description provided for @detailInsiderTips.
  ///
  /// In en, this message translates to:
  /// **'Insider Tips'**
  String get detailInsiderTips;

  /// No description provided for @detailReserve.
  ///
  /// In en, this message translates to:
  /// **'Reserve Experience'**
  String get detailReserve;

  /// No description provided for @detailReserveSoon.
  ///
  /// In en, this message translates to:
  /// **'Reservation partners coming soon.'**
  String get detailReserveSoon;

  /// No description provided for @detailNearbyGems.
  ///
  /// In en, this message translates to:
  /// **'Nearby Gems'**
  String get detailNearbyGems;

  /// No description provided for @detailDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get detailDuration;

  /// No description provided for @detailPractical.
  ///
  /// In en, this message translates to:
  /// **'Practical Details'**
  String get detailPractical;

  /// No description provided for @detailCostRange.
  ///
  /// In en, this message translates to:
  /// **'Cost range'**
  String get detailCostRange;

  /// No description provided for @detailBestFor.
  ///
  /// In en, this message translates to:
  /// **'Best for'**
  String get detailBestFor;

  /// No description provided for @detailVibeMatch.
  ///
  /// In en, this message translates to:
  /// **'Vibe Match'**
  String get detailVibeMatch;

  /// No description provided for @detailCrowd.
  ///
  /// In en, this message translates to:
  /// **'Crowd'**
  String get detailCrowd;

  /// No description provided for @detailPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get detailPrice;

  /// No description provided for @detailLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get detailLocation;

  /// No description provided for @detailGetDirections.
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get detailGetDirections;

  /// No description provided for @detailParkMap.
  ///
  /// In en, this message translates to:
  /// **'Park map'**
  String get detailParkMap;

  /// No description provided for @detailViewOnMap.
  ///
  /// In en, this message translates to:
  /// **'View on map'**
  String get detailViewOnMap;

  /// No description provided for @detailMapsError.
  ///
  /// In en, this message translates to:
  /// **'Couldn’t open maps on this device.'**
  String get detailMapsError;

  /// No description provided for @detailGoogleMaps.
  ///
  /// In en, this message translates to:
  /// **'Google Maps'**
  String get detailGoogleMaps;

  /// No description provided for @detailAppleMaps.
  ///
  /// In en, this message translates to:
  /// **'Apple Maps'**
  String get detailAppleMaps;

  /// No description provided for @detailOpenInMaps.
  ///
  /// In en, this message translates to:
  /// **'Open in maps'**
  String get detailOpenInMaps;

  /// No description provided for @detailDriveFromOrlando.
  ///
  /// In en, this message translates to:
  /// **'{time} drive from Orlando'**
  String detailDriveFromOrlando(String time);

  /// No description provided for @detailSaveToItinerary.
  ///
  /// In en, this message translates to:
  /// **'Save to itinerary'**
  String get detailSaveToItinerary;

  /// No description provided for @detailSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get detailSaved;

  /// No description provided for @detailSavedSnack.
  ///
  /// In en, this message translates to:
  /// **'Saved to your itinerary'**
  String get detailSavedSnack;

  /// No description provided for @detailRemovedSnack.
  ///
  /// In en, this message translates to:
  /// **'Removed from your itinerary'**
  String get detailRemovedSnack;

  /// No description provided for @detailSetHomeBase.
  ///
  /// In en, this message translates to:
  /// **'Set as home base'**
  String get detailSetHomeBase;

  /// No description provided for @detailHomeBaseActive.
  ///
  /// In en, this message translates to:
  /// **'Your trip home base'**
  String get detailHomeBaseActive;

  /// No description provided for @detailHomeBaseHint.
  ///
  /// In en, this message translates to:
  /// **'Your day’s route starts and ends here.'**
  String get detailHomeBaseHint;

  /// No description provided for @detailHomeBaseSetSnack.
  ///
  /// In en, this message translates to:
  /// **'Set as your trip home base'**
  String get detailHomeBaseSetSnack;

  /// No description provided for @detailHomeBaseClearedSnack.
  ///
  /// In en, this message translates to:
  /// **'Home base cleared'**
  String get detailHomeBaseClearedSnack;

  /// No description provided for @detailMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'Menu highlights'**
  String get detailMenuTitle;

  /// No description provided for @detailMenuDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Selected highlights — full menu and prices may vary at the venue.'**
  String get detailMenuDisclaimer;

  /// No description provided for @detailMenuComingSoon.
  ///
  /// In en, this message translates to:
  /// **'We’re still curating this menu. View the latest menu and prices online in the meantime.'**
  String get detailMenuComingSoon;

  /// No description provided for @detailViewMenuOnline.
  ///
  /// In en, this message translates to:
  /// **'View menu online'**
  String get detailViewMenuOnline;

  /// No description provided for @photoClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get photoClose;

  /// No description provided for @photoViewDestination.
  ///
  /// In en, this message translates to:
  /// **'View destination'**
  String get photoViewDestination;

  /// No description provided for @photoBy.
  ///
  /// In en, this message translates to:
  /// **'Photo by'**
  String get photoBy;

  /// No description provided for @photoOn.
  ///
  /// In en, this message translates to:
  /// **'on'**
  String get photoOn;

  /// No description provided for @milesFromOrlando.
  ///
  /// In en, this message translates to:
  /// **'{distance} from Orlando'**
  String milesFromOrlando(String distance);

  /// No description provided for @landingBadge.
  ///
  /// In en, this message translates to:
  /// **'FLORIDA · ORLANDO MVP'**
  String get landingBadge;

  /// No description provided for @landingTitle1.
  ///
  /// In en, this message translates to:
  /// **'The vacation'**
  String get landingTitle1;

  /// No description provided for @landingTitle2.
  ///
  /// In en, this message translates to:
  /// **'already started.'**
  String get landingTitle2;

  /// No description provided for @landingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Luxora AI is your emotionally intelligent concierge — hidden gems, rooftop sunsets, and moments designed to feel unforgettable before you even pack.'**
  String get landingSubtitle;

  /// No description provided for @landingBegin.
  ///
  /// In en, this message translates to:
  /// **'Begin your journey'**
  String get landingBegin;

  /// No description provided for @landingTalk.
  ///
  /// In en, this message translates to:
  /// **'Talk to Luxora'**
  String get landingTalk;

  /// No description provided for @landingWhy.
  ///
  /// In en, this message translates to:
  /// **'Why we’re building this'**
  String get landingWhy;

  /// No description provided for @storyTitle.
  ///
  /// In en, this message translates to:
  /// **'Our story'**
  String get storyTitle;

  /// No description provided for @storyHeroBadge.
  ///
  /// In en, this message translates to:
  /// **'BUILT WITH INTENTION'**
  String get storyHeroBadge;

  /// No description provided for @storyHeroCreator.
  ///
  /// In en, this message translates to:
  /// **'Creator, Luxora AI'**
  String get storyHeroCreator;

  /// No description provided for @storyHeroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Florida · emotion-first travel'**
  String get storyHeroSubtitle;

  /// No description provided for @storyHeading.
  ///
  /// In en, this message translates to:
  /// **'Why we’re building Luxora'**
  String get storyHeading;

  /// No description provided for @storyProblemLead.
  ///
  /// In en, this message translates to:
  /// **'We realized that planning a Florida / Orlando trip is surprisingly fragmented and overwhelming.'**
  String get storyProblemLead;

  /// No description provided for @storyJumpingBetween.
  ///
  /// In en, this message translates to:
  /// **'People usually jump between'**
  String get storyJumpingBetween;

  /// No description provided for @storyProblemTail.
  ///
  /// In en, this message translates to:
  /// **'…and still end up with generic tourist plans.'**
  String get storyProblemTail;

  /// No description provided for @storyDifferentLead.
  ///
  /// In en, this message translates to:
  /// **'We want to build something different.'**
  String get storyDifferentLead;

  /// No description provided for @storyNotPlannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Not just a travel planner'**
  String get storyNotPlannerTitle;

  /// No description provided for @storyNotPlannerBody.
  ///
  /// In en, this message translates to:
  /// **'An emotion-first AI travel companion.'**
  String get storyNotPlannerBody;

  /// No description provided for @storyInsteadOfAsking.
  ///
  /// In en, this message translates to:
  /// **'Instead of asking'**
  String get storyInsteadOfAsking;

  /// No description provided for @storyAppAsks.
  ///
  /// In en, this message translates to:
  /// **'The app asks'**
  String get storyAppAsks;

  /// No description provided for @storyInsteadQuestion.
  ///
  /// In en, this message translates to:
  /// **'“Where should I go?”'**
  String get storyInsteadQuestion;

  /// No description provided for @storyFeelQuestion.
  ///
  /// In en, this message translates to:
  /// **'“How do you want this trip to feel?”'**
  String get storyFeelQuestion;

  /// No description provided for @storyMoodBuildLine.
  ///
  /// In en, this message translates to:
  /// **'Then AI builds a personalized experience around that mood.'**
  String get storyMoodBuildLine;

  /// No description provided for @storyFloridaFirstTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Florida / Orlando first?'**
  String get storyFloridaFirstTitle;

  /// No description provided for @storyFloridaFirstLead.
  ///
  /// In en, this message translates to:
  /// **'Orlando is a perfect test market:'**
  String get storyFloridaFirstLead;

  /// No description provided for @storyVisionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our vision'**
  String get storyVisionTitle;

  /// No description provided for @storyVisionLead.
  ///
  /// In en, this message translates to:
  /// **'Combine:'**
  String get storyVisionLead;

  /// No description provided for @storyVisionCard.
  ///
  /// In en, this message translates to:
  /// **'So the app feels closer to a luxury AI concierge — not another boring itinerary tool.'**
  String get storyVisionCard;

  /// No description provided for @storyLongTermTitle.
  ///
  /// In en, this message translates to:
  /// **'Long-term opportunity'**
  String get storyLongTermTitle;

  /// No description provided for @storySourceGoogleMaps.
  ///
  /// In en, this message translates to:
  /// **'Google Maps'**
  String get storySourceGoogleMaps;

  /// No description provided for @storySourceTikTok.
  ///
  /// In en, this message translates to:
  /// **'TikTok'**
  String get storySourceTikTok;

  /// No description provided for @storySourceInstagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram Reels'**
  String get storySourceInstagram;

  /// No description provided for @storySourceTravelBlogs.
  ///
  /// In en, this message translates to:
  /// **'travel blogs'**
  String get storySourceTravelBlogs;

  /// No description provided for @storySourceRestaurantApps.
  ///
  /// In en, this message translates to:
  /// **'restaurant apps'**
  String get storySourceRestaurantApps;

  /// No description provided for @storySourceWeatherApps.
  ///
  /// In en, this message translates to:
  /// **'weather apps'**
  String get storySourceWeatherApps;

  /// No description provided for @storySourceTicketSites.
  ///
  /// In en, this message translates to:
  /// **'ticket websites'**
  String get storySourceTicketSites;

  /// No description provided for @storySourceTop10.
  ///
  /// In en, this message translates to:
  /// **'random “top 10 Orlando” articles'**
  String get storySourceTop10;

  /// No description provided for @storyBulletMarket.
  ///
  /// In en, this message translates to:
  /// **'Huge tourism market'**
  String get storyBulletMarket;

  /// No description provided for @storyBulletAudience.
  ///
  /// In en, this message translates to:
  /// **'Families, couples, luxury travelers, and wellness travelers'**
  String get storyBulletAudience;

  /// No description provided for @storyBulletOptions.
  ///
  /// In en, this message translates to:
  /// **'Endless restaurants, resorts, hidden gems, theme parks, springs, and nightlife'**
  String get storyBulletOptions;

  /// No description provided for @storyBulletRepeat.
  ///
  /// In en, this message translates to:
  /// **'High repeat-visit behavior'**
  String get storyBulletRepeat;

  /// No description provided for @storyBulletLogisticsGap.
  ///
  /// In en, this message translates to:
  /// **'Most travel apps focus on logistics — not experience design'**
  String get storyBulletLogisticsGap;

  /// No description provided for @storyPillarAiItinerary.
  ///
  /// In en, this message translates to:
  /// **'AI itinerary generation'**
  String get storyPillarAiItinerary;

  /// No description provided for @storyPillarMoodPlanning.
  ///
  /// In en, this message translates to:
  /// **'Mood-based travel planning'**
  String get storyPillarMoodPlanning;

  /// No description provided for @storyPillarLiveDiscovery.
  ///
  /// In en, this message translates to:
  /// **'Live discovery & trending experiences'**
  String get storyPillarLiveDiscovery;

  /// No description provided for @storyPillarHiddenGems.
  ///
  /// In en, this message translates to:
  /// **'Hidden local gems'**
  String get storyPillarHiddenGems;

  /// No description provided for @storyPillarRouting.
  ///
  /// In en, this message translates to:
  /// **'Smart routing'**
  String get storyPillarRouting;

  /// No description provided for @storyPillarWeatherSunset.
  ///
  /// In en, this message translates to:
  /// **'Weather & sunset intelligence'**
  String get storyPillarWeatherSunset;

  /// No description provided for @storyPillarPremiumUx.
  ///
  /// In en, this message translates to:
  /// **'Premium aesthetic UX'**
  String get storyPillarPremiumUx;

  /// No description provided for @storyOpportunityMultilingual.
  ///
  /// In en, this message translates to:
  /// **'Multilingual expansion'**
  String get storyOpportunityMultilingual;

  /// No description provided for @storyOpportunityAffiliate.
  ///
  /// In en, this message translates to:
  /// **'Affiliate & booking partnerships'**
  String get storyOpportunityAffiliate;

  /// No description provided for @storyOpportunityInventory.
  ///
  /// In en, this message translates to:
  /// **'Restaurants, experiences, and tickets'**
  String get storyOpportunityInventory;

  /// No description provided for @storyOpportunitySubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Premium subscriptions'**
  String get storyOpportunitySubscriptions;

  /// No description provided for @storyOpportunityScale.
  ///
  /// In en, this message translates to:
  /// **'Scalable beyond Florida → other destinations later'**
  String get storyOpportunityScale;

  /// No description provided for @landingValues.
  ///
  /// In en, this message translates to:
  /// **'Memories · Emotion · Escape · Connection'**
  String get landingValues;

  /// No description provided for @landingRegionBadge.
  ///
  /// In en, this message translates to:
  /// **'Launch region'**
  String get landingRegionBadge;

  /// No description provided for @landingRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Orlando & Florida — curated for feeling'**
  String get landingRegionTitle;

  /// No description provided for @onboardFinish.
  ///
  /// In en, this message translates to:
  /// **'Meet your concierge'**
  String get onboardFinish;

  /// No description provided for @onboardStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Where dreams land first'**
  String get onboardStep1Title;

  /// No description provided for @onboardStep1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Where are you headed?'**
  String get onboardStep1Subtitle;

  /// No description provided for @onboardDestination.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get onboardDestination;

  /// No description provided for @onboardRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get onboardRegion;

  /// No description provided for @onboardStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Time to feel free'**
  String get onboardStep2Title;

  /// No description provided for @onboardStep2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'When does your escape begin?'**
  String get onboardStep2Subtitle;

  /// No description provided for @onboardBudget.
  ///
  /// In en, this message translates to:
  /// **'Trip budget (USD)'**
  String get onboardBudget;

  /// No description provided for @onboardStep3Title.
  ///
  /// In en, this message translates to:
  /// **'Who shares the story'**
  String get onboardStep3Title;

  /// No description provided for @onboardStep3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Who\'s traveling with you?'**
  String get onboardStep3Subtitle;

  /// No description provided for @onboardTravelers.
  ///
  /// In en, this message translates to:
  /// **'Travelers'**
  String get onboardTravelers;

  /// No description provided for @onboardStep4Title.
  ///
  /// In en, this message translates to:
  /// **'Your rhythm'**
  String get onboardStep4Title;

  /// No description provided for @onboardStep4Subtitle.
  ///
  /// In en, this message translates to:
  /// **'How should your days flow?'**
  String get onboardStep4Subtitle;

  /// No description provided for @onboardNightlife.
  ///
  /// In en, this message translates to:
  /// **'Nightlife interest'**
  String get onboardNightlife;

  /// No description provided for @onboardFoodie.
  ///
  /// In en, this message translates to:
  /// **'Foodie passion'**
  String get onboardFoodie;

  /// No description provided for @onboardPoolside.
  ///
  /// In en, this message translates to:
  /// **'Poolside & downtime'**
  String get onboardPoolside;

  /// No description provided for @onboardAdventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure & outdoors'**
  String get onboardAdventure;

  /// No description provided for @onboardCulture.
  ///
  /// In en, this message translates to:
  /// **'Culture & sightseeing'**
  String get onboardCulture;

  /// No description provided for @dayFlowSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A day shaped around how you want to feel — not a checklist.'**
  String get dayFlowSubtitle;

  /// No description provided for @dayFlowMorning.
  ///
  /// In en, this message translates to:
  /// **'MORNING'**
  String get dayFlowMorning;

  /// No description provided for @dayFlowMidday.
  ///
  /// In en, this message translates to:
  /// **'MIDDAY'**
  String get dayFlowMidday;

  /// No description provided for @dayFlowAfternoon.
  ///
  /// In en, this message translates to:
  /// **'AFTERNOON'**
  String get dayFlowAfternoon;

  /// No description provided for @dayFlowEvening.
  ///
  /// In en, this message translates to:
  /// **'EVENING'**
  String get dayFlowEvening;

  /// No description provided for @dayFlowNight.
  ///
  /// In en, this message translates to:
  /// **'NIGHT'**
  String get dayFlowNight;

  /// No description provided for @dayFlowReasonMorningPool.
  ///
  /// In en, this message translates to:
  /// **'Ease in slowly — poolside or spa before the day begins.'**
  String get dayFlowReasonMorningPool;

  /// No description provided for @dayFlowReasonMorningCalm.
  ///
  /// In en, this message translates to:
  /// **'A gentle start to set the tone.'**
  String get dayFlowReasonMorningCalm;

  /// No description provided for @dayFlowReasonMiddayAdventure.
  ///
  /// In en, this message translates to:
  /// **'Peak energy hours — the big adventure while you\'re fresh.'**
  String get dayFlowReasonMiddayAdventure;

  /// No description provided for @dayFlowReasonMiddayCulture.
  ///
  /// In en, this message translates to:
  /// **'Sightseeing while the light is bright.'**
  String get dayFlowReasonMiddayCulture;

  /// No description provided for @dayFlowReasonMiddayIcon.
  ///
  /// In en, this message translates to:
  /// **'The signature moment of the day.'**
  String get dayFlowReasonMiddayIcon;

  /// No description provided for @dayFlowReasonAfternoonDowntime.
  ///
  /// In en, this message translates to:
  /// **'Afternoon downtime to recharge.'**
  String get dayFlowReasonAfternoonDowntime;

  /// No description provided for @dayFlowReasonAfternoonGem.
  ///
  /// In en, this message translates to:
  /// **'A hidden gem away from the crowds.'**
  String get dayFlowReasonAfternoonGem;

  /// No description provided for @dayFlowReasonEveningDining.
  ///
  /// In en, this message translates to:
  /// **'The meal of the day — your foodie pick.'**
  String get dayFlowReasonEveningDining;

  /// No description provided for @dayFlowReasonNightOut.
  ///
  /// In en, this message translates to:
  /// **'One last glow — a night out.'**
  String get dayFlowReasonNightOut;

  /// No description provided for @dayFlowVibeFoodie.
  ///
  /// In en, this message translates to:
  /// **'Foodie-forward'**
  String get dayFlowVibeFoodie;

  /// No description provided for @dayFlowVibeNightlife.
  ///
  /// In en, this message translates to:
  /// **'Nightlife'**
  String get dayFlowVibeNightlife;

  /// No description provided for @dayFlowVibePoolside.
  ///
  /// In en, this message translates to:
  /// **'Poolside'**
  String get dayFlowVibePoolside;

  /// No description provided for @dayFlowVibeAdventure.
  ///
  /// In en, this message translates to:
  /// **'Adventurous'**
  String get dayFlowVibeAdventure;

  /// No description provided for @dayFlowVibeCulture.
  ///
  /// In en, this message translates to:
  /// **'Culture'**
  String get dayFlowVibeCulture;

  /// No description provided for @onboardStep5Title.
  ///
  /// In en, this message translates to:
  /// **'The heart of Luxora'**
  String get onboardStep5Title;

  /// No description provided for @onboardStep5Subtitle.
  ///
  /// In en, this message translates to:
  /// **'What do you want this trip to FEEL like?'**
  String get onboardStep5Subtitle;

  /// No description provided for @onboardTripFeelHint.
  ///
  /// In en, this message translates to:
  /// **'Sunset dinners, slow mornings, laughter with my partner…'**
  String get onboardTripFeelHint;

  /// No description provided for @moodRomantic.
  ///
  /// In en, this message translates to:
  /// **'Romantic'**
  String get moodRomantic;

  /// No description provided for @moodRelaxing.
  ///
  /// In en, this message translates to:
  /// **'Relaxing'**
  String get moodRelaxing;

  /// No description provided for @moodAdventurous.
  ///
  /// In en, this message translates to:
  /// **'Adventurous'**
  String get moodAdventurous;

  /// No description provided for @moodLuxurious.
  ///
  /// In en, this message translates to:
  /// **'Luxurious'**
  String get moodLuxurious;

  /// No description provided for @moodFamily.
  ///
  /// In en, this message translates to:
  /// **'Family bonding'**
  String get moodFamily;

  /// No description provided for @moodSocial.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get moodSocial;

  /// No description provided for @moodNature.
  ///
  /// In en, this message translates to:
  /// **'Nature-focused'**
  String get moodNature;

  /// No description provided for @moodWellness.
  ///
  /// In en, this message translates to:
  /// **'Wellness retreat'**
  String get moodWellness;

  /// No description provided for @moodFoodie.
  ///
  /// In en, this message translates to:
  /// **'Foodie experience'**
  String get moodFoodie;

  /// No description provided for @catHiddenGems.
  ///
  /// In en, this message translates to:
  /// **'Hidden gems'**
  String get catHiddenGems;

  /// No description provided for @catLuxuryStay.
  ///
  /// In en, this message translates to:
  /// **'Luxury staycations'**
  String get catLuxuryStay;

  /// No description provided for @catBeaches.
  ///
  /// In en, this message translates to:
  /// **'Beaches'**
  String get catBeaches;

  /// No description provided for @catRooftop.
  ///
  /// In en, this message translates to:
  /// **'Rooftop dining'**
  String get catRooftop;

  /// No description provided for @catSpas.
  ///
  /// In en, this message translates to:
  /// **'Spas'**
  String get catSpas;

  /// No description provided for @catNightlife.
  ///
  /// In en, this message translates to:
  /// **'Nightlife'**
  String get catNightlife;

  /// No description provided for @catFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get catFamily;

  /// No description provided for @catEco.
  ///
  /// In en, this message translates to:
  /// **'Eco tourism'**
  String get catEco;

  /// No description provided for @catThemeParks.
  ///
  /// In en, this message translates to:
  /// **'Theme parks'**
  String get catThemeParks;

  /// No description provided for @catRomantic.
  ///
  /// In en, this message translates to:
  /// **'Romantic getaways'**
  String get catRomantic;

  /// No description provided for @catFood.
  ///
  /// In en, this message translates to:
  /// **'Food experiences'**
  String get catFood;

  /// No description provided for @catSprings.
  ///
  /// In en, this message translates to:
  /// **'Springs'**
  String get catSprings;

  /// No description provided for @catIslands.
  ///
  /// In en, this message translates to:
  /// **'Island hopping'**
  String get catIslands;

  /// No description provided for @catInfluencer.
  ///
  /// In en, this message translates to:
  /// **'Influencer-worthy'**
  String get catInfluencer;

  /// No description provided for @placeCatBeach.
  ///
  /// In en, this message translates to:
  /// **'Beach'**
  String get placeCatBeach;

  /// No description provided for @placeCatDining.
  ///
  /// In en, this message translates to:
  /// **'Dining'**
  String get placeCatDining;

  /// No description provided for @placeCatNature.
  ///
  /// In en, this message translates to:
  /// **'Nature'**
  String get placeCatNature;

  /// No description provided for @placeCatNightlife.
  ///
  /// In en, this message translates to:
  /// **'Nightlife'**
  String get placeCatNightlife;

  /// No description provided for @placeCatWellness.
  ///
  /// In en, this message translates to:
  /// **'Wellness'**
  String get placeCatWellness;

  /// No description provided for @placeCatFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get placeCatFamily;

  /// No description provided for @placeCatSprings.
  ///
  /// In en, this message translates to:
  /// **'Springs'**
  String get placeCatSprings;

  /// No description provided for @placeCatRomantic.
  ///
  /// In en, this message translates to:
  /// **'Romantic'**
  String get placeCatRomantic;

  /// No description provided for @placeCatAdventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get placeCatAdventure;

  /// No description provided for @placeCatHotel.
  ///
  /// In en, this message translates to:
  /// **'Hotel'**
  String get placeCatHotel;

  /// No description provided for @styleLessCrowded.
  ///
  /// In en, this message translates to:
  /// **'Less crowded'**
  String get styleLessCrowded;

  /// No description provided for @styleLuxurySubtle.
  ///
  /// In en, this message translates to:
  /// **'Luxury but not flashy'**
  String get styleLuxurySubtle;

  /// No description provided for @styleHiddenLuxury.
  ///
  /// In en, this message translates to:
  /// **'Hidden luxury'**
  String get styleHiddenLuxury;

  /// No description provided for @styleWalkable.
  ///
  /// In en, this message translates to:
  /// **'Walkable when possible'**
  String get styleWalkable;

  /// No description provided for @styleSlowMornings.
  ///
  /// In en, this message translates to:
  /// **'Slow mornings'**
  String get styleSlowMornings;

  /// No description provided for @styleNoTraps.
  ///
  /// In en, this message translates to:
  /// **'No tourist traps'**
  String get styleNoTraps;

  /// No description provided for @styleNatureHeavy.
  ///
  /// In en, this message translates to:
  /// **'Nature heavy'**
  String get styleNatureHeavy;

  /// No description provided for @styleNatureWellness.
  ///
  /// In en, this message translates to:
  /// **'Nature + wellness only'**
  String get styleNatureWellness;

  /// No description provided for @styleAestheticDining.
  ///
  /// In en, this message translates to:
  /// **'Aesthetic dining'**
  String get styleAestheticDining;

  /// No description provided for @styleFamilyEasy.
  ///
  /// In en, this message translates to:
  /// **'Family-easy logistics'**
  String get styleFamilyEasy;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'it',
    'ja',
    'ko',
    'pt',
    'ru',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
