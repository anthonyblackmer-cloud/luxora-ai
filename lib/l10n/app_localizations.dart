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

  /// No description provided for @settingsThemeIntro.
  ///
  /// In en, this message translates to:
  /// **'Luxury cinematic or clean readability — pick what fits your day.'**
  String get settingsThemeIntro;

  /// No description provided for @settingsThemeSectionLuxury.
  ///
  /// In en, this message translates to:
  /// **'Luxury cinematic'**
  String get settingsThemeSectionLuxury;

  /// No description provided for @settingsThemeSectionReadable.
  ///
  /// In en, this message translates to:
  /// **'Clean & readable'**
  String get settingsThemeSectionReadable;

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

  /// No description provided for @commonLive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get commonLive;

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

  /// No description provided for @navAgenda.
  ///
  /// In en, this message translates to:
  /// **'Agenda'**
  String get navAgenda;

  /// No description provided for @navDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get navDiscover;

  /// No description provided for @navMap.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get navMap;

  /// No description provided for @navTrips.
  ///
  /// In en, this message translates to:
  /// **'Trips'**
  String get navTrips;

  /// No description provided for @navMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navMore;

  /// No description provided for @navTimeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get navTimeline;

  /// No description provided for @agendaPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your full trip — day-by-day stops, ticket deals, and today\'s Concierge plan.'**
  String get agendaPageSubtitle;

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

  /// No description provided for @navTicketSavings.
  ///
  /// In en, this message translates to:
  /// **'Savings'**
  String get navTicketSavings;

  /// No description provided for @navStays.
  ///
  /// In en, this message translates to:
  /// **'Stays'**
  String get navStays;

  /// No description provided for @morePageTitle.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get morePageTitle;

  /// No description provided for @morePageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Travel tools, account, and preferences — curated for calm access.'**
  String get morePageSubtitle;

  /// No description provided for @moreSectionTravelTools.
  ///
  /// In en, this message translates to:
  /// **'TRAVEL TOOLS'**
  String get moreSectionTravelTools;

  /// No description provided for @moreSectionAccount.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get moreSectionAccount;

  /// No description provided for @moreSectionApp.
  ///
  /// In en, this message translates to:
  /// **'APP'**
  String get moreSectionApp;

  /// No description provided for @moreCardHotelsSub.
  ///
  /// In en, this message translates to:
  /// **'Intelligent stays matched to your mood'**
  String get moreCardHotelsSub;

  /// No description provided for @moreCardGemsSub.
  ///
  /// In en, this message translates to:
  /// **'Insider discoveries locals guard'**
  String get moreCardGemsSub;

  /// No description provided for @moreCardTicketsSub.
  ///
  /// In en, this message translates to:
  /// **'Compare authorized partner savings'**
  String get moreCardTicketsSub;

  /// No description provided for @moreCardWeatherSub.
  ///
  /// In en, this message translates to:
  /// **'Forecast-aware day guidance'**
  String get moreCardWeatherSub;

  /// No description provided for @moreCardProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Trip profile'**
  String get moreCardProfileTitle;

  /// No description provided for @moreCardProfileSub.
  ///
  /// In en, this message translates to:
  /// **'Who travels, how it should feel'**
  String get moreCardProfileSub;

  /// No description provided for @moreCardFavoritesSub.
  ///
  /// In en, this message translates to:
  /// **'Destinations you\'ve bookmarked'**
  String get moreCardFavoritesSub;

  /// No description provided for @moreCardNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get moreCardNotificationsTitle;

  /// No description provided for @moreCardNotificationsSub.
  ///
  /// In en, this message translates to:
  /// **'Trip alerts and concierge updates'**
  String get moreCardNotificationsSub;

  /// No description provided for @moreCardSettingsSub.
  ///
  /// In en, this message translates to:
  /// **'Theme, city packs, and preferences'**
  String get moreCardSettingsSub;

  /// No description provided for @moreCardAboutSub.
  ///
  /// In en, this message translates to:
  /// **'Why we\'re building Luxora'**
  String get moreCardAboutSub;

  /// No description provided for @moreCardHelpSub.
  ///
  /// In en, this message translates to:
  /// **'Guides and concierge support'**
  String get moreCardHelpSub;

  /// No description provided for @moreCardCityPacksSub.
  ///
  /// In en, this message translates to:
  /// **'Unlock destination concierges'**
  String get moreCardCityPacksSub;

  /// No description provided for @moreCardPartnersSub.
  ///
  /// In en, this message translates to:
  /// **'Featured partner experiences'**
  String get moreCardPartnersSub;

  /// No description provided for @moreCardItinerarySub.
  ///
  /// In en, this message translates to:
  /// **'Your day-by-day golden escape'**
  String get moreCardItinerarySub;

  /// No description provided for @moreCardDiscoverSub.
  ///
  /// In en, this message translates to:
  /// **'Trending dining, experiences, and live discovery'**
  String get moreCardDiscoverSub;

  /// No description provided for @savedFavoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved favorites'**
  String get savedFavoritesTitle;

  /// No description provided for @savedFavoritesEmpty.
  ///
  /// In en, this message translates to:
  /// **'Bookmark destinations on the map or feed — they\'ll appear here.'**
  String get savedFavoritesEmpty;

  /// No description provided for @helpCenterTitle.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenterTitle;

  /// No description provided for @helpCenterBody.
  ///
  /// In en, this message translates to:
  /// **'Email support@luxora.ai for concierge help. In-app guides are coming soon.'**
  String get helpCenterBody;

  /// No description provided for @notificationsComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Trip notifications are coming in a future update.'**
  String get notificationsComingSoon;

  /// No description provided for @partnerOffersTitle.
  ///
  /// In en, this message translates to:
  /// **'Partner offers'**
  String get partnerOffersTitle;

  /// No description provided for @ticketSavingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Ticket Savings'**
  String get ticketSavingsTitle;

  /// No description provided for @ticketSavingsBadgeLabel.
  ///
  /// In en, this message translates to:
  /// **'PREMIUM SAVINGS'**
  String get ticketSavingsBadgeLabel;

  /// No description provided for @ticketSavingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Luxora surfaces authorized resellers, bundles, and promotions so you feel like a luxury advisor — not a coupon site.'**
  String get ticketSavingsSubtitle;

  /// No description provided for @ticketSavingsBadge.
  ///
  /// In en, this message translates to:
  /// **'SAVE {percent}%'**
  String ticketSavingsBadge(int percent);

  /// No description provided for @ticketOfficialPrice.
  ///
  /// In en, this message translates to:
  /// **'Official'**
  String get ticketOfficialPrice;

  /// No description provided for @ticketDiscountPrice.
  ///
  /// In en, this message translates to:
  /// **'Luxora price'**
  String get ticketDiscountPrice;

  /// No description provided for @ticketSaveAmount.
  ///
  /// In en, this message translates to:
  /// **'Save {amount}'**
  String ticketSaveAmount(String amount);

  /// No description provided for @ticketSaveAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Savings'**
  String get ticketSaveAmountLabel;

  /// No description provided for @ticketSavePerTicket.
  ///
  /// In en, this message translates to:
  /// **'You could save {amount} per ticket.'**
  String ticketSavePerTicket(String amount);

  /// No description provided for @ticketFamilySave.
  ///
  /// In en, this message translates to:
  /// **'Estimated family savings: {amount}.'**
  String ticketFamilySave(String amount);

  /// No description provided for @ticketEstimatedFamilySave.
  ///
  /// In en, this message translates to:
  /// **'Estimated family savings: {amount}.'**
  String ticketEstimatedFamilySave(String amount);

  /// No description provided for @ticketSource.
  ///
  /// In en, this message translates to:
  /// **'Source: {source}'**
  String ticketSource(String source);

  /// No description provided for @ticketExpires.
  ///
  /// In en, this message translates to:
  /// **'Offer through {date}'**
  String ticketExpires(String date);

  /// No description provided for @ticketBetterOption.
  ///
  /// In en, this message translates to:
  /// **'Luxora found a better option.'**
  String get ticketBetterOption;

  /// No description provided for @ticketOverpaying.
  ///
  /// In en, this message translates to:
  /// **'You may be overpaying at gate price.'**
  String get ticketOverpaying;

  /// No description provided for @ticketRecommendedSavings.
  ///
  /// In en, this message translates to:
  /// **'Recommended savings available'**
  String get ticketRecommendedSavings;

  /// No description provided for @ticketCalculatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Potential savings'**
  String get ticketCalculatorTitle;

  /// No description provided for @ticketFilterLabel.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get ticketFilterLabel;

  /// No description provided for @ticketFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get ticketFilterAll;

  /// No description provided for @ticketFilterThemeParks.
  ///
  /// In en, this message translates to:
  /// **'Theme parks'**
  String get ticketFilterThemeParks;

  /// No description provided for @ticketFilterAttractions.
  ///
  /// In en, this message translates to:
  /// **'Attractions'**
  String get ticketFilterAttractions;

  /// No description provided for @ticketFilterTours.
  ///
  /// In en, this message translates to:
  /// **'Tours'**
  String get ticketFilterTours;

  /// No description provided for @ticketFilterDining.
  ///
  /// In en, this message translates to:
  /// **'Dining experiences'**
  String get ticketFilterDining;

  /// No description provided for @ticketFilterWaterParks.
  ///
  /// In en, this message translates to:
  /// **'Water parks'**
  String get ticketFilterWaterParks;

  /// No description provided for @ticketFilterFamily.
  ///
  /// In en, this message translates to:
  /// **'Family activities'**
  String get ticketFilterFamily;

  /// No description provided for @ticketFilterEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get ticketFilterEntertainment;

  /// No description provided for @ticketSortLabel.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get ticketSortLabel;

  /// No description provided for @ticketSortHighestSavings.
  ///
  /// In en, this message translates to:
  /// **'Highest savings'**
  String get ticketSortHighestSavings;

  /// No description provided for @ticketSortMostPopular.
  ///
  /// In en, this message translates to:
  /// **'Most popular'**
  String get ticketSortMostPopular;

  /// No description provided for @ticketSortFamilyFriendly.
  ///
  /// In en, this message translates to:
  /// **'Family friendly'**
  String get ticketSortFamilyFriendly;

  /// No description provided for @ticketSortLuxury.
  ///
  /// In en, this message translates to:
  /// **'Luxury experiences'**
  String get ticketSortLuxury;

  /// No description provided for @ticketSortClosest.
  ///
  /// In en, this message translates to:
  /// **'Closest to me'**
  String get ticketSortClosest;

  /// No description provided for @ticketDealsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Authorized deals'**
  String get ticketDealsSectionTitle;

  /// No description provided for @ticketDealsPricesAsOf.
  ///
  /// In en, this message translates to:
  /// **'Prices as of {date}'**
  String ticketDealsPricesAsOf(String date);

  /// No description provided for @ticketDealsRefreshFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t refresh prices — showing cached deals.'**
  String get ticketDealsRefreshFailed;

  /// No description provided for @ticketDealsUpdating.
  ///
  /// In en, this message translates to:
  /// **'Updating prices…'**
  String get ticketDealsUpdating;

  /// No description provided for @ticketNoDeals.
  ///
  /// In en, this message translates to:
  /// **'No deals in this filter — try another category.'**
  String get ticketNoDeals;

  /// No description provided for @ticketConfidenceHigh.
  ///
  /// In en, this message translates to:
  /// **'High confidence'**
  String get ticketConfidenceHigh;

  /// No description provided for @ticketConfidenceVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified reseller'**
  String get ticketConfidenceVerified;

  /// No description provided for @ticketConfidenceLimited.
  ///
  /// In en, this message translates to:
  /// **'Limited time'**
  String get ticketConfidenceLimited;

  /// No description provided for @ticketAiInsightTitle.
  ///
  /// In en, this message translates to:
  /// **'Luxora recommendation'**
  String get ticketAiInsightTitle;

  /// No description provided for @ticketInsightDisneyPass.
  ///
  /// In en, this message translates to:
  /// **'Based on your itinerary, a 3-day Walt Disney World pass instead of single-day tickets could save your family approximately 120 USD.'**
  String get ticketInsightDisneyPass;

  /// No description provided for @ticketInsightUniversalCombo.
  ///
  /// In en, this message translates to:
  /// **'Your plan includes Universal — a 2-park ticket beats buying days separately for most families.'**
  String get ticketInsightUniversalCombo;

  /// No description provided for @ticketInsightSeaworldCombo.
  ///
  /// In en, this message translates to:
  /// **'SeaWorld on your route — the Aquatica combo often beats two separate admissions.'**
  String get ticketInsightSeaworldCombo;

  /// No description provided for @ticketInsightGeneric.
  ///
  /// In en, this message translates to:
  /// **'Luxora matched savings to stops on your itinerary — compare before you buy at the gate.'**
  String get ticketInsightGeneric;

  /// No description provided for @ticketInsightMiamiCulture.
  ///
  /// In en, this message translates to:
  /// **'Culture stops on your plan — Vizcaya and PAMM partner offers may beat gate pricing this week.'**
  String get ticketInsightMiamiCulture;

  /// No description provided for @ticketInsightMiamiEverglades.
  ///
  /// In en, this message translates to:
  /// **'Everglades day on your itinerary — morning airboat slots often run cheaper mid-week.'**
  String get ticketInsightMiamiEverglades;

  /// No description provided for @ticketInsightMiamiWynwood.
  ///
  /// In en, this message translates to:
  /// **'Wynwood on your route — a guided art walk can beat walk-up booth pricing.'**
  String get ticketInsightMiamiWynwood;

  /// No description provided for @ticketItineraryMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'Itinerary savings check'**
  String get ticketItineraryMatchTitle;

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

  /// No description provided for @conciergeGreetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning.'**
  String get conciergeGreetingMorning;

  /// No description provided for @conciergeGreetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon.'**
  String get conciergeGreetingAfternoon;

  /// No description provided for @conciergeGreetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening.'**
  String get conciergeGreetingEvening;

  /// No description provided for @conciergeWelcomeWarm.
  ///
  /// In en, this message translates to:
  /// **'I\'m here to shape Florida around how you want to feel — not a checklist of sights. What are you craving today?'**
  String get conciergeWelcomeWarm;

  /// No description provided for @conciergeRefineStyle.
  ///
  /// In en, this message translates to:
  /// **'Refine My Style'**
  String get conciergeRefineStyle;

  /// No description provided for @conciergeRecallReturning.
  ///
  /// In en, this message translates to:
  /// **'Welcome back.'**
  String get conciergeRecallReturning;

  /// No description provided for @conciergeRecallStyle.
  ///
  /// In en, this message translates to:
  /// **'I remember you like {prefs}.'**
  String conciergeRecallStyle(String prefs);

  /// No description provided for @conciergeRecallFeelLine.
  ///
  /// In en, this message translates to:
  /// **'And you wanted this trip to feel: “{feel}”.'**
  String conciergeRecallFeelLine(String feel);

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

  /// No description provided for @discoverFromHub.
  ///
  /// In en, this message translates to:
  /// **'From {hub}'**
  String discoverFromHub(String hub);

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

  /// No description provided for @discoverSearchScopeRadiusHub.
  ///
  /// In en, this message translates to:
  /// **'Within {radius} of {hub}'**
  String discoverSearchScopeRadiusHub(String radius, String hub);

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

  /// No description provided for @scopeDestinationsRadiusHub.
  ///
  /// In en, this message translates to:
  /// **'{count} destinations · within {radius} of {hub}'**
  String scopeDestinationsRadiusHub(int count, String radius, String hub);

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

  /// No description provided for @radiusDesc25Miami.
  ///
  /// In en, this message translates to:
  /// **'South Beach, Brickell, and core neighborhoods'**
  String get radiusDesc25Miami;

  /// No description provided for @radiusDesc50Miami.
  ///
  /// In en, this message translates to:
  /// **'Wynwood, Coconut Grove, Key Biscayne'**
  String get radiusDesc50Miami;

  /// No description provided for @radiusDesc100Miami.
  ///
  /// In en, this message translates to:
  /// **'Everglades, Fort Lauderdale, deeper South Florida'**
  String get radiusDesc100Miami;

  /// No description provided for @radiusDescAllMiami.
  ///
  /// In en, this message translates to:
  /// **'Florida Keys trail and statewide highlights'**
  String get radiusDescAllMiami;

  /// No description provided for @radiusDesc25Keys.
  ///
  /// In en, this message translates to:
  /// **'Key Largo, Islamorada, and upper reef corridor'**
  String get radiusDesc25Keys;

  /// No description provided for @radiusDesc50Keys.
  ///
  /// In en, this message translates to:
  /// **'Marathon, Big Pine, and middle Keys beaches'**
  String get radiusDesc50Keys;

  /// No description provided for @radiusDesc100Keys.
  ///
  /// In en, this message translates to:
  /// **'Full Overseas Highway through Key West'**
  String get radiusDesc100Keys;

  /// No description provided for @radiusDescAllKeys.
  ///
  /// In en, this message translates to:
  /// **'Entire island chain and day-trip waters'**
  String get radiusDescAllKeys;

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

  /// No description provided for @feedSubtitleFamily.
  ///
  /// In en, this message translates to:
  /// **'Family-friendly picks for your crew — parks, easy wins, and moments that land with kids (and parents).'**
  String get feedSubtitleFamily;

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

  /// No description provided for @feedMoodPrompt.
  ///
  /// In en, this message translates to:
  /// **'HOW DO YOU WANT TO FEEL?'**
  String get feedMoodPrompt;

  /// No description provided for @feedMoodPromptFamily.
  ///
  /// In en, this message translates to:
  /// **'HOW SHOULD TODAY FEEL FOR YOUR CREW?'**
  String get feedMoodPromptFamily;

  /// No description provided for @feedMoodAll.
  ///
  /// In en, this message translates to:
  /// **'Everything'**
  String get feedMoodAll;

  /// No description provided for @feedMoodFamily.
  ///
  /// In en, this message translates to:
  /// **'Family magic'**
  String get feedMoodFamily;

  /// No description provided for @feedMoodRomantic.
  ///
  /// In en, this message translates to:
  /// **'Romantic'**
  String get feedMoodRomantic;

  /// No description provided for @feedMoodCalm.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get feedMoodCalm;

  /// No description provided for @feedMoodAdventurous.
  ///
  /// In en, this message translates to:
  /// **'Adventurous'**
  String get feedMoodAdventurous;

  /// No description provided for @feedMoodPampered.
  ///
  /// In en, this message translates to:
  /// **'Pampered'**
  String get feedMoodPampered;

  /// No description provided for @feedMoodSocial.
  ///
  /// In en, this message translates to:
  /// **'Buzzing'**
  String get feedMoodSocial;

  /// No description provided for @feedMoodFoodie.
  ///
  /// In en, this message translates to:
  /// **'Foodie'**
  String get feedMoodFoodie;

  /// No description provided for @feedFamilyMoodHint.
  ///
  /// In en, this message translates to:
  /// **'Theme parks, character meals, and easy parent wins — filtered for family tags.'**
  String get feedFamilyMoodHint;

  /// No description provided for @feedEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'No feed cards in this radius — try 50 mi or All Florida for Gulf coast and Keys highlights.'**
  String get feedEmptyHint;

  /// No description provided for @feedEmptyHintFamily.
  ///
  /// In en, this message translates to:
  /// **'No family-tagged cards in this radius — try Adventurous or Everything, or widen the radius.'**
  String get feedEmptyHintFamily;

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

  /// No description provided for @gemsMatchedBadge.
  ///
  /// In en, this message translates to:
  /// **'Your style'**
  String get gemsMatchedBadge;

  /// No description provided for @gemsMatchedNote.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 gem matched to your style} other{{count} gems matched to your style}}'**
  String gemsMatchedNote(int count);

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
  /// **'Today\'s agenda'**
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

  /// No description provided for @shareDayLegDrive.
  ///
  /// In en, this message translates to:
  /// **'{time} drive · {miles} from previous stop'**
  String shareDayLegDrive(String time, String miles);

  /// No description provided for @mapCrowdLevelQuiet.
  ///
  /// In en, this message translates to:
  /// **'Quiet'**
  String get mapCrowdLevelQuiet;

  /// No description provided for @mapCrowdLevelModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get mapCrowdLevelModerate;

  /// No description provided for @mapCrowdLevelBusy.
  ///
  /// In en, this message translates to:
  /// **'Busy'**
  String get mapCrowdLevelBusy;

  /// No description provided for @mapCrowdLevelPacked.
  ///
  /// In en, this message translates to:
  /// **'Packed'**
  String get mapCrowdLevelPacked;

  /// No description provided for @mapCrowdAtStop.
  ///
  /// In en, this message translates to:
  /// **'Crowd: {level}'**
  String mapCrowdAtStop(String level);

  /// No description provided for @mapParkingLevelEasy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get mapParkingLevelEasy;

  /// No description provided for @mapParkingLevelModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get mapParkingLevelModerate;

  /// No description provided for @mapParkingLevelDifficult.
  ///
  /// In en, this message translates to:
  /// **'Difficult'**
  String get mapParkingLevelDifficult;

  /// No description provided for @mapParkingLevelLimited.
  ///
  /// In en, this message translates to:
  /// **'Limited · arrive early'**
  String get mapParkingLevelLimited;

  /// No description provided for @mapParkingAtStop.
  ///
  /// In en, this message translates to:
  /// **'Parking: {level}'**
  String mapParkingAtStop(String level);

  /// No description provided for @mapDriveFrictionAtStop.
  ///
  /// In en, this message translates to:
  /// **'Drive friction: {score}/90'**
  String mapDriveFrictionAtStop(int score);

  /// No description provided for @mapRerouteButton.
  ///
  /// In en, this message translates to:
  /// **'Reroute for calmer stops'**
  String get mapRerouteButton;

  /// No description provided for @mapRerouteApplied.
  ///
  /// In en, this message translates to:
  /// **'Day adjusted — {count} stops swapped for lighter crowds.'**
  String mapRerouteApplied(int count);

  /// No description provided for @mapRerouteNone.
  ///
  /// In en, this message translates to:
  /// **'Your route already looks calm.'**
  String get mapRerouteNone;

  /// No description provided for @mapRerouteRainHint.
  ///
  /// In en, this message translates to:
  /// **'Rain likely — tap reroute for indoor backups.'**
  String get mapRerouteRainHint;

  /// No description provided for @dayFlowSwapTitle.
  ///
  /// In en, this message translates to:
  /// **'Change this stop'**
  String get dayFlowSwapTitle;

  /// No description provided for @dayFlowSwapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell Luxora what you\'d rather do instead of {current}.'**
  String dayFlowSwapSubtitle(String current);

  /// No description provided for @dayFlowSwapTemplate.
  ///
  /// In en, this message translates to:
  /// **'I was thinking something more like…'**
  String get dayFlowSwapTemplate;

  /// No description provided for @dayFlowSwapHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. a quiet park this morning, or seafood for dinner'**
  String get dayFlowSwapHint;

  /// No description provided for @dayFlowSwapApply.
  ///
  /// In en, this message translates to:
  /// **'Update my day'**
  String get dayFlowSwapApply;

  /// No description provided for @dayFlowSwapViewPlace.
  ///
  /// In en, this message translates to:
  /// **'View current stop'**
  String get dayFlowSwapViewPlace;

  /// No description provided for @dayFlowSwapSuccess.
  ///
  /// In en, this message translates to:
  /// **'Updated — {newStop} is now your {phase} stop.'**
  String dayFlowSwapSuccess(String newStop, String phase);

  /// No description provided for @dayFlowSwapNoMatch.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t find a match nearby — try being more specific.'**
  String get dayFlowSwapNoMatch;

  /// No description provided for @dayFlowSwapTapToChange.
  ///
  /// In en, this message translates to:
  /// **'Change this stop'**
  String get dayFlowSwapTapToChange;

  /// No description provided for @dayFlowSwapHoldSpeak.
  ///
  /// In en, this message translates to:
  /// **'Hold to speak'**
  String get dayFlowSwapHoldSpeak;

  /// No description provided for @dayFlowSwapListening.
  ///
  /// In en, this message translates to:
  /// **'Listening…'**
  String get dayFlowSwapListening;

  /// No description provided for @rightNowButton.
  ///
  /// In en, this message translates to:
  /// **'What should we do right now?'**
  String get rightNowButton;

  /// No description provided for @rightNowEmpty.
  ///
  /// In en, this message translates to:
  /// **'No strong moment in your radius yet — widen discover or bookmark a few favorites.'**
  String get rightNowEmpty;

  /// No description provided for @rightNowResultTitle.
  ///
  /// In en, this message translates to:
  /// **'RIGHT NOW'**
  String get rightNowResultTitle;

  /// No description provided for @rightNowTapForDetails.
  ///
  /// In en, this message translates to:
  /// **'Tap for details'**
  String get rightNowTapForDetails;

  /// No description provided for @rightNowScenicCoffee.
  ///
  /// In en, this message translates to:
  /// **'You\'re {minutes} minutes from {district}. The weather is perfect — grab coffee at {place}, then stroll {walkArea} before crowds arrive ({crowd} crowds).'**
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  );

  /// No description provided for @rightNowPerfectWeather.
  ///
  /// In en, this message translates to:
  /// **'You\'re {minutes} minutes from {district}. Skies look great — head to {place} while crowds are still {crowd}.'**
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  );

  /// No description provided for @rightNowGoldenHour.
  ///
  /// In en, this message translates to:
  /// **'Golden hour is coming — leave in about {minutes} minutes for {place} ({crowd} by sunset).'**
  String rightNowGoldenHour(int minutes, String place, String crowd);

  /// No description provided for @rightNowRainyIndoor.
  ///
  /// In en, this message translates to:
  /// **'Rain on the radar — {minutes} minutes to a cozy indoor pick: {place}.'**
  String rightNowRainyIndoor(int minutes, String place);

  /// No description provided for @rightNowFamilyCalm.
  ///
  /// In en, this message translates to:
  /// **'Nap-window calm — {minutes} minutes to an easy family reset at {place}.'**
  String rightNowFamilyCalm(int minutes, String place);

  /// No description provided for @rightNowRomantic.
  ///
  /// In en, this message translates to:
  /// **'Date-night energy — {minutes} minutes to {place} before the rush.'**
  String rightNowRomantic(int minutes, String place);

  /// No description provided for @rightNowQuietGem.
  ///
  /// In en, this message translates to:
  /// **'Quiet window — {minutes} minutes to {place} ({crowd} right now).'**
  String rightNowQuietGem(int minutes, String place, String crowd);

  /// No description provided for @goldenHourTitle.
  ///
  /// In en, this message translates to:
  /// **'Golden hour'**
  String get goldenHourTitle;

  /// No description provided for @goldenHourLeaveBy.
  ///
  /// In en, this message translates to:
  /// **'Leave by {time} ({minutes} min drive) for {place} — arrive ~15 minutes before sunset.'**
  String goldenHourLeaveBy(String time, int minutes, String place);

  /// No description provided for @goldenHourKindBeach.
  ///
  /// In en, this message translates to:
  /// **'Beach sunset window'**
  String get goldenHourKindBeach;

  /// No description provided for @goldenHourKindRooftop.
  ///
  /// In en, this message translates to:
  /// **'Rooftop golden hour'**
  String get goldenHourKindRooftop;

  /// No description provided for @goldenHourKindScenic.
  ///
  /// In en, this message translates to:
  /// **'Scenic photography timing'**
  String get goldenHourKindScenic;

  /// No description provided for @vacationScoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Vacation score'**
  String get vacationScoreTitle;

  /// No description provided for @vacationScoreSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Today feels like a {score}/100 kind of day.'**
  String vacationScoreSubtitle(int score);

  /// No description provided for @onboardOccasionLabel.
  ///
  /// In en, this message translates to:
  /// **'What\'s the occasion?'**
  String get onboardOccasionLabel;

  /// No description provided for @occasionGeneral.
  ///
  /// In en, this message translates to:
  /// **'Just exploring'**
  String get occasionGeneral;

  /// No description provided for @occasionAnniversary.
  ///
  /// In en, this message translates to:
  /// **'Anniversary'**
  String get occasionAnniversary;

  /// No description provided for @occasionHoneymoon.
  ///
  /// In en, this message translates to:
  /// **'Honeymoon'**
  String get occasionHoneymoon;

  /// No description provided for @occasionDateNight.
  ///
  /// In en, this message translates to:
  /// **'Date night'**
  String get occasionDateNight;

  /// No description provided for @occasionProposal.
  ///
  /// In en, this message translates to:
  /// **'Proposal trip'**
  String get occasionProposal;

  /// No description provided for @occasionFamily.
  ///
  /// In en, this message translates to:
  /// **'Family with kids'**
  String get occasionFamily;

  /// No description provided for @occasionDisneyAdventure.
  ///
  /// In en, this message translates to:
  /// **'Disney adventure'**
  String get occasionDisneyAdventure;

  /// No description provided for @occasionUniversalAdventure.
  ///
  /// In en, this message translates to:
  /// **'Universal adventure'**
  String get occasionUniversalAdventure;

  /// No description provided for @localSecretTitle.
  ///
  /// In en, this message translates to:
  /// **'Local secret'**
  String get localSecretTitle;

  /// No description provided for @localSecretWinterParkParkAvenue.
  ///
  /// In en, this message translates to:
  /// **'Locals duck into the alley courtyard behind the bookstore — no street sign.'**
  String get localSecretWinterParkParkAvenue;

  /// No description provided for @localSecretWorldFoodTrucks.
  ///
  /// In en, this message translates to:
  /// **'Order the daily catch, not the burger — the line moves faster at the far window.'**
  String get localSecretWorldFoodTrucks;

  /// No description provided for @localSecretWekiwaSprings.
  ///
  /// In en, this message translates to:
  /// **'Skip the main boardwalk after 2 PM — north trailhead stays quiet.'**
  String get localSecretWekiwaSprings;

  /// No description provided for @localSecretDisneySpringsParking.
  ///
  /// In en, this message translates to:
  /// **'Best parking is the orange garage — walk the marina side, not the main entrance rush.'**
  String get localSecretDisneySpringsParking;

  /// No description provided for @localSecretLakeEolaSunset.
  ///
  /// In en, this message translates to:
  /// **'Face the amphitheater side for swan photos as the sky turns gold.'**
  String get localSecretLakeEolaSunset;

  /// No description provided for @localSecretMiamiWynwoodAlley.
  ///
  /// In en, this message translates to:
  /// **'Duck through the loading alley behind Panther Coffee — locals shoot murals without the main-line crowd.'**
  String get localSecretMiamiWynwoodAlley;

  /// No description provided for @localSecretMiamiLittleHavanaDomino.
  ///
  /// In en, this message translates to:
  /// **'Buy cafecito at the window cart first — sideline bench regulars open up when you\'re holding a cortadito.'**
  String get localSecretMiamiLittleHavanaDomino;

  /// No description provided for @localSecretMiamiVizcayaMangrove.
  ///
  /// In en, this message translates to:
  /// **'Skip the main terrace rush — enter from the east garden and walk the mangrove boardwalk counter-clockwise.'**
  String get localSecretMiamiVizcayaMangrove;

  /// No description provided for @localSecretMiamiOceanDriveSunrise.
  ///
  /// In en, this message translates to:
  /// **'Face east at 7 AM on Lummus — art deco pastels glow before the brunch crowd arrives.'**
  String get localSecretMiamiOceanDriveSunrise;

  /// No description provided for @localSecretMiamiPantherAlley.
  ///
  /// In en, this message translates to:
  /// **'Order at the window, walk the alley clockwise — best mural light hits the turquoise wall at 8:45 AM.'**
  String get localSecretMiamiPantherAlley;

  /// No description provided for @momentsTitle.
  ///
  /// In en, this message translates to:
  /// **'LUXORA MOMENTS'**
  String get momentsTitle;

  /// No description provided for @momentsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Search for a feeling — not a place.'**
  String get momentsSubtitle;

  /// No description provided for @momentFeelRelaxed.
  ///
  /// In en, this message translates to:
  /// **'Feel relaxed'**
  String get momentFeelRelaxed;

  /// No description provided for @momentImpressSpouse.
  ///
  /// In en, this message translates to:
  /// **'Impress my spouse'**
  String get momentImpressSpouse;

  /// No description provided for @momentPerfectSunset.
  ///
  /// In en, this message translates to:
  /// **'Perfect sunset'**
  String get momentPerfectSunset;

  /// No description provided for @momentFamilyMemory.
  ///
  /// In en, this message translates to:
  /// **'Family memory'**
  String get momentFamilyMemory;

  /// No description provided for @momentLuxuryValue.
  ///
  /// In en, this message translates to:
  /// **'Luxury without overspending'**
  String get momentLuxuryValue;

  /// No description provided for @momentPromptRelaxed.
  ///
  /// In en, this message translates to:
  /// **'I want to feel completely relaxed for the next few hours — slow, beautiful, no crowds.'**
  String get momentPromptRelaxed;

  /// No description provided for @momentPromptImpressSpouse.
  ///
  /// In en, this message translates to:
  /// **'I want to impress my spouse with something romantic and unexpected tonight.'**
  String get momentPromptImpressSpouse;

  /// No description provided for @momentPromptPerfectSunset.
  ///
  /// In en, this message translates to:
  /// **'I want the perfect Florida sunset moment — where should we be and when should we leave?'**
  String get momentPromptPerfectSunset;

  /// No description provided for @momentPromptFamilyMemory.
  ///
  /// In en, this message translates to:
  /// **'I want a memorable family moment that\'s easy on parents and magical for kids.'**
  String get momentPromptFamilyMemory;

  /// No description provided for @momentPromptLuxuryValue.
  ///
  /// In en, this message translates to:
  /// **'I want luxury that feels special without spending a fortune.'**
  String get momentPromptLuxuryValue;

  /// No description provided for @visualShareImageButton.
  ///
  /// In en, this message translates to:
  /// **'Share image card'**
  String get visualShareImageButton;

  /// No description provided for @tripStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Your trip story'**
  String get tripStoryTitle;

  /// No description provided for @tripStoryHeading.
  ///
  /// In en, this message translates to:
  /// **'{title} — your Florida story'**
  String tripStoryHeading(String title);

  /// No description provided for @tripStoryBeatMoods.
  ///
  /// In en, this message translates to:
  /// **'You came for {moods}.'**
  String tripStoryBeatMoods(String moods);

  /// No description provided for @tripStoryBeatTitle.
  ///
  /// In en, this message translates to:
  /// **'This chapter: {title}.'**
  String tripStoryBeatTitle(String title);

  /// No description provided for @tripStoryBeatClosing.
  ///
  /// In en, this message translates to:
  /// **'Luxora shaped the moments — you lived them.'**
  String get tripStoryBeatClosing;

  /// No description provided for @tripsOpenStory.
  ///
  /// In en, this message translates to:
  /// **'Your story'**
  String get tripsOpenStory;

  /// No description provided for @conciergeVoiceHold.
  ///
  /// In en, this message translates to:
  /// **'Hold to speak'**
  String get conciergeVoiceHold;

  /// No description provided for @conciergeVoiceSoon.
  ///
  /// In en, this message translates to:
  /// **'Allow microphone access so Luxora can hear you.'**
  String get conciergeVoiceSoon;

  /// No description provided for @conciergeVoiceListening.
  ///
  /// In en, this message translates to:
  /// **'Luxora is listening…'**
  String get conciergeVoiceListening;

  /// No description provided for @conciergeVoiceSpeaking.
  ///
  /// In en, this message translates to:
  /// **'Luxora is speaking…'**
  String get conciergeVoiceSpeaking;

  /// No description provided for @conciergeVoiceRelease.
  ///
  /// In en, this message translates to:
  /// **'Release to send'**
  String get conciergeVoiceRelease;

  /// No description provided for @conciergeVoiceSend.
  ///
  /// In en, this message translates to:
  /// **'Send to Luxora'**
  String get conciergeVoiceSend;

  /// No description provided for @conciergeVoiceProcessing.
  ///
  /// In en, this message translates to:
  /// **'Sending to Luxora…'**
  String get conciergeVoiceProcessing;

  /// No description provided for @conciergeVoiceNoSpeech.
  ///
  /// In en, this message translates to:
  /// **'I didn\'t catch that — hold the button, speak, then release.'**
  String get conciergeVoiceNoSpeech;

  /// No description provided for @conciergeVoicePreviewFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t play a preview. Check your volume and try again.'**
  String get conciergeVoicePreviewFailed;

  /// No description provided for @conciergeVoiceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Voice isn\'t available on this device.'**
  String get conciergeVoiceUnavailable;

  /// No description provided for @conciergeVoiceSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Luxora voice'**
  String get conciergeVoiceSettingsTitle;

  /// No description provided for @conciergeVoiceSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how Luxora sounds when she speaks — accent, tone, and pace. Uses your device\'s built-in voices.'**
  String get conciergeVoiceSettingsSubtitle;

  /// No description provided for @conciergeVoiceRateLabel.
  ///
  /// In en, this message translates to:
  /// **'Speaking pace'**
  String get conciergeVoiceRateLabel;

  /// No description provided for @conciergeVoiceRateSlow.
  ///
  /// In en, this message translates to:
  /// **'Slow'**
  String get conciergeVoiceRateSlow;

  /// No description provided for @conciergeVoiceRateNatural.
  ///
  /// In en, this message translates to:
  /// **'Natural'**
  String get conciergeVoiceRateNatural;

  /// No description provided for @conciergeVoiceRateFast.
  ///
  /// In en, this message translates to:
  /// **'Fast'**
  String get conciergeVoiceRateFast;

  /// No description provided for @conciergeVoicePreview.
  ///
  /// In en, this message translates to:
  /// **'Preview voice'**
  String get conciergeVoicePreview;

  /// No description provided for @conciergeVoicePreviewSample.
  ///
  /// In en, this message translates to:
  /// **'Hello — I\'m Luxora. Tell me how you want this trip to feel.'**
  String get conciergeVoicePreviewSample;

  /// No description provided for @conciergeVoiceDeviceNote.
  ///
  /// In en, this message translates to:
  /// **'Download more voices in iPhone Settings → Accessibility → Spoken Content → Voices. Return here and tap Refresh.'**
  String get conciergeVoiceDeviceNote;

  /// No description provided for @conciergeVoiceDeviceSection.
  ///
  /// In en, this message translates to:
  /// **'Voices on this iPhone'**
  String get conciergeVoiceDeviceSection;

  /// No description provided for @conciergeVoiceDeviceSectionHint.
  ///
  /// In en, this message translates to:
  /// **'Includes voices you downloaded — tap one to use it for Luxora.'**
  String get conciergeVoiceDeviceSectionHint;

  /// No description provided for @conciergeVoiceRefreshList.
  ///
  /// In en, this message translates to:
  /// **'Refresh voice list'**
  String get conciergeVoiceRefreshList;

  /// No description provided for @conciergeVoiceShowAllLanguages.
  ///
  /// In en, this message translates to:
  /// **'Show all languages'**
  String get conciergeVoiceShowAllLanguages;

  /// No description provided for @conciergeVoiceOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open iPhone voice settings'**
  String get conciergeVoiceOpenSettings;

  /// No description provided for @conciergeVoiceNoDeviceVoices.
  ///
  /// In en, this message translates to:
  /// **'No voices found — download packs in Settings, then refresh.'**
  String get conciergeVoiceNoDeviceVoices;

  /// No description provided for @conciergeVoicePresetSection.
  ///
  /// In en, this message translates to:
  /// **'Quick personas'**
  String get conciergeVoicePresetSection;

  /// No description provided for @conciergeVoiceRegionRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get conciergeVoiceRegionRecommended;

  /// No description provided for @conciergeVoiceRegionEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get conciergeVoiceRegionEnglish;

  /// No description provided for @conciergeVoiceRegionRussian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get conciergeVoiceRegionRussian;

  /// No description provided for @conciergeVoiceRegionSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get conciergeVoiceRegionSpanish;

  /// No description provided for @conciergeVoiceRegionFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get conciergeVoiceRegionFrench;

  /// No description provided for @conciergeVoiceRegionGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get conciergeVoiceRegionGerman;

  /// No description provided for @conciergeVoiceRegionOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get conciergeVoiceRegionOther;

  /// No description provided for @conciergeVoicePresetMatchApp.
  ///
  /// In en, this message translates to:
  /// **'Match app language · Female'**
  String get conciergeVoicePresetMatchApp;

  /// No description provided for @conciergeVoicePresetEnUsF.
  ///
  /// In en, this message translates to:
  /// **'American · Female'**
  String get conciergeVoicePresetEnUsF;

  /// No description provided for @conciergeVoicePresetEnUsM.
  ///
  /// In en, this message translates to:
  /// **'American · Male'**
  String get conciergeVoicePresetEnUsM;

  /// No description provided for @conciergeVoicePresetEnGbF.
  ///
  /// In en, this message translates to:
  /// **'British · Female'**
  String get conciergeVoicePresetEnGbF;

  /// No description provided for @conciergeVoicePresetEnGbM.
  ///
  /// In en, this message translates to:
  /// **'British · Male'**
  String get conciergeVoicePresetEnGbM;

  /// No description provided for @conciergeVoicePresetRuF.
  ///
  /// In en, this message translates to:
  /// **'Russian · Female'**
  String get conciergeVoicePresetRuF;

  /// No description provided for @conciergeVoicePresetRuM.
  ///
  /// In en, this message translates to:
  /// **'Russian · Male'**
  String get conciergeVoicePresetRuM;

  /// No description provided for @conciergeVoicePresetEsF.
  ///
  /// In en, this message translates to:
  /// **'Spanish · Female'**
  String get conciergeVoicePresetEsF;

  /// No description provided for @conciergeVoicePresetEsM.
  ///
  /// In en, this message translates to:
  /// **'Spanish · Male'**
  String get conciergeVoicePresetEsM;

  /// No description provided for @conciergeVoicePresetFrF.
  ///
  /// In en, this message translates to:
  /// **'French · Female'**
  String get conciergeVoicePresetFrF;

  /// No description provided for @conciergeVoicePresetFrM.
  ///
  /// In en, this message translates to:
  /// **'French · Male'**
  String get conciergeVoicePresetFrM;

  /// No description provided for @conciergeVoicePresetDeF.
  ///
  /// In en, this message translates to:
  /// **'German · Female'**
  String get conciergeVoicePresetDeF;

  /// No description provided for @conciergeVoicePresetDeM.
  ///
  /// In en, this message translates to:
  /// **'German · Male'**
  String get conciergeVoicePresetDeM;

  /// No description provided for @conciergeThinking.
  ///
  /// In en, this message translates to:
  /// **'Luxora is thinking…'**
  String get conciergeThinking;

  /// No description provided for @conciergeItinerarySynced.
  ///
  /// In en, this message translates to:
  /// **'I\'ve added that to your Agenda — same stops on Map, ready to share.'**
  String get conciergeItinerarySynced;

  /// No description provided for @conciergeAgendaUpdatedSnack.
  ///
  /// In en, this message translates to:
  /// **'Your agenda is ready on Map and Agenda'**
  String get conciergeAgendaUpdatedSnack;

  /// No description provided for @conciergeAgendaSyncFailed.
  ///
  /// In en, this message translates to:
  /// **'Map and Agenda did not update. Try one clear request, for example: Plan a 4-day Disney and Universal trip.'**
  String get conciergeAgendaSyncFailed;

  /// No description provided for @conciergeViewAgendaOnMap.
  ///
  /// In en, this message translates to:
  /// **'View Agenda'**
  String get conciergeViewAgendaOnMap;

  /// No description provided for @conciergeAgendaDealsIntro.
  ///
  /// In en, this message translates to:
  /// **'I matched authorized ticket deals to stops on your agenda — compare before you buy at the gate:'**
  String get conciergeAgendaDealsIntro;

  /// No description provided for @conciergeAgendaDealsSnack.
  ///
  /// In en, this message translates to:
  /// **'Ticket deals matched to your agenda'**
  String get conciergeAgendaDealsSnack;

  /// No description provided for @conciergeViewTicketDeals.
  ///
  /// In en, this message translates to:
  /// **'View deals'**
  String get conciergeViewTicketDeals;

  /// No description provided for @ticketAgendaMatchLine.
  ///
  /// In en, this message translates to:
  /// **'{stop} · est. save {amount} via {source}'**
  String ticketAgendaMatchLine(String stop, String amount, String source);

  /// No description provided for @ticketAgendaStopsSummary.
  ///
  /// In en, this message translates to:
  /// **'{count} stops on your agenda have partner deals — compare authorized offers before you buy at the gate.'**
  String ticketAgendaStopsSummary(int count);

  /// No description provided for @ticketAgendaStopsSavings.
  ///
  /// In en, this message translates to:
  /// **'Est. family savings · {amount}'**
  String ticketAgendaStopsSavings(String amount);

  /// No description provided for @ticketBrowseAgendaDeals.
  ///
  /// In en, this message translates to:
  /// **'Browse deals for your agenda →'**
  String get ticketBrowseAgendaDeals;

  /// No description provided for @conciergeFreshThread.
  ///
  /// In en, this message translates to:
  /// **'Your agenda is on Map and Agenda. I\'ve archived this chat and started fresh — tweak the day, find deals, or ask something new.'**
  String get conciergeFreshThread;

  /// No description provided for @conciergeThreadArchivedSnack.
  ///
  /// In en, this message translates to:
  /// **'Chat archived — fresh thread started'**
  String get conciergeThreadArchivedSnack;

  /// No description provided for @conciergeNewConversationTooltip.
  ///
  /// In en, this message translates to:
  /// **'New conversation'**
  String get conciergeNewConversationTooltip;

  /// No description provided for @itinerarySameAsMapAgenda.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Concierge plan — also pinned on Map. Share the day card below.'**
  String get itinerarySameAsMapAgenda;

  /// No description provided for @conciergeTicketsFoundIntro.
  ///
  /// In en, this message translates to:
  /// **'I found authorized ticket deals for your trip — tap Book tickets on Agenda for direct links:'**
  String get conciergeTicketsFoundIntro;

  /// No description provided for @conciergeTicketDealLine.
  ///
  /// In en, this message translates to:
  /// **'• {title}: {price} via {source} (save {savings})'**
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  );

  /// No description provided for @conciergeTicketsTimelineHint.
  ///
  /// In en, this message translates to:
  /// **'Each matching stop on Agenda now has a Book tickets button with the reseller link.'**
  String get conciergeTicketsTimelineHint;

  /// No description provided for @itineraryBookTickets.
  ///
  /// In en, this message translates to:
  /// **'Book tickets · Save {amount}'**
  String itineraryBookTickets(String amount);

  /// No description provided for @itineraryOpenTicketDeal.
  ///
  /// In en, this message translates to:
  /// **'Book tickets'**
  String get itineraryOpenTicketDeal;

  /// No description provided for @conciergeTripSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved “{title}” to your Trips — open the Trips tab anytime to revisit it.'**
  String conciergeTripSaved(String title);

  /// No description provided for @conciergeTripSavedWithStops.
  ///
  /// In en, this message translates to:
  /// **'Saved “{title}” with {count} experiences on your timeline.'**
  String conciergeTripSavedWithStops(String title, int count);

  /// No description provided for @conciergeSavedTripsIntro.
  ///
  /// In en, this message translates to:
  /// **'You have {count} saved trip(s):'**
  String conciergeSavedTripsIntro(int count);

  /// No description provided for @conciergeSavedTripLine.
  ///
  /// In en, this message translates to:
  /// **'• {title} ({dates}) — {status}'**
  String conciergeSavedTripLine(String title, String dates, String status);

  /// No description provided for @conciergeSavedTripsEmpty.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any saved trips yet — ask me to plan something, then say “save my trip.”'**
  String get conciergeSavedTripsEmpty;

  /// No description provided for @conciergeSavedTripsHint.
  ///
  /// In en, this message translates to:
  /// **'Open the Trips tab to view cards, share, or edit dates.'**
  String get conciergeSavedTripsHint;

  /// No description provided for @conciergeAiError.
  ///
  /// In en, this message translates to:
  /// **'I couldn\'t reach Luxora right now. Check your connection and try again.'**
  String get conciergeAiError;

  /// No description provided for @conciergeAiErrorVoice.
  ///
  /// In en, this message translates to:
  /// **'Sorry — I couldn\'t connect to Luxora\'s concierge just now.'**
  String get conciergeAiErrorVoice;

  /// No description provided for @conciergeAiNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'Luxora\'s live concierge isn\'t wired up on this build yet — Supabase URL and anon key need to be baked into the app, and the edge function deployed. Map and itinerary still work; see docs/CONCIERGE_AI.md for setup.'**
  String get conciergeAiNotConfigured;

  /// No description provided for @conciergeAiOpenAiNotReady.
  ///
  /// In en, this message translates to:
  /// **'Luxora heard you, but the concierge brain isn\'t online yet. Set OPENAI_API_KEY in Supabase secrets for the edge function (bright-processor), then try again.'**
  String get conciergeAiOpenAiNotReady;

  /// No description provided for @conciergeAiFunctionNotFound.
  ///
  /// In en, this message translates to:
  /// **'Luxora couldn\'t find the concierge edge function \"{function}\". Deploy it in Supabase or fix SUPABASE_CONCIERGE_FUNCTION on this build.'**
  String conciergeAiFunctionNotFound(String function);

  /// No description provided for @conciergeAiAuthFailed.
  ///
  /// In en, this message translates to:
  /// **'Luxora couldn\'t authenticate with Supabase — double-check SUPABASE_ANON_KEY matches your project.'**
  String get conciergeAiAuthFailed;

  /// No description provided for @mapAiPowers.
  ///
  /// In en, this message translates to:
  /// **'AI map powers'**
  String get mapAiPowers;

  /// No description provided for @mapNavLayerTitle.
  ///
  /// In en, this message translates to:
  /// **'Stop friction intelligence'**
  String get mapNavLayerTitle;

  /// No description provided for @mapNavLayerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Crowd, parking, and drive-stress outlook on each Plan my day stop — plus one-tap reroute.'**
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
  /// **'Crowd outlook'**
  String get mapFutureCrowdTitle;

  /// No description provided for @mapFutureCrowdDesc.
  ///
  /// In en, this message translates to:
  /// **'Predicted quiet-to-packed windows on each stop in Plan my day.'**
  String get mapFutureCrowdDesc;

  /// No description provided for @mapFutureParkingTitle.
  ///
  /// In en, this message translates to:
  /// **'Parking outlook'**
  String get mapFutureParkingTitle;

  /// No description provided for @mapFutureParkingDesc.
  ///
  /// In en, this message translates to:
  /// **'Estimated valet, garage, and arrival friction before you go.'**
  String get mapFutureParkingDesc;

  /// No description provided for @mapFutureTrafficTitle.
  ///
  /// In en, this message translates to:
  /// **'Drive friction score'**
  String get mapFutureTrafficTitle;

  /// No description provided for @mapFutureTrafficDesc.
  ///
  /// In en, this message translates to:
  /// **'Stress-weighted leg scores on your day plan — not just drive minutes.'**
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

  /// No description provided for @tripsEditDates.
  ///
  /// In en, this message translates to:
  /// **'Trip dates'**
  String get tripsEditDates;

  /// No description provided for @tripsSaveDates.
  ///
  /// In en, this message translates to:
  /// **'Save dates'**
  String get tripsSaveDates;

  /// No description provided for @tripsDatesUpdated.
  ///
  /// In en, this message translates to:
  /// **'Trip dates updated'**
  String get tripsDatesUpdated;

  /// No description provided for @tripsDatesFlexible.
  ///
  /// In en, this message translates to:
  /// **'Dates flexible'**
  String get tripsDatesFlexible;

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

  /// No description provided for @tripsOpenAgenda.
  ///
  /// In en, this message translates to:
  /// **'Open full agenda'**
  String get tripsOpenAgenda;

  /// No description provided for @tripsOpenTimeline.
  ///
  /// In en, this message translates to:
  /// **'Open full timeline'**
  String get tripsOpenTimeline;

  /// No description provided for @tripsShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get tripsShare;

  /// No description provided for @shareItineraryFooter.
  ///
  /// In en, this message translates to:
  /// **'Planned with Luxora — your emotionally intelligent Florida companion.'**
  String get shareItineraryFooter;

  /// No description provided for @shareSubject.
  ///
  /// In en, this message translates to:
  /// **'My {title}'**
  String shareSubject(String title);

  /// No description provided for @itineraryBadge.
  ///
  /// In en, this message translates to:
  /// **'YOUR AGENDA'**
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

  /// No description provided for @detailTravelIntelTitle.
  ///
  /// In en, this message translates to:
  /// **'Trip friction outlook'**
  String get detailTravelIntelTitle;

  /// No description provided for @detailTravelIntelSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Predicted from category, time, and distance — not live sensors.'**
  String get detailTravelIntelSubtitle;

  /// No description provided for @detailCrowdOutlook.
  ///
  /// In en, this message translates to:
  /// **'Crowd: {level}'**
  String detailCrowdOutlook(String level);

  /// No description provided for @detailParkingOutlook.
  ///
  /// In en, this message translates to:
  /// **'Parking: {level}'**
  String detailParkingOutlook(String level);

  /// No description provided for @detailDriveFrictionOutlook.
  ///
  /// In en, this message translates to:
  /// **'Drive friction: {score}/90'**
  String detailDriveFrictionOutlook(int score);

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

  /// No description provided for @detailDriveFromHub.
  ///
  /// In en, this message translates to:
  /// **'{time} drive from {hub}'**
  String detailDriveFromHub(String time, String hub);

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

  /// No description provided for @milesFromHub.
  ///
  /// In en, this message translates to:
  /// **'{distance} from {hub}'**
  String milesFromHub(String distance, String hub);

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

  /// No description provided for @onboardCityLabel.
  ///
  /// In en, this message translates to:
  /// **'Choose your city'**
  String get onboardCityLabel;

  /// No description provided for @onboardCityUnlockNote.
  ///
  /// In en, this message translates to:
  /// **'Each destination has its own concierge unlock — one-time purchase per city. Orlando theme parks are one add-on pack (Disney & Universal together).'**
  String get onboardCityUnlockNote;

  /// No description provided for @landingCityLabel.
  ///
  /// In en, this message translates to:
  /// **'Where are you going?'**
  String get landingCityLabel;

  /// No description provided for @paywallSwitchCity.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get paywallSwitchCity;

  /// No description provided for @cityPickerUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get cityPickerUnlocked;

  /// No description provided for @cityPickerUnlockPrice.
  ///
  /// In en, this message translates to:
  /// **'Unlock {price}'**
  String cityPickerUnlockPrice(String price);

  /// No description provided for @cityPickerThemeParksSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Orlando add-on · Disney & Universal together'**
  String get cityPickerThemeParksSubtitle;

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

  /// No description provided for @onboardStartDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get onboardStartDateLabel;

  /// No description provided for @onboardEndDateLabel.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get onboardEndDateLabel;

  /// No description provided for @onboardPickDate.
  ///
  /// In en, this message translates to:
  /// **'Tap to choose'**
  String get onboardPickDate;

  /// No description provided for @onboardSelectStartDate.
  ///
  /// In en, this message translates to:
  /// **'Choose start date'**
  String get onboardSelectStartDate;

  /// No description provided for @onboardSelectEndDate.
  ///
  /// In en, this message translates to:
  /// **'Choose end date'**
  String get onboardSelectEndDate;

  /// No description provided for @onboardDatesHint.
  ///
  /// In en, this message translates to:
  /// **'You can change these anytime from your Trips tab.'**
  String get onboardDatesHint;

  /// No description provided for @onboardStepBudgetTitle.
  ///
  /// In en, this message translates to:
  /// **'Plan with ease'**
  String get onboardStepBudgetTitle;

  /// No description provided for @onboardStepBudgetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What feels right for this escape?'**
  String get onboardStepBudgetSubtitle;

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

  /// No description provided for @weatherToday.
  ///
  /// In en, this message translates to:
  /// **'Right now in {place}'**
  String weatherToday(String place);

  /// No description provided for @weatherSunset.
  ///
  /// In en, this message translates to:
  /// **'Sunset {time}'**
  String weatherSunset(String time);

  /// No description provided for @weatherRainNote.
  ///
  /// In en, this message translates to:
  /// **'{percent}% chance of rain — pack a light layer.'**
  String weatherRainNote(int percent);

  /// No description provided for @weatherConditionClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get weatherConditionClear;

  /// No description provided for @weatherConditionPartlyCloudy.
  ///
  /// In en, this message translates to:
  /// **'Partly cloudy'**
  String get weatherConditionPartlyCloudy;

  /// No description provided for @weatherConditionCloudy.
  ///
  /// In en, this message translates to:
  /// **'Cloudy'**
  String get weatherConditionCloudy;

  /// No description provided for @weatherConditionFog.
  ///
  /// In en, this message translates to:
  /// **'Fog'**
  String get weatherConditionFog;

  /// No description provided for @weatherConditionDrizzle.
  ///
  /// In en, this message translates to:
  /// **'Drizzle'**
  String get weatherConditionDrizzle;

  /// No description provided for @weatherConditionRain.
  ///
  /// In en, this message translates to:
  /// **'Rain'**
  String get weatherConditionRain;

  /// No description provided for @weatherConditionSnow.
  ///
  /// In en, this message translates to:
  /// **'Snow'**
  String get weatherConditionSnow;

  /// No description provided for @weatherConditionThunder.
  ///
  /// In en, this message translates to:
  /// **'Thunderstorms'**
  String get weatherConditionThunder;

  /// No description provided for @weatherConciergeTitle.
  ///
  /// In en, this message translates to:
  /// **'Weather Concierge'**
  String get weatherConciergeTitle;

  /// No description provided for @weatherConciergeTapHint.
  ///
  /// In en, this message translates to:
  /// **'Tap for travel-aware forecast'**
  String get weatherConciergeTapHint;

  /// No description provided for @weatherConciergeAdviceTitle.
  ///
  /// In en, this message translates to:
  /// **'Luxora Weather Advice'**
  String get weatherConciergeAdviceTitle;

  /// No description provided for @weatherFeelsLike.
  ///
  /// In en, this message translates to:
  /// **'Feels like {temp}'**
  String weatherFeelsLike(String temp);

  /// No description provided for @weatherHumidity.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get weatherHumidity;

  /// No description provided for @weatherWind.
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get weatherWind;

  /// No description provided for @weatherWindValue.
  ///
  /// In en, this message translates to:
  /// **'{dir} at {speed} mph'**
  String weatherWindValue(String dir, int speed);

  /// No description provided for @weatherUv.
  ///
  /// In en, this message translates to:
  /// **'UV index'**
  String get weatherUv;

  /// No description provided for @weatherCloudCover.
  ///
  /// In en, this message translates to:
  /// **'Cloud cover'**
  String get weatherCloudCover;

  /// No description provided for @weatherVisibility.
  ///
  /// In en, this message translates to:
  /// **'Visibility'**
  String get weatherVisibility;

  /// No description provided for @weatherVisibilityMiles.
  ///
  /// In en, this message translates to:
  /// **'{miles} mi'**
  String weatherVisibilityMiles(String miles);

  /// No description provided for @weatherSunrise.
  ///
  /// In en, this message translates to:
  /// **'Sunrise {time}'**
  String weatherSunrise(String time);

  /// No description provided for @weatherStatRain.
  ///
  /// In en, this message translates to:
  /// **'Rain'**
  String get weatherStatRain;

  /// No description provided for @weatherWhatToBring.
  ///
  /// In en, this message translates to:
  /// **'What to Bring Today'**
  String get weatherWhatToBring;

  /// No description provided for @weatherPlanImpact.
  ///
  /// In en, this message translates to:
  /// **'Impact on Your Plan'**
  String get weatherPlanImpact;

  /// No description provided for @weatherHourlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Hourly outlook'**
  String get weatherHourlyTitle;

  /// No description provided for @weatherHourlyUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Hourly forecast will appear when data loads.'**
  String get weatherHourlyUnavailable;

  /// No description provided for @weatherLiveRadar.
  ///
  /// In en, this message translates to:
  /// **'Live Radar'**
  String get weatherLiveRadar;

  /// No description provided for @weatherRadarComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Live radar coming soon.'**
  String get weatherRadarComingSoon;

  /// No description provided for @weatherRadarPlay.
  ///
  /// In en, this message translates to:
  /// **'Play loop'**
  String get weatherRadarPlay;

  /// No description provided for @weatherRadarPause.
  ///
  /// In en, this message translates to:
  /// **'Pause loop'**
  String get weatherRadarPause;

  /// No description provided for @weatherRadarTapToExpand.
  ///
  /// In en, this message translates to:
  /// **'Tap for full screen'**
  String get weatherRadarTapToExpand;

  /// No description provided for @weatherRadarNow.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get weatherRadarNow;

  /// No description provided for @weatherRadarMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min ago'**
  String weatherRadarMinutesAgo(int minutes);

  /// No description provided for @weatherRadarMinutesAhead.
  ///
  /// In en, this message translates to:
  /// **'+{minutes} min'**
  String weatherRadarMinutesAhead(int minutes);

  /// No description provided for @weatherRadarStepBack.
  ///
  /// In en, this message translates to:
  /// **'Earlier frame'**
  String get weatherRadarStepBack;

  /// No description provided for @weatherRadarStepForward.
  ///
  /// In en, this message translates to:
  /// **'Later frame'**
  String get weatherRadarStepForward;

  /// No description provided for @weatherRadarJumpNow.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get weatherRadarJumpNow;

  /// No description provided for @weatherRadarJump1h.
  ///
  /// In en, this message translates to:
  /// **'−1 hr'**
  String get weatherRadarJump1h;

  /// No description provided for @weatherRadarJump2h.
  ///
  /// In en, this message translates to:
  /// **'−2 hr'**
  String get weatherRadarJump2h;

  /// No description provided for @weatherRadarJump30m.
  ///
  /// In en, this message translates to:
  /// **'+30 min'**
  String get weatherRadarJump30m;

  /// No description provided for @weatherRadarSpeedSlow.
  ///
  /// In en, this message translates to:
  /// **'Slow'**
  String get weatherRadarSpeedSlow;

  /// No description provided for @weatherRadarSpeedNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get weatherRadarSpeedNormal;

  /// No description provided for @weatherRadarSpeedFast.
  ///
  /// In en, this message translates to:
  /// **'Fast'**
  String get weatherRadarSpeedFast;

  /// No description provided for @weatherRadarLoopNote.
  ///
  /// In en, this message translates to:
  /// **'Radar loop: past ~2 hours in 10‑minute steps, plus short-range nowcast when available — not a 4‑hour forecast.'**
  String get weatherRadarLoopNote;

  /// No description provided for @shareMapPreviewCaption.
  ///
  /// In en, this message translates to:
  /// **'Map preview · open in Luxora for live directions'**
  String get shareMapPreviewCaption;

  /// No description provided for @shareRadarPreviewCaption.
  ///
  /// In en, this message translates to:
  /// **'Live Doppler radar · open in Luxora for the full loop'**
  String get shareRadarPreviewCaption;

  /// No description provided for @weatherMapOverlays.
  ///
  /// In en, this message translates to:
  /// **'Map overlays'**
  String get weatherMapOverlays;

  /// No description provided for @weatherOverlayPrecip.
  ///
  /// In en, this message translates to:
  /// **'Precipitation'**
  String get weatherOverlayPrecip;

  /// No description provided for @weatherOverlayTemp.
  ///
  /// In en, this message translates to:
  /// **'Temperature'**
  String get weatherOverlayTemp;

  /// No description provided for @weatherOverlayWind.
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get weatherOverlayWind;

  /// No description provided for @weatherOverlayCloud.
  ///
  /// In en, this message translates to:
  /// **'Cloud cover'**
  String get weatherOverlayCloud;

  /// No description provided for @weatherComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get weatherComingSoon;

  /// No description provided for @weatherAdjustDay.
  ///
  /// In en, this message translates to:
  /// **'Adjust My Day for Weather'**
  String get weatherAdjustDay;

  /// No description provided for @weatherBestOutdoorWindow.
  ///
  /// In en, this message translates to:
  /// **'Best outdoor window'**
  String get weatherBestOutdoorWindow;

  /// No description provided for @weatherRainWindow.
  ///
  /// In en, this message translates to:
  /// **'Rain likely'**
  String get weatherRainWindow;

  /// No description provided for @weatherSunsetRec.
  ///
  /// In en, this message translates to:
  /// **'Sunset recommendation'**
  String get weatherSunsetRec;

  /// No description provided for @weatherOutdoorAtRisk.
  ///
  /// In en, this message translates to:
  /// **'{count} outdoor stops may be affected'**
  String weatherOutdoorAtRisk(int count);

  /// No description provided for @weatherIndoorBackup.
  ///
  /// In en, this message translates to:
  /// **'Indoor backup ideas'**
  String get weatherIndoorBackup;

  /// No description provided for @weatherAdviceLightJacket.
  ///
  /// In en, this message translates to:
  /// **'Bring a light jacket this evening.'**
  String get weatherAdviceLightJacket;

  /// No description provided for @weatherAdviceOutdoorBefore.
  ///
  /// In en, this message translates to:
  /// **'Plan outdoor activities before {time}.'**
  String weatherAdviceOutdoorBefore(String time);

  /// No description provided for @weatherAdviceHighUv.
  ///
  /// In en, this message translates to:
  /// **'High UV today — bring sunscreen and avoid long direct sun exposure midday.'**
  String get weatherAdviceHighUv;

  /// No description provided for @weatherAdviceRainLater.
  ///
  /// In en, this message translates to:
  /// **'Rain risk increases later today, so move indoor experiences to the afternoon.'**
  String get weatherAdviceRainLater;

  /// No description provided for @weatherAdviceWindBeach.
  ///
  /// In en, this message translates to:
  /// **'Wind may make beach or boat activities less comfortable today.'**
  String get weatherAdviceWindBeach;

  /// No description provided for @weatherAdviceGreatSunset.
  ///
  /// In en, this message translates to:
  /// **'Great sunset conditions tonight — consider a rooftop dinner or lake walk.'**
  String get weatherAdviceGreatSunset;

  /// No description provided for @weatherAdviceDefault.
  ///
  /// In en, this message translates to:
  /// **'Skies look manageable — follow your plan and keep a light layer handy.'**
  String get weatherAdviceDefault;

  /// No description provided for @weatherSunsetRecRooftop.
  ///
  /// In en, this message translates to:
  /// **'Clear skies near {time} — rooftop dinner or a lake walk could shine.'**
  String weatherSunsetRecRooftop(String time);

  /// No description provided for @weatherPackSunscreen.
  ///
  /// In en, this message translates to:
  /// **'Sunscreen'**
  String get weatherPackSunscreen;

  /// No description provided for @weatherPackSunglasses.
  ///
  /// In en, this message translates to:
  /// **'Sunglasses'**
  String get weatherPackSunglasses;

  /// No description provided for @weatherPackUmbrella.
  ///
  /// In en, this message translates to:
  /// **'Umbrella'**
  String get weatherPackUmbrella;

  /// No description provided for @weatherPackLightJacket.
  ///
  /// In en, this message translates to:
  /// **'Light jacket'**
  String get weatherPackLightJacket;

  /// No description provided for @weatherPackShoes.
  ///
  /// In en, this message translates to:
  /// **'Comfortable shoes'**
  String get weatherPackShoes;

  /// No description provided for @weatherPackWater.
  ///
  /// In en, this message translates to:
  /// **'Water bottle'**
  String get weatherPackWater;

  /// No description provided for @weatherPackHat.
  ///
  /// In en, this message translates to:
  /// **'Hat'**
  String get weatherPackHat;

  /// No description provided for @weatherPackPoncho.
  ///
  /// In en, this message translates to:
  /// **'Poncho'**
  String get weatherPackPoncho;

  /// No description provided for @weatherPackSwimwear.
  ///
  /// In en, this message translates to:
  /// **'Swimwear'**
  String get weatherPackSwimwear;

  /// No description provided for @weatherImpactRainLater.
  ///
  /// In en, this message translates to:
  /// **'Rain risk rises after {time}. Consider moving {outdoorStop} earlier and saving {indoorStop} for later.'**
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  );

  /// No description provided for @weatherImpactHeat.
  ///
  /// In en, this message translates to:
  /// **'High heat midday — plan outdoor walks before {time}.'**
  String weatherImpactHeat(String time);

  /// No description provided for @weatherImpactClear.
  ///
  /// In en, this message translates to:
  /// **'Skies look friendly for your outdoor plans this morning.'**
  String get weatherImpactClear;

  /// No description provided for @weatherImpactMixed.
  ///
  /// In en, this message translates to:
  /// **'{count} outdoor stops may need timing tweaks today.'**
  String weatherImpactMixed(int count);

  /// No description provided for @weatherImpactNoPlanRain.
  ///
  /// In en, this message translates to:
  /// **'Rain is in the mix — build your day with indoor anchors first.'**
  String get weatherImpactNoPlanRain;

  /// No description provided for @weatherImpactNoPlanClear.
  ///
  /// In en, this message translates to:
  /// **'Best outdoor window looks like {start}–{end} before heat or showers build.'**
  String weatherImpactNoPlanClear(String start, String end);

  /// No description provided for @weatherImpactNoPlanDefault.
  ///
  /// In en, this message translates to:
  /// **'Weather looks steady — tap Plan My Day when you\'re ready to sequence stops.'**
  String get weatherImpactNoPlanDefault;

  /// No description provided for @weatherImpactIndoorFallback.
  ///
  /// In en, this message translates to:
  /// **'a spa or museum'**
  String get weatherImpactIndoorFallback;

  /// No description provided for @hotelIntelBadge.
  ///
  /// In en, this message translates to:
  /// **'HOTEL INTELLIGENCE'**
  String get hotelIntelBadge;

  /// No description provided for @hotelIntelTitle.
  ///
  /// In en, this message translates to:
  /// **'Find Your Home Base'**
  String get hotelIntelTitle;

  /// No description provided for @hotelIntelSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Based on the trip you want to have, Luxora selects stays that shape your days — not a booking grid.'**
  String get hotelIntelSubtitle;

  /// No description provided for @hotelDiscoveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Curated for Orlando'**
  String get hotelDiscoveryTitle;

  /// No description provided for @hotelMatchmakerTeaser.
  ///
  /// In en, this message translates to:
  /// **'Tell Luxora your trip style and get three concierge-picked stays with honest tradeoffs.'**
  String get hotelMatchmakerTeaser;

  /// No description provided for @hotelMatchmakerCta.
  ///
  /// In en, this message translates to:
  /// **'AI Hotel Matchmaker'**
  String get hotelMatchmakerCta;

  /// No description provided for @hotelMatchmakerTitle.
  ///
  /// In en, this message translates to:
  /// **'Hotel Matchmaker'**
  String get hotelMatchmakerTitle;

  /// No description provided for @hotelMatchmakerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Share how you travel — Luxora recommends where to anchor your days.'**
  String get hotelMatchmakerSubtitle;

  /// No description provided for @hotelMatchmakerRun.
  ///
  /// In en, this message translates to:
  /// **'Find My Top 3 Stays'**
  String get hotelMatchmakerRun;

  /// No description provided for @hotelMatchBudget.
  ///
  /// In en, this message translates to:
  /// **'Budget comfort zone'**
  String get hotelMatchBudget;

  /// No description provided for @hotelMatchTravelers.
  ///
  /// In en, this message translates to:
  /// **'Travelers'**
  String get hotelMatchTravelers;

  /// No description provided for @hotelMatchAdults.
  ///
  /// In en, this message translates to:
  /// **'Adults'**
  String get hotelMatchAdults;

  /// No description provided for @hotelMatchKids.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get hotelMatchKids;

  /// No description provided for @hotelMatchAttractions.
  ///
  /// In en, this message translates to:
  /// **'Attractions on your list'**
  String get hotelMatchAttractions;

  /// No description provided for @hotelMatchLuxuryLevel.
  ///
  /// In en, this message translates to:
  /// **'Desired luxury level'**
  String get hotelMatchLuxuryLevel;

  /// No description provided for @hotelMatchTransport.
  ///
  /// In en, this message translates to:
  /// **'Getting around'**
  String get hotelMatchTransport;

  /// No description provided for @hotelTransportCar.
  ///
  /// In en, this message translates to:
  /// **'Rental car'**
  String get hotelTransportCar;

  /// No description provided for @hotelTransportRideshare.
  ///
  /// In en, this message translates to:
  /// **'Rideshare'**
  String get hotelTransportRideshare;

  /// No description provided for @hotelTransportShuttle.
  ///
  /// In en, this message translates to:
  /// **'Resort shuttle'**
  String get hotelTransportShuttle;

  /// No description provided for @hotelTransportWalkable.
  ///
  /// In en, this message translates to:
  /// **'Walkable neighborhood'**
  String get hotelTransportWalkable;

  /// No description provided for @hotelMatchResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your top 3 matches'**
  String get hotelMatchResultsTitle;

  /// No description provided for @hotelMatchWhyTitle.
  ///
  /// In en, this message translates to:
  /// **'Match score {score}'**
  String hotelMatchWhyTitle(int score);

  /// No description provided for @hotelMatchBestForLabel.
  ///
  /// In en, this message translates to:
  /// **'Best for:'**
  String get hotelMatchBestForLabel;

  /// No description provided for @hotelMatchItineraryLabel.
  ///
  /// In en, this message translates to:
  /// **'Itinerary:'**
  String get hotelMatchItineraryLabel;

  /// No description provided for @hotelMatchTradeoffsLabel.
  ///
  /// In en, this message translates to:
  /// **'Tradeoffs:'**
  String get hotelMatchTradeoffsLabel;

  /// No description provided for @hotelMatchNearbyLabel.
  ///
  /// In en, this message translates to:
  /// **'Nearby:'**
  String get hotelMatchNearbyLabel;

  /// No description provided for @hotelLuxoraScore.
  ///
  /// In en, this message translates to:
  /// **'Luxora'**
  String get hotelLuxoraScore;

  /// No description provided for @hotelHomeBaseBadge.
  ///
  /// In en, this message translates to:
  /// **'HOME BASE'**
  String get hotelHomeBaseBadge;

  /// No description provided for @hotelScoreLuxury.
  ///
  /// In en, this message translates to:
  /// **'Luxury'**
  String get hotelScoreLuxury;

  /// No description provided for @hotelScoreFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get hotelScoreFamily;

  /// No description provided for @hotelScoreRomance.
  ///
  /// In en, this message translates to:
  /// **'Romance'**
  String get hotelScoreRomance;

  /// No description provided for @hotelScoreWalkability.
  ///
  /// In en, this message translates to:
  /// **'Walk'**
  String get hotelScoreWalkability;

  /// No description provided for @hotelWhyRecommendTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Luxora Recommends This'**
  String get hotelWhyRecommendTitle;

  /// No description provided for @hotelItineraryImpactTitle.
  ///
  /// In en, this message translates to:
  /// **'How this shapes your days'**
  String get hotelItineraryImpactTitle;

  /// No description provided for @hotelItineraryImpactBody.
  ///
  /// In en, this message translates to:
  /// **'Rough drive from hub: {driveTime}. Travel friction score: {friction}/90 (lower is calmer).'**
  String hotelItineraryImpactBody(String driveTime, int friction);

  /// No description provided for @hotelAddHomeBase.
  ///
  /// In en, this message translates to:
  /// **'Add as Home Base'**
  String get hotelAddHomeBase;

  /// No description provided for @hotelHomeBaseActive.
  ///
  /// In en, this message translates to:
  /// **'Home Base Active'**
  String get hotelHomeBaseActive;

  /// No description provided for @hotelViewOnMap.
  ///
  /// In en, this message translates to:
  /// **'View on Map'**
  String get hotelViewOnMap;

  /// No description provided for @hotelGetDirections.
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get hotelGetDirections;

  /// No description provided for @hotelCheckRates.
  ///
  /// In en, this message translates to:
  /// **'Check Rates'**
  String get hotelCheckRates;

  /// No description provided for @hotelVisitWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit Website'**
  String get hotelVisitWebsite;

  /// No description provided for @hotelLinkUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Booking link not available for this stay yet.'**
  String get hotelLinkUnavailable;

  /// No description provided for @hotelLinkOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open link — check your browser or try again.'**
  String get hotelLinkOpenFailed;

  /// No description provided for @hotelSave.
  ///
  /// In en, this message translates to:
  /// **'Save Hotel'**
  String get hotelSave;

  /// No description provided for @hotelSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get hotelSaved;

  /// No description provided for @hotelDistanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Distance to key spots'**
  String get hotelDistanceTitle;

  /// No description provided for @hotelCompareTitle.
  ///
  /// In en, this message translates to:
  /// **'Compare Stays'**
  String get hotelCompareTitle;

  /// No description provided for @hotelCompareSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Side-by-side concierge view — up to three hotels.'**
  String get hotelCompareSubtitle;

  /// No description provided for @hotelCompareSelected.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String hotelCompareSelected(int count);

  /// No description provided for @hotelComparePrice.
  ///
  /// In en, this message translates to:
  /// **'Price range'**
  String get hotelComparePrice;

  /// No description provided for @hotelCompareDriveImpact.
  ///
  /// In en, this message translates to:
  /// **'Drive impact'**
  String get hotelCompareDriveImpact;

  /// No description provided for @hotelCompareNearby.
  ///
  /// In en, this message translates to:
  /// **'Nearby highlights'**
  String get hotelCompareNearby;

  /// No description provided for @hotelPriceBudget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get hotelPriceBudget;

  /// No description provided for @hotelPriceModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get hotelPriceModerate;

  /// No description provided for @hotelPriceUpscale.
  ///
  /// In en, this message translates to:
  /// **'Upscale'**
  String get hotelPriceUpscale;

  /// No description provided for @hotelPriceLuxury.
  ///
  /// In en, this message translates to:
  /// **'Luxury'**
  String get hotelPriceLuxury;

  /// No description provided for @hotelTagCouples.
  ///
  /// In en, this message translates to:
  /// **'Best for couples'**
  String get hotelTagCouples;

  /// No description provided for @hotelTagDisney.
  ///
  /// In en, this message translates to:
  /// **'Best for Disney'**
  String get hotelTagDisney;

  /// No description provided for @hotelTagUniversal.
  ///
  /// In en, this message translates to:
  /// **'Best for Universal'**
  String get hotelTagUniversal;

  /// No description provided for @hotelTagLuxuryStaycation.
  ///
  /// In en, this message translates to:
  /// **'Luxury staycation'**
  String get hotelTagLuxuryStaycation;

  /// No description provided for @hotelTagFamily.
  ///
  /// In en, this message translates to:
  /// **'Family friendly'**
  String get hotelTagFamily;

  /// No description provided for @hotelTagQuiet.
  ///
  /// In en, this message translates to:
  /// **'Quiet escape'**
  String get hotelTagQuiet;

  /// No description provided for @hotelTagWalkableDining.
  ///
  /// In en, this message translates to:
  /// **'Walkable dining'**
  String get hotelTagWalkableDining;

  /// No description provided for @hotelTagResort.
  ///
  /// In en, this message translates to:
  /// **'Resort feel'**
  String get hotelTagResort;

  /// No description provided for @hotelTagBudget.
  ///
  /// In en, this message translates to:
  /// **'Budget friendly'**
  String get hotelTagBudget;

  /// No description provided for @hotelReasonMatchesMood.
  ///
  /// In en, this message translates to:
  /// **'Matches your trip mood and pace.'**
  String get hotelReasonMatchesMood;

  /// No description provided for @hotelReasonCloseStops.
  ///
  /// In en, this message translates to:
  /// **'Close to planned stops on your timeline.'**
  String get hotelReasonCloseStops;

  /// No description provided for @hotelReasonSavesDrive.
  ///
  /// In en, this message translates to:
  /// **'Saves drive time vs. a generic hub — about {time} from center.'**
  String hotelReasonSavesDrive(String time);

  /// No description provided for @hotelReasonFitsBudget.
  ///
  /// In en, this message translates to:
  /// **'Fits a {range} comfort zone without overspending on the wrong resort.'**
  String hotelReasonFitsBudget(String range);

  /// No description provided for @hotelReasonBetterGroup.
  ///
  /// In en, this message translates to:
  /// **'Better suited to your group type and energy level.'**
  String get hotelReasonBetterGroup;

  /// No description provided for @hotelReasonNearbyDining.
  ///
  /// In en, this message translates to:
  /// **'Strong nearby dining for effortless evenings.'**
  String get hotelReasonNearbyDining;

  /// No description provided for @hotelReasonLowStress.
  ///
  /// In en, this message translates to:
  /// **'Resort-style calm — less logistics, more vacation.'**
  String get hotelReasonLowStress;

  /// No description provided for @hotelMatchAttractionsGeneral.
  ///
  /// In en, this message translates to:
  /// **'your planned attractions'**
  String get hotelMatchAttractionsGeneral;

  /// No description provided for @hotelMatchWhyMulti.
  ///
  /// In en, this message translates to:
  /// **'Based on your {attractions} itinerary, {hotel} reduces drive time and keeps evenings easy.'**
  String hotelMatchWhyMulti(String attractions, String hotel);

  /// No description provided for @hotelMatchWhySingle.
  ///
  /// In en, this message translates to:
  /// **'{hotel} in {neighborhood} fits how you want this trip to feel.'**
  String hotelMatchWhySingle(String hotel, String neighborhood);

  /// No description provided for @hotelMatchBestForFamily.
  ///
  /// In en, this message translates to:
  /// **'Families who want pool days without sacrificing park access.'**
  String get hotelMatchBestForFamily;

  /// No description provided for @hotelMatchBestForCouple.
  ///
  /// In en, this message translates to:
  /// **'Couples who want romance without theme-park chaos.'**
  String get hotelMatchBestForCouple;

  /// No description provided for @hotelMatchBestForGroup.
  ///
  /// In en, this message translates to:
  /// **'Groups balancing comfort, access, and calm logistics.'**
  String get hotelMatchBestForGroup;

  /// No description provided for @hotelMatchImpactDisney.
  ///
  /// In en, this message translates to:
  /// **'Shorter Disney runs — about {time} to the parks from your door.'**
  String hotelMatchImpactDisney(String time);

  /// No description provided for @hotelMatchImpactUniversal.
  ///
  /// In en, this message translates to:
  /// **'Universal Express perks or water-taxi access can reclaim hours from your day.'**
  String get hotelMatchImpactUniversal;

  /// No description provided for @hotelMatchImpactWalkable.
  ///
  /// In en, this message translates to:
  /// **'Walk to dinner — less parking stress after long park days.'**
  String get hotelMatchImpactWalkable;

  /// No description provided for @hotelMatchImpactDefault.
  ///
  /// In en, this message translates to:
  /// **'Keeps average drives around {time} so your day flow stays relaxed.'**
  String hotelMatchImpactDefault(String time);

  /// No description provided for @hotelMatchTradeoffLuxuryBudget.
  ///
  /// In en, this message translates to:
  /// **'Premium resort pricing — budget more for the room, less elsewhere.'**
  String get hotelMatchTradeoffLuxuryBudget;

  /// No description provided for @hotelMatchTradeoffCarNeeded.
  ///
  /// In en, this message translates to:
  /// **'You\'ll rely on a car or rideshare — not a walk-everywhere base.'**
  String get hotelMatchTradeoffCarNeeded;

  /// No description provided for @hotelMatchTradeoffLessFamily.
  ///
  /// In en, this message translates to:
  /// **'Less focused on kid-centric amenities than dedicated family resorts.'**
  String get hotelMatchTradeoffLessFamily;

  /// No description provided for @hotelMatchTradeoffLessRomantic.
  ///
  /// In en, this message translates to:
  /// **'More theme-park energy than a quiet couples retreat.'**
  String get hotelMatchTradeoffLessRomantic;

  /// No description provided for @hotelMatchTradeoffDefault.
  ///
  /// In en, this message translates to:
  /// **'Every stay has tradeoffs — Luxora picked this for your priorities first.'**
  String get hotelMatchTradeoffDefault;

  /// No description provided for @hotelNearbyDefault.
  ///
  /// In en, this message translates to:
  /// **'Dining and experiences around {neighborhood}.'**
  String hotelNearbyDefault(String neighborhood);

  /// No description provided for @mapHotelIntelBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the right home base'**
  String get mapHotelIntelBannerTitle;

  /// No description provided for @mapHotelIntelBannerBody.
  ///
  /// In en, this message translates to:
  /// **'Your hotel shapes drive times, day flow, and where you eat. Luxora helps you pick — without booking pressure.'**
  String get mapHotelIntelBannerBody;

  /// No description provided for @mapHotelIntelBannerCta.
  ///
  /// In en, this message translates to:
  /// **'Explore Hotel Intelligence'**
  String get mapHotelIntelBannerCta;

  /// No description provided for @sponsorLuxoraRecommended.
  ///
  /// In en, this message translates to:
  /// **'Luxora Recommended'**
  String get sponsorLuxoraRecommended;

  /// No description provided for @sponsorBadgeFeaturedPartner.
  ///
  /// In en, this message translates to:
  /// **'Featured Partner'**
  String get sponsorBadgeFeaturedPartner;

  /// No description provided for @sponsorBadgeSponsored.
  ///
  /// In en, this message translates to:
  /// **'Sponsored'**
  String get sponsorBadgeSponsored;

  /// No description provided for @sponsorBadgePromoted.
  ///
  /// In en, this message translates to:
  /// **'Promoted'**
  String get sponsorBadgePromoted;

  /// No description provided for @sponsorBadgePartnerOffer.
  ///
  /// In en, this message translates to:
  /// **'Partner Offer'**
  String get sponsorBadgePartnerOffer;

  /// No description provided for @sponsorCtaVisitWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit Website'**
  String get sponsorCtaVisitWebsite;

  /// No description provided for @sponsorCtaBookNow.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get sponsorCtaBookNow;

  /// No description provided for @sponsorCtaCheckRates.
  ///
  /// In en, this message translates to:
  /// **'Check Rates'**
  String get sponsorCtaCheckRates;

  /// No description provided for @sponsorCtaGetTickets.
  ///
  /// In en, this message translates to:
  /// **'Get Tickets'**
  String get sponsorCtaGetTickets;

  /// No description provided for @sponsorCtaViewOffer.
  ///
  /// In en, this message translates to:
  /// **'View Offer'**
  String get sponsorCtaViewOffer;

  /// No description provided for @featuredStaysTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Stays'**
  String get featuredStaysTitle;

  /// No description provided for @featuredStaysSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Partner placements — separate from Luxora\'s organic hotel match scores.'**
  String get featuredStaysSubtitle;

  /// No description provided for @featuredExperiencesTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Experiences'**
  String get featuredExperiencesTitle;

  /// No description provided for @featuredExperiencesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Promoted picks for your mood — always labeled, never disguised as AI rank.'**
  String get featuredExperiencesSubtitle;

  /// No description provided for @featuredDiningTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Dining'**
  String get featuredDiningTitle;

  /// No description provided for @featuredDiningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Partner restaurants Luxora highlights — your organic gem list stays independent.'**
  String get featuredDiningSubtitle;

  /// No description provided for @featuredTicketPartnersTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Ticket Partners'**
  String get featuredTicketPartnersTitle;

  /// No description provided for @featuredTicketPartnersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Authorized partner offers — compare with organic savings below.'**
  String get featuredTicketPartnersSubtitle;

  /// No description provided for @featuredCityHomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Partners'**
  String get featuredCityHomeTitle;

  /// No description provided for @featuredCityHomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Helpful partner options for Orlando — clearly marked, never hidden as AI picks.'**
  String get featuredCityHomeSubtitle;

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

  /// No description provided for @paywallHeroEyebrow.
  ///
  /// In en, this message translates to:
  /// **'YOUR PERSONAL CONCIERGE'**
  String get paywallHeroEyebrow;

  /// No description provided for @paywallHeroHeadline.
  ///
  /// In en, this message translates to:
  /// **'DON\'T WASTE YOUR VACATION'**
  String get paywallHeroHeadline;

  /// No description provided for @paywallHeroSubheadline.
  ///
  /// In en, this message translates to:
  /// **'Luxora plans the trip so you can enjoy it.'**
  String get paywallHeroSubheadline;

  /// No description provided for @paywallEmotionalLine.
  ///
  /// In en, this message translates to:
  /// **'You\'re already spending thousands on your vacation. Don\'t leave the experience to chance.'**
  String get paywallEmotionalLine;

  /// No description provided for @paywallHeadlineCouples.
  ///
  /// In en, this message translates to:
  /// **'Your perfect {cityName} getaway starts here.'**
  String paywallHeadlineCouples(String cityName);

  /// No description provided for @paywallHeadlineFamily.
  ///
  /// In en, this message translates to:
  /// **'Spend less time planning and more time making memories in {cityName}.'**
  String paywallHeadlineFamily(String cityName);

  /// No description provided for @paywallHeadlineLuxury.
  ///
  /// In en, this message translates to:
  /// **'Experience {cityName} differently.'**
  String paywallHeadlineLuxury(String cityName);

  /// No description provided for @paywallHeadlineAdventure.
  ///
  /// In en, this message translates to:
  /// **'Discover the {cityName} most tourists never see.'**
  String paywallHeadlineAdventure(String cityName);

  /// No description provided for @paywallHeadlineFoodie.
  ///
  /// In en, this message translates to:
  /// **'Taste {cityName} like a local insider.'**
  String paywallHeadlineFoodie(String cityName);

  /// No description provided for @paywallWhatYouUnlock.
  ///
  /// In en, this message translates to:
  /// **'What You Unlock'**
  String get paywallWhatYouUnlock;

  /// No description provided for @paywallFeatureAiConcierge.
  ///
  /// In en, this message translates to:
  /// **'AI Concierge'**
  String get paywallFeatureAiConcierge;

  /// No description provided for @paywallFeatureItineraries.
  ///
  /// In en, this message translates to:
  /// **'Personalized Itineraries'**
  String get paywallFeatureItineraries;

  /// No description provided for @paywallFeatureHiddenGems.
  ///
  /// In en, this message translates to:
  /// **'Hidden Gems'**
  String get paywallFeatureHiddenGems;

  /// No description provided for @paywallFeatureHotelIntel.
  ///
  /// In en, this message translates to:
  /// **'Hotel Intelligence'**
  String get paywallFeatureHotelIntel;

  /// No description provided for @paywallFeatureTicketSavings.
  ///
  /// In en, this message translates to:
  /// **'Smart Ticket Savings'**
  String get paywallFeatureTicketSavings;

  /// No description provided for @paywallFeatureWeatherConcierge.
  ///
  /// In en, this message translates to:
  /// **'Weather Concierge'**
  String get paywallFeatureWeatherConcierge;

  /// No description provided for @paywallFeatureCrowdIntel.
  ///
  /// In en, this message translates to:
  /// **'Crowd Intelligence'**
  String get paywallFeatureCrowdIntel;

  /// No description provided for @paywallFeatureGpsNav.
  ///
  /// In en, this message translates to:
  /// **'GPS Navigation'**
  String get paywallFeatureGpsNav;

  /// No description provided for @paywallFeatureLocalSecrets.
  ///
  /// In en, this message translates to:
  /// **'Local Secrets'**
  String get paywallFeatureLocalSecrets;

  /// No description provided for @paywallFeatureDining.
  ///
  /// In en, this message translates to:
  /// **'Dining Recommendations'**
  String get paywallFeatureDining;

  /// No description provided for @paywallFeatureUnlimitedPlanning.
  ///
  /// In en, this message translates to:
  /// **'Unlimited City Planning'**
  String get paywallFeatureUnlimitedPlanning;

  /// No description provided for @paywallWhyTravelersUnlock.
  ///
  /// In en, this message translates to:
  /// **'Why Travelers Unlock Luxora'**
  String get paywallWhyTravelersUnlock;

  /// No description provided for @paywallBenefitSaveTimeTitle.
  ///
  /// In en, this message translates to:
  /// **'Save Time'**
  String get paywallBenefitSaveTimeTitle;

  /// No description provided for @paywallBenefitSaveTimeBody.
  ///
  /// In en, this message translates to:
  /// **'Skip hours of research and planning.'**
  String get paywallBenefitSaveTimeBody;

  /// No description provided for @paywallBenefitSaveMoneyTitle.
  ///
  /// In en, this message translates to:
  /// **'Save Money'**
  String get paywallBenefitSaveMoneyTitle;

  /// No description provided for @paywallBenefitSaveMoneyBody.
  ///
  /// In en, this message translates to:
  /// **'Discover ticket savings, local deals, and smarter choices.'**
  String get paywallBenefitSaveMoneyBody;

  /// No description provided for @paywallBenefitAvoidTrapsTitle.
  ///
  /// In en, this message translates to:
  /// **'Avoid Tourist Traps'**
  String get paywallBenefitAvoidTrapsTitle;

  /// No description provided for @paywallBenefitAvoidTrapsBody.
  ///
  /// In en, this message translates to:
  /// **'Find experiences locals actually recommend.'**
  String get paywallBenefitAvoidTrapsBody;

  /// No description provided for @paywallBenefitTravelSmarterTitle.
  ///
  /// In en, this message translates to:
  /// **'Travel Smarter'**
  String get paywallBenefitTravelSmarterTitle;

  /// No description provided for @paywallBenefitTravelSmarterBody.
  ///
  /// In en, this message translates to:
  /// **'Get recommendations based on weather, crowds, and your trip style.'**
  String get paywallBenefitTravelSmarterBody;

  /// No description provided for @paywallLockedPreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Waiting Inside Your Concierge'**
  String get paywallLockedPreviewTitle;

  /// No description provided for @paywallLockedPreviewSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock to reveal routes and secrets tailored to your trip.'**
  String get paywallLockedPreviewSubtitle;

  /// No description provided for @paywallLockedDateNight.
  ///
  /// In en, this message translates to:
  /// **'Romantic Date Night Routes'**
  String get paywallLockedDateNight;

  /// No description provided for @paywallLockedHiddenLuxury.
  ///
  /// In en, this message translates to:
  /// **'Hidden Luxury Experiences'**
  String get paywallLockedHiddenLuxury;

  /// No description provided for @paywallLockedVipSecrets.
  ///
  /// In en, this message translates to:
  /// **'VIP Local Secrets'**
  String get paywallLockedVipSecrets;

  /// No description provided for @paywallLockedConciergeRecs.
  ///
  /// In en, this message translates to:
  /// **'Concierge Recommendations'**
  String get paywallLockedConciergeRecs;

  /// No description provided for @paywallLockedFamilyPlans.
  ///
  /// In en, this message translates to:
  /// **'Family Stress-Free Plans'**
  String get paywallLockedFamilyPlans;

  /// No description provided for @paywallLockedWeatherReroute.
  ///
  /// In en, this message translates to:
  /// **'Weather-Aware Rerouting'**
  String get paywallLockedWeatherReroute;

  /// No description provided for @paywallLockedHotelMatchmaker.
  ///
  /// In en, this message translates to:
  /// **'Smart Hotel Matchmaker'**
  String get paywallLockedHotelMatchmaker;

  /// No description provided for @paywallUnlockCityConcierge.
  ///
  /// In en, this message translates to:
  /// **'Unlock {cityName} Concierge'**
  String paywallUnlockCityConcierge(String cityName);

  /// No description provided for @paywallOneTimePurchase.
  ///
  /// In en, this message translates to:
  /// **'One-Time Purchase'**
  String get paywallOneTimePurchase;

  /// No description provided for @paywallNoSubscription.
  ///
  /// In en, this message translates to:
  /// **'No Subscription'**
  String get paywallNoSubscription;

  /// No description provided for @paywallNoMonthlyFees.
  ///
  /// In en, this message translates to:
  /// **'No Monthly Fees'**
  String get paywallNoMonthlyFees;

  /// No description provided for @paywallLifetimeAccess.
  ///
  /// In en, this message translates to:
  /// **'Lifetime {cityName} Access'**
  String paywallLifetimeAccess(String cityName);

  /// No description provided for @paywallFutureUpdatesIncluded.
  ///
  /// In en, this message translates to:
  /// **'Future {cityName} Updates Included'**
  String paywallFutureUpdatesIncluded(String cityName);

  /// No description provided for @paywallMostVacationsCost.
  ///
  /// In en, this message translates to:
  /// **'Most {cityName} vacations cost {minUsd}–{maxUsd}+'**
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  );

  /// No description provided for @paywallLuxoraPriceLine.
  ///
  /// In en, this message translates to:
  /// **'{price} One Time'**
  String paywallLuxoraPriceLine(String price);

  /// No description provided for @paywallLessThanDinner.
  ///
  /// In en, this message translates to:
  /// **'Less than the cost of a vacation dinner.'**
  String get paywallLessThanDinner;

  /// No description provided for @paywallSocialProofTitle.
  ///
  /// In en, this message translates to:
  /// **'Travelers Who Unlocked Luxora'**
  String get paywallSocialProofTitle;

  /// No description provided for @paywallReview1.
  ///
  /// In en, this message translates to:
  /// **'\"Saved us hours of planning.\"'**
  String get paywallReview1;

  /// No description provided for @paywallReview2.
  ///
  /// In en, this message translates to:
  /// **'\"Found places we never would have discovered.\"'**
  String get paywallReview2;

  /// No description provided for @paywallReview3.
  ///
  /// In en, this message translates to:
  /// **'\"Worth it for the hidden gems alone.\"'**
  String get paywallReview3;

  /// No description provided for @paywallCtaUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock {cityName} Concierge'**
  String paywallCtaUnlock(String cityName);

  /// No description provided for @paywallContinueExploring.
  ///
  /// In en, this message translates to:
  /// **'Continue Exploring'**
  String get paywallContinueExploring;

  /// No description provided for @paywallConciergePromise.
  ///
  /// In en, this message translates to:
  /// **'One-time purchase · Personal concierge · No subscription'**
  String get paywallConciergePromise;

  /// No description provided for @settingsUnlockConciergeTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock city concierge'**
  String get settingsUnlockConciergeTitle;

  /// No description provided for @settingsUnlockConciergeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'One-time city pack — not a subscription'**
  String get settingsUnlockConciergeSubtitle;

  /// No description provided for @settingsOpenConciergeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Open your AI concierge tab'**
  String get settingsOpenConciergeSubtitle;

  /// No description provided for @weatherMiamiHumidityIndoor.
  ///
  /// In en, this message translates to:
  /// **'High humidity today. Hit the beach or pool earlier, then Wynwood or Brickell for indoor dining and galleries during the hottest hours.'**
  String get weatherMiamiHumidityIndoor;

  /// No description provided for @weatherMiamiHeatAdvisory.
  ///
  /// In en, this message translates to:
  /// **'Heat advisory conditions — light fabrics, hydration, and shade breaks between outdoor stops.'**
  String get weatherMiamiHeatAdvisory;

  /// No description provided for @weatherMiamiBeachMorning.
  ///
  /// In en, this message translates to:
  /// **'Strong UV on the sand — sunscreen, hat, and beach time before midday.'**
  String get weatherMiamiBeachMorning;

  /// No description provided for @weatherMiamiBoatWind.
  ///
  /// In en, this message translates to:
  /// **'Wind is elevated — reconsider boat or yacht activities; rooftop dining may still work.'**
  String get weatherMiamiBoatWind;

  /// No description provided for @weatherMiamiRainReroute.
  ///
  /// In en, this message translates to:
  /// **'Rain window ahead — swap outdoor plans for {indoorSpot} or gallery time.'**
  String weatherMiamiRainReroute(String indoorSpot);

  /// No description provided for @weatherMiamiSunsetWaterfront.
  ///
  /// In en, this message translates to:
  /// **'Sunset looks strong — waterfront or rooftop with an east-to-west view.'**
  String get weatherMiamiSunsetWaterfront;

  /// No description provided for @miamiBeachIntelTitle.
  ///
  /// In en, this message translates to:
  /// **'Beach Intelligence'**
  String get miamiBeachIntelTitle;

  /// No description provided for @miamiBeachBestTime.
  ///
  /// In en, this message translates to:
  /// **'Best time: {time}'**
  String miamiBeachBestTime(String time);

  /// No description provided for @miamiBeachFamilyScore.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get miamiBeachFamilyScore;

  /// No description provided for @miamiBeachCrowdScore.
  ///
  /// In en, this message translates to:
  /// **'Crowd'**
  String get miamiBeachCrowdScore;

  /// No description provided for @miamiBeachPhotoScore.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get miamiBeachPhotoScore;

  /// No description provided for @miamiBeachRomanceScore.
  ///
  /// In en, this message translates to:
  /// **'Romance'**
  String get miamiBeachRomanceScore;

  /// No description provided for @miamiBeachSunsetScore.
  ///
  /// In en, this message translates to:
  /// **'Sunset'**
  String get miamiBeachSunsetScore;

  /// No description provided for @miamiBeachParking.
  ///
  /// In en, this message translates to:
  /// **'Parking: {level}'**
  String miamiBeachParking(String level);

  /// No description provided for @miamiNightlifeTitle.
  ///
  /// In en, this message translates to:
  /// **'Nightlife Concierge'**
  String get miamiNightlifeTitle;

  /// No description provided for @miamiNightlifeDressCode.
  ///
  /// In en, this message translates to:
  /// **'Dress code: {code}'**
  String miamiNightlifeDressCode(String code);

  /// No description provided for @miamiNightlifeArrival.
  ///
  /// In en, this message translates to:
  /// **'Best arrival: {time}'**
  String miamiNightlifeArrival(String time);

  /// No description provided for @miamiNightlifeReservation.
  ///
  /// In en, this message translates to:
  /// **'Reservation recommended'**
  String get miamiNightlifeReservation;

  /// No description provided for @miamiMoodRoutesTitle.
  ///
  /// In en, this message translates to:
  /// **'Miami Mood Routes'**
  String get miamiMoodRoutesTitle;

  /// No description provided for @miamiMoodRouteStart.
  ///
  /// In en, this message translates to:
  /// **'Start around {time}'**
  String miamiMoodRouteStart(String time);

  /// No description provided for @keysWaterIntelTitle.
  ///
  /// In en, this message translates to:
  /// **'Keys Water Intelligence'**
  String get keysWaterIntelTitle;

  /// No description provided for @keysWaterBestTime.
  ///
  /// In en, this message translates to:
  /// **'Best window: {time}'**
  String keysWaterBestTime(String time);

  /// No description provided for @keysWaterTemp.
  ///
  /// In en, this message translates to:
  /// **'Water: {note}'**
  String keysWaterTemp(String note);

  /// No description provided for @keysWaterSnorkelScore.
  ///
  /// In en, this message translates to:
  /// **'Snorkel'**
  String get keysWaterSnorkelScore;

  /// No description provided for @keysWaterDivingScore.
  ///
  /// In en, this message translates to:
  /// **'Dive'**
  String get keysWaterDivingScore;

  /// No description provided for @keysWaterBoatingScore.
  ///
  /// In en, this message translates to:
  /// **'Boat'**
  String get keysWaterBoatingScore;

  /// No description provided for @keysWaterFishingScore.
  ///
  /// In en, this message translates to:
  /// **'Fish'**
  String get keysWaterFishingScore;

  /// No description provided for @keysWaterWindScore.
  ///
  /// In en, this message translates to:
  /// **'Wind'**
  String get keysWaterWindScore;

  /// No description provided for @keysWaterSunsetScore.
  ///
  /// In en, this message translates to:
  /// **'Sunset'**
  String get keysWaterSunsetScore;

  /// No description provided for @keysWaterCrowdScore.
  ///
  /// In en, this message translates to:
  /// **'Crowd'**
  String get keysWaterCrowdScore;

  /// No description provided for @keysMoodRoutesTitle.
  ///
  /// In en, this message translates to:
  /// **'Keys Island Routes'**
  String get keysMoodRoutesTitle;

  /// No description provided for @keysMoodRouteStart.
  ///
  /// In en, this message translates to:
  /// **'Start {time}'**
  String keysMoodRouteStart(String time);

  /// No description provided for @paywallHeadlineMiamiDefault.
  ///
  /// In en, this message translates to:
  /// **'EXPERIENCE MIAMI DIFFERENTLY'**
  String get paywallHeadlineMiamiDefault;

  /// No description provided for @paywallHeadlineMiamiWeekend.
  ///
  /// In en, this message translates to:
  /// **'DON\'T WASTE YOUR MIAMI WEEKEND'**
  String get paywallHeadlineMiamiWeekend;

  /// No description provided for @paywallOrlandoAddonsHeading.
  ///
  /// In en, this message translates to:
  /// **'Theme park pack'**
  String get paywallOrlandoAddonsHeading;

  /// No description provided for @paywallOrlandoBaseIncludes.
  ///
  /// In en, this message translates to:
  /// **'Orlando unlock includes dining, hidden gems, hotels, and non-park experiences. Add the theme park pack for Disney and Universal together.'**
  String get paywallOrlandoBaseIncludes;

  /// No description provided for @paywallAddonThemeParksTitle.
  ///
  /// In en, this message translates to:
  /// **'Disney & Universal Pack'**
  String get paywallAddonThemeParksTitle;

  /// No description provided for @paywallAddonThemeParksSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Walt Disney World and Universal Orlando — all parks, deals, routes, and crowd intel in one unlock.'**
  String get paywallAddonThemeParksSubtitle;

  /// No description provided for @paywallUnlockAddon.
  ///
  /// In en, this message translates to:
  /// **'Unlock {packName} · {price}'**
  String paywallUnlockAddon(String packName, String price);

  /// No description provided for @paywallAddonUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get paywallAddonUnlocked;

  /// No description provided for @paywallAddonRequiresOrlando.
  ///
  /// In en, this message translates to:
  /// **'Requires Orlando unlock first'**
  String get paywallAddonRequiresOrlando;

  /// No description provided for @paywallUnlockAddonPack.
  ///
  /// In en, this message translates to:
  /// **'Unlock {packName}'**
  String paywallUnlockAddonPack(String packName);

  /// No description provided for @paywallCtaUnlockAddon.
  ///
  /// In en, this message translates to:
  /// **'Unlock {packName}'**
  String paywallCtaUnlockAddon(String packName);

  /// No description provided for @orlandoThemeParksPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock Disney & Universal for Orlando?'**
  String get orlandoThemeParksPromptTitle;

  /// No description provided for @orlandoThemeParksPromptBody.
  ///
  /// In en, this message translates to:
  /// **'Add the theme park pack for Walt Disney World and Universal Orlando — all parks, ticket deals, routes, and crowd intel in one unlock.'**
  String get orlandoThemeParksPromptBody;

  /// No description provided for @orlandoThemeParksPromptUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock · {price}'**
  String orlandoThemeParksPromptUnlock(String price);

  /// No description provided for @orlandoThemeParksPromptNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get orlandoThemeParksPromptNotNow;
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
