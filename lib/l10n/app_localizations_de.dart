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
      'Luxuriös und cineastisch oder klar und lesbar — wählen Sie, was zu Ihrem Tag passt.';

  @override
  String get settingsThemeSectionLuxury => 'Luxuriös & cineastisch';

  @override
  String get settingsThemeSectionReadable => 'Klar & lesbar';

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
  String get navDiscover => 'Entdecken';

  @override
  String get navMap => 'Karte';

  @override
  String get navTrips => 'Reisen';

  @override
  String get navMore => 'Mehr';

  @override
  String get navTimeline => 'Zeitplan';

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
    return 'Preise vom $date';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'Preise konnten nicht aktualisiert werden — zwischengespeicherte Angebote werden angezeigt.';

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
  String get radiusDesc25Keys => 'Key Largo, Islamorada und oberes Riff';

  @override
  String get radiusDesc50Keys => 'Marathon, Big Pine und mittlere Keys-Strände';

  @override
  String get radiusDesc100Keys => 'Gesamte Overseas Highway bis Key West';

  @override
  String get radiusDescAllKeys => 'Ganze Inselkette und Tagesausflugsgewässer';

  @override
  String get feedBadge => 'LIVE-ENTDECKUNG';

  @override
  String get feedTitle => 'Erlebnis-Feed';

  @override
  String get feedSubtitle =>
      'Was gerade in Bewegung ist: Trendorte, Neueröffnungen, Creator-Tipps, saisonale Routen und Live-Updates.';

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
  String get feedMoodAll => 'Alles';

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
  String get feedEmptyHint =>
      'Keine Feed-Karten in diesem Radius. Probiere 50 mi oder Ganz Florida für Golfküste und Keys.';

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
  String get mapPlanDayTitle => 'Die Agenda für heute';

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
    return 'Parken: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'Fahrstress: $score/90';
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
      'Es regnet wahrscheinlich – tippen Sie auf „Umleitung“ für Backups in Innenräumen.';

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
      'Mikrofon-Zugriff erlauben, damit Luxora zuhören kann.';

  @override
  String get conciergeVoiceListening => 'Luxora hört zu…';

  @override
  String get conciergeVoiceRelease => 'Loslassen zum Senden';

  @override
  String get conciergeVoiceNoSpeech =>
      'Das habe ich nicht verstanden — halten, sprechen, loslassen.';

  @override
  String get conciergeVoicePreviewFailed =>
      'Vorschau fehlgeschlagen. Lautstärke prüfen und erneut versuchen.';

  @override
  String get conciergeVoiceUnavailable =>
      'Spracheingabe ist auf diesem Gerät nicht verfügbar.';

  @override
  String get conciergeVoiceSettingsTitle => 'Luxora-Stimme';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Wählen Sie Akzent, Ton und Tempo — nutzt die Systemstimmen Ihres Geräts.';

  @override
  String get conciergeVoiceRateLabel => 'Sprechtempo';

  @override
  String get conciergeVoiceRateSlow => 'Langsam';

  @override
  String get conciergeVoiceRateNatural => 'Natürlich';

  @override
  String get conciergeVoiceRateFast => 'Schnell';

  @override
  String get conciergeVoicePreview => 'Stimme testen';

  @override
  String get conciergeVoicePreviewSample =>
      'Hallo — ich bin Luxora. Sag mir, wie sich diese Reise anfühlen soll.';

  @override
  String get conciergeVoiceDeviceNote =>
      'Verfügbare Stimmen hängen von den Sprachpaketen auf Ihrem Gerät ab.';

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
  String get conciergeVoicePresetMatchApp => 'App-Sprache · Weiblich';

  @override
  String get conciergeVoicePresetEnUsF => 'Amerikanisch · Weiblich';

  @override
  String get conciergeVoicePresetEnUsM => 'Amerikanisch · Männlich';

  @override
  String get conciergeVoicePresetEnGbF => 'Britisch · Weiblich';

  @override
  String get conciergeVoicePresetEnGbM => 'Britisch · Männlich';

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
  String get conciergeThinking => 'Luxora denkt nach…';

  @override
  String get conciergeAiError =>
      'Luxora ist gerade nicht erreichbar. Verbindung prüfen und erneut versuchen.';

  @override
  String get conciergeAiNotConfigured =>
      'Live-Concierge benötigt Supabase + OpenAI. SUPABASE_URL und SUPABASE_ANON_KEY in die lokale Config eintragen und die Edge Function concierge-chat deployen — siehe docs/CONCIERGE_AI.md.';

  @override
  String get mapAiPowers => 'KI-Kartenfunktionen';

  @override
  String get mapNavLayerTitle => 'Reibungs-Intelligenz pro Stopp';

  @override
  String get mapNavLayerSubtitle =>
      'Andrang, Parken und Fahrstress im Tagesplan — plus spontane Umleitung.';

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
  String get mapFutureCrowdTitle => 'Andrang-Ausblick';

  @override
  String get mapFutureCrowdDesc =>
      'Prognose von ruhig bis voll auf jedem Stopp in „Plan my day“.';

  @override
  String get mapFutureParkingTitle => 'Park-Ausblick';

  @override
  String get mapFutureParkingDesc =>
      'Geschätzte Reibung bei Valet, Parkhaus und Ankunft — vor dem Losfahren.';

  @override
  String get mapFutureTrafficTitle => 'Drive friction score';

  @override
  String get mapFutureTrafficDesc =>
      'Stressgewichtete Etappen-Scores im Tagesplan — nicht nur Fahrminuten.';

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
  String get tripsSaveDates => 'Daten speichern';

  @override
  String get tripsDatesUpdated => 'Reisedaten aktualisiert';

  @override
  String get tripsDatesFlexible => 'Flexible Daten';

  @override
  String get tripsLiveWeather => 'Live-Wetter';

  @override
  String get tripsNextUp => 'Als nächstes';

  @override
  String get tripsSunsetWindow => 'Sonnenuntergangsfenster';

  @override
  String get tripsTimelineSnapshot => 'Zeitleisten-Schnappschuss';

  @override
  String get tripsOpenTimeline => 'Vollständige Zeitleiste öffnen';

  @override
  String get tripsShare => 'Aktie';

  @override
  String get shareItineraryFooter =>
      'Geplant mit Luxora – Ihrem emotional intelligenten Florida-Begleiter.';

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
  String get detailTravelIntelTitle => 'Reibungs-Ausblick';

  @override
  String get detailTravelIntelSubtitle =>
      'Prognose aus Kategorie, Uhrzeit und Entfernung — keine Live-Sensoren.';

  @override
  String detailCrowdOutlook(String level) {
    return 'Andrang: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'Parken: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'Fahrstress: $score/90';
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
  String get landingBegin => 'Reise beginnen';

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
  String get onboardStep1Title => 'Wo Träume zuerst landen';

  @override
  String get onboardStep1Subtitle => 'Wohin geht es?';

  @override
  String get onboardDestination => 'Ziel';

  @override
  String get onboardRegion => 'Region';

  @override
  String get onboardCityLabel => 'Wähle deine Stadt';

  @override
  String get onboardCityUnlockNote =>
      'Jedes Reiseziel hat sein eigenes Concierge-Freischalten — einmaliger Kauf pro Stadt. Orlando-Themenparks sind ein Paket (Disney & Universal zusammen).';

  @override
  String get landingCityLabel => 'Wohin geht es?';

  @override
  String get paywallSwitchCity => 'Reiseziel';

  @override
  String get cityPickerUnlocked => 'Freigeschaltet';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Freischalten $price';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Orlando-Add-on · Disney & Universal zusammen';

  @override
  String get onboardStep2Title => 'Zeit, dich frei zu fühlen';

  @override
  String get onboardStep2Subtitle => 'Wann beginnt deine Auszeit?';

  @override
  String get onboardStartDateLabel => 'Startdatum';

  @override
  String get onboardEndDateLabel => 'Enddatum';

  @override
  String get onboardPickDate => 'Tippen zum Auswählen';

  @override
  String get onboardSelectStartDate => 'Startdatum wählen';

  @override
  String get onboardSelectEndDate => 'Enddatum wählen';

  @override
  String get onboardDatesHint =>
      'Sie können die Daten jederzeit unter Reisen ändern.';

  @override
  String get onboardStepBudgetTitle => 'Entspannt planen';

  @override
  String get onboardStepBudgetSubtitle =>
      'Was fühlt sich für diese Reise richtig an?';

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
  String get weatherRadarPause => 'Schleife pausieren';

  @override
  String get weatherRadarTapToExpand => 'Tippen für Vollbild';

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
      'Buchungslink für diesen Aufenthalt noch nicht verfügbar.';

  @override
  String get hotelLinkOpenFailed =>
      'Link konnte nicht geöffnet werden — versuche es im Browser erneut.';

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
  String get paywallConciergePromise =>
      'Einmaliger Kauf · Persönlicher Concierge · Kein Abonnement';

  @override
  String get settingsUnlockConciergeTitle => 'Stadt-Concierge freischalten';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'Einmaliges City-Paket – kein Abonnement';

  @override
  String get settingsOpenConciergeSubtitle => 'Zum KI-Concierge-Tab wechseln';

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
  String miamiMoodRouteStart(String time) {
    return 'Beginnen Sie etwa um $time';
  }

  @override
  String get keysWaterIntelTitle => 'Keys Wasser-Intelligence';

  @override
  String keysWaterBestTime(String time) {
    return 'Bestes Fenster: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Wasser: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Schnorcheln';

  @override
  String get keysWaterDivingScore => 'Tauchen';

  @override
  String get keysWaterBoatingScore => 'Boot';

  @override
  String get keysWaterFishingScore => 'Angeln';

  @override
  String get keysWaterWindScore => 'Wind';

  @override
  String get keysWaterSunsetScore => 'Sonnenuntergang';

  @override
  String get keysWaterCrowdScore => 'Menschenmenge';

  @override
  String get keysMoodRoutesTitle => 'Keys-Inselrouten';

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
      'Orlando umfasst Restaurants, Geheimtipps, Hotels und Erlebnisse außerhalb der Parks. Themenpark-Paket für Disney und Universal zusammen.';

  @override
  String get paywallAddonThemeParksTitle => 'Disney & Universal Paket';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World und Universal Orlando — alle Parks, Deals, Routen und Crowd-Intel in einem Freischalten.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return '$packName freischalten · $price';
  }

  @override
  String get paywallAddonUnlocked => 'Freigeschaltet';

  @override
  String get paywallAddonRequiresOrlando =>
      'Erfordert zuerst Orlando-Freischaltung';

  @override
  String paywallUnlockAddonPack(String packName) {
    return '$packName freischalten';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return '$packName freischalten';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      'Disney & Universal für Orlando freischalten?';

  @override
  String get orlandoThemeParksPromptBody =>
      'Füge das Themenpark-Paket für Walt Disney World und Universal Orlando hinzu — alle Parks, Ticket-Deals, Routen und Crowd-Intel in einem Freischalten.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Freischalten · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Nicht jetzt';
}
