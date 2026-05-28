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
  String get commonClose => 'Schließen';

  @override
  String get navConcierge => 'Concierge';

  @override
  String get navTimeline => 'Zeitplan';

  @override
  String get navMap => 'Karte';

  @override
  String get navGems => 'Geheimtipps';

  @override
  String get navFeed => 'Feed';

  @override
  String get navTrips => 'Reisen';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'Concierge';

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
  String get discoverSearchScopeAll => 'Suche im gesamten Florida-Katalog';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'Innerhalb von $radius um Orlando';
  }

  @override
  String get discoverSearchEmpty =>
      'Keine Treffer in diesem Radius. Probiere einen kürzeren Namen, erweitere die Distanz auf Karte oder Feed oder suche nach „Strand“, „Disney“ oder „Quellen“.';

  @override
  String get discoverPopularInRadius => 'Beliebt in deinem Radius';

  @override
  String get discoverTrySearching => 'Suche ausprobieren';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count Ziele · innerhalb von $radius um Orlando';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count Ziele · ganz Florida';
  }

  @override
  String get radius25 => '25 mi';

  @override
  String get radius50 => '50 mi';

  @override
  String get radius100 => '100 mi';

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
  String get detailPrice => 'Preis';

  @override
  String get detailLocation => 'Ort';

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
  String get onboardStep2Title => 'Zeit, dich frei zu fühlen';

  @override
  String get onboardStep2Subtitle => 'Wann beginnt deine Auszeit?';

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
}
