// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => 'Einstellungen';

  @override
  String get appearance => 'Darstellung';

  @override
  String get settingsThemeIntro =>
      'Dunkles Kino oder helles Resort — wählen Sie die Stimmung für Ihre Reise.';

  @override
  String get settingsThemeLabel => 'Design';

  @override
  String get themeGoldenEmber => 'Golden Ember';

  @override
  String get themeGoldenEmberMood => 'Warme Ultra-Luxus';

  @override
  String get themeMidnightAmethyst => 'Midnight Amethyst';

  @override
  String get themeMidnightAmethystMood => 'Geheimnisvoll und exklusiv';

  @override
  String get themeEmeraldHaven => 'Emerald Haven';

  @override
  String get themeEmeraldHavenMood => 'Serene tropische Luxus';

  @override
  String get themeRivieraWhite => 'Riviera White';

  @override
  String get themeRivieraWhiteMood => 'Elegantes Luxus-Reisemagazin';

  @override
  String get themeCoastalGlass => 'Coastal Glass';

  @override
  String get themeCoastalGlassMood => 'Saubere Premium-Urlaubsenergie';

  @override
  String get themeChampagneLuxe => 'Champagne Luxe';

  @override
  String get themeChampagneLuxeMood => 'Private Concierge-Eleganz';

  @override
  String get themeBlackCard => 'Black Card';

  @override
  String get themeBlackCardMood => 'Prestige der Privatluftfahrt';

  @override
  String get settingsThemeSectionLuxury => 'Luxuriöses Kino';

  @override
  String get settingsThemeSectionReadable => 'Sauber und lesbar';

  @override
  String get settingsMapSkinSection => 'Karten-Basemap';

  @override
  String get settingsMapSkinIntro =>
      'Wählen Sie das Erscheinungsbild der Kartenkacheln auf der Karte.';

  @override
  String get mapSkinVoyager => 'Voyager';

  @override
  String get mapSkinVoyagerMood => 'Sanfte Farben — Parks, Wasser, Straßen';

  @override
  String get mapSkinOsm => 'OpenStreetMap';

  @override
  String get mapSkinOsmMood => 'Klassisch, natürliche Töne';

  @override
  String get mapSkinCartoLight => 'Carto Light';

  @override
  String get mapSkinCartoLightMood => 'Minimal und hell';

  @override
  String get mapSkinCartoDark => 'Carto Dark';

  @override
  String get mapSkinCartoDarkMood => 'Nachtfreundliche Basemap';

  @override
  String get mapSkinMapboxStreets => 'Mapbox Streets';

  @override
  String get mapSkinMapboxStreetsMood => 'Reich an Details, Reise-App-Look';

  @override
  String get mapSkinMapboxOutdoors => 'Mapbox Outdoors';

  @override
  String get mapSkinMapboxOutdoorsMood => 'Grün und Gelände betont';

  @override
  String get dark_mode => 'Dunkler Modus';

  @override
  String get light_mode => 'Heller Modus';

  @override
  String get language => 'Sprache';

  @override
  String get settings_language_picker_note =>
      'Änderungen werden sofort übernommen.';

  @override
  String get settings_regions_coming_title => 'Länder und Städte';

  @override
  String get settings_regions_coming_subtitle =>
      'Home-Hub und Städtepakete, bald verfügbar.';

  @override
  String get commonSoon => 'Bald';

  @override
  String get commonContinue => 'Weiter';

  @override
  String get commonNew => 'Neu';

  @override
  String get commonRoadmap => 'Roadmap';

  @override
  String get commonLive => 'Live';

  @override
  String get commonClose => 'Schließen';

  @override
  String get commonCancel => 'Stornieren';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get settingsStartOverSubtitle => 'Beginnen Sie eine völlig neue Reise';

  @override
  String get navConcierge => 'Portier';

  @override
  String get navAgenda => 'Heute';

  @override
  String get navDiscover => 'Entdecken';

  @override
  String get navMap => 'Karte';

  @override
  String get navTrips => 'Reisen';

  @override
  String get navMore => 'Mehr';

  @override
  String get navRestaurants => 'Restaurants';

  @override
  String get navTimeline => 'Zeitplan';

  @override
  String get agendaTabItinerary => 'Tage';

  @override
  String get agendaTabRestaurants => 'Restaurants';

  @override
  String get restaurantsPageTitle => 'Restaurants';

  @override
  String get restaurantsPageSubtitle =>
      'Stöbern Sie in den Restaurants, die Luxora kennt – speichern Sie Ihre Favoriten oder lassen Sie den Concierge das heutige Abendessen auswählen.';

  @override
  String get restaurantsConciergePick => 'Wählen Sie ein Restaurant für mich';

  @override
  String restaurantsConciergePickDone(String name) {
    return '$name gespeichert – bitten Sie den Concierge, ihn zu Ihrer Reise hinzuzufügen.';
  }

  @override
  String restaurantsSavedCount(int count) {
    return '$count für Ihre Reise gespeichert';
  }

  @override
  String get restaurantsEmptyHint =>
      'Keine Restaurants in Ihrem Entdeckungsradius – erweitern Sie den Radius auf der Karte.';

  @override
  String get moreCardRestaurantsSub =>
      'Durchstöbern Sie die Restaurants und lassen Sie den Concierge für Sie auswählen';

  @override
  String get agendaHotelSuggestionsTitle => 'Wo übernachten';

  @override
  String agendaHotelSuggestionsSubtitle(int budget) {
    return 'KI-angepasst an Ihr ~$budget USD-Reisebudget – tippen Sie, um alle Optionen anzuzeigen.';
  }

  @override
  String agendaHotelTopPick(String name) {
    return 'Top-Auswahl: $name';
  }

  @override
  String get agendaStayDropdownHint => 'Wählen Sie ein Hotel aus';

  @override
  String get agendaDiningDropdownHint => 'Wählen Sie ein Restaurant aus';

  @override
  String get agendaDaySelectLabel => 'Welcher Tag';

  @override
  String get agendaDayDiningTitle => 'Wo kann man heute Abend essen?';

  @override
  String agendaDayDiningSubtitle(int budget, String tier) {
    return 'Vorschläge für Ihr ~$budget USD-Budget ($tier Dining) basierend auf dem heutigen Plan.';
  }

  @override
  String get agendaDiningNearStops => 'In der Nähe der heutigen Haltestellen';

  @override
  String get agendaDiningFitsBudget => 'Passt zu Ihrem Reisebudget';

  @override
  String get agendaDiningMatchesDay => 'Passt zur heutigen Stimmung';

  @override
  String get agendaDiningFoodiePick => 'Feinschmecker-Favorit';

  @override
  String get browseCatRecommended => 'Empfohlen';

  @override
  String get browseCatDisneyHotels => 'Disney-Bereich';

  @override
  String get browseCatBudgetFriendly => 'Budgetfreundlich';

  @override
  String get browseCatUpscaleLuxury => 'Gehoben und luxuriös';

  @override
  String get browseCatUniversalHotels => 'Universeller Bereich';

  @override
  String get browseCatThemeParkDining => 'Essen im Themenpark';

  @override
  String get browseCatUpscaleDining => 'Gehobene und feine Küche';

  @override
  String get browseSearchAllHotels =>
      'Durchsuchen Sie den vollständigen Hotelkatalog…';

  @override
  String get browseSearchAllRestaurants =>
      'Durchsuchen Sie den vollständigen Restaurantkatalog…';

  @override
  String get browseCategoryEmpty =>
      'Keine Treffer in dieser Kategorie für Ihren Umkreis – versuchen Sie es mit der Suche oder erweitern Sie die Suche.';

  @override
  String get browseFullCatalogHint =>
      'Nutzen Sie die Suche oben für den vollständigen Katalog – jedes Hotel und Restaurant, das Luxora kennt.';

  @override
  String get agendaPageSubtitle => 'Was mache ich gerade?';

  @override
  String get navGems => 'Geheimtipps';

  @override
  String get navFeed => 'Füttern';

  @override
  String get navTicketSavings => 'Ersparnisse';

  @override
  String get navStays => 'Bleibt';

  @override
  String get morePageTitle => 'Mehr';

  @override
  String get morePageSubtitle =>
      'Reisetools, Konto und Einstellungen – kuratiert für einen reibungslosen Zugriff.';

  @override
  String get moreSectionTravelTools => 'REISEWERKZEUGE';

  @override
  String get moreSectionAccount => 'KONTO';

  @override
  String get moreSectionApp => 'APP';

  @override
  String get moreCardHotelsSub => 'Intelligent bleibt Ihrer Stimmung angepasst';

  @override
  String get moreCardGemsSub =>
      'Insider-Entdeckungen werden von Einheimischen bewacht';

  @override
  String get moreCardTicketsSub =>
      'Vergleichen Sie die Ersparnisse autorisierter Partner';

  @override
  String get moreCardWeatherSub => 'Prognosebewusste Tagesführung';

  @override
  String get moreCardProfileTitle => 'Reiseprofil';

  @override
  String get moreCardProfileSub => 'Wer reist, wie soll es sich anfühlen';

  @override
  String get moreCardFavoritesSub =>
      'Ziele, die Sie mit Ihren Lesezeichen versehen haben';

  @override
  String get moreCardNotificationsTitle => 'Benachrichtigungen';

  @override
  String get moreCardNotificationsSub => 'Reisewarnungen und Concierge-Updates';

  @override
  String get moreCardSettingsSub => 'Thema, Stadtpakete und Vorlieben';

  @override
  String get moreCardAboutSub => 'Warum wir Luxora bauen';

  @override
  String get moreCardHelpSub => 'Reiseführer und Concierge-Unterstützung';

  @override
  String get moreCardCityPacksSub => 'Schalten Sie Ziel-Concierges frei';

  @override
  String get moreCardPartnersSub => 'Empfohlene Partnererlebnisse';

  @override
  String get moreCardItinerarySub => 'Ihr täglicher goldener Zufluchtsort';

  @override
  String get moreCardDiscoverSub =>
      'Trendiges Essen, Erlebnisse und Live-Entdeckungen';

  @override
  String get savedFavoritesTitle => 'Gespeicherte Favoriten';

  @override
  String get savedFavoritesEmpty =>
      'Setzen Sie Ziele auf der Karte oder im Feed als Lesezeichen – sie werden hier angezeigt.';

  @override
  String get helpCenterTitle => 'Hilfecenter';

  @override
  String get helpCenterBody =>
      'Für Concierge-Hilfe senden Sie eine E-Mail an support@luxora.ai. In-App-Anleitungen sind bald verfügbar.';

  @override
  String get notificationsComingSoon =>
      'Reisebenachrichtigungen folgen in einem zukünftigen Update.';

  @override
  String get partnerOffersTitle => 'Partnerangebote';

  @override
  String get ticketSavingsTitle => 'Smarte Ticketeinsparungen';

  @override
  String get ticketSavingsBadgeLabel => 'PREMIUM-SPARUNGEN';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora zeigt autorisierte Wiederverkäufer, Pakete und Werbeaktionen an, sodass Sie sich wie ein Luxusberater fühlen – und nicht wie eine Coupon-Website.';

  @override
  String ticketSavingsBadge(int percent) {
    return 'SPAREN Sie $percent%';
  }

  @override
  String get ticketOfficialPrice => 'Offiziell';

  @override
  String get ticketDiscountPrice => 'Luxora-Preis';

  @override
  String ticketSaveAmount(String amount) {
    return 'Sparen Sie $amount';
  }

  @override
  String get ticketSaveAmountLabel => 'Ersparnisse';

  @override
  String ticketSavePerTicket(String amount) {
    return 'Sie könnten $amount pro Ticket sparen.';
  }

  @override
  String ticketFamilySave(String amount) {
    return 'Geschätzte Ersparnisse der Familie: $amount.';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return 'Geschätzte Ersparnisse der Familie: $amount.';
  }

  @override
  String ticketSource(String source) {
    return 'Quelle: $source';
  }

  @override
  String ticketExpires(String date) {
    return 'Angebot bis $date';
  }

  @override
  String get ticketBetterOption => 'Luxora hat eine bessere Option gefunden.';

  @override
  String get ticketOverpaying =>
      'Möglicherweise zahlen Sie zum Gate-Preis zu viel.';

  @override
  String get ticketRecommendedSavings => 'Empfohlene Ersparnisse verfügbar';

  @override
  String get ticketCalculatorTitle => 'Mögliche Einsparungen';

  @override
  String get ticketFilterLabel => 'Filter';

  @override
  String get ticketFilterAll => 'Alle';

  @override
  String get ticketFilterThemeParks => 'Themenparks';

  @override
  String get ticketFilterAttractions => 'Attraktionen';

  @override
  String get ticketFilterTours => 'Touren';

  @override
  String get ticketFilterDining => 'Kulinarische Erlebnisse';

  @override
  String get ticketFilterWaterParks => 'Wasserparks';

  @override
  String get ticketFilterFamily => 'Familienaktivitäten';

  @override
  String get ticketFilterEntertainment => 'Unterhaltung';

  @override
  String get ticketSortLabel => 'Sortieren nach';

  @override
  String get ticketSortHighestSavings => 'Höchste Einsparungen';

  @override
  String get ticketSortMostPopular => 'Am beliebtesten';

  @override
  String get ticketSortFamilyFriendly => 'Familienfreundlich';

  @override
  String get ticketSortLuxury => 'Luxuserlebnisse';

  @override
  String get ticketSortClosest => 'Mir am nächsten';

  @override
  String get ticketDealsSectionTitle => 'Autorisierte Angebote';

  @override
  String ticketDealsPricesAsOf(String date) {
    return 'Preise ab $date';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'Preise konnten nicht aktualisiert werden – zwischengespeicherte Angebote werden angezeigt.';

  @override
  String get ticketDealsUpdating => 'Preise werden aktualisiert…';

  @override
  String get ticketNoDeals =>
      'Keine Angebote in diesem Filter – versuchen Sie es mit einer anderen Kategorie.';

  @override
  String get ticketConfidenceHigh => 'Hohes Selbstvertrauen';

  @override
  String get ticketConfidenceVerified => 'Verifizierter Wiederverkäufer';

  @override
  String get ticketConfidenceLimited => 'Begrenzte Zeit';

  @override
  String get ticketAiInsightTitle => 'Luxora-Empfehlung';

  @override
  String get ticketInsightDisneyPass =>
      'Abhängig von Ihrer Reiseroute könnte Ihre Familie mit einem 3-Tages-Walt-Disney-World-Pass anstelle von Tagestickets etwa 120 USD sparen.';

  @override
  String get ticketInsightUniversalCombo =>
      'Ihr Plan beinhaltet Universal – ein Ticket für 2 Parks ist für die meisten Familien besser als der Kauf einzelner Tage.';

  @override
  String get ticketInsightSeaworldCombo =>
      'SeaWorld auf Ihrer Route – die Aquatica-Kombination ist oft besser als zwei separate Eintritte.';

  @override
  String get ticketInsightGeneric =>
      'Luxora hat die Ersparnisse an die Stopps auf Ihrer Reiseroute angepasst – vergleichen Sie, bevor Sie am Gate kaufen.';

  @override
  String get ticketInsightMiamiCulture =>
      'Kultur bleibt bei Ihrem Plan stehen – die Angebote von Vizcaya- und PAMM-Partnern könnten diese Woche die Gate-Preise übertreffen.';

  @override
  String get ticketInsightMiamiEverglades =>
      'Everglades-Tag steht auf Ihrem Reiseplan – morgendliche Airboat-Slots sind unter der Woche oft günstiger.';

  @override
  String get ticketInsightMiamiWynwood =>
      'Wynwood auf Ihrer Route – ein geführter Kunstspaziergang kann die Preise für begehbare Stände übertreffen.';

  @override
  String get ticketItineraryMatchTitle => 'Sparcheck für die Reiseroute';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'Portier';

  @override
  String conciergeTripFeel(String feel) {
    return 'Reisegefühl: „$feel“';
  }

  @override
  String get conciergeWelcome =>
      'Willkommen bei Luxora, deinem emotional intelligenten Florida-Begleiter.\n\nWähle unten einen Vorschlag oder beschreibe das Gefühl, das deine Reise erzeugen soll.';

  @override
  String get conciergeQuickPrompts => 'Schnelle Vorschläge';

  @override
  String get conciergeRemembering => 'Für diese Reise gemerkt';

  @override
  String get conciergeStyleMemory => 'Stilgedächtnis';

  @override
  String get conciergeInputHint =>
      'Beschreibe das Gefühl, das deine Reise erzeugen soll …';

  @override
  String get conciergeGreetingMorning => 'Guten Morgen.';

  @override
  String get conciergeGreetingAfternoon => 'Guten Tag.';

  @override
  String get conciergeGreetingEvening => 'Guten Abend.';

  @override
  String get conciergeWelcomeWarm =>
      'Ich bin hier, um Florida so zu gestalten, wie Sie sich fühlen möchten – und nicht anhand einer Checkliste mit Sehenswürdigkeiten. Worauf hast du heute Lust?';

  @override
  String get conciergeRefineStyle => 'Verfeinere meinen Stil';

  @override
  String get conciergeRecallReturning => 'Willkommen zurück.';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'Ich erinnere mich, dass du $prefs magst.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'Und Sie wollten, dass sich diese Reise anfühlt: „$feel“.';
  }

  @override
  String get conciergePromptRomantic => 'Romantische Auszeit';

  @override
  String get conciergePromptWellness => 'Wellness-Neustart';

  @override
  String get conciergePromptFamily => 'Familienzauber';

  @override
  String get conciergePromptHiddenLuxury => 'Versteckter Luxus';

  @override
  String get conciergePromptFoodie => 'Kulinarisches Abenteuer';

  @override
  String get conciergePromptSoftLuxury => 'Sanfte Luxusflucht';

  @override
  String get conciergePromptAdventure => 'Abenteuermodus';

  @override
  String get conciergePromptDisney => 'Disney nach Einbruch der Dunkelheit';

  @override
  String get discoverSearchHint => 'Ziele suchen …';

  @override
  String get discoverSearchTitle => 'Ein Ziel finden';

  @override
  String get discoverFromOrlando => 'Ab Orlando';

  @override
  String discoverFromHub(String hub) {
    return 'Von $hub';
  }

  @override
  String get discoverSearchScopeAll => 'Suche im gesamten Florida-Katalog';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'Innerhalb von $radius um Orlando';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return 'Innerhalb von $radius von $hub';
  }

  @override
  String get discoverSearchEmpty =>
      'Keine Treffer in diesem Radius. Probiere einen kürzeren Namen, erweitere die Distanz auf Karte oder Feed oder suche nach „Strand“, „Disney“ oder „Quellen“.';

  @override
  String get discoverFilterAll => 'Alle';

  @override
  String get discoverFilterHotels => 'Hotels';

  @override
  String get discoverFilterRestaurants => 'Restaurants';

  @override
  String get discoverFilterDestinations => 'Reiseziele';

  @override
  String get discoverPopularInRadius => 'Beliebt in deinem Radius';

  @override
  String get discoverTrySearching => 'Suche ausprobieren';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count Ziele · innerhalb von $radius um Orlando';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$count Ziele · innerhalb von $radius von $hub';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count Ziele · ganz Florida';
  }

  @override
  String get radius25 => '25 Meilen';

  @override
  String get radius50 => '50 Meilen';

  @override
  String get radius100 => '100 Meilen';

  @override
  String get radiusAllFlorida => 'Ganz Florida';

  @override
  String get radiusDesc25 => 'Tagesausflüge rund um Orlando';

  @override
  String get radiusDesc50 => 'Quellen, Küstentagestrips, Space Coast';

  @override
  String get radiusDesc100 => 'Tampa Bay, Daytona, tieferer Golf';

  @override
  String get radiusDescAll => 'Keys, Miami und Highlights im ganzen Staat';

  @override
  String get radiusDesc25Miami => 'South Beach, Brickell und Kernviertel';

  @override
  String get radiusDesc50Miami => 'Wynwood, Coconut Grove, Key Biscayne';

  @override
  String get radiusDesc100Miami =>
      'Everglades, Fort Lauderdale, tieferes Südflorida';

  @override
  String get radiusDescAllMiami =>
      'Florida Keys Trail und landesweite Highlights';

  @override
  String get radiusDesc25Keys =>
      'Key Largo, Islamorada und oberer Riffkorridor';

  @override
  String get radiusDesc50Keys => 'Marathon-, Big Pine- und Middle Keys-Strände';

  @override
  String get radiusDesc100Keys => 'Kompletter Overseas Highway durch Key West';

  @override
  String get radiusDescAllKeys =>
      'Gesamte Inselkette und Tagesausflugsgewässer';

  @override
  String get feedBadge => 'LIVE-ENTDECKUNG';

  @override
  String get feedTitle => 'Erlebnis-Feed';

  @override
  String get feedSubtitle =>
      'Was gerade in Bewegung ist: Trendorte, Neueröffnungen, Creator-Tipps, saisonale Routen und Live-Updates.';

  @override
  String get feedSubtitleFamily =>
      'Familienfreundliche Tipps für Ihre Crew – Parks, einfache Siege und Momente, die bei Kindern (und Eltern) ankommen.';

  @override
  String get feedPillTrending => 'Im Trend';

  @override
  String get feedPillNewOpenings => 'Neueröffnungen';

  @override
  String get feedPillCreator => 'Creator-Tipps';

  @override
  String get feedPillLive => 'Live-Updates';

  @override
  String get feedMoodPrompt => 'WIE MÖCHTEN SIE SICH FÜHLEN?';

  @override
  String get feedMoodPromptFamily =>
      'Wie sollte sich der heutige Tag für Ihre Crew anfühlen?';

  @override
  String get feedMoodAll => 'Alles';

  @override
  String get feedMoodFamily => 'Familienzauber';

  @override
  String get feedMoodRomantic => 'Romantisch';

  @override
  String get feedMoodCalm => 'Ruhig';

  @override
  String get feedMoodAdventurous => 'Abenteuerlich';

  @override
  String get feedMoodPampered => 'Verwöhnt';

  @override
  String get feedMoodSocial => 'Summen';

  @override
  String get feedMoodFoodie => 'Feinschmecker';

  @override
  String get vibeSunsetReady => 'Sonnenuntergang';

  @override
  String get vibeViral => 'Viral';

  @override
  String get vibeFamilyApproved => 'Familienfreundlich';

  @override
  String get vibeHiddenGem => 'Geheimtipp';

  @override
  String get vibeRainSafe => 'Regensicher';

  @override
  String get vibeDateNight => 'Date-Night';

  @override
  String get vibeNightVibe => 'Nachtstimmung';

  @override
  String get vibeFoodie => 'Foodie';

  @override
  String get vibeLuxury => 'Luxus';

  @override
  String get vibeTrending => 'Im Trend';

  @override
  String get vibeLive => 'Live';

  @override
  String get vibeSeasonal => 'Saisonal';

  @override
  String get vibeLocalPick => 'Lokal';

  @override
  String get vibeAdventure => 'Abenteuer';

  @override
  String get vibeWellness => 'Wellness';

  @override
  String get vibeBeachDay => 'Strandtag';

  @override
  String get vibeLuxoraPick => 'Luxora-Tipp';

  @override
  String get mapLayersTitle => 'KARTEN-STIMMUNG';

  @override
  String get mapLayerAll => 'Alle Pins';

  @override
  String get mapLayerGems => 'Geheimtipps';

  @override
  String get mapLayerNight => 'Nacht';

  @override
  String get mapLayerDateNight => 'Date-Night';

  @override
  String get mapLayerWeather => 'Bestes Wetter';

  @override
  String get mapLayerItinerary => 'Reiseplan';

  @override
  String get mapExpandMap => 'Karte vergrößern';

  @override
  String get mapFullscreenTitle => 'Karte';

  @override
  String get mapCloseFullscreen => 'Karte schließen';

  @override
  String get mapItineraryDayLabel => 'Reiseplan anzeigen für';

  @override
  String get mapItineraryCurrentDay => 'Aktueller Tag';

  @override
  String get feedFamilyMoodHint =>
      'Themenparks, Charaktermahlzeiten und einfache Elterngewinne – gefiltert nach Familien-Tags.';

  @override
  String get feedEmptyHint =>
      'Keine Feed-Karten in diesem Radius. Probiere 50 mi oder Ganz Florida für Golfküste und Keys.';

  @override
  String get feedEmptyHintFamily =>
      'In diesem Umkreis gibt es keine mit Familien versehenen Karten – versuchen Sie es mit „Abenteuerlich“ oder „Alles“ oder erweitern Sie den Umkreis.';

  @override
  String get gemsBadge => 'INSIDER-KURATIERUNG';

  @override
  String get gemsTitle => 'Versteckte Geheimtipps';

  @override
  String get gemsSubtitle =>
      'Geheime Entdeckungen, die Einheimische hüten: warum sie besonders sind, wann man hingeht, wie voll es wird und Tipps, die auf keiner Postkarte stehen.';

  @override
  String get gemsPillHidden => 'Versteckte Orte';

  @override
  String get gemsPillLocal => 'Nur für Einheimische';

  @override
  String get gemsPillInsider => 'Insider-Tipps';

  @override
  String get gemsPillCrowd => 'Besucher-Infos';

  @override
  String get gemsEmptyHint =>
      'Noch keine Geheimtipps in diesem Radius. Erweitere auf 50 mi oder mehr für Quellen und Space-Coast-Geheimnisse.';

  @override
  String get gemsSearchHint => 'Versteckte Geheimtipps und Ziele suchen …';

  @override
  String get gemLocalSecret => 'LOKALES GEHEIMNIS';

  @override
  String get gemsMatchedBadge => 'Dein Stil';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Edelsteine passen zu Ihrem Stil',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
  }

  @override
  String get gemWhySpecial => 'Warum es besonders ist';

  @override
  String get gemBestTime => 'Beste Zeit für den Besuch';

  @override
  String get gemCrowdLevel => 'Besucherandrang';

  @override
  String get gemInsiderTip => 'Insider-Tipp';

  @override
  String get gemLocalNote => 'Hinweis nur von Einheimischen';

  @override
  String get mapBadge => 'KI-KARTE';

  @override
  String get mapTitle => 'Deine intelligente Route';

  @override
  String get mapSubtitle =>
      'Pins für deinen kuratierten Tag: goldene Diamanten sind Geheimtipps, cyanfarbene Marker markieren den heutigen Zeitplan, die goldene Linie ist die Stimmungsroute.';

  @override
  String get mapPlanDayTitle => 'Plane meinen Tag';

  @override
  String get mapPlanDaySuggested =>
      'Vorschläge aus Ihrer Reisestimmung – setzen Sie Lesezeichen für Orte, um sie zu Ihrem persönlichen Erlebnis zu machen.';

  @override
  String get mapPlanDayEmpty =>
      'Setzen Sie ein Lesezeichen für Ziele (♥) und Luxora erstellt eine optimierte Route von Ihrem Drehkreuz in Orlando aus – am wenigsten fahren, am meisten Gefühl.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count stoppt · $miles · $time Fahrt';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'Ab $hotel';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '$time Fahrt · $miles vom vorherigen Stopp';
  }

  @override
  String get mapCrowdLevelQuiet => 'Ruhig';

  @override
  String get mapCrowdLevelModerate => 'Mäßig';

  @override
  String get mapCrowdLevelBusy => 'Beschäftigt';

  @override
  String get mapCrowdLevelPacked => 'Verpackt';

  @override
  String mapCrowdAtStop(String level) {
    return 'Menschenmenge: $level';
  }

  @override
  String get mapParkingLevelEasy => 'Einfach';

  @override
  String get mapParkingLevelModerate => 'Mäßig';

  @override
  String get mapParkingLevelDifficult => 'Schwierig';

  @override
  String get mapParkingLevelLimited => 'Begrenzt · früh ankommen';

  @override
  String mapParkingAtStop(String level) {
    return 'Parkdeck';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'Antriebsreibung: $score/90';
  }

  @override
  String get mapRerouteButton => 'Umleitung für ruhigere Haltestellen';

  @override
  String mapRerouteApplied(int count) {
    return 'Tagesbereinigt – $count Haltestellen wurden gegen weniger Andrang getauscht.';
  }

  @override
  String get mapRerouteNone => 'Ihre Route sieht bereits ruhig aus.';

  @override
  String get mapRerouteRainHint =>
      'Keine Sorge — ich habe bereits Alternativen in der Nähe gefunden, damit dein Tag entspannt bleibt.';

  @override
  String get dayFlowSwapTitle => 'Ändern Sie diesen Stopp';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'Sagen Sie Luxora, was Sie statt $current lieber tun würden.';
  }

  @override
  String get dayFlowSwapTemplate => 'Ich dachte eher an etwas wie ...';

  @override
  String get dayFlowSwapHint =>
      'z.B. Heute Morgen ein ruhiger Park oder Meeresfrüchte zum Abendessen';

  @override
  String get dayFlowSwapApply => 'Aktualisiere meinen Tag';

  @override
  String get dayFlowSwapViewPlace => 'Aktuellen Stopp anzeigen';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return 'Aktualisiert – $newStop ist jetzt Ihr $phase-Stopp.';
  }

  @override
  String get dayFlowSwapNoMatch =>
      'Es konnte keine Übereinstimmung in der Nähe gefunden werden. Versuchen Sie es genauer zu formulieren.';

  @override
  String get dayFlowSwapTapToChange => 'Ändern Sie diesen Stopp';

  @override
  String get dayFlowSwapHoldSpeak => 'Halten Sie gedrückt, um zu sprechen';

  @override
  String get dayFlowSwapListening => 'Hören…';

  @override
  String get rightNowButton => 'Was sollen wir jetzt tun?';

  @override
  String get rightNowEmpty =>
      'Noch kein starker Moment in Ihrem Umkreis – erweitern Sie, entdecken Sie ein paar Favoriten oder setzen Sie ein Lesezeichen.';

  @override
  String get rightNowResultTitle => 'IM AUGENBLICK';

  @override
  String get rightNowTapForDetails => 'Für Details tippen';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return 'Sie sind $minutes Minuten von $district entfernt. Das Wetter ist perfekt – trinken Sie einen Kaffee bei $place und schlendern Sie dann durch $walkArea, bevor die Menschenmassen eintreffen ($crowd crowds).';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return 'Sie sind $minutes Minuten von $district entfernt. Der Himmel sieht großartig aus – fahren Sie nach $place, während die Menschenmenge noch $crowd ist.';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return 'Die goldene Stunde steht vor der Tür – Abfahrt in etwa $minutes Minuten nach $place ($crowd bei Sonnenuntergang).';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return 'Regen auf dem Radar – $minutes Minuten bis zu einem gemütlichen Indoor-Pick: $place.';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return 'Ruhiges Nickerchenfenster – $minutes Minuten bis zu einem einfachen Familien-Reset am $place.';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return 'Datum-Nacht-Energie – $minutes Minuten bis $place vor dem Ansturm.';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return 'Ruhiges Fenster – $minutes Minuten bis $place ($crowd gerade).';
  }

  @override
  String get goldenHourTitle => 'Goldene Stunde';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return 'Abfahrt bis $time ($minutes min Fahrt) nach $place – Ankunft ca. 15 Minuten vor Sonnenuntergang.';
  }

  @override
  String get goldenHourKindBeach => 'Fenster zum Sonnenuntergang am Strand';

  @override
  String get goldenHourKindRooftop => 'Goldene Stunde auf dem Dach';

  @override
  String get goldenHourKindScenic => 'Timing für szenische Fotografie';

  @override
  String get vacationScoreTitle => 'Urlaubsbewertung';

  @override
  String vacationScoreSubtitle(int score) {
    return 'Heute fühlt es sich an wie ein $score/100-Tag.';
  }

  @override
  String get onboardOccasionLabel => 'Was ist der Anlass?';

  @override
  String get onboardThemeParksOccasionHint =>
      'Schalten Sie Disney und Universal frei, um unten Themenpark-Events hinzuzufügen – Sie sehen diese Chips direkt nach dem Kauf.';

  @override
  String get occasionGeneral => 'Einfach erkunden';

  @override
  String get occasionAnniversary => 'Jubiläum';

  @override
  String get occasionHoneymoon => 'Flitterwochen';

  @override
  String get occasionDateNight => 'Date-Nacht';

  @override
  String get occasionProposal => 'Vorschlag Reise';

  @override
  String get occasionFamily => 'Familie mit Kindern';

  @override
  String get occasionDisneyAdventure => 'Disney-Abenteuer';

  @override
  String get occasionUniversalAdventure => 'Universelles Abenteuer';

  @override
  String get localSecretTitle => 'Lokales Geheimnis';

  @override
  String get localSecretWinterParkParkAvenue =>
      'Einheimische flüchten in den Hinterhof hinter der Buchhandlung – kein Straßenschild.';

  @override
  String get localSecretWorldFoodTrucks =>
      'Bestellen Sie den täglichen Fang, nicht den Burger – am anderen Fenster bewegt sich die Schlange schneller.';

  @override
  String get localSecretWekiwaSprings =>
      'Verzichten Sie nach 14:00 Uhr auf die Hauptpromenade – am nördlichen Ausgangspunkt bleibt es ruhig.';

  @override
  String get localSecretDisneySpringsParking =>
      'Der beste Parkplatz ist die orangefarbene Garage – gehen Sie zum Yachthafen und nicht zum Haupteingang.';

  @override
  String get localSecretLakeEolaSunset =>
      'Schauen Sie auf die Seite des Amphitheaters, um Schwanenfotos zu machen, während der Himmel golden wird.';

  @override
  String get localSecretMiamiWynwoodAlley =>
      'Gehen Sie durch die Ladegasse hinter Panther Coffee – die Einheimischen schießen Wandgemälde ohne die Menge an der Hauptschlange.';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      'Kaufen Sie Cafecito zuerst am Fensterwagen – Stammtische an der Nebenbank öffnen sich, wenn Sie einen Cortadito in der Hand halten.';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      'Überspringen Sie den Andrang auf der Hauptterrasse – betreten Sie den Garten vom Ostgarten aus und laufen Sie den Mangrovensteg gegen den Uhrzeigersinn entlang.';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      'Blicken Sie um 7 Uhr morgens auf Lummus nach Osten – Art-Deco-Pastelltöne leuchten, bevor die Brunch-Menge eintrifft.';

  @override
  String get localSecretMiamiPantherAlley =>
      'Bestellen Sie am Fenster, gehen Sie im Uhrzeigersinn durch die Gasse – um 8:45 Uhr trifft das beste Wandlicht auf die türkisfarbene Wand.';

  @override
  String get localSecretTampaBayRiverwalkParking =>
      'Whiting-Street-Parkhaus nutzen — südlich am Fluss entlanggehen und Sperrungen am Kai vermeiden.';

  @override
  String get localSecretTampaBayClearwaterSunset =>
      'Pier-60-Geländer meiden — 40 Min. vor Sonnenuntergang nördlichen Sand-Key-Zugang für Gulf-Farben.';

  @override
  String get localSecretTampaBayDaliGarden =>
      'Letzten Nachmittagseintritt buchen — Ostgarten-Aussicht fängt Brückenlicht ohne Terrassen-Andrang.';

  @override
  String get localSecretTampaBayPierTiming =>
      'Wochentags 16 Uhr Pier-Eintritt — Sonnenuntergang ohne Wochenend-Kinderwagen-Verkehr.';

  @override
  String get localSecretTampaBayYborCourtyard =>
      'Cubano zum Mitnehmen — im Backstein-Innenhof der Seitenstraße essen, den Einheimische nach 20 Uhr nutzen.';

  @override
  String get localSecretTampaBaySpongeDocks =>
      'Erst am Dock essen, dann Schwammboote — Tourgruppen lichten sich werktags nach 13 Uhr.';

  @override
  String get localSecretVegasBellagioFountains =>
      '15 Min. vor der Show mittig auf der Wiese stehen — vordere Geländer blockieren die Choreografie.';

  @override
  String get localSecretVegasFremontTiming =>
      'Wochentags 21 Uhr unter der LED-Krone — volle Viva-Vision-Schleife ohne Samstagsandrang.';

  @override
  String get localSecretVegasCaesarsEntrance =>
      'Parkhaus-Verbindung nutzen — Strip-Gehwegsstau zur Hauptdinnerzeit vermeiden.';

  @override
  String get localSecretVegasVenetianWalk =>
      'Mittags im überdachten Kanalgang — klimatisierter Strip-Übergang ohne Hitze.';

  @override
  String get nycMoodRoutesTitle => 'New-York-Stimmungsrouten';

  @override
  String get localSecretNycTimesSquareStrategy =>
      'Über Seitenstraßen der 7th Ave — Kreuzungsandrang meiden, Broadway-Sicht behalten.';

  @override
  String get localSecretNycObservationDeck =>
      'Letzten Slot vor Sonnenuntergang buchen — goldenes Licht ohne Mittagswarteschlange.';

  @override
  String get localSecretNycCentralParkEntrance =>
      '72nd-Street-Querweg — schneller zu Bethesda ohne Columbus-Circle-Menschenmassen.';

  @override
  String get localSecretNycBroadwayTickets =>
      'TKTS-Matinee-Sch Schlange öffnet früh — Rush-Plätze schlagen Touristenpreise.';

  @override
  String get localSecretNycBrooklynBridgePhoto =>
      'Washington Street DUMBO um 8 Uhr — leerer Kopfsteinrahmen vor Tourgruppen.';

  @override
  String get localSecretNycFerryGoldenHour =>
      'Hinfahrt der Staten-Island-Fähre bei Sonnenuntergang — kostenlose Hafenrunde.';

  @override
  String get momentsTitle => 'LUXORA-MOMENTE';

  @override
  String get momentsSubtitle =>
      'Suche nach einem Gefühl – nicht nach einem Ort.';

  @override
  String get momentFeelRelaxed => 'Fühlen Sie sich entspannt';

  @override
  String get momentImpressSpouse => 'Beeindrucke meinen Ehepartner';

  @override
  String get momentPerfectSunset => 'Perfekter Sonnenuntergang';

  @override
  String get momentFamilyMemory => 'Familienerinnerung';

  @override
  String get momentLuxuryValue => 'Luxus, ohne zu viel auszugeben';

  @override
  String get momentPromptRelaxed =>
      'Ich möchte mich in den nächsten Stunden völlig entspannt fühlen – langsam, schön, ohne Menschenmassen.';

  @override
  String get momentPromptImpressSpouse =>
      'Ich möchte meinen Ehepartner heute Abend mit etwas Romantischem und Unerwartetem beeindrucken.';

  @override
  String get momentPromptPerfectSunset =>
      'Ich möchte den perfekten Sonnenuntergangsmoment in Florida – wo sollten wir sein und wann sollten wir abreisen?';

  @override
  String get momentPromptFamilyMemory =>
      'Ich möchte einen unvergesslichen Familienmoment haben, der für die Eltern angenehm und für die Kinder magisch ist.';

  @override
  String get momentPromptLuxuryValue =>
      'Ich möchte Luxus, der sich besonders anfühlt, ohne ein Vermögen auszugeben.';

  @override
  String get visualShareImageButton => 'Bildkarte teilen';

  @override
  String get tripStoryTitle => 'Ihre Reisegeschichte';

  @override
  String tripStoryHeading(String title) {
    return '$title – Ihre Florida-Geschichte';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return 'Du bist wegen $moods gekommen.';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return 'Dieses Kapitel: $title.';
  }

  @override
  String get tripStoryBeatClosing =>
      'Luxora hat die Momente geprägt – Sie haben sie gelebt.';

  @override
  String get tripsOpenStory => 'Deine Geschichte';

  @override
  String get conciergeVoiceHold => 'Halten Sie gedrückt, um zu sprechen';

  @override
  String get conciergeVoiceSoon =>
      'Voice Concierge ist bald verfügbar – tippen Sie zunächst kurz auf oder geben Sie ein, was Sie möchten.';

  @override
  String get conciergeVoiceListening => 'Luxora hört zu…';

  @override
  String get conciergeVoiceSpeaking => 'Luxora spricht…';

  @override
  String get conciergeVoiceRelease => 'Zum Senden freigeben';

  @override
  String get conciergeVoiceSend => 'Nach Luxora senden';

  @override
  String get conciergeVoiceProcessing => 'Senden nach Luxora…';

  @override
  String get conciergeVoiceNoSpeech =>
      'Das habe ich nicht verstanden – den Knopf gedrückt halten, sprechen und dann loslassen.';

  @override
  String get conciergeVoicePreviewFailed =>
      'Die Vorschau konnte nicht abgespielt werden. Überprüfen Sie Ihre Lautstärke und versuchen Sie es erneut.';

  @override
  String get conciergeVoiceUnavailable =>
      'Auf diesem Gerät ist keine Sprachfunktion verfügbar.';

  @override
  String get conciergeVoiceSettingsTitle => 'Luxora-Stimme';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Wählen Sie, wie Luxora beim Sprechen klingt – Akzent, Tonfall und Tempo. Verwendet die integrierten Stimmen Ihres Geräts.';

  @override
  String get conciergeVoiceRateLabel => 'Sprechtempo';

  @override
  String get conciergeVoiceRateSlow => 'Langsam';

  @override
  String get conciergeVoiceRateNatural => 'Natürlich';

  @override
  String get conciergeVoiceRateFast => 'Schnell';

  @override
  String get conciergeVoicePreview => 'Vorschau der Stimme';

  @override
  String get conciergeVoicePreviewSample =>
      'Hallo – ich bin Luxora. Sagen Sie mir, wie sich diese Reise anfühlen soll.';

  @override
  String get conciergeVoiceDeviceNote =>
      'Laden Sie weitere Stimmen in den iPhone-Einstellungen → Barrierefreiheit → Gesprochene Inhalte → Stimmen herunter. Kehren Sie hierher zurück und tippen Sie auf Aktualisieren.';

  @override
  String get conciergeVoiceDeviceSection => 'Stimmen auf diesem iPhone';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'Enthält von Ihnen heruntergeladene Stimmen – tippen Sie auf eine, um sie für Luxora zu verwenden.';

  @override
  String get conciergeVoiceRefreshList => 'Stimmenliste aktualisieren';

  @override
  String get conciergeVoiceShowAllLanguages => 'Alle Sprachen anzeigen';

  @override
  String get conciergeVoiceOpenSettings =>
      'Öffnen Sie die iPhone-Spracheinstellungen';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'Keine Stimmen gefunden – Pakete in den Einstellungen herunterladen und dann aktualisieren.';

  @override
  String get conciergeVoicePresetSection => 'Schnelle Personas';

  @override
  String get conciergeVoiceRegionRecommended => 'Empfohlen';

  @override
  String get conciergeVoiceRegionEnglish => 'Englisch';

  @override
  String get conciergeVoiceRegionRussian => 'Russisch';

  @override
  String get conciergeVoiceRegionSpanish => 'Spanisch';

  @override
  String get conciergeVoiceRegionFrench => 'Französisch';

  @override
  String get conciergeVoiceRegionGerman => 'Deutsch';

  @override
  String get conciergeVoiceRegionOther => 'Andere';

  @override
  String get conciergeVoicePresetMatchApp => 'App-Sprache anpassen · Weiblich';

  @override
  String get conciergeVoicePresetEnUsF => 'Amerikanisch · Weiblich';

  @override
  String get conciergeVoicePresetEnUsM => 'Amerikaner · Männlich';

  @override
  String get conciergeVoicePresetEnGbF => 'Britisch · Weiblich';

  @override
  String get conciergeVoicePresetEnGbM => 'Brite · Männlich';

  @override
  String get conciergeVoicePresetRuF => 'Russisch · Weiblich';

  @override
  String get conciergeVoicePresetRuM => 'Russisch · Männlich';

  @override
  String get conciergeVoicePresetEsF => 'Spanisch · Weiblich';

  @override
  String get conciergeVoicePresetEsM => 'Spanisch · Männlich';

  @override
  String get conciergeVoicePresetFrF => 'Französisch · Weiblich';

  @override
  String get conciergeVoicePresetFrM => 'Französisch · Männlich';

  @override
  String get conciergeVoicePresetDeF => 'Deutsch · Weiblich';

  @override
  String get conciergeVoicePresetDeM => 'Deutsch · Männlich';

  @override
  String get conciergeThinking => 'Luxora denkt ...';

  @override
  String get conciergeItinerarySynced =>
      'Ich habe das zu Ihrer Agenda hinzugefügt – dieselben Stopps auf der Karte, bereit zum Teilen.';

  @override
  String get conciergeAgendaUpdatedSnack =>
      'Ihre Agenda ist auf Karte und Agenda bereit';

  @override
  String get conciergeAgendaSyncFailed =>
      'Karte und Agenda wurden nicht aktualisiert. Versuchen Sie es mit einer klaren Aufforderung, zum Beispiel: Planen Sie eine 4-tägige Disney- und Universal-Reise.';

  @override
  String get conciergeViewAgendaOnMap => 'Agenda ansehen';

  @override
  String get conciergeAgendaDealsIntro =>
      'Ich habe autorisierte Ticketangebote den Haltestellen auf Ihrer Agenda zugeordnet – vergleichen Sie sie, bevor Sie am Gate kaufen:';

  @override
  String get conciergeAgendaDealsSnack =>
      'Ticketangebote passend zu Ihrer Agenda';

  @override
  String get conciergeViewTicketDeals => 'Angebote ansehen';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · geschätzte Einsparung von $amount über $source';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return '$count Haltestellen auf Ihrer Agenda haben Partnerangebote – vergleichen Sie autorisierte Angebote, bevor Sie am Gate kaufen.';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return 'Schätzung: Familienersparnisse · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals =>
      'Durchsuchen Sie Angebote für Ihre Agenda →';

  @override
  String get conciergeFreshThread =>
      'Ihre Agenda finden Sie auf Karte und Agenda. Ich habe diesen Chat archiviert und neu angefangen – den Tag optimieren, Angebote finden oder etwas Neues fragen.';

  @override
  String get conciergeThreadArchivedSnack =>
      'Chat archiviert – neuer Thread gestartet';

  @override
  String get conciergeNewConversationTooltip => 'Neues Gespräch';

  @override
  String get itinerarySameAsMapAgenda =>
      'Der heutige Concierge-Plan – auch auf der Karte angeheftet. Teilen Sie die Tageskarte unten.';

  @override
  String get conciergeTicketsFoundIntro =>
      'Ich habe autorisierte Ticketangebote für Ihre Reise gefunden – tippen Sie auf „Tickets auf Agenda buchen“, um direkte Links zu erhalten:';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title: $price über $source (sparen Sie $savings)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'Jeder passende Stopp auf der Agenda verfügt jetzt über die Schaltfläche „Tickets buchen“ mit dem Reseller-Link.';

  @override
  String itineraryBookTickets(String amount) {
    return 'Tickets buchen · $amount sparen';
  }

  @override
  String get itineraryOpenTicketDeal => 'Tickets buchen';

  @override
  String conciergeTripSaved(String title) {
    return '„$title“ wurde in Ihren Reisen gespeichert – Sie können die Registerkarte „Reisen“ jederzeit öffnen, um sie erneut aufzurufen.';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return '„$title“ mit $count Erlebnissen auf Ihrer Chronik gespeichert.';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return 'Sie haben $count Fahrt(en) gespeichert:';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title ($dates) – $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      'Sie haben noch keine gespeicherten Reisen. Bitten Sie mich, etwas zu planen, und sagen Sie dann „Meine Reise speichern“.';

  @override
  String get conciergeSavedTripsHint =>
      'Öffnen Sie die Registerkarte „Reisen“, um Karten anzuzeigen, Daten zu teilen oder zu bearbeiten.';

  @override
  String get conciergeAiError =>
      'Ich konnte Luxora im Moment nicht erreichen. Überprüfen Sie Ihre Verbindung und versuchen Sie es erneut.';

  @override
  String get conciergeAiErrorVoice =>
      'Entschuldigung – ich konnte gerade keine Verbindung zum Luxora-Concierge herstellen.';

  @override
  String get conciergeAiNotConfigured =>
      'Der Live-Concierge von Luxora ist noch nicht auf diesen Build eingestellt – die Supabase-URL und der Anon-Schlüssel müssen in die App integriert und die Edge-Funktion bereitgestellt werden. Karte und Reiseroute funktionieren weiterhin; Informationen zur Einrichtung finden Sie unter docs/CONCIERGE_AI.md.';

  @override
  String get conciergeAiOpenAiNotReady =>
      'Luxora hat Sie gehört, aber das Concierge-Gehirn ist noch nicht online. Legen Sie OPENAI_API_KEY in den Supabase-Geheimnissen für die Edge-Funktion (Bright-Prozessor) fest und versuchen Sie es dann erneut.';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'Luxora konnte die Concierge-Edge-Funktion „$function“ nicht finden. Stellen Sie es in Supabase bereit oder korrigieren Sie SUPABASE_CONCIERGE_FUNCTION in diesem Build.';
  }

  @override
  String get conciergeAiAuthFailed =>
      'Luxora konnte sich nicht bei Supabase authentifizieren. Überprüfen Sie noch einmal, ob SUPABASE_ANON_KEY mit Ihrem Projekt übereinstimmt.';

  @override
  String get mapAiPowers => 'KI-Kartenfunktionen';

  @override
  String get mapNavLayerTitle => 'KI-Navigationsebene (als Nächstes)';

  @override
  String get mapNavLayerSubtitle =>
      'Mehr als Entdeckung: Live-Intelligenz, ob sich ein Stopp gerade lohnt.';

  @override
  String get mapBookingTitle => 'Nahtlose Buchung (Partner)';

  @override
  String get mapCapMoodTitle => 'Routen nach Stimmung';

  @override
  String get mapCapMoodDesc =>
      'Wege, die zu Romantik, Wellness, Familie oder Abenteuer passen, nicht nur zur kürzesten Fahrzeit.';

  @override
  String get mapCapDriveTitle => 'Optimierung der Fahrzeit';

  @override
  String get mapCapDriveDesc =>
      'Intelligente Reihenfolge, damit du mehr Zeit mit Erleben verbringst und weniger im Verkehr zwischen Highlights.';

  @override
  String get mapCapWeatherTitle => 'Wetterbewusste Vorschläge';

  @override
  String get mapCapWeatherDesc =>
      'Regen-Alternativrouten und Live-Zeitfenster für Strände, Rooftops und Quellen.';

  @override
  String get mapCapSunsetTitle => 'Bester Sonnenuntergang jetzt';

  @override
  String get mapCapSunsetDesc =>
      'Wo die Golden Hour in den nächsten 90 Minuten am schönsten ist, basierend auf Himmel und Besucherströmen.';

  @override
  String get mapCapCrowdTitle => 'Besucherprognose';

  @override
  String get mapCapCrowdDesc =>
      'Wann Parks, Quellen und virale Spots ruhiger werden, bevor du ankommst.';

  @override
  String get mapCapGemsTitle => 'Versteckte Tipps in der Nähe';

  @override
  String get mapCapGemsDesc =>
      'Insider-Pins entlang deiner Route, nicht nur touristische Top-10-Stopps.';

  @override
  String get mapCapPersonalTitle => 'Routenpersonalisierung';

  @override
  String get mapCapPersonalDesc =>
      'Reisegefühl, Tempo und Budget formen die Karte in Echtzeit neu.';

  @override
  String get mapFutureCrowdTitle => 'Live-Andrangskarte';

  @override
  String get mapFutureCrowdDesc =>
      'Echtzeitdichte bei Quellen, Parks und viralen Rooftops: lohnt es sich gerade?';

  @override
  String get mapFutureParkingTitle => 'Parkschwierigkeit';

  @override
  String get mapFutureParkingDesc =>
      'Reibungsscore, bevor du dich festlegst: Valet, Parkhaus oder idealer Rideshare-Punkt.';

  @override
  String get mapFutureTrafficTitle => 'Fahrstress-Score';

  @override
  String get mapFutureTrafficDesc =>
      'Stressgewichtete Routen: nicht nur Minuten, sondern wie sich die Fahrt anfühlt.';

  @override
  String get mapFutureRerouteTitle => 'Spontane Umleitung';

  @override
  String get mapFutureRerouteDesc =>
      'Wetterwechsel oder Besucheransturm? Ein Tipp formt den Rest deines Tages neu.';

  @override
  String affiliateReserve(String category) {
    return 'Reservieren · $category · Premium-Partner (bald)';
  }

  @override
  String get affiliateHotels => 'Hotels und Staycations';

  @override
  String get affiliateExperiences => 'Erlebnisse und Touren';

  @override
  String get affiliateRestaurants => 'Restaurantreservierungen';

  @override
  String get affiliateThemeParks => 'Tickets für Freizeitparks';

  @override
  String get affiliateDayPasses => 'ResortPass / Tagespässe';

  @override
  String get affiliateCarRentals => 'Mietwagen';

  @override
  String get affiliateWellness => 'Wellness-Buchungen';

  @override
  String get tripsBadge => 'SAMMLUNGEN';

  @override
  String get tripsTitle => 'Gespeicherte Reisen';

  @override
  String get tripsSubtitle =>
      'Tippe auf eine Reise für eine Live-Momentaufnahme: nächster Moment, Wetter, Sonnenuntergang und Zeitplan.';

  @override
  String get tripsFooter =>
      'Reise-Cover aus dem Stimmungskatalog · Supabase-Sync Phase 2';

  @override
  String get tripsPlanNew => 'Planen Sie eine neue Reise';

  @override
  String get tripsEmptyTitle => 'Noch keine gespeicherten Reisen';

  @override
  String get tripsEmptyBody =>
      'Planen Sie Ihre erste Reise und sie wird hier angezeigt und kann jederzeit erneut besucht werden.';

  @override
  String get tripsDeleteTitle => 'Reise löschen?';

  @override
  String tripsDeleteBody(String title) {
    return 'Dadurch wird „$title“ aus Ihren gespeicherten Reisen entfernt. Dies kann nicht rückgängig gemacht werden.';
  }

  @override
  String get tripsDeleted => 'Reise gelöscht';

  @override
  String get tripsEditDates => 'Reisedaten';

  @override
  String get tripsSaveDates => 'Termine speichern';

  @override
  String get tripsDatesUpdated => 'Reisedaten aktualisiert';

  @override
  String get tripsDatesFlexible => 'Termine flexibel';

  @override
  String get tripsLiveWeather => 'Live-Wetter';

  @override
  String get tripsNextUp => 'Als nächstes';

  @override
  String get tripsSunsetWindow => 'Sonnenuntergangsfenster';

  @override
  String get tripsTimelineSnapshot => 'Zeitleisten-Schnappschuss';

  @override
  String get tripsOpenAgenda => 'Vollständige Agenda öffnen';

  @override
  String get tripsOpenTimeline => 'Vollständige Zeitleiste öffnen';

  @override
  String get tripsShare => 'Aktie';

  @override
  String get shareItineraryFooter =>
      'Geplant mit Luxora – Ihrem emotional intelligenten Florida-Begleiter.';

  @override
  String get shareCardCta => 'Planen Sie Ihren in Luxora';

  @override
  String get shareCardDownloadHint =>
      'Kostenlos für iOS und Android · luxora.ai/download';

  @override
  String shareCardShareMessage(String title, String url) {
    return '$title\n\nGeplant mit Luxora AI – emotional intelligente Florida-Reise.\nHolen Sie sich die App: $url';
  }

  @override
  String get conciergeLocalTryPlanning =>
      'Sagen Sie mir, wie sich die Reise anfühlen soll – z. B. „Planen Sie eine entspannte zweitägige Orlando-Reise mit Quellen und Essen.“ Ich erstelle eine echte Agenda auf Ihrem Gerät (keine Cloud erforderlich).';

  @override
  String conciergeLocalPlanBuilt(String city, int count) {
    return 'Ich habe Ihren $city-Tag aufgebaut – $count Stopps, geordnet nach Stimmung und Fahrzeit. Öffnen Sie Agenda oder Karte, um Ihre Route anzuzeigen.';
  }

  @override
  String get conciergeLocalNoIntent =>
      'Beschreiben Sie das gewünschte Gefühl – oder sagen Sie „Planen Sie meinen Orlando-Tag“ – und ich erstelle auf dem Gerät eine echte Route.';

  @override
  String get ticketConciergeIntelBadge => 'Concierge-Informationen';

  @override
  String get ticketConciergeIntelAgenda =>
      'Abgestimmt auf Ihre Agenda-Stopps – keine generische Couponliste.';

  @override
  String get agendaFixAfternoonRain =>
      'Es regnet aufkommend – fixiere meinen Nachmittag';

  @override
  String agendaRainRerouteDone(int count, int score) {
    return 'Nachmittag aktualisiert – $count Haltestellen wurden nach innen verlegt. Urlaubsbewertung $score/100.';
  }

  @override
  String get agendaRainRerouteNone =>
      'Ihr Plan funktioniert für dieses Wetter bereits.';

  @override
  String get cloudTripsTitle => 'Cloud-Backup';

  @override
  String get cloudTripsSubtitle =>
      'Ihre gespeicherten Fahrten werden bei der Anmeldung geräteübergreifend synchronisiert – bei jeder Städtefreischaltung inklusive.';

  @override
  String get cloudTripsMoreSubSignedOut =>
      'Melden Sie sich an, um gespeicherte Reisen zu sichern';

  @override
  String cloudTripsMoreSubSignedIn(String email) {
    return 'Angemeldet als $email';
  }

  @override
  String get cloudTripsMoreSubSyncing => 'Synchronisierung…';

  @override
  String get cloudTripsUnlockRequired =>
      'Schalten Sie ein Stadtpaket frei, um Cloud-Backup zu aktivieren';

  @override
  String get cloudTripsUnlockCta => 'Concierge freischalten';

  @override
  String get cloudTripsEmailHint => 'E-Mail-Adresse';

  @override
  String get cloudTripsSendCode => 'Anmeldecode senden';

  @override
  String get cloudTripsCodeHint => '6-stelliger Code aus E-Mail';

  @override
  String get cloudTripsVerify => 'Bestätigen und anmelden';

  @override
  String get cloudTripsCodeSent =>
      'Überprüfen Sie Ihre E-Mails auf einen Anmeldecode';

  @override
  String get cloudTripsSignOut => 'Abmelden';

  @override
  String get cloudTripsSyncNow => 'Jetzt synchronisieren';

  @override
  String get cloudTripsSyncSuccess => 'Reisen synchronisiert';

  @override
  String get cloudTripsSyncError =>
      'Die Synchronisierung ist fehlgeschlagen. Versuchen Sie es erneut';

  @override
  String get cloudTripsBannerTitle => 'Sichern Sie Ihre Reisen';

  @override
  String get cloudTripsBannerBody =>
      'Melden Sie sich an, um Reisen auf einem neuen Telefon oder Tablet wiederherzustellen.';

  @override
  String get cloudTripsBannerCta => 'Cloud-Backup einrichten';

  @override
  String get cloudTripsNotConfigured =>
      'Cloud-Backup erfordert Supabase (Entwickler-Setup)';

  @override
  String get paywallFeatureCloudBackup => 'Cloud-Trip-Backup';

  @override
  String shareSubject(String title) {
    return 'Mein $title';
  }

  @override
  String get itineraryBadge => 'DEIN ZEITPLAN';

  @override
  String get itineraryTagline =>
      'Jeder Moment verbunden: Vorfreude eingebaut, Stress ausgeschlossen.';

  @override
  String itineraryDayTab(int day, String label) {
    return 'Tag $day · $label';
  }

  @override
  String get detailWhySpecial => 'Warum es besonders ist';

  @override
  String get detailBestTime => 'Beste Zeit für den Besuch';

  @override
  String get detailInsiderTips => 'Insider-Tipps';

  @override
  String get detailReserve => 'Erlebnis reservieren';

  @override
  String get detailReserveSoon => 'Reservierungspartner kommen bald.';

  @override
  String get detailNearbyGems => 'Geheimtipps in der Nähe';

  @override
  String get detailDuration => 'Dauer';

  @override
  String get detailPractical => 'Praktische Details';

  @override
  String get detailCostRange => 'Kostenspanne';

  @override
  String get detailBestFor => 'Am besten für';

  @override
  String get detailVibeMatch => 'Stimmungsmatch';

  @override
  String get detailCrowd => 'Andrang';

  @override
  String get detailTravelIntelTitle => 'Ausblick auf die Reisereibung';

  @override
  String get detailTravelIntelSubtitle =>
      'Wird anhand von Kategorie, Zeit und Entfernung vorhergesagt – nicht anhand von Live-Sensoren.';

  @override
  String detailCrowdOutlook(String level) {
    return 'Menschenmenge: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'Parkdeck';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'Antriebsreibung: $score/90';
  }

  @override
  String get detailPrice => 'Preis';

  @override
  String get detailLocation => 'Ort';

  @override
  String get detailGetDirections => 'Wegbeschreibung abrufen';

  @override
  String get detailParkMap => 'Parkkarte';

  @override
  String get detailViewOnMap => 'Auf der Karte anzeigen';

  @override
  String get detailMapsError =>
      'Die Karten konnten auf diesem Gerät nicht geöffnet werden.';

  @override
  String get detailGoogleMaps => 'Google Maps';

  @override
  String get detailAppleMaps => 'Apple Maps';

  @override
  String get detailOpenInMaps => 'In Karten öffnen';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time Fahrt von Orlando';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$time Fahrt von $hub';
  }

  @override
  String get detailSaveToItinerary => 'Im Reiseplan speichern';

  @override
  String get detailSaved => 'Gespeichert';

  @override
  String get detailSavedSnack => 'In Ihrer Reiseroute gespeichert';

  @override
  String get detailRemovedSnack => 'Aus Ihrer Reiseroute entfernt';

  @override
  String get detailSetHomeBase => 'Als Heimatbasis eingerichtet';

  @override
  String get detailHomeBaseActive => 'Ihr Ausgangspunkt für die Heimreise';

  @override
  String get detailHomeBaseHint => 'Hier beginnt und endet Ihre Tagesroute.';

  @override
  String get detailHomeBaseSetSnack =>
      'Als Ausgangspunkt für Ihre Heimreise festlegen';

  @override
  String get detailHomeBaseClearedSnack => 'Heimatbasis geräumt';

  @override
  String get detailMenuTitle => 'Menü-Highlights';

  @override
  String get detailMenuDisclaimer =>
      'Ausgewählte Highlights – vollständige Speisekarte und Preise können je nach Veranstaltungsort variieren.';

  @override
  String get detailMenuComingSoon =>
      'Wir sind noch dabei, dieses Menü zu kuratieren. Sehen Sie sich in der Zwischenzeit die aktuelle Speisekarte und die Preise online an.';

  @override
  String get detailViewMenuOnline => 'Menü online ansehen';

  @override
  String get photoClose => 'Schließen';

  @override
  String get photoViewDestination => 'Ziel anzeigen';

  @override
  String get photoBy => 'Foto von';

  @override
  String get photoOn => 'An';

  @override
  String milesFromOrlando(String distance) {
    return '$distance von Orlando';
  }

  @override
  String milesFromHub(String distance, String hub) {
    return '$distance von $hub';
  }

  @override
  String get landingBadge => 'FLORIDA · ORLANDO MVP';

  @override
  String get landingTitle1 => 'Der Urlaub';

  @override
  String get landingTitle2 => 'hat schon begonnen.';

  @override
  String get landingSubtitle =>
      'Luxora AI ist dein emotional intelligenter Concierge: versteckte Geheimtipps, Rooftop-Sonnenuntergänge und Momente, die schon vor dem Packen unvergesslich wirken.';

  @override
  String get landingBegin => 'Meine Reise beginnen';

  @override
  String get landingTalk => 'Mit Luxora sprechen';

  @override
  String get landingWhy => 'Warum wir das bauen';

  @override
  String get storyTitle => 'Unsere Geschichte';

  @override
  String get storyHeroBadge => 'MIT ABSICHT GEBAUT';

  @override
  String get storyHeroCreator => 'Schöpfer, Luxora AI';

  @override
  String get storyHeroSubtitle => 'Florida · Emotionsorientiertes Reisen';

  @override
  String get storyHeading => 'Warum wir Luxora bauen';

  @override
  String get storyProblemLead =>
      'Wir haben festgestellt, dass die Planung einer Florida-/Orlando-Reise überraschend fragmentiert und überwältigend ist.';

  @override
  String get storyJumpingBetween =>
      'Normalerweise springen die Leute dazwischen';

  @override
  String get storyProblemTail =>
      '…und am Ende immer noch allgemeine Touristenpläne haben.';

  @override
  String get storyDifferentLead => 'Wir wollen etwas anderes bauen.';

  @override
  String get storyNotPlannerTitle => 'Nicht nur ein Reiseplaner';

  @override
  String get storyNotPlannerBody =>
      'Ein auf Emotionen ausgerichteter KI-Reisebegleiter.';

  @override
  String get storyInsteadOfAsking => 'Anstatt zu fragen';

  @override
  String get storyAppAsks => 'Die App fragt';

  @override
  String get storyInsteadQuestion => '„Wohin soll ich gehen?“';

  @override
  String get storyFeelQuestion => '„Wie soll sich diese Reise anfühlen?“';

  @override
  String get storyMoodBuildLine =>
      'Dann baut die KI ein personalisiertes Erlebnis rund um diese Stimmung auf.';

  @override
  String get storyFloridaFirstTitle => 'Warum zuerst Florida / Orlando?';

  @override
  String get storyFloridaFirstLead => 'Orlando ist ein perfekter Testmarkt:';

  @override
  String get storyVisionTitle => 'Unsere Vision';

  @override
  String get storyVisionLead => 'Kombinieren:';

  @override
  String get storyVisionCard =>
      'Die App fühlt sich also eher wie ein luxuriöser KI-Concierge an – nicht wie ein weiteres langweiliges Reiserouten-Tool.';

  @override
  String get storyLongTermTitle => 'Langfristige Chance';

  @override
  String get storySourceGoogleMaps => 'Google Maps';

  @override
  String get storySourceTikTok => 'TikTok';

  @override
  String get storySourceInstagram => 'Instagram-Reels';

  @override
  String get storySourceTravelBlogs => 'Reiseblogs';

  @override
  String get storySourceRestaurantApps => 'Restaurant-Apps';

  @override
  String get storySourceWeatherApps => 'Wetter-Apps';

  @override
  String get storySourceTicketSites => 'Ticket-Websites';

  @override
  String get storySourceTop10 => 'zufällige „Top 10 Orlando“-Artikel';

  @override
  String get storyBulletMarket => 'Riesiger Tourismusmarkt';

  @override
  String get storyBulletAudience =>
      'Familien, Paare, Luxusreisende und Wellnessreisende';

  @override
  String get storyBulletOptions =>
      'Unzählige Restaurants, Resorts, versteckte Schätze, Themenparks, Quellen und Nachtleben';

  @override
  String get storyBulletRepeat => 'Hohes Wiederholungsbesuchsverhalten';

  @override
  String get storyBulletLogisticsGap =>
      'Die meisten Reise-Apps konzentrieren sich auf Logistik – nicht auf Erlebnisdesign';

  @override
  String get storyPillarAiItinerary => 'KI-Reiseplangenerierung';

  @override
  String get storyPillarMoodPlanning => 'Stimmungsbasierte Reiseplanung';

  @override
  String get storyPillarLiveDiscovery =>
      'Live-Entdeckungs- und Trenderlebnisse';

  @override
  String get storyPillarHiddenGems => 'Versteckte lokale Juwelen';

  @override
  String get storyPillarRouting => 'Intelligentes Routing';

  @override
  String get storyPillarWeatherSunset =>
      'Wetter- und Sonnenuntergangsinformationen';

  @override
  String get storyPillarPremiumUx => 'Erstklassige ästhetische UX';

  @override
  String get storyOpportunityMultilingual => 'Mehrsprachige Erweiterung';

  @override
  String get storyOpportunityAffiliate =>
      'Affiliate- und Buchungspartnerschaften';

  @override
  String get storyOpportunityInventory => 'Restaurants, Erlebnisse und Tickets';

  @override
  String get storyOpportunitySubscriptions => 'Premium-Abonnements';

  @override
  String get storyOpportunityScale =>
      'Skalierbar über Florida hinaus → später weitere Ziele';

  @override
  String get landingValues => 'Erinnerungen · Emotion · Flucht · Verbindung';

  @override
  String get landingRegionBadge => 'Startregion';

  @override
  String get landingRegionTitle => 'Orlando und Florida, für Gefühle kuratiert';

  @override
  String get onboardFinish => 'Lerne deinen Concierge kennen';

  @override
  String get onboardBuilding => 'Dein Abenteuer wird erstellt…';

  @override
  String get onboardStep1Title => 'Wo Träume zuerst landen';

  @override
  String get onboardStep1Subtitle => 'Wohin geht es?';

  @override
  String get onboardDestination => 'Ziel';

  @override
  String get onboardRegion => 'Region';

  @override
  String get onboardCityLabel => 'Wählen Sie Ihre Stadt';

  @override
  String get onboardCityUnlockNote =>
      'Jedes Reiseziel verfügt über eine eigene Concierge-Freischaltung – einmaliger Kauf pro Stadt.';

  @override
  String get landingCityLabel => 'Wohin gehst du?';

  @override
  String get paywallSwitchCity => 'Ziel';

  @override
  String get cityPickerUnlocked => 'Entsperrt';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Schalte $price frei';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Orlando-Add-on · Disney und Universal zusammen';

  @override
  String get onboardStep2Title => 'Zeit, dich frei zu fühlen';

  @override
  String get onboardStep2Subtitle => 'Wann beginnt deine Auszeit?';

  @override
  String get onboardStartDateLabel => 'Startdatum';

  @override
  String get onboardEndDateLabel => 'Enddatum';

  @override
  String get onboardPickDate => 'Zum Auswählen tippen';

  @override
  String get onboardSelectStartDate => 'Wählen Sie das Startdatum';

  @override
  String get onboardSelectEndDate => 'Wählen Sie das Enddatum';

  @override
  String get onboardDatesHint =>
      'Sie können diese jederzeit auf der Registerkarte „Reisen“ ändern.';

  @override
  String get onboardStepBudgetTitle => 'Planen Sie ganz einfach';

  @override
  String get onboardStepBudgetSubtitle =>
      'Was fühlt sich für diese Flucht richtig an?';

  @override
  String get onboardBudget => 'Reisebudget (USD)';

  @override
  String get onboardStep3Title => 'Wer die Geschichte teilt';

  @override
  String get onboardStep3Subtitle => 'Wer reist mit dir?';

  @override
  String get onboardTravelers => 'Reisende';

  @override
  String get onboardStep4Title => 'Dein Rhythmus';

  @override
  String get onboardStep4Subtitle => 'Wie sollen deine Tage fließen?';

  @override
  String get onboardNightlife => 'Interesse an Nachtleben';

  @override
  String get onboardFoodie => 'Kulinarische Leidenschaft';

  @override
  String get onboardPoolside => 'Pool- und Ausfallzeiten';

  @override
  String get onboardAdventure => 'Abenteuer & Outdoor';

  @override
  String get onboardCulture => 'Kultur & Sightseeing';

  @override
  String get dayFlowSubtitle =>
      'Ein Tag, der darauf ausgerichtet ist, wie Sie sich fühlen möchten – keine Checkliste.';

  @override
  String get dayFlowMorning => 'MORGEN';

  @override
  String get dayFlowMidday => 'MITTAG';

  @override
  String get dayFlowAfternoon => 'NACHMITTAG';

  @override
  String get dayFlowEvening => 'ABEND';

  @override
  String get dayFlowNight => 'NACHT';

  @override
  String get dayFlowReasonMorningPool =>
      'Machen Sie es sich langsam gemütlich – am Pool oder im Spa, bevor der Tag beginnt.';

  @override
  String get dayFlowReasonMorningCalm =>
      'Ein sanfter Anfang, um den Ton anzugeben.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Spitzenenergiestunden – das große Abenteuer, während Sie frisch sind.';

  @override
  String get dayFlowReasonMiddayCulture => 'Sightseeing bei hellem Licht.';

  @override
  String get dayFlowReasonMiddayIcon => 'Der entscheidende Moment des Tages.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Nachmittags Auszeit zum Aufladen.';

  @override
  String get dayFlowReasonAfternoonGem =>
      'Ein verstecktes Juwel abseits der Massen.';

  @override
  String get dayFlowReasonEveningDining =>
      'Die Mahlzeit des Tages – Ihre Wahl für Feinschmecker.';

  @override
  String get dayFlowReasonNightOut => 'Ein letzter Glanz – eine Nacht draußen.';

  @override
  String weatherToday(String place) {
    return 'Im Moment in $place';
  }

  @override
  String weatherSunset(String time) {
    return 'Sonnenuntergang $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% Regenwahrscheinlichkeit – packen Sie eine leichte Schicht ein.';
  }

  @override
  String get weatherConditionClear => 'Klar';

  @override
  String get weatherConditionPartlyCloudy => 'Teilweise bewölkt';

  @override
  String get weatherConditionCloudy => 'Wolkig';

  @override
  String get weatherConditionFog => 'Nebel';

  @override
  String get weatherConditionDrizzle => 'Nieselregen';

  @override
  String get weatherConditionRain => 'Regen';

  @override
  String get weatherConditionSnow => 'Schnee';

  @override
  String get weatherConditionThunder => 'Gewitter';

  @override
  String get weatherConciergeTitle => 'Wetter-Concierge';

  @override
  String get weatherConciergeTapHint =>
      'Tippen Sie hier, um eine reisebezogene Vorhersage zu erhalten';

  @override
  String get weatherConciergeAdviceTitle => 'Luxora-Wettervorhersage';

  @override
  String weatherFeelsLike(String temp) {
    return 'Fühlt sich an wie $temp';
  }

  @override
  String get weatherHumidity => 'Luftfeuchtigkeit';

  @override
  String get weatherWind => 'Wind';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir bei $speed Meilen pro Stunde';
  }

  @override
  String get weatherUv => 'UV-Index';

  @override
  String get weatherCloudCover => 'Wolkendecke';

  @override
  String get weatherVisibility => 'Sichtweite';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles Meilen';
  }

  @override
  String weatherSunrise(String time) {
    return 'Sonnenaufgang $time';
  }

  @override
  String get weatherStatRain => 'Regen';

  @override
  String get weatherWhatToBring => 'Was Sie heute mitbringen sollten';

  @override
  String get weatherPlanImpact => 'Auswirkungen auf Ihren Plan';

  @override
  String get weatherHourlyTitle => 'Stündlicher Ausblick';

  @override
  String get weatherHourlyUnavailable =>
      'Beim Laden der Daten wird eine stündliche Vorhersage angezeigt.';

  @override
  String get weatherLiveRadar => 'Live-Radar';

  @override
  String get weatherRadarComingSoon => 'Live-Radar kommt bald.';

  @override
  String get weatherRadarPlay => 'Schleife abspielen';

  @override
  String get weatherRadarPause => 'Schleife anhalten';

  @override
  String get weatherRadarTapToExpand => 'Tippen Sie für den Vollbildmodus';

  @override
  String get weatherRadarNow => 'Jetzt';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return 'Vor $minutes Minuten';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes Min';
  }

  @override
  String get weatherRadarStepBack => 'Früherer Rahmen';

  @override
  String get weatherRadarStepForward => 'Späterer Rahmen';

  @override
  String get weatherRadarJumpNow => 'Jetzt';

  @override
  String get weatherRadarJump1h => '−1 Std';

  @override
  String get weatherRadarJump2h => '−2 Std';

  @override
  String get weatherRadarJump30m => '+30 Min';

  @override
  String get weatherRadarSpeedSlow => 'Langsam';

  @override
  String get weatherRadarSpeedNormal => 'Normal';

  @override
  String get weatherRadarSpeedFast => 'Schnell';

  @override
  String get weatherRadarLoopNote =>
      'Radarschleife: vergangene ~2 Stunden in 10-Minuten-Schritten, plus Kurzstrecken-Nowcast, sofern verfügbar – keine 4-Stunden-Vorhersage.';

  @override
  String get shareMapPreviewCaption =>
      'Kartenvorschau · Öffnen Sie in Luxora für Live-Wegbeschreibungen';

  @override
  String get shareRadarPreviewCaption =>
      'Live-Doppler-Radar · in Luxora für die gesamte Schleife geöffnet';

  @override
  String get weatherMapOverlays => 'Kartenüberlagerungen';

  @override
  String get weatherOverlayPrecip => 'Fällung';

  @override
  String get weatherOverlayTemp => 'Temperatur';

  @override
  String get weatherOverlayWind => 'Wind';

  @override
  String get weatherOverlayCloud => 'Wolkendecke';

  @override
  String get weatherComingSoon => 'Kommt bald';

  @override
  String get weatherAdjustDay => 'Passen Sie meinen Tag an das Wetter an';

  @override
  String get weatherBestOutdoorWindow => 'Bestes Außenfenster';

  @override
  String get weatherRainWindow => 'Regen wahrscheinlich';

  @override
  String get weatherSunsetRec => 'Empfehlung für den Sonnenuntergang';

  @override
  String weatherOutdoorAtRisk(int count) {
    return '$count Haltestellen im Freien können betroffen sein';
  }

  @override
  String get weatherIndoorBackup => 'Backup-Ideen für den Innenbereich';

  @override
  String get weatherAdviceLightJacket =>
      'Bringen Sie heute Abend eine leichte Jacke mit.';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return 'Planen Sie Outdoor-Aktivitäten vor $time.';
  }

  @override
  String get weatherAdviceHighUv =>
      'Heute hohe UV-Strahlung – bringen Sie Sonnenschutzmittel mit und vermeiden Sie längere direkte Sonneneinstrahlung am Mittag.';

  @override
  String get weatherAdviceRainLater =>
      'Das Regenrisiko nimmt heute später zu, also verlegen Sie Indoor-Erlebnisse auf den Nachmittag.';

  @override
  String get weatherAdviceWindBeach =>
      'Der Wind könnte Strand- oder Bootsaktivitäten heute weniger angenehm machen.';

  @override
  String get weatherAdviceGreatSunset =>
      'Tolle Sonnenuntergangsbedingungen heute Abend – denken Sie über ein Abendessen auf dem Dach oder einen Spaziergang am See nach.';

  @override
  String get weatherAdviceDefault =>
      'Der Himmel scheint überschaubar zu sein – befolgen Sie Ihren Plan und halten Sie eine leichte Schicht bereit.';

  @override
  String weatherSunsetRecRooftop(String time) {
    return 'Der Himmel ist gegen $time klar – ein Abendessen auf dem Dach oder ein Spaziergang am See könnten glänzen.';
  }

  @override
  String get weatherPackSunscreen => 'Sonnenschutz';

  @override
  String get weatherPackSunglasses => 'Sonnenbrille';

  @override
  String get weatherPackUmbrella => 'Regenschirm';

  @override
  String get weatherPackLightJacket => 'Leichte Jacke';

  @override
  String get weatherPackShoes => 'Bequeme Schuhe';

  @override
  String get weatherPackWater => 'Wasserflasche';

  @override
  String get weatherPackHat => 'Hut';

  @override
  String get weatherPackPoncho => 'Poncho';

  @override
  String get weatherPackSwimwear => 'Bademode';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return 'Das Regenrisiko steigt nach $time. Erwägen Sie, $outdoorStop früher zu verschieben und $indoorStop für später aufzubewahren.';
  }

  @override
  String weatherImpactHeat(String time) {
    return 'Hohe Mittagshitze – planen Sie Spaziergänge im Freien vor $time.';
  }

  @override
  String get weatherImpactClear =>
      'Der Himmel sieht für Ihre Outdoor-Pläne heute Morgen freundlich aus.';

  @override
  String weatherImpactMixed(int count) {
    return 'Bei $count Outdoor-Stopps sind heute möglicherweise zeitliche Anpassungen erforderlich.';
  }

  @override
  String get weatherImpactNoPlanRain =>
      'Regen ist mit von der Partie – bauen Sie Ihren Tag zunächst mit Indoor-Ankern auf.';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return 'Das beste Außenfenster sieht wie $start–$end aus, bevor Hitze oder Schauer entstehen.';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      'Das Wetter sieht stabil aus – tippen Sie auf „Planen Sie meinen Tag“, wenn Sie bereit sind, Stopps zu planen.';

  @override
  String get weatherImpactIndoorFallback => 'ein Spa oder ein Museum';

  @override
  String get hotelIntelBadge => 'HOTELINTELLIGENZ';

  @override
  String get hotelIntelTitle => 'Finden Sie Ihre Heimatbasis';

  @override
  String get hotelIntelSubtitle =>
      'Basierend auf der Reise, die Sie unternehmen möchten, wählt Luxora Aufenthalte aus, die Ihre Tage prägen – und nicht nach einem Buchungsraster.';

  @override
  String get hotelDiscoveryTitle => 'Kuratiert für Orlando';

  @override
  String get hotelMatchmakerTeaser =>
      'Teilen Sie Luxora Ihren Reisestil mit und sichern Sie sich drei vom Concierge ausgewählte Aufenthalte mit ehrlichen Kompromissen.';

  @override
  String get hotelMatchmakerCta => 'KI-Hotel-Matchmaker';

  @override
  String get hotelMatchmakerTitle => 'Hotel-Matchmaker';

  @override
  String get hotelMatchmakerSubtitle =>
      'Teilen Sie mit, wie Sie reisen – Luxora empfiehlt Ihnen, wo Sie Ihre Tage verbringen können.';

  @override
  String get hotelMatchmakerRun => 'Finden Sie meine Top 3 Aufenthalte';

  @override
  String get hotelMatchBudget => 'Budget-Komfortzone';

  @override
  String get hotelMatchTravelers => 'Reisende';

  @override
  String get hotelMatchAdults => 'Erwachsene';

  @override
  String get hotelMatchKids => 'Kinder';

  @override
  String get hotelMatchAttractions => 'Sehenswürdigkeiten auf Ihrer Liste';

  @override
  String get hotelMatchLuxuryLevel => 'Gewünschtes Luxusniveau';

  @override
  String get hotelMatchTransport => 'Sich fortbewegen';

  @override
  String get hotelTransportCar => 'Mietwagen';

  @override
  String get hotelTransportRideshare => 'Mitfahrgelegenheit';

  @override
  String get hotelTransportShuttle => 'Resort-Shuttle';

  @override
  String get hotelTransportWalkable => 'Fußgängerfreundliche Nachbarschaft';

  @override
  String get hotelMatchResultsTitle => 'Deine Top 3 Spiele';

  @override
  String hotelMatchWhyTitle(int score) {
    return 'Spielergebnis $score';
  }

  @override
  String get hotelMatchBestForLabel => 'Am besten für:';

  @override
  String get hotelMatchItineraryLabel => 'Route:';

  @override
  String get hotelMatchTradeoffsLabel => 'Kompromisse:';

  @override
  String get hotelMatchNearbyLabel => 'Nahe:';

  @override
  String get hotelLuxoraScore => 'Luxora';

  @override
  String get hotelHomeBaseBadge => 'HEIMATBASIS';

  @override
  String get hotelScoreLuxury => 'Luxus';

  @override
  String get hotelScoreFamily => 'Familie';

  @override
  String get hotelScoreRomance => 'Romantik';

  @override
  String get hotelScoreWalkability => 'Gehen';

  @override
  String get hotelWhyRecommendTitle => 'Warum Luxora dies empfiehlt';

  @override
  String get hotelItineraryImpactTitle => 'Wie das Ihre Tage prägt';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return 'Raue Fahrt vom Hub: $driveTime. Fahrreibungswert: $friction/90 (niedriger ist ruhiger).';
  }

  @override
  String get hotelAddHomeBase => 'Als Heimatbasis hinzufügen';

  @override
  String get hotelHomeBaseActive => 'Heimatbasis aktiv';

  @override
  String get hotelViewOnMap => 'Auf der Karte anzeigen';

  @override
  String get hotelGetDirections => 'Wegbeschreibung abrufen';

  @override
  String get hotelCheckRates => 'Überprüfen Sie die Preise';

  @override
  String get hotelVisitWebsite => 'Besuchen Sie die Website';

  @override
  String get hotelLinkUnavailable =>
      'Für diesen Aufenthalt ist der Buchungslink noch nicht verfügbar.';

  @override
  String get hotelLinkOpenFailed =>
      'Der Link konnte nicht geöffnet werden. Überprüfen Sie Ihren Browser oder versuchen Sie es erneut.';

  @override
  String get hotelSave => 'Hotel speichern';

  @override
  String get hotelSaved => 'Gespeichert';

  @override
  String get hotelDistanceTitle => 'Entfernung zu wichtigen Stellen';

  @override
  String get hotelCompareTitle => 'Vergleichen Sie Aufenthalte';

  @override
  String get hotelCompareSubtitle =>
      'Concierge-Ansicht nebeneinander – bis zu drei Hotels.';

  @override
  String hotelCompareSelected(int count) {
    return '$count ausgewählt';
  }

  @override
  String get hotelComparePrice => 'Preisklasse';

  @override
  String get hotelCompareDriveImpact => 'Antriebswirkung';

  @override
  String get hotelCompareNearby => 'Highlights in der Nähe';

  @override
  String get hotelPriceBudget => 'Budget';

  @override
  String get hotelPriceModerate => 'Mäßig';

  @override
  String get hotelPriceUpscale => 'Gehoben';

  @override
  String get hotelPriceLuxury => 'Luxus';

  @override
  String get hotelTagCouples => 'Am besten für Paare';

  @override
  String get hotelTagDisney => 'Am besten für Disney';

  @override
  String get hotelTagUniversal => 'Am besten für Universal';

  @override
  String get hotelTagLuxuryStaycation => 'Luxuriöser Aufenthalt';

  @override
  String get hotelTagFamily => 'Familienfreundlich';

  @override
  String get hotelTagQuiet => 'Ruhige Flucht';

  @override
  String get hotelTagWalkableDining => 'Begehbares Essen';

  @override
  String get hotelTagResort => 'Resort-Feeling';

  @override
  String get hotelTagBudget => 'Budgetfreundlich';

  @override
  String get hotelReasonMatchesMood =>
      'Passend zu Ihrer Reisestimmung und Ihrem Reisetempo.';

  @override
  String get hotelReasonCloseStops =>
      'In der Nähe geplanter Stopps auf Ihrer Zeitleiste.';

  @override
  String hotelReasonSavesDrive(String time) {
    return 'Spart Fahrzeit im Vergleich zu einem generischen Hub – etwa $time vom Zentrum.';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return 'Passt in eine Komfortzone von $range, ohne zu viel für das falsche Resort auszugeben.';
  }

  @override
  String get hotelReasonBetterGroup =>
      'Besser geeignet für Ihren Gruppentyp und Ihr Energieniveau.';

  @override
  String get hotelReasonNearbyDining =>
      'Gutes Restaurant in der Nähe für entspannte Abende.';

  @override
  String get hotelReasonLowStress =>
      'Ruhe im Resort-Stil – weniger Logistik, mehr Urlaub.';

  @override
  String get hotelMatchAttractionsGeneral => 'Ihre geplanten Attraktionen';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return 'Basierend auf Ihrer $attractions-Reiseroute reduziert $hotel die Fahrzeit und sorgt für entspannte Abende.';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$hotel in $neighborhood entspricht genau dem, wie sich diese Reise anfühlen soll.';
  }

  @override
  String get hotelMatchBestForFamily =>
      'Familien, die Tage am Pool verbringen möchten, ohne auf den Zugang zum Park verzichten zu müssen.';

  @override
  String get hotelMatchBestForCouple =>
      'Paare, die Romantik ohne Chaos im Freizeitpark wollen.';

  @override
  String get hotelMatchBestForGroup =>
      'Gruppen, die Komfort, Zugang und ruhige Logistik in Einklang bringen.';

  @override
  String hotelMatchImpactDisney(String time) {
    return 'Kürzere Disney-Fahrten – etwa $time bis zu den Parks von Ihrer Haustür aus.';
  }

  @override
  String get hotelMatchImpactUniversal =>
      'Dank der Universal-Express-Vergünstigungen oder des Wassertaxi-Zugangs können Sie Stunden Ihres Tages einsparen.';

  @override
  String get hotelMatchImpactWalkable =>
      'Gehen Sie zu Fuß zum Abendessen – weniger Parkstress nach langen Parktagen.';

  @override
  String hotelMatchImpactDefault(String time) {
    return 'Hält durchschnittliche Fahrten um $time aufrecht, sodass Ihr Tagesablauf entspannt bleibt.';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      'Premium-Resort-Preise – Budget mehr für das Zimmer, weniger anderswo.';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      'Sie sind auf ein Auto oder eine Mitfahrgelegenheit angewiesen – nicht auf eine Basis, von der aus Sie alles zu Fuß erreichen können.';

  @override
  String get hotelMatchTradeoffLessFamily =>
      'Weniger auf kinderorientierte Annehmlichkeiten ausgerichtet als spezielle Familienresorts.';

  @override
  String get hotelMatchTradeoffLessRomantic =>
      'Mehr Freizeitpark-Energie als ein ruhiger Rückzugsort für Paare.';

  @override
  String get hotelMatchTradeoffDefault =>
      'Jeder Aufenthalt hat Kompromisse – Luxora hat dies als erstes für Sie ausgewählt.';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return 'Essen und Erlebnisse rund um $neighborhood.';
  }

  @override
  String get mapHotelIntelBannerTitle => 'Wählen Sie die richtige Heimatbasis';

  @override
  String get mapHotelIntelBannerBody =>
      'Ihr Hotel bestimmt die Fahrzeiten, den Tagesablauf und den Ort, an dem Sie essen. Luxora hilft Ihnen bei der Auswahl – ohne Buchungsdruck.';

  @override
  String get mapHotelIntelBannerCta => 'Entdecken Sie Hotel Intelligence';

  @override
  String get sponsorLuxoraRecommended => 'Luxora empfohlen';

  @override
  String get sponsorBadgeFeaturedPartner => 'Empfohlener Partner';

  @override
  String get sponsorBadgeSponsored => 'Gesponsert';

  @override
  String get sponsorBadgePromoted => 'Gefördert';

  @override
  String get sponsorBadgePartnerOffer => 'Partnerangebot';

  @override
  String get sponsorCtaVisitWebsite => 'Besuchen Sie die Website';

  @override
  String get sponsorCtaBookNow => 'Buchen Sie jetzt';

  @override
  String get sponsorCtaCheckRates => 'Überprüfen Sie die Preise';

  @override
  String get sponsorCtaGetTickets => 'Holen Sie sich Tickets';

  @override
  String get sponsorCtaViewOffer => 'Angebot ansehen';

  @override
  String get featuredStaysTitle => 'Empfohlene Aufenthalte';

  @override
  String get featuredStaysSubtitle =>
      'Partnerplatzierungen – getrennt von den organischen Hotel-Match-Scores von Luxora.';

  @override
  String get featuredExperiencesTitle => 'Besondere Erlebnisse';

  @override
  String get featuredExperiencesSubtitle =>
      'Beworbene Tipps für Ihre Stimmung – immer beschriftet, nie als KI-Rang getarnt.';

  @override
  String get featuredDiningTitle => 'Empfohlenes Essen';

  @override
  String get featuredDiningSubtitle =>
      'Highlights der Partnerrestaurants von Luxora – Ihre Bio-Juwelenliste bleibt unabhängig.';

  @override
  String get featuredTicketPartnersTitle => 'Empfohlene Ticketpartner';

  @override
  String get featuredTicketPartnersSubtitle =>
      'Angebote von autorisierten Partnern – vergleichen Sie unten mit den organischen Ersparnissen.';

  @override
  String get featuredCityHomeTitle => 'Empfohlene Partner';

  @override
  String get featuredCityHomeSubtitle =>
      'Hilfreiche Partneroptionen für Orlando – klar gekennzeichnet, niemals als KI-Auswahl ausgeblendet.';

  @override
  String get dayFlowVibeFoodie => 'Feinschmecker-vorwärts';

  @override
  String get dayFlowVibeNightlife => 'Nachtleben';

  @override
  String get dayFlowVibePoolside => 'Am Pool';

  @override
  String get dayFlowVibeAdventure => 'Abenteuerlich';

  @override
  String get dayFlowVibeCulture => 'Kultur';

  @override
  String get onboardStep5Title => 'Das Herz von Luxora';

  @override
  String get onboardStep5Subtitle => 'Wie soll sich diese Reise ANFÜHLEN?';

  @override
  String get onboardTripFeelHint =>
      'Abendessen bei Sonnenuntergang, langsame Morgen, Lachen mit meinem Partner …';

  @override
  String get onboardStepNameEyebrow =>
      'Ihre Geschichte beginnt mit einem Namen';

  @override
  String get onboardStepNameTitle => 'Wie sollen wir diese Reise nennen?';

  @override
  String get onboardStepNameSubtitle =>
      'Luxora kann einen Titel aus Ihrer Stimmung erstellen – oder Ihren eigenen eingeben.';

  @override
  String get onboardTripNameLuxora => 'Luxora soll es nennen';

  @override
  String get onboardTripNameYours => 'Ich werde es benennen';

  @override
  String get onboardTripNameHint => 'Unser Ausflug zum Frühlingsjubiläum …';

  @override
  String onboardTripNameSuggested(String name) {
    return 'Luxora schlägt vor: $name';
  }

  @override
  String get conciergeTripNameLabel => 'Reisename';

  @override
  String get moodRomantic => 'Romantisch';

  @override
  String get moodRelaxing => 'Entspannend';

  @override
  String get moodAdventurous => 'Abenteuerlich';

  @override
  String get moodLuxurious => 'Luxuriös';

  @override
  String get moodFamily => 'Familienverbundenheit';

  @override
  String get moodSocial => 'Gesellig';

  @override
  String get moodNature => 'Naturfokussiert';

  @override
  String get moodWellness => 'Wellness-Retreat';

  @override
  String get moodFoodie => 'Kulinarisches Erlebnis';

  @override
  String get catHiddenGems => 'Versteckte Geheimtipps';

  @override
  String get catLuxuryStay => 'Luxuriöse Staycations';

  @override
  String get catBeaches => 'Strände';

  @override
  String get catRooftop => 'Rooftop-Dining';

  @override
  String get catSpas => 'Spas';

  @override
  String get catNightlife => 'Nachtleben';

  @override
  String get catFamily => 'Familie';

  @override
  String get catEco => 'Ökotourismus';

  @override
  String get catThemeParks => 'Freizeitparks';

  @override
  String get catRomantic => 'Romantische Auszeiten';

  @override
  String get catFood => 'Kulinarische Erlebnisse';

  @override
  String get catSprings => 'Quellen';

  @override
  String get catIslands => 'Inselhopping';

  @override
  String get catInfluencer => 'Influencer-tauglich';

  @override
  String get placeCatBeach => 'Strand';

  @override
  String get placeCatDining => 'Essen';

  @override
  String get placeCatNature => 'Natur';

  @override
  String get placeCatNightlife => 'Nachtleben';

  @override
  String get placeCatWellness => 'Wellness';

  @override
  String get placeCatFamily => 'Familie';

  @override
  String get placeCatSprings => 'Quellen';

  @override
  String get placeCatRomantic => 'Romantisch';

  @override
  String get placeCatAdventure => 'Abenteuer';

  @override
  String get placeCatHotel => 'Hotel';

  @override
  String get styleLessCrowded => 'Weniger überlaufen';

  @override
  String get styleLuxurySubtle => 'Luxus, aber nicht protzig';

  @override
  String get styleHiddenLuxury => 'Versteckter Luxus';

  @override
  String get styleWalkable => 'Wenn möglich zu Fuß erreichbar';

  @override
  String get styleSlowMornings => 'Langsame Morgen';

  @override
  String get styleNoTraps => 'Keine Touristenfallen';

  @override
  String get styleNatureHeavy => 'Viel Natur';

  @override
  String get styleNatureWellness => 'Nur Natur und Wellness';

  @override
  String get styleAestheticDining => 'Ästhetisches Dining';

  @override
  String get styleFamilyEasy => 'Familienfreundliche Logistik';

  @override
  String get paywallHeroEyebrow => 'IHR PERSÖNLICHER CONCIERGE';

  @override
  String get paywallHeroHeadline => 'VERGEBEN SIE IHREN URLAUB NICHT';

  @override
  String get paywallHeroSubheadline =>
      'Luxora plant die Reise, damit Sie sie genießen können.';

  @override
  String get paywallEmotionalLine =>
      'Sie geben bereits Tausende für Ihren Urlaub aus. Überlassen Sie das Erlebnis nicht dem Zufall.';

  @override
  String paywallHeadlineCouples(String cityName) {
    return 'Ihr perfekter Kurzurlaub in $cityName beginnt hier.';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return 'Verbringen Sie weniger Zeit mit der Planung und mehr Zeit mit dem Sammeln von Erinnerungen in $cityName.';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return 'Erleben Sie $cityName anders.';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return 'Entdecken Sie die Stadt $cityName, die die meisten Touristen nie sehen.';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return 'Probieren Sie $cityName wie ein lokaler Insider.';
  }

  @override
  String get paywallWhatYouUnlock => 'Was Sie freischalten';

  @override
  String get paywallFeatureAiConcierge => 'KI-Concierge';

  @override
  String get paywallFeatureItineraries => 'Personalisierte Reiserouten';

  @override
  String get paywallFeatureHiddenGems => 'Versteckte Juwelen';

  @override
  String get paywallFeatureHotelIntel => 'Hotelintelligenz';

  @override
  String get paywallFeatureTicketSavings => 'Smarte Ticketeinsparungen';

  @override
  String get paywallFeatureWeatherConcierge => 'Wetter-Concierge';

  @override
  String get paywallFeatureCrowdIntel => 'Crowd Intelligence';

  @override
  String get paywallFeatureGpsNav => 'GPS-Navigation';

  @override
  String get paywallFeatureLocalSecrets => 'Lokale Geheimnisse';

  @override
  String get paywallFeatureDining => 'Speiseempfehlungen';

  @override
  String get paywallFeatureUnlimitedPlanning => 'Grenzenlose Stadtplanung';

  @override
  String get paywallWhyTravelersUnlock => 'Warum Reisende Luxora freischalten';

  @override
  String get paywallBenefitSaveTimeTitle => 'Sparen Sie Zeit';

  @override
  String get paywallBenefitSaveTimeBody =>
      'Sparen Sie stundenlange Recherche und Planung.';

  @override
  String get paywallBenefitSaveMoneyTitle => 'Sparen Sie Geld';

  @override
  String get paywallBenefitSaveMoneyBody =>
      'Entdecken Sie Ticketeinsparungen, lokale Angebote und intelligentere Entscheidungen.';

  @override
  String get paywallBenefitAvoidTrapsTitle => 'Vermeiden Sie Touristenfallen';

  @override
  String get paywallBenefitAvoidTrapsBody =>
      'Finden Sie Erlebnisse, die Einheimische tatsächlich empfehlen.';

  @override
  String get paywallBenefitTravelSmarterTitle => 'Intelligenter reisen';

  @override
  String get paywallBenefitTravelSmarterBody =>
      'Erhalten Sie Empfehlungen basierend auf Wetter, Menschenmenge und Ihrem Reisestil.';

  @override
  String get paywallLockedPreviewTitle => 'Warten in Ihrem Concierge';

  @override
  String get paywallLockedPreviewSubtitle =>
      'Entsperren Sie die Karte, um Routen und Geheimnisse zu enthüllen, die auf Ihre Reise zugeschnitten sind.';

  @override
  String get paywallLockedDateNight => 'Romantische Date-Night-Routen';

  @override
  String get paywallLockedHiddenLuxury => 'Versteckte Luxuserlebnisse';

  @override
  String get paywallLockedVipSecrets => 'VIP-Lokalgeheimnisse';

  @override
  String get paywallLockedConciergeRecs => 'Concierge-Empfehlungen';

  @override
  String get paywallLockedFamilyPlans => 'Stressfreie Familienpläne';

  @override
  String get paywallLockedWeatherReroute => 'Wetterabhängige Umleitung';

  @override
  String get paywallLockedHotelMatchmaker => 'Smarter Hotel-Matchmaker';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return 'Schalten Sie den $cityName-Concierge frei';
  }

  @override
  String get paywallOneTimePurchase => 'Einmaliger Kauf';

  @override
  String get paywallNoSubscription => 'Kein Abonnement';

  @override
  String get paywallNoMonthlyFees => 'Keine monatlichen Gebühren';

  @override
  String paywallLifetimeAccess(String cityName) {
    return 'Lebenslanger Zugriff auf $cityName';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return 'Zukünftige $cityName-Updates enthalten';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return 'Die meisten $cityName-Urlaube kosten $minUsd–$maxUsd+';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price Einmalig';
  }

  @override
  String get paywallLessThanDinner =>
      'Weniger als die Kosten für ein Urlaubsessen.';

  @override
  String get paywallSocialProofTitle =>
      'Reisende, die Luxora freigeschaltet haben';

  @override
  String get paywallReview1 => '„Hat uns stundenlange Planung erspart.“';

  @override
  String get paywallReview2 => '„Orte gefunden, die wir nie entdeckt hätten.“';

  @override
  String get paywallReview3 =>
      '„Allein wegen der verborgenen Schätze lohnt es sich.“';

  @override
  String paywallCtaUnlock(String cityName) {
    return 'Schalten Sie den $cityName-Concierge frei';
  }

  @override
  String get paywallContinueExploring => 'Erkunden Sie weiter';

  @override
  String get paywallConciergePromise => 'Kein Abo · Lebenslanger Stadt-Zugang';

  @override
  String get paywallRestorePurchases => 'Einkäufe wiederherstellen';

  @override
  String get paywallPurchaseSuccess =>
      'Kauf abgeschlossen – Ihr Concierge ist freigeschaltet.';

  @override
  String get paywallPurchasePending => 'Kauf abschließen…';

  @override
  String get paywallPurchaseFailed =>
      'Der Kauf konnte nicht abgeschlossen werden. Versuchen Sie es erneut oder stellen Sie die Einkäufe wieder her.';

  @override
  String get paywallPurchaseCanceled => 'Kauf storniert.';

  @override
  String get paywallRestoreComplete => 'Einkäufe wiederhergestellt.';

  @override
  String get paywallRestoreNone =>
      'Für diese Apple-ID oder dieses Google-Konto wurden keine vorherigen Käufe gefunden.';

  @override
  String get paywallStoreUnavailable =>
      'Die Abrechnung über den App Store ist auf diesem Gerät nicht verfügbar.';

  @override
  String get paywallProductUnavailable =>
      'Dieses Paket ist noch nicht im Store erhältlich.';

  @override
  String get settingsUnlockConciergeTitle => 'Stadt-Concierge freischalten';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'Einmaliges City-Paket – kein Abonnement';

  @override
  String get settingsOpenConciergeSubtitle =>
      'Öffnen Sie die Registerkarte „AI Concierge“.';

  @override
  String get weatherMiamiHumidityIndoor =>
      'Heute hohe Luftfeuchtigkeit. Gehen Sie früher an den Strand oder in den Pool und genießen Sie dann in den heißesten Stunden in Wynwood oder Brickell Innenrestaurants und Galerien.';

  @override
  String get weatherMiamiHeatAdvisory =>
      'Empfohlene Bedingungen für die Hitze: leichte Stoffe, Flüssigkeitszufuhr und Pausen im Schatten zwischen Aufenthalten im Freien.';

  @override
  String get weatherMiamiBeachMorning =>
      'Starke UV-Strahlung im Sand – Sonnencreme, Hut und Strandzeit vor Mittag.';

  @override
  String get weatherMiamiBoatWind =>
      'Der Wind ist stärker – überdenken Sie die Boots- oder Yachtaktivitäten. Das Essen auf dem Dach funktioniert möglicherweise immer noch.';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return 'Regenwetter steht bevor – tauschen Sie Outdoor-Pläne gegen $indoorSpot oder Galeriezeit ein.';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      'Der Sonnenuntergang sieht stark aus – direkt am Wasser oder auf dem Dach mit Blick von Ost nach West.';

  @override
  String get miamiBeachIntelTitle => 'Strandintelligenz';

  @override
  String miamiBeachBestTime(String time) {
    return 'Beste Zeit: $time';
  }

  @override
  String get miamiBeachFamilyScore => 'Familie';

  @override
  String get miamiBeachCrowdScore => 'Menge';

  @override
  String get miamiBeachPhotoScore => 'Foto';

  @override
  String get miamiBeachRomanceScore => 'Romantik';

  @override
  String get miamiBeachSunsetScore => 'Sonnenuntergang';

  @override
  String miamiBeachParking(String level) {
    return 'Parkdeck';
  }

  @override
  String get miamiNightlifeTitle => 'Nachtleben-Concierge';

  @override
  String miamiNightlifeDressCode(String code) {
    return 'Kleiderordnung: $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return 'Beste Ankunftszeit: $time';
  }

  @override
  String get miamiNightlifeReservation => 'Reservierung empfohlen';

  @override
  String get miamiMoodRoutesTitle => 'Miami Mood Routes';

  @override
  String get tampaBayMoodRoutesTitle => 'Tampa-Bay-Stimmungsrouten';

  @override
  String get stAugustineMoodRoutesTitle => 'St.-Augustine-Stimmungsrouten';

  @override
  String get naplesMoodRoutesTitle => 'Naples-Stimmungsrouten';

  @override
  String get destin30aMoodRoutesTitle => 'Destin-&-30A-Stimmungsrouten';

  @override
  String get vegasMoodRoutesTitle => 'Las-Vegas-Stimmungsrouten';

  @override
  String miamiMoodRouteStart(String time) {
    return 'Beginnen Sie etwa um $time';
  }

  @override
  String get keysWaterIntelTitle => 'Keys Water Intelligence';

  @override
  String keysWaterBestTime(String time) {
    return 'Bestes Fenster: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Wasser: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Schnorchel';

  @override
  String get keysWaterDivingScore => 'Tauchen';

  @override
  String get keysWaterBoatingScore => 'Boot';

  @override
  String get keysWaterFishingScore => 'Fisch';

  @override
  String get keysWaterWindScore => 'Wind';

  @override
  String get keysWaterSunsetScore => 'Sonnenuntergang';

  @override
  String get keysWaterCrowdScore => 'Menge';

  @override
  String get keysMoodRoutesTitle => 'Keys Island-Routen';

  @override
  String keysMoodRouteStart(String time) {
    return 'Start $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'ERLEBEN SIE MIAMI ANDERS';

  @override
  String get paywallHeadlineMiamiWeekend =>
      'Verschwenden Sie nicht Ihr Miami-Wochenende';

  @override
  String get paywallOrlandoAddonsHeading => 'Themenpark-Paket';

  @override
  String get paywallOrlandoBaseIncludes =>
      'Die Orlando-Freischaltung umfasst Restaurants, versteckte Schätze, Hotels und Erlebnisse außerhalb des Parks. Fügen Sie das Themenpark-Paket für Disney und Universal zusammen.';

  @override
  String get paywallAddonThemeParksTitle => 'Disney & Universal-Paket';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World und Universal Orlando – alle Parks, Angebote, Routen und Crowd-Informationen in einer Freischaltung.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return 'Schalte $packName · $price frei';
  }

  @override
  String get paywallAddonUnlocked => 'Entsperrt';

  @override
  String get paywallAddonRequiresOrlando =>
      'Erfordert zuerst die Freischaltung von Orlando';

  @override
  String paywallUnlockAddonPack(String packName) {
    return 'Schalte $packName frei';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return 'Schalte $packName frei';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      'Disney & Universal für Orlando freischalten?';

  @override
  String get orlandoThemeParksPromptBody =>
      'Fügen Sie das Themenparkpaket für Walt Disney World und Universal Orlando hinzu – alle Parks, Ticketangebote, Routen und Zuschauerinformationen in einer Freischaltung.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Freischalten · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Nicht jetzt';

  @override
  String get onboardV2Eyebrow => 'Lassen Sie uns Ihre perfekte Reise gestalten';

  @override
  String get onboardV2StepTravelerEyebrow => 'Schritt 1';

  @override
  String get onboardV2StepTravelerTitle => 'Mit wem reisen Sie?';

  @override
  String get onboardV2StepTravelerSubtitle =>
      'Luxora passt die Aufenthalte, das Essen und das Tempo Ihrer Crew individuell an.';

  @override
  String get onboardV2ChildrenLabel => 'Kinder reisen?';

  @override
  String get onboardV2StepStyleEyebrow => 'Schritt 2';

  @override
  String get onboardV2StepStyleTitle => 'Was für eine Reise suchen Sie?';

  @override
  String get onboardV2StepStyleSubtitle =>
      'Wählen Sie alles, was Sie begeistert.';

  @override
  String get onboardV2StepHotelEyebrow => 'Schritt 3';

  @override
  String get onboardV2StepHotelTitle =>
      'In welcher Art von Unterkunft möchten Sie übernachten?';

  @override
  String get onboardV2StepHotelSubtitle =>
      'Wir kombinieren Boutique-Juwelen und Resort-Ikonen.';

  @override
  String get onboardV2HotelBudgetLabel => 'Hotelbudget';

  @override
  String get onboardV2HotelAmenitiesLabel => 'Unverzichtbare Annehmlichkeiten';

  @override
  String get onboardV2StepFoodEyebrow => 'Schritt 4';

  @override
  String get onboardV2StepFoodTitle =>
      'Welche Arten von Restaurants mögen Sie?';

  @override
  String get onboardV2StepFoodSubtitle =>
      'Küche und Speisestil – wählen Sie alles aus, was Ihnen gefällt.';

  @override
  String get onboardV2CuisineLabel => 'Küchenarten';

  @override
  String get onboardV2DiningStyleLabel => 'Essstil';

  @override
  String get onboardV2StepPaceEyebrow => 'Schritt 5';

  @override
  String get onboardV2StepPaceTitle => 'Wie möchten Sie Ihre Tage planen?';

  @override
  String get onboardV2StepPaceSubtitle =>
      'Entspannter Morgen oder vollgepacktes Abenteuer – Sie haben die Wahl.';

  @override
  String get onboardV2PaceRelaxedTitle => 'Entspannt';

  @override
  String get onboardV2PaceRelaxedBody => '2–3 Aktivitäten pro Tag';

  @override
  String get onboardV2PaceBalancedTitle => 'Ausgewogen';

  @override
  String get onboardV2PaceBalancedBody => '4–5 Aktivitäten pro Tag';

  @override
  String get onboardV2PacePackedTitle => 'Verpackt';

  @override
  String get onboardV2PacePackedBody => 'Maximieren Sie jeden Tag';

  @override
  String get onboardV2StepGoalsEyebrow => 'Schritt 6';

  @override
  String get onboardV2StepGoalsTitle =>
      'Was ist auf dieser Reise am wichtigsten?';

  @override
  String get onboardV2StepGoalsSubtitle =>
      'Wählen Sie bis zu fünf Prioritäten.';

  @override
  String get onboardV2StepExperienceEyebrow => 'Schritt 7';

  @override
  String get onboardV2StepExperienceTitle =>
      'Welche Erlebnisse würden Sie genießen?';

  @override
  String get onboardV2StepExperienceSubtitle =>
      'Wir werden diese in Ihre Reiseroute integrieren.';

  @override
  String get onboardV2StepAvoidEyebrow => 'Schritt 8';

  @override
  String get onboardV2StepAvoidTitle => 'Was würden Sie lieber vermeiden?';

  @override
  String get onboardV2StepAvoidSubtitle =>
      'Luxora vermeidet Dinge, die Ihre Reise belasten.';

  @override
  String get onboardV2StepEmotionEyebrow => 'Schritt 9';

  @override
  String get onboardV2StepEmotionTitle =>
      'Was würde diese Reise erfolgreich machen?';

  @override
  String get onboardV2StepEmotionSubtitle => 'Wählen Sie ein primäres Gefühl.';

  @override
  String get onboardV2StepSummaryEyebrow => 'LUXORA';

  @override
  String onboardV2StepSummaryTitle(String name) {
    return 'Perfekt, $name.';
  }

  @override
  String get onboardV2StepSummarySubtitle =>
      'Ich habe ein wenig über deinen Reisestil gelernt.\n\nJetzt nutze ich deine Vorlieben, um Orte, Erlebnisse, Restaurants und Geheimtipps zu empfehlen, die zu dir passen.\n\nJede Empfehlung wird speziell für dich zugeschnitten.\n\nLass uns sehen, was wir entdecken können.';

  @override
  String get onboardSummaryHotels => 'Unterkünfte';

  @override
  String get onboardSummaryRestaurants => 'Restaurants';

  @override
  String get onboardSummaryHiddenGems => 'Versteckte Juwelen';

  @override
  String get onboardSummaryExperiences => 'Erfahrungen';

  @override
  String get onboardSummaryHotelDefault =>
      'Kuratierte Aufenthalte, abgestimmt auf Ihr Budget';

  @override
  String onboardSummaryHotelType(String type) {
    return '$type bleiben';
  }

  @override
  String get onboardSummaryRooftopDining =>
      'Kulinarische Erlebnisse auf dem Dach';

  @override
  String onboardSummaryCuisine(String cuisine) {
    return '$cuisine Favoriten';
  }

  @override
  String onboardSummaryPace(String pace) {
    return '$pace tägliches Tempo';
  }

  @override
  String get onboardSummaryRomantic => 'Romantische Sonnenuntergangserlebnisse';

  @override
  String onboardSummaryEmotion(String emotion) {
    return '$emotion-fokussierte Reise';
  }

  @override
  String get onboardSummaryPremiumGems => 'Premium versteckte Schätze';

  @override
  String get agendaSuggestionsForYou => 'Für Sie ausgewählt';

  @override
  String get agendaSuggestionsAlternates => 'Auch großartig';

  @override
  String get agendaSuggestionsBrowseAll => 'Alle durchsuchen';

  @override
  String get onboardPrefTravelerSolo => 'Allein';

  @override
  String get onboardPrefTravelerCouple => 'Paar';

  @override
  String get onboardPrefTravelerFamily => 'Familie';

  @override
  String get onboardPrefTravelerFriends => 'Freunde';

  @override
  String get onboardPrefTravelerBusiness => 'Geschäft';

  @override
  String get onboardPrefChildrenNone => 'Keine Kinder';

  @override
  String get onboardPrefChildrenToddlers => 'Kleinkinder';

  @override
  String get onboardPrefChildrenElementary => 'Grundschulalter';

  @override
  String get onboardPrefChildrenTeenagers => 'Teenager';

  @override
  String get onboardPrefStyleLuxury => 'Luxus';

  @override
  String get onboardPrefStyleRelaxation => 'Entspannung';

  @override
  String get onboardPrefStyleAdventure => 'Abenteuer';

  @override
  String get onboardPrefStyleThemeParks => 'Themenparks';

  @override
  String get onboardPrefStyleFoodie => 'Feinschmecker';

  @override
  String get onboardPrefStyleNightlife => 'Nachtleben';

  @override
  String get onboardPrefStyleRomance => 'Romantik';

  @override
  String get onboardPrefStyleShopping => 'Einkaufen';

  @override
  String get onboardPrefStyleBeaches => 'Strände';

  @override
  String get onboardPrefStyleWellness => 'Wohlbefinden';

  @override
  String get onboardPrefStyleNature => 'Natur';

  @override
  String get onboardPrefStylePhotography => 'Fotografie';

  @override
  String get onboardPrefStyleHiddenGems => 'Versteckte Juwelen';

  @override
  String get onboardPrefStyleFamilyActivities => 'Familienaktivitäten';

  @override
  String get onboardPrefStyleLocalExperiences => 'Lokale Erlebnisse';

  @override
  String get onboardPrefStyleEntertainment => 'Unterhaltung';

  @override
  String get onboardPrefHotelLuxuryResort => 'Luxusresort';

  @override
  String get onboardPrefHotelBoutique => 'Boutique-Hotel';

  @override
  String get onboardPrefHotelFamilyResort => 'Familienresort';

  @override
  String get onboardPrefHotelBudgetFriendly => 'Budgetfreundlich';

  @override
  String get onboardPrefHotelAdultsOnly => 'Nur für Erwachsene';

  @override
  String get onboardPrefHotelSpaResort => 'Spa-Resort';

  @override
  String get onboardPrefHotelBeachfront => 'Direkt am Strand';

  @override
  String get onboardPrefHotelDowntown => 'Innenstadt';

  @override
  String get onboardPrefHotelWalkable => 'Begehbarer Bereich';

  @override
  String get onboardPrefHotelThemeParkArea => 'Themenparkbereich';

  @override
  String get onboardPrefHotelModern => 'Modernes Hotel';

  @override
  String get onboardPrefHotelHistoric => 'Historisches Hotel';

  @override
  String get onboardPrefBudgetOne => '\$';

  @override
  String get onboardPrefBudgetTwo => '\$\$';

  @override
  String get onboardPrefBudgetThree => '\$\$\$';

  @override
  String get onboardPrefBudgetFour => '\$\$\$\$';

  @override
  String get onboardPrefAmenityPool => 'Swimmingpool';

  @override
  String get onboardPrefAmenitySpa => 'Wellness-Spa';

  @override
  String get onboardPrefAmenityGym => 'Fitnessstudio';

  @override
  String get onboardPrefAmenityBreakfast => 'Kostenloses Frühstück';

  @override
  String get onboardPrefAmenityOceanView => 'Meerblick';

  @override
  String get onboardPrefAmenityBalcony => 'Balkon';

  @override
  String get onboardPrefAmenityKitchen => 'Küche';

  @override
  String get onboardPrefAmenityShuttle => 'Shuttle-Service';

  @override
  String get onboardPrefAmenityPetFriendly => 'Haustierfreundlich';

  @override
  String get onboardPrefCuisineAmerican => 'amerikanisch';

  @override
  String get onboardPrefCuisineItalian => 'Italienisch';

  @override
  String get onboardPrefCuisineMexican => 'Mexikaner';

  @override
  String get onboardPrefCuisineSeafood => 'Meeresfrüchte';

  @override
  String get onboardPrefCuisineSteakhouse => 'Steakhaus';

  @override
  String get onboardPrefCuisineSushi => 'Sushi';

  @override
  String get onboardPrefCuisineCuban => 'Kubanisch';

  @override
  String get onboardPrefCuisineMediterranean => 'Mittelmeer';

  @override
  String get onboardPrefCuisineAsian => 'asiatisch';

  @override
  String get onboardPrefCuisineBbq => 'Grillen';

  @override
  String get onboardPrefCuisineFineDining => 'Feines Essen';

  @override
  String get onboardPrefCuisineLocalFavorites => 'Lokale Favoriten';

  @override
  String get onboardPrefCuisineFoodTrucks => 'Imbisswagen';

  @override
  String get onboardPrefCuisineRooftop => 'Speisen auf dem Dach';

  @override
  String get onboardPrefCuisineBrunch => 'Brunch';

  @override
  String get onboardPrefCuisineDessert => 'Nachtisch';

  @override
  String get onboardPrefDiningQuick => 'Schneller Service';

  @override
  String get onboardPrefDiningCasual => 'Lässiges Essen';

  @override
  String get onboardPrefDiningFamily => 'Familienfreundlich';

  @override
  String get onboardPrefDiningDateNight => 'Date-Nacht';

  @override
  String get onboardPrefDiningFine => 'Feines Essen';

  @override
  String get onboardPrefDiningWaterfront => 'Uferpromenade';

  @override
  String get onboardPrefDiningHiddenGems => 'Versteckte Juwelen';

  @override
  String get onboardPrefDiningLocal => 'Lokale Favoriten';

  @override
  String get onboardPrefGoalMakeMemories => 'Machen Sie Erinnerungen';

  @override
  String get onboardPrefGoalSaveMoney => 'Sparen Sie Geld';

  @override
  String get onboardPrefGoalAvoidCrowds => 'Vermeiden Sie Menschenmassen';

  @override
  String get onboardPrefGoalLuxury => 'Luxuserlebnisse';

  @override
  String get onboardPrefGoalBestFood => 'Bestes Essen';

  @override
  String get onboardPrefGoalHiddenGems => 'Versteckte Juwelen';

  @override
  String get onboardPrefGoalRelaxation => 'Entspannung';

  @override
  String get onboardPrefGoalAdventure => 'Abenteuer';

  @override
  String get onboardPrefGoalBestPhotos => 'Beste Fotos';

  @override
  String get onboardPrefGoalFamilyTime => 'Familienzeit';

  @override
  String get onboardPrefGoalRomance => 'Romantik';

  @override
  String get onboardPrefGoalNightlife => 'Nachtleben';

  @override
  String get onboardPrefGoalLocal => 'Lokale Erlebnisse';

  @override
  String get onboardPrefGoalStressFree => 'Stressfreie Planung';

  @override
  String get onboardPrefExpBoatTours => 'Bootstouren';

  @override
  String get onboardPrefExpSunsetCruises => 'Sonnenuntergangskreuzfahrten';

  @override
  String get onboardPrefExpAirboat => 'Airboat-Touren';

  @override
  String get onboardPrefExpThemeParks => 'Themenparks';

  @override
  String get onboardPrefExpMuseums => 'Museen';

  @override
  String get onboardPrefExpLiveShows => 'Live-Shows';

  @override
  String get onboardPrefExpSpas => 'Spa & Wellness';

  @override
  String get onboardPrefExpShopping => 'Einkaufen';

  @override
  String get onboardPrefExpWaterParks => 'Wasserparks';

  @override
  String get onboardPrefExpGolf => 'Golf';

  @override
  String get onboardPrefExpFishing => 'Angeln';

  @override
  String get onboardPrefExpKayaking => 'Kajakfahren';

  @override
  String get onboardPrefExpSnorkeling => 'Schnorcheln';

  @override
  String get onboardPrefExpRooftopBars => 'Bars auf dem Dach';

  @override
  String get onboardPrefExpNightclubs => 'Nachtclubs';

  @override
  String get onboardPrefExpWildlife => 'Wildtiererlebnisse';

  @override
  String get onboardPrefExpFoodTours => 'Food-Touren';

  @override
  String get onboardPrefExpScenicDrives => 'Malerische Fahrten';

  @override
  String get onboardPrefAvoidCrowds => 'Massen';

  @override
  String get onboardPrefAvoidLongLines => 'Lange Schlangen';

  @override
  String get onboardPrefAvoidExpensiveRestaurants => 'Teure Restaurants';

  @override
  String get onboardPrefAvoidWalking => 'Lange Strecken zurücklegen';

  @override
  String get onboardPrefAvoidNightlife => 'Nachtleben';

  @override
  String get onboardPrefAvoidDriving => 'Fahren';

  @override
  String get onboardPrefAvoidTouristTraps => 'Touristenfallen';

  @override
  String get onboardPrefAvoidEarlyMornings => 'Frühmorgens';

  @override
  String get onboardPrefAvoidLateNights => 'Späte Nächte';

  @override
  String get onboardPrefAvoidFamilyAttractions => 'Familienattraktionen';

  @override
  String get onboardPrefAvoidThemeParks => 'Themenparks';

  @override
  String get onboardPrefEmotionRelaxed => 'Entspannt';

  @override
  String get onboardPrefEmotionExcited => 'Aufgeregt';

  @override
  String get onboardPrefEmotionAdventurous => 'Abenteuerlich';

  @override
  String get onboardPrefEmotionRomantic => 'Romantisch';

  @override
  String get onboardPrefEmotionLuxurious => 'Luxuriös';

  @override
  String get onboardPrefEmotionFamilyFocused => 'Familienorientiert';

  @override
  String get onboardPrefEmotionMemorable => 'Unvergesslich';

  @override
  String get onboardPrefEmotionStressFree => 'Stressfrei';

  @override
  String get onboardPrefEmotionInspiring => 'Inspirierend';

  @override
  String get onboardPrefPaceSlow => 'Entspannt';

  @override
  String get onboardPrefPaceBalanced => 'Ausgewogen';

  @override
  String get onboardPrefPacePacked => 'Verpackt';

  @override
  String get onboardSummaryHiddenGemsInsight =>
      'Versteckte lokale Restaurants und Juwelen';

  @override
  String get onboardBuildFailedHint =>
      'Wir haben Ihre Präferenzen gespeichert, aber die Reiseroute benötigt noch einen Moment. Ziehen Sie, um die Agenda zu aktualisieren oder Concierge zu öffnen.';

  @override
  String get onboardV2ChildrenSubtitle =>
      'Wählen Sie alle zutreffenden Altersgruppen aus.';

  @override
  String get onboardTravelerNameEyebrow => 'Das Wichtigste zuerst';

  @override
  String get onboardTravelerNameTitle => 'Wie soll Luxora dich nennen?';

  @override
  String get onboardTravelerNameSubtitle =>
      'Ihr Vorname reicht aus – Luxora verwendet ihn beim Chatten.';

  @override
  String get onboardTravelerNameLabel => 'Dein Vorname';

  @override
  String get onboardTravelerNameHint => 'z.B. Maria';

  @override
  String conciergeWelcomeNamed(String name) {
    return 'Willkommen, $name – Ihr emotional intelligenter Florida-Begleiter.\n\nWählen Sie unten eine Aufforderung aus oder beschreiben Sie das Gefühl, das Ihre Reise vermitteln soll.';
  }

  @override
  String conciergeWelcomeWarmNamed(String name) {
    return '$name, ich bin hier, um Florida nach Ihren Wünschen zu gestalten – nicht nach einer Checkliste mit Sehenswürdigkeiten. Worauf hast du heute Lust?';
  }

  @override
  String get onboardWelcomeEyebrow => 'LUXORA';

  @override
  String get onboardWelcomeTitle => 'Hallo, ich bin Luxora.';

  @override
  String get onboardWelcomeTagline => 'Dein persönlicher Reise-Concierge.';

  @override
  String get onboardWelcomeBody =>
      'Ich helfe dir, unglaubliche Orte zu entdecken, Touristenfallen zu vermeiden und einen Urlaub zu planen, den du jahrelang in Erinnerung behältst.\n\nLass uns etwas Unvergessliches planen.';

  @override
  String get onboardWelcomeCta => 'Meine Reise beginnen';

  @override
  String get onboardLuxoraGuideBody =>
      'Von diesem Moment an begleite ich dich auf jedem Schritt.\n\nOb versteckte Juwelen, großartiges Essen, unvergessliche Erlebnisse oder einfach ein stressfreier Urlaub — ich bin für dich da.';

  @override
  String get onboardLuxoraReplyClosing =>
      'Lass uns gemeinsam dein perfektes Abenteuer gestalten.';

  @override
  String onboardBuildingTitle(String name) {
    return 'Wunderbare Wahl, $name.';
  }

  @override
  String get onboardBuildingBody =>
      'Ich erstelle eine personalisierte Reiseroute basierend auf deinem Stil, deinen Interessen, deinem Tempo, deinen Essensvorlieben und deinen Urlaubszielen.\n\nDas kann einen Moment dauern.';

  @override
  String get onboardBuildingTagline =>
      'Gute Urlaube passieren zufällig.\n\nGroßartige Urlaube entstehen mit einem Plan.';

  @override
  String get onboardItineraryReadyTitle => 'Dein Abenteuer ist bereit.';

  @override
  String get onboardItineraryReadyBody =>
      'Ich habe sorgfältig Erlebnisse, Restaurants, Attraktionen und Geheimtipps ausgewählt, die zu deiner Reise passen.\n\nNatürlich können wir alles jederzeit anpassen.\n\nDie besten Urlaube entwickeln sich, während sie stattfinden.';

  @override
  String weatherRerouteLuxoraIntro(String name) {
    return '$name, das Wetter könnte einen Teil der heutigen Pläne beeinflussen.';
  }

  @override
  String get weatherRerouteLuxoraClosing =>
      'Manchmal entstehen die besten Erinnerungen aus dem Unerwarteten.';

  @override
  String rightNowLuxoraIntro(String name) {
    return '$name, basierend auf deinem Standort, dem aktuellen Wetter und deinen Vorlieben — das würde ich jetzt tun.';
  }

  @override
  String get rightNowLuxoraClosing =>
      'Vertrau mir.\n\nIch denke, du wirst es lieben.';

  @override
  String paywallPersonalPitch(String name, String cityName) {
    return '$name, dein personalisierter Urlaubsplan nimmt bereits Form an.\n\nTag 1 ist bereit.\n\nDer Rest deiner Reise wartet.\n\nSchalte $cityName Concierge frei für die komplette Reiseroute, Geheimtipps, lokale Secrets, Wetter-Intelligenz und unbegrenzte Concierge-Begleitung.\n\nLass uns diesen Urlaub unvergesslich machen.';
  }

  @override
  String get onboardLuxoraReplyEyebrow => 'LUXORA';

  @override
  String onboardLuxoraReplyTitle(String name) {
    return 'Schön, Sie kennenzulernen, $name.';
  }

  @override
  String onboardLuxoraGuideNamed(String name) {
    return 'Von diesem Moment an begleite ich dich auf jedem Schritt.\n\nOb versteckte Juwelen, großartiges Essen, unvergessliche Erlebnisse oder einfach ein stressfreier Urlaub — ich bin für dich da.';
  }

  @override
  String get onboardLuxoraItineraryPromise =>
      'Lass uns gemeinsam dein perfektes Abenteuer gestalten.';

  @override
  String get onboardReturningEyebrow => 'WILLKOMMEN ZURÜCK';

  @override
  String onboardReturningTitle(String name) {
    return 'Willkommen zurück, $name.';
  }

  @override
  String get onboardReturningTitleGeneric => 'Willkommen zurück.';

  @override
  String get onboardReturningSubtitle =>
      'Bereit, dein Abenteuer fortzusetzen?\n\nIch habe deine Vorlieben, Lieblingsorte und Reisepläne gespeichert, damit wir genau dort weitermachen können.\n\nLass uns sehen, was heute auf dich wartet.';

  @override
  String get todayPlanSectionTitle => 'Der heutige Plan';

  @override
  String get todayNextActivityLabel => 'Als nächstes';

  @override
  String get todayStaysDiningSection => 'Aufenthalte und Restaurants';

  @override
  String get todayStaysDiningCollapsedHint =>
      'Hotel- und Restaurantideen – zum Erweitern tippen';

  @override
  String get todayPlanDetailsTitle => 'Vollständiger Zeitplan';

  @override
  String todayPlanStopCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Stopps heute',
      one: '1 stop today',
    );
    return '$_temp0';
  }

  @override
  String get todayRainRerouteTitle => 'Wetter-Umplanung';

  @override
  String get todayExtrasSection => 'Tickets & Teilen';

  @override
  String get todayExtrasCollapsedHint => 'Angebote, Sharecard und mehr';

  @override
  String freemiumVacationTitle(String cityName) {
    return 'Dein $cityName-Urlaub';
  }

  @override
  String get freemiumDay1Ready => '✓ Tag 1 bereit';

  @override
  String get freemiumUnlockFullPlan => 'Gesamten Urlaubsplan freischalten';

  @override
  String freemiumLockedDayConcierge(int day) {
    return 'Tag $day · Concierge-optimiert';
  }

  @override
  String get freemiumLockedDayGems => 'Tag 3 · Geheimtipps-Route';

  @override
  String get freemiumLockedDayWeather => 'Tag 4 · Wetterbewusste Planung';

  @override
  String get freemiumLockedDayDeparture => 'Tag 5 · Abreise-Strategie';

  @override
  String freemiumConciergeRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kostenlose Fragen übrig',
      one: '1 kostenlose Frage übrig',
    );
    return '$_temp0';
  }

  @override
  String get freemiumConciergeLimitReached =>
      'Kostenloses Concierge-Limit erreicht — für unbegrenzte Planung freischalten.';

  @override
  String freemiumLockedHotels(int count) {
    return '🔒 $count+ weitere Hotels verfügbar';
  }

  @override
  String freemiumLockedRestaurants(int count) {
    return '🔒 $count+ weitere Restaurants verfügbar';
  }

  @override
  String freemiumLockedGems(int count) {
    return '🔒 $count+ Geheimtipps verfügbar';
  }

  @override
  String freemiumLockedSecrets(int count) {
    return '🔒 $count+ lokale Geheimnisse verfügbar';
  }

  @override
  String freemiumLockedExperiences(int count) {
    return '🔒 $count+ Erlebnisse verfügbar';
  }

  @override
  String get freemiumLockedAttractions => '🔒 Weitere Attraktionen verfügbar';

  @override
  String freemiumUnlockExplore(String cityName) {
    return '$cityName Concierge freischalten, um weiter zu entdecken.';
  }

  @override
  String freemiumUnlockConcierge(String cityName) {
    return '$cityName Concierge freischalten';
  }

  @override
  String freemiumHeadlineDayTwoPlus(String cityName) {
    return 'Deine nächsten Tage sind bereit — schalte den vollen $cityName-Plan frei.';
  }

  @override
  String get freemiumHeadlineConciergeLimit =>
      'Weiterplanen mit unbegrenztem Concierge-Zugang.';

  @override
  String freemiumHeadlineHotels(String cityName) {
    return '$cityName Concierge freischalten für jede Unterkunftsempfehlung.';
  }

  @override
  String freemiumHeadlineRestaurants(String cityName) {
    return 'Schalte die komplette Restaurant-Sammlung für $cityName frei.';
  }

  @override
  String get freemiumHeadlineGems =>
      'Lokale Favoriten und Insider-Geheimtipps warten.';

  @override
  String get freemiumHeadlineSecrets =>
      'Schalte Insider-Timing und Parkgeheimnisse frei.';

  @override
  String freemiumHeadlineExperiences(String cityName) {
    return 'Schalte kuratierte Erlebnisse in ganz $cityName frei.';
  }

  @override
  String get freemiumHeadlineAttractions =>
      'Schalte die komplette Attraktionen-Sammlung frei.';

  @override
  String get freemiumHeadlineHotelMatchmaker =>
      'Hotel Intelligence freischalten, um jeden Aufenthalt zu vergleichen.';

  @override
  String get freemiumHeadlineFullItinerary =>
      'Schalte deinen vollen Urlaubsplan frei.';

  @override
  String get freemiumLocalSecretsTitle => 'Lokale Geheimnisse';

  @override
  String get freemiumLocalSecretsSubtitle =>
      'Insider-Timing, Parken und Aussichtspunkte, die Einheimische hüten.';
}
