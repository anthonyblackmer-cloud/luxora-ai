// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => 'Impostazioni';

  @override
  String get appearance => 'Aspetto';

  @override
  String get settingsThemeIntro =>
      'Scuro cinematografico o resort chiaro — scegli l\'atmosfera del tuo viaggio.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get themeGoldenEmber => 'Golden Ember';

  @override
  String get themeGoldenEmberMood => 'Ultra lusso caldo';

  @override
  String get themeMidnightAmethyst => 'Midnight Amethyst';

  @override
  String get themeMidnightAmethystMood => 'Misterioso ed esclusivo';

  @override
  String get themeEmeraldHaven => 'Emerald Haven';

  @override
  String get themeEmeraldHavenMood => 'Lusso tropicale sereno';

  @override
  String get themeRivieraWhite => 'Riviera White';

  @override
  String get themeRivieraWhiteMood => 'Elegante magazine di viaggi di lusso';

  @override
  String get themeCoastalGlass => 'Coastal Glass';

  @override
  String get themeCoastalGlassMood => 'Energia vacanza premium e pulita';

  @override
  String get themeChampagneLuxe => 'Champagne Luxe';

  @override
  String get themeChampagneLuxeMood => 'Eleganza concierge privato';

  @override
  String get themeBlackCard => 'Black Card';

  @override
  String get themeBlackCardMood => 'Prestigio dell\'aviazione privata';

  @override
  String get settingsThemeSectionLuxury => 'Cinematografico di lusso';

  @override
  String get settingsThemeSectionReadable => 'Pulito e leggibile';

  @override
  String get settingsMapSkinSection => 'Mappa di base';

  @override
  String get settingsMapSkinIntro =>
      'Scegli l\'aspetto delle tessere mappa nella scheda Mappa.';

  @override
  String get mapSkinVoyager => 'Voyager';

  @override
  String get mapSkinVoyagerMood => 'Colori tenui — parchi, acqua, strade';

  @override
  String get mapSkinOsm => 'OpenStreetMap';

  @override
  String get mapSkinOsmMood => 'Classico, toni naturali';

  @override
  String get mapSkinCartoLight => 'Carto Light';

  @override
  String get mapSkinCartoLightMood => 'Minimal e luminoso';

  @override
  String get mapSkinCartoDark => 'Carto Dark';

  @override
  String get mapSkinCartoDarkMood => 'Mappa base notturna';

  @override
  String get mapSkinMapboxStreets => 'Mapbox Streets';

  @override
  String get mapSkinMapboxStreetsMood =>
      'Ricco di dettagli, stile app di viaggio';

  @override
  String get mapSkinMapboxOutdoors => 'Mapbox Outdoors';

  @override
  String get mapSkinMapboxOutdoorsMood => 'Verdi e rilievo in evidenza';

  @override
  String get dark_mode => 'Modalità oscura';

  @override
  String get light_mode => 'Modalità luce';

  @override
  String get language => 'Lingua';

  @override
  String get settings_language_picker_note =>
      'Le modifiche si applicano immediatamente.';

  @override
  String get settings_regions_coming_title => 'Paesi e città';

  @override
  String get settings_regions_coming_subtitle =>
      'Hub casa e pacchetti città: presto disponibili.';

  @override
  String get commonSoon => 'Presto';

  @override
  String get commonContinue => 'Continuare';

  @override
  String get commonNew => 'Nuovo';

  @override
  String get commonRoadmap => 'Tabella di marcia';

  @override
  String get commonLive => 'Vivere';

  @override
  String get commonClose => 'Vicino';

  @override
  String get commonCancel => 'Cancellare';

  @override
  String get commonDelete => 'Eliminare';

  @override
  String get settingsStartOverSubtitle => 'Inizia un nuovo viaggio da zero';

  @override
  String get navConcierge => 'Concierge';

  @override
  String get navAgenda => 'Oggi';

  @override
  String get navDiscover => 'Scoprire';

  @override
  String get navMap => 'Mappa';

  @override
  String get navTrips => 'Viaggi';

  @override
  String get navMore => 'Di più';

  @override
  String get navRestaurants => 'Ristoranti';

  @override
  String get navTimeline => 'Cronologia';

  @override
  String get agendaTabItinerary => 'Giorni';

  @override
  String get agendaTabRestaurants => 'Ristoranti';

  @override
  String get restaurantsPageTitle => 'Ristoranti';

  @override
  String get restaurantsPageSubtitle =>
      'Sfoglia i ristoranti che Luxora conosce: salva i preferiti o lascia che sia il Concierge a scegliere il pasto di stasera.';

  @override
  String get restaurantsConciergePick => 'Scegli un ristorante per me';

  @override
  String restaurantsConciergePickDone(String name) {
    return '$name salvato: chiedi al Concierge di aggiungerlo al tuo viaggio.';
  }

  @override
  String restaurantsSavedCount(int count) {
    return '$count risparmiati per il tuo viaggio';
  }

  @override
  String get restaurantsEmptyHint =>
      'Nessun ristorante nel tuo raggio di scoperta: amplia il raggio sulla mappa.';

  @override
  String get moreCardRestaurantsSub =>
      'Sfoglia i ristoranti e lascia che Concierge scelga per te';

  @override
  String get agendaHotelSuggestionsTitle => 'Dove alloggiare';

  @override
  String agendaHotelSuggestionsSubtitle(int budget) {
    return 'Adeguato all\'intelligenza artificiale al tuo budget di viaggio di ~$budget USD: tocca per visualizzare tutte le opzioni.';
  }

  @override
  String agendaHotelTopPick(String name) {
    return 'Scelta migliore: $name';
  }

  @override
  String get agendaStayDropdownHint => 'Seleziona un albergo';

  @override
  String get agendaDiningDropdownHint => 'Seleziona un ristorante';

  @override
  String get agendaDaySelectLabel => 'Quale giorno';

  @override
  String get agendaDayDiningTitle => 'Dove mangiare stasera';

  @override
  String agendaDayDiningSubtitle(int budget, String tier) {
    return 'Suggerimenti per il tuo budget di ~$budget USD ($tier pranzo) in base al piano di oggi.';
  }

  @override
  String get agendaDiningNearStops => 'Vicino alle fermate di oggi';

  @override
  String get agendaDiningFitsBudget => 'Si adatta al budget del tuo viaggio';

  @override
  String get agendaDiningMatchesDay => 'Corrisponde all\'atmosfera di oggi';

  @override
  String get agendaDiningFoodiePick => 'Il preferito dai buongustai';

  @override
  String get browseCatRecommended => 'Raccomandato';

  @override
  String get browseCatDisneyHotels => 'Zona Disney';

  @override
  String get browseCatBudgetFriendly => 'Economico';

  @override
  String get browseCatUpscaleLuxury => 'Elegante e lussuoso';

  @override
  String get browseCatUniversalHotels => 'Zona universale';

  @override
  String get browseCatThemeParkDining => 'Pranzo nel parco a tema';

  @override
  String get browseCatUpscaleDining => 'Cucina raffinata e raffinata';

  @override
  String get browseSearchAllHotels =>
      'Cerca nel catalogo completo degli hotel…';

  @override
  String get browseSearchAllRestaurants =>
      'Cerca nel catalogo completo dei ristoranti…';

  @override
  String get browseCategoryEmpty =>
      'Nessuna corrispondenza in questa categoria per il tuo raggio: prova a cercare o ad ampliare la scoperta.';

  @override
  String get browseFullCatalogHint =>
      'Utilizza la ricerca qui sopra per il catalogo completo: tutti gli hotel e ristoranti che Luxora conosce.';

  @override
  String get agendaPageSubtitle => 'Cosa sto facendo adesso?';

  @override
  String get navGems => 'Gemme';

  @override
  String get navFeed => 'Foraggio';

  @override
  String get navTicketSavings => 'Risparmio';

  @override
  String get navStays => 'Soggiorni';

  @override
  String get morePageTitle => 'Di più';

  @override
  String get morePageSubtitle =>
      'Strumenti di viaggio, account e preferenze: pensati per un accesso tranquillo.';

  @override
  String get moreSectionTravelTools => 'STRUMENTI DI VIAGGIO';

  @override
  String get moreSectionAccount => 'ACCOUNT';

  @override
  String get moreSectionApp => 'APP';

  @override
  String get moreCardHotelsSub => 'L\'intelligenza si adatta al tuo umore';

  @override
  String get moreCardGemsSub => 'Scoperte interne alla guardia locale';

  @override
  String get moreCardTicketsSub =>
      'Confronta i risparmi dei partner autorizzati';

  @override
  String get moreCardWeatherSub => 'Guida giornaliera basata sulle previsioni';

  @override
  String get moreCardProfileTitle => 'Profilo di viaggio';

  @override
  String get moreCardProfileSub => 'Chi viaggia, come dovrebbe sentirsi';

  @override
  String get moreCardFavoritesSub =>
      'Destinazioni che hai aggiunto ai segnalibri';

  @override
  String get moreCardNotificationsTitle => 'Notifiche';

  @override
  String get moreCardNotificationsSub =>
      'Avvisi di viaggio e aggiornamenti del concierge';

  @override
  String get moreCardSettingsSub => 'Tema, pacchetti città e preferenze';

  @override
  String get moreCardAboutSub => 'Perché stiamo costruendo Luxora';

  @override
  String get moreCardHelpSub => 'Guide e supporto concierge';

  @override
  String get moreCardCityPacksSub => 'Sblocca i concierge di destinazione';

  @override
  String get moreCardPartnersSub => 'Esperienze dei partner in primo piano';

  @override
  String get moreCardItinerarySub => 'La tua fuga d\'oro giorno dopo giorno';

  @override
  String get moreCardDiscoverSub =>
      'Ristoranti di tendenza, esperienze e scoperte dal vivo';

  @override
  String get savedFavoritesTitle => 'Preferiti salvati';

  @override
  String get savedFavoritesEmpty =>
      'Aggiungi le destinazioni ai segnalibri sulla mappa o sul feed: verranno visualizzate qui.';

  @override
  String get helpCenterTitle => 'Centro assistenza';

  @override
  String get helpCenterBody =>
      'Invia un\'e-mail a support@luxora.ai per ricevere assistenza dal concierge. Presto arriveranno le guide in-app.';

  @override
  String get notificationsComingSoon =>
      'Le notifiche di viaggio arriveranno in un aggiornamento futuro.';

  @override
  String get partnerOffersTitle => 'Offerte dei partner';

  @override
  String get ticketSavingsTitle => 'Risparmio intelligente sui biglietti';

  @override
  String get ticketSavingsBadgeLabel => 'RISPARMIO PREMIO';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora mette a disposizione rivenditori, pacchetti e promozioni autorizzati, così ti sentirai un consulente del lusso, non un sito di coupon.';

  @override
  String ticketSavingsBadge(int percent) {
    return 'RISPARMIA $percent%';
  }

  @override
  String get ticketOfficialPrice => 'Ufficiale';

  @override
  String get ticketDiscountPrice => 'Prezzo Luxora';

  @override
  String ticketSaveAmount(String amount) {
    return 'Risparmia $amount';
  }

  @override
  String get ticketSaveAmountLabel => 'Risparmio';

  @override
  String ticketSavePerTicket(String amount) {
    return 'Potresti risparmiare $amount per biglietto.';
  }

  @override
  String ticketFamilySave(String amount) {
    return 'Risparmio familiare stimato: $amount.';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return 'Risparmio familiare stimato: $amount.';
  }

  @override
  String ticketSource(String source) {
    return 'Fonte: $source';
  }

  @override
  String ticketExpires(String date) {
    return 'Offerta fino al giorno $date';
  }

  @override
  String get ticketBetterOption => 'Luxora ha trovato un\'opzione migliore.';

  @override
  String get ticketOverpaying =>
      'Potresti pagare più del dovuto al prezzo di partenza.';

  @override
  String get ticketRecommendedSavings => 'Risparmio consigliato disponibile';

  @override
  String get ticketCalculatorTitle => 'Risparmio potenziale';

  @override
  String get ticketFilterLabel => 'Filtro';

  @override
  String get ticketFilterAll => 'Tutto';

  @override
  String get ticketFilterThemeParks => 'Parchi a tema';

  @override
  String get ticketFilterAttractions => 'Attrazioni';

  @override
  String get ticketFilterTours => 'Tour';

  @override
  String get ticketFilterDining => 'Esperienze culinarie';

  @override
  String get ticketFilterWaterParks => 'Parchi acquatici';

  @override
  String get ticketFilterFamily => 'Attività familiari';

  @override
  String get ticketFilterEntertainment => 'Divertimento';

  @override
  String get ticketSortLabel => 'Ordina per';

  @override
  String get ticketSortHighestSavings => 'Il massimo risparmio';

  @override
  String get ticketSortMostPopular => 'Il più popolare';

  @override
  String get ticketSortFamilyFriendly => 'Adatto alle famiglie';

  @override
  String get ticketSortLuxury => 'Esperienze di lusso';

  @override
  String get ticketSortClosest => 'Più vicino a me';

  @override
  String get ticketDealsSectionTitle => 'Offerte autorizzate';

  @override
  String ticketDealsPricesAsOf(String date) {
    return 'Prezzi al $date';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'Impossibile aggiornare i prezzi: vengono visualizzate le offerte memorizzate nella cache.';

  @override
  String get ticketDealsUpdating => 'Aggiornamento dei prezzi…';

  @override
  String get ticketNoDeals =>
      'Nessuna offerta in questo filtro: prova un\'altra categoria.';

  @override
  String get ticketConfidenceHigh => 'Alta fiducia';

  @override
  String get ticketConfidenceVerified => 'Rivenditore verificato';

  @override
  String get ticketConfidenceLimited => 'Tempo limitato';

  @override
  String get ticketAiInsightTitle => 'Raccomandazione Luxora';

  @override
  String get ticketInsightDisneyPass =>
      'In base al tuo itinerario, un pass Walt Disney World da 3 giorni invece dei biglietti giornalieri potrebbe far risparmiare alla tua famiglia circa 120 USD.';

  @override
  String get ticketInsightUniversalCombo =>
      'Il tuo piano include Universal: un biglietto per 2 parchi batte l\'acquisto di giorni separatamente per la maggior parte delle famiglie.';

  @override
  String get ticketInsightSeaworldCombo =>
      'SeaWorld sul tuo percorso: la combinazione Aquatica spesso batte due ingressi separati.';

  @override
  String get ticketInsightGeneric =>
      'Luxora abbina i risparmi alle fermate del tuo itinerario: confronta prima di acquistare all\'ingresso.';

  @override
  String get ticketInsightMiamiCulture =>
      'La cultura si ferma nel tuo piano: le offerte dei partner Vizcaya e PAMM potrebbero battere i prezzi iniziali questa settimana.';

  @override
  String get ticketInsightMiamiEverglades =>
      'Giorno delle Everglades sul tuo itinerario: gli slot mattutini per l\'airboat spesso sono più economici a metà settimana.';

  @override
  String get ticketInsightMiamiWynwood =>
      'Wynwood sul tuo percorso: una passeggiata artistica guidata può battere i prezzi degli stand walk-up.';

  @override
  String get ticketItineraryMatchTitle =>
      'Controllo del risparmio sull\'itinerario';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'Concierge';

  @override
  String conciergeTripFeel(String feel) {
    return 'Sensazione di viaggio: \"$feel\"';
  }

  @override
  String get conciergeWelcome =>
      'Benvenuto a Luxora, il tuo compagno della Florida emotivamente intelligente.\n\nScegli un suggerimento qui sotto o descrivi l\'emozione che desideri che il tuo viaggio susciti.';

  @override
  String get conciergeQuickPrompts => 'Suggerimenti rapidi';

  @override
  String get conciergeRemembering => 'Ricordando per questo viaggio';

  @override
  String get conciergeStyleMemory => 'Memoria di stile';

  @override
  String get conciergeInputHint =>
      'Descrivi la sensazione che vuoi che il tuo viaggio susciti...';

  @override
  String get conciergeGreetingMorning => 'Buongiorno.';

  @override
  String get conciergeGreetingAfternoon => 'Buon pomeriggio.';

  @override
  String get conciergeGreetingEvening => 'Buonasera.';

  @override
  String get conciergeWelcomeWarm =>
      'Sono qui per modellare la Florida in base a come vuoi sentirti, non per una lista di cose da vedere. Di cosa hai voglia oggi?';

  @override
  String get conciergeRefineStyle => 'Affina il mio stile';

  @override
  String get conciergeRecallReturning => 'Bentornato.';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'Ricordo che ti piaceva $prefs.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'E volevi che questo viaggio sentisse: \"$feel\".';
  }

  @override
  String get conciergePromptRomantic => 'Fuga romantica';

  @override
  String get conciergePromptWellness => 'Ripristino del benessere';

  @override
  String get conciergePromptFamily => 'Magia familiare';

  @override
  String get conciergePromptHiddenLuxury => 'Lusso nascosto';

  @override
  String get conciergePromptFoodie => 'Avventura gastronomica';

  @override
  String get conciergePromptSoftLuxury => 'Fuga di lusso morbido';

  @override
  String get conciergePromptAdventure => 'Modalità Avventura';

  @override
  String get conciergePromptDisney => 'Disney dopo il tramonto';

  @override
  String get discoverSearchHint => 'Cerca destinazioni...';

  @override
  String get discoverSearchTitle => 'Trova una destinazione';

  @override
  String get discoverFromOrlando => 'Da Orlando';

  @override
  String discoverFromHub(String hub) {
    return 'Da $hub';
  }

  @override
  String get discoverSearchScopeAll =>
      'Ricerca in tutta la Florida nel catalogo';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'Entro $radius da Orlando';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return 'Entro $radius da $hub';
  }

  @override
  String get discoverSearchEmpty =>
      'Nessuna corrispondenza in questo raggio: prova un nome più breve, amplia il chip della distanza su Mappa o Feed oppure cerca \"spiaggia\", \"Disney\" o \"sorgenti\".';

  @override
  String get discoverFilterAll => 'Tutto';

  @override
  String get discoverFilterHotels => 'Alberghi';

  @override
  String get discoverFilterRestaurants => 'Ristoranti';

  @override
  String get discoverFilterDestinations => 'Destinazioni';

  @override
  String get discoverPopularInRadius => 'Popolare nel tuo raggio';

  @override
  String get discoverTrySearching => 'Prova a cercare';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count destinazioni · entro $radius da Orlando';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$count destinazioni · entro $radius da $hub';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count destinazioni · tutta la Florida';
  }

  @override
  String get radius25 => '25 miglia';

  @override
  String get radius50 => '50 miglia';

  @override
  String get radius100 => '100 miglia';

  @override
  String get radiusAllFlorida => 'Tutta la Florida';

  @override
  String get radiusDesc25 => 'Gite di un giorno nel centro di Orlando';

  @override
  String get radiusDesc50 =>
      'Sorgenti, gite di un giorno sulla costa, Space Coast';

  @override
  String get radiusDesc100 => 'Tampa Bay, Daytona, Golfo più profondo';

  @override
  String get radiusDescAll => 'Keys, Miami, punti salienti in tutto lo stato';

  @override
  String get radiusDesc25Miami =>
      'South Beach, Brickell e i quartieri centrali';

  @override
  String get radiusDesc50Miami => 'Wynwood, Coconut Grove, Key Biscayne';

  @override
  String get radiusDesc100Miami =>
      'Everglades, Fort Lauderdale, nel profondo sud della Florida';

  @override
  String get radiusDescAllMiami =>
      'Sentiero delle Florida Keys e punti salienti in tutto lo stato';

  @override
  String get radiusDesc25Keys =>
      'Key Largo, Islamorada e corridoio superiore della barriera corallina';

  @override
  String get radiusDesc50Keys => 'Spiagge di Marathon, Big Pine e Middle Keys';

  @override
  String get radiusDesc100Keys =>
      'Tutta l\'autostrada d\'oltremare attraverso Key West';

  @override
  String get radiusDescAllKeys =>
      'Intera catena di isole e acque per gite di un giorno';

  @override
  String get feedBadge => 'SCOPERTA DAL VIVO';

  @override
  String get feedTitle => 'Feed dell\'esperienza';

  @override
  String get feedSubtitle =>
      'Cosa sta succedendo in questo momento: luoghi di tendenza, nuove aperture, scelte dei creatori, percorsi stagionali e aggiornamenti in tempo reale.';

  @override
  String get feedSubtitleFamily =>
      'Scelte adatte alla famiglia per il tuo equipaggio: parchi, vittorie facili e momenti che arrivano con i bambini (e i genitori).';

  @override
  String get feedPillTrending => 'Tendenza';

  @override
  String get feedPillNewOpenings => 'Nuove aperture';

  @override
  String get feedPillCreator => 'Scelte del creatore';

  @override
  String get feedPillLive => 'Aggiornamenti in tempo reale';

  @override
  String get feedMoodPrompt => 'COME VUOI SENTIRSI?';

  @override
  String get feedMoodPromptFamily =>
      'COME DOVREBBE SENTIRSI OGGI PER LA TUA CREW?';

  @override
  String get feedMoodAll => 'Qualunque cosa';

  @override
  String get feedMoodFamily => 'Magia familiare';

  @override
  String get feedMoodRomantic => 'Romantico';

  @override
  String get feedMoodCalm => 'Calma';

  @override
  String get feedMoodAdventurous => 'Avventuroso';

  @override
  String get feedMoodPampered => 'Coccolato';

  @override
  String get feedMoodSocial => 'Ronzio';

  @override
  String get feedMoodFoodie => 'Buongustaio';

  @override
  String get vibeSunsetReady => 'Tramonto';

  @override
  String get vibeViral => 'Virale';

  @override
  String get vibeFamilyApproved => 'Famiglia';

  @override
  String get vibeHiddenGem => 'Gioiello nascosto';

  @override
  String get vibeRainSafe => 'Anti-pioggia';

  @override
  String get vibeDateNight => 'Serata romantica';

  @override
  String get vibeNightVibe => 'Vibe notturna';

  @override
  String get vibeFoodie => 'Foodie';

  @override
  String get vibeLuxury => 'Lusso';

  @override
  String get vibeTrending => 'Di tendenza';

  @override
  String get vibeLive => 'Live';

  @override
  String get vibeSeasonal => 'Stagionale';

  @override
  String get vibeLocalPick => 'Locale';

  @override
  String get vibeAdventure => 'Avventura';

  @override
  String get vibeWellness => 'Benessere';

  @override
  String get vibeBeachDay => 'Giornata spiaggia';

  @override
  String get vibeLuxoraPick => 'Scelta Luxora';

  @override
  String get mapLayersTitle => 'LAYER MAPPA';

  @override
  String get mapLayerAll => 'Tutti';

  @override
  String get mapLayerGems => 'Gemme';

  @override
  String get mapLayerNight => 'Notte';

  @override
  String get mapLayerDateNight => 'Romantico';

  @override
  String get mapLayerWeather => 'Meteo ideale';

  @override
  String get mapLayerItinerary => 'Itinerario';

  @override
  String get mapExpandMap => 'Espandi mappa';

  @override
  String get mapFullscreenTitle => 'Mappa';

  @override
  String get mapCloseFullscreen => 'Chiudi mappa';

  @override
  String get mapItineraryDayLabel => 'Mostra itinerario per';

  @override
  String get mapItineraryCurrentDay => 'Giorno attuale';

  @override
  String get feedFamilyMoodHint =>
      'Parchi a tema, pasti con personaggi e facili vittorie per i genitori: filtrati per tag familiari.';

  @override
  String get feedEmptyHint =>
      'Nessuna scheda feed in questo raggio: prova 50 miglia o Tutta la Florida per i punti salienti della costa del Golfo e delle Keys.';

  @override
  String get feedEmptyHintFamily =>
      'Nessuna carta con tag famiglia in questo raggio: prova Avventuroso o Tutto, oppure allarga il raggio.';

  @override
  String get gemsBadge => 'CURAZIONE INTERNA';

  @override
  String get gemsTitle => 'Gemme nascoste';

  @override
  String get gemsSubtitle =>
      'Scoperte segrete custodite dalla gente del posto: perché è speciale, quando andare, quanto è affollato e consigli che non troverai su una cartolina.';

  @override
  String get gemsPillHidden => 'Luoghi nascosti';

  @override
  String get gemsPillLocal => 'Solo locale';

  @override
  String get gemsPillInsider => 'Consigli utili';

  @override
  String get gemsPillCrowd => 'Informazioni sulla folla';

  @override
  String get gemsEmptyHint =>
      'Ancora nessuna gemma in questo raggio: allargalo a 50 miglia o oltre per sorgenti e segreti della Space Coast.';

  @override
  String get gemsSearchHint => 'Cerca gemme e destinazioni nascoste...';

  @override
  String get gemLocalSecret => 'SEGRETO LOCALE';

  @override
  String get gemsMatchedBadge => 'Il tuo stile';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gemme abbinate al tuo stile',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
  }

  @override
  String get gemWhySpecial => 'Perché è speciale';

  @override
  String get gemBestTime => 'Il momento migliore per andare';

  @override
  String get gemCrowdLevel => 'Livello di folla';

  @override
  String get gemInsiderTip => 'Consiglio dell\'esperto';

  @override
  String get gemLocalNote => 'Nota solo locale';

  @override
  String get mapBadge => 'MAPPA DELL\'AI';

  @override
  String get mapTitle => 'Il tuo percorso intelligente';

  @override
  String get mapSubtitle =>
      'Spille per la tua giornata curata: i diamanti d\'oro sono gemme, i pennarelli ciano sono la sequenza temporale di oggi, la linea d\'oro è il percorso dell\'umore.';

  @override
  String get mapPlanDayTitle => 'Pianifica la mia giornata';

  @override
  String get mapPlanDaySuggested =>
      'Consigliati in base allo stato d\'animo del tuo viaggio: aggiungi i luoghi ai preferiti per renderlo tuo.';

  @override
  String get mapPlanDayEmpty =>
      'Aggiungi le destinazioni ai segnalibri (♥) e Luxora costruirà un percorso ottimizzato dal tuo hub di Orlando: meno guida, più sensazioni.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count fermate · $miles · $time viaggio';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'A partire da $hotel';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '$time drive · $miles dalla fermata precedente';
  }

  @override
  String get mapCrowdLevelQuiet => 'Tranquillo';

  @override
  String get mapCrowdLevelModerate => 'Moderare';

  @override
  String get mapCrowdLevelBusy => 'Occupato';

  @override
  String get mapCrowdLevelPacked => 'Imballato';

  @override
  String mapCrowdAtStop(String level) {
    return 'Folla: $level';
  }

  @override
  String get mapParkingLevelEasy => 'Facile';

  @override
  String get mapParkingLevelModerate => 'Moderare';

  @override
  String get mapParkingLevelDifficult => 'Difficile';

  @override
  String get mapParkingLevelLimited => 'Limitato · arriva presto';

  @override
  String mapParkingAtStop(String level) {
    return 'Parcheggio: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'Attrito di guida: $score/90';
  }

  @override
  String get mapRerouteButton => 'Reindirizzamento per soste più tranquille';

  @override
  String mapRerouteApplied(int count) {
    return 'Giorno adattato: $count fermate scambiate con folle più leggere.';
  }

  @override
  String get mapRerouteNone => 'Il tuo percorso sembra già calmo.';

  @override
  String get mapRerouteRainHint =>
      'Non preoccuparti — ho già trovato alternative nelle vicinanze così la giornata resta piacevole e senza stress.';

  @override
  String get dayFlowSwapTitle => 'Cambia questa fermata';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'Dì a Luxora cosa preferiresti fare invece di $current.';
  }

  @override
  String get dayFlowSwapTemplate =>
      'Stavo pensando a qualcosa di più simile...';

  @override
  String get dayFlowSwapHint =>
      'per esempio. un parco tranquillo stamattina o frutti di mare per cena';

  @override
  String get dayFlowSwapApply => 'Aggiorna la mia giornata';

  @override
  String get dayFlowSwapViewPlace => 'Visualizza la fermata attuale';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return 'Aggiornato: $newStop è ora la tua fermata $phase.';
  }

  @override
  String get dayFlowSwapNoMatch =>
      'Impossibile trovare una corrispondenza nelle vicinanze: prova a essere più specifico.';

  @override
  String get dayFlowSwapTapToChange => 'Cambia questa fermata';

  @override
  String get dayFlowSwapHoldSpeak => 'Aspetta a parlare';

  @override
  String get dayFlowSwapListening => 'Ascolto…';

  @override
  String get rightNowButton => 'Cosa dovremmo fare adesso?';

  @override
  String get rightNowEmpty =>
      'Nessun momento forte nel tuo raggio ancora: amplia, scopri o aggiungi alcuni preferiti ai preferiti.';

  @override
  String get rightNowResultTitle => 'PROPRIO ADESSO';

  @override
  String get rightNowTapForDetails => 'Tocca per i dettagli';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return 'Sei a $minutes minuti da $district. Il tempo è perfetto: prendi un caffè a $place, poi passeggia $walkArea prima che arrivi la folla (folla di $crowd).';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return 'Sei a $minutes minuti da $district. I cieli sembrano fantastici: vai a $place mentre la folla è ancora $crowd.';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return 'L\'ora d\'oro si sta avvicinando: parti tra circa $minutes minuti per $place ($crowd entro il tramonto).';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return 'Pioggia sul radar: $minutes minuti per un\'accogliente scelta al coperto: $place.';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return 'Calma durante il pisolino: $minutes minuti per un facile ripristino della famiglia a $place.';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return 'Energia per un appuntamento notturno: $minutes minuti a $place prima della corsa.';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return 'Periodo tranquillo: $minutes minuti per $place ($crowd in questo momento).';
  }

  @override
  String get goldenHourTitle => 'Ora d\'oro';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return 'Parti entro le ore $time ($minutes minuti in auto) per $place e arriva circa 15 minuti prima del tramonto.';
  }

  @override
  String get goldenHourKindBeach => 'Finestra al tramonto sulla spiaggia';

  @override
  String get goldenHourKindRooftop => 'Ora d\'oro sul tetto';

  @override
  String get goldenHourKindScenic => 'Tempi di fotografia scenica';

  @override
  String get vacationScoreTitle => 'Punteggio delle vacanze';

  @override
  String vacationScoreSubtitle(int score) {
    return 'Oggi sembra una giornata tipo $score/100.';
  }

  @override
  String get onboardOccasionLabel => 'Qual è l\'occasione?';

  @override
  String get onboardThemeParksOccasionHint =>
      'Sblocca Disney & Universal per aggiungere occasioni nei parchi a tema qui sotto: vedrai i gettoni subito dopo l\'acquisto.';

  @override
  String get occasionGeneral => 'Sto solo esplorando';

  @override
  String get occasionAnniversary => 'Anniversario';

  @override
  String get occasionHoneymoon => 'Luna di miele';

  @override
  String get occasionDateNight => 'Appuntamento notturno';

  @override
  String get occasionProposal => 'Proposta di viaggio';

  @override
  String get occasionFamily => 'Famiglia con bambini';

  @override
  String get occasionDisneyAdventure => 'Avventura Disney';

  @override
  String get occasionUniversalAdventure => 'Avventura universale';

  @override
  String get localSecretTitle => 'Segreto locale';

  @override
  String get localSecretWinterParkParkAvenue =>
      'La gente del posto si tuffa nel cortile del vicolo dietro la libreria: nessun segnale stradale.';

  @override
  String get localSecretWorldFoodTrucks =>
      'Ordina il pescato giornaliero, non l\'hamburger: la fila si muove più velocemente allo sportello più lontano.';

  @override
  String get localSecretWekiwaSprings =>
      'Salta la passerella principale dopo le 14:00: l\'inizio del sentiero nord rimane tranquillo.';

  @override
  String get localSecretDisneySpringsParking =>
      'Il miglior parcheggio è il garage arancione: cammina dal lato del porto turistico, non dall\'ingresso principale.';

  @override
  String get localSecretLakeEolaSunset =>
      'Affronta il lato dell\'anfiteatro per scattare foto di cigni mentre il cielo diventa dorato.';

  @override
  String get localSecretMiamiWynwoodAlley =>
      'Avanza nella corsia di carico dietro il Panther Coffee: la gente del posto scatta murales senza la folla della fila principale.';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      'Acquista prima il cafecito al carrello della finestra: i clienti abituali della panchina a bordo campo si aprono quando hai in mano un cortadito.';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      'Salta la corsa sulla terrazza principale: entra dal giardino est e percorri la passerella di mangrovie in senso antiorario.';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      'Guarda verso est alle 7 del mattino su Lummus: i pastelli art déco brillano prima che arrivi la folla del brunch.';

  @override
  String get localSecretMiamiPantherAlley =>
      'Ordina alla finestra, percorri il vicolo in senso orario: la migliore luce murale colpisce il muro turchese alle 8:45.';

  @override
  String get localSecretTampaBayRiverwalkParking =>
      'Usa il parcheggio Whiting Street — cammina a sud lungo il fiume per evitare chiusure vicino al molo.';

  @override
  String get localSecretTampaBayClearwaterSunset =>
      'Evita la folla del Pier 60 — avvicinati a Sand Key 40 minuti prima del tramonto.';

  @override
  String get localSecretTampaBayDaliGarden =>
      'Prenota l\'ultimo ingresso del pomeriggio — il giardino est cattura la luce del ponte senza affollamento.';

  @override
  String get localSecretTampaBayPierTiming =>
      'Ingresso al molo nei giorni feriali alle 16 — tramonto senza passeggini del weekend.';

  @override
  String get localSecretTampaBayYborCourtyard =>
      'Cuban sandwich da asporto — mangia nel cortile di mattoni usato dai locali dopo le 20.';

  @override
  String get localSecretTampaBaySpongeDocks =>
      'Pranzo al molo, barche delle spugne dopo — tour più tranquilli nei feriali dopo le 13.';

  @override
  String get localSecretVegasBellagioFountains =>
      'Centro del prato 15 min prima dello spettacolo — la ringhiera davanti blocca la coreografia.';

  @override
  String get localSecretVegasFremontTiming =>
      'Feriale ore 21 sotto la canopy — loop Viva Vision completo senza folla del sabato.';

  @override
  String get localSecretVegasCaesarsEntrance =>
      'Usa il passaggio del parcheggio — evita il collo di bottiglia dello Strip a cena.';

  @override
  String get localSecretVegasVenetianWalk =>
      'Passeggiata sul canal coperto a mezzogiorno — attraversa lo Strip al fresco.';

  @override
  String get nycMoodRoutesTitle => 'Percorsi mood New York';

  @override
  String get localSecretNycTimesSquareStrategy =>
      'Entra dalle traverse della 7th Ave — evita la calca del incrocio e mantieni Broadway in vista.';

  @override
  String get localSecretNycObservationDeck =>
      'Prenota l\'ultimo slot prima del tramonto — luce dorata senza code di mezzogiorno.';

  @override
  String get localSecretNycCentralParkEntrance =>
      'Usa il travers di 72nd Street — percorso più rapido verso Bethesda senza folla a Columbus Circle.';

  @override
  String get localSecretNycBroadwayTickets =>
      'La fila matinale TKTS apre presto — posti rush battono i prezzi turistici.';

  @override
  String get localSecretNycBrooklynBridgePhoto =>
      'Washington Street DUMBO alle 8 — cornice di ciottoli vuota prima dei gruppi turistici.';

  @override
  String get localSecretNycFerryGoldenHour =>
      'Traghetto Staten Island al tramonto — giro del porto gratis senza barca turistica.';

  @override
  String get momentsTitle => 'MOMENTI LUXORA';

  @override
  String get momentsSubtitle => 'Cerca una sensazione, non un luogo.';

  @override
  String get momentFeelRelaxed => 'Sentiti rilassato';

  @override
  String get momentImpressSpouse => 'Impressiona il mio coniuge';

  @override
  String get momentPerfectSunset => 'Tramonto perfetto';

  @override
  String get momentFamilyMemory => 'Memoria di famiglia';

  @override
  String get momentLuxuryValue => 'Lusso senza spendere troppo';

  @override
  String get momentPromptRelaxed =>
      'Voglio sentirmi completamente rilassato per le prossime ore: lento, bello, senza folla.';

  @override
  String get momentPromptImpressSpouse =>
      'Voglio impressionare il mio coniuge con qualcosa di romantico e inaspettato stasera.';

  @override
  String get momentPromptPerfectSunset =>
      'Voglio il momento perfetto del tramonto in Florida: dove dovremmo essere e quando dovremmo partire?';

  @override
  String get momentPromptFamilyMemory =>
      'Voglio un momento familiare memorabile che sia facile per i genitori e magico per i bambini.';

  @override
  String get momentPromptLuxuryValue =>
      'Voglio un lusso che sembri speciale senza spendere una fortuna.';

  @override
  String get visualShareImageButton => 'Condividi la scheda immagine';

  @override
  String get tripStoryTitle => 'Il racconto del tuo viaggio';

  @override
  String tripStoryHeading(String title) {
    return '$title: la tua storia in Florida';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return 'Sei venuto per $moods.';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return 'Questo capitolo: $title.';
  }

  @override
  String get tripStoryBeatClosing =>
      'Luxora ha plasmato i momenti: li hai vissuti.';

  @override
  String get tripsOpenStory => 'La tua storia';

  @override
  String get conciergeVoiceHold => 'Aspetta a parlare';

  @override
  String get conciergeVoiceSoon =>
      'Il concierge vocale sarà presto disponibile: per ora, tocca un momento o digita come vuoi sentirti.';

  @override
  String get conciergeVoiceListening => 'Luxora sta ascoltando...';

  @override
  String get conciergeVoiceSpeaking => 'Luxora sta parlando...';

  @override
  String get conciergeVoiceRelease => 'Rilascia per inviare';

  @override
  String get conciergeVoiceSend => 'Invia a Luxora';

  @override
  String get conciergeVoiceProcessing => 'Invio a Luxora...';

  @override
  String get conciergeVoiceNoSpeech =>
      'Non l\'ho capito: tieni premuto il pulsante, parla, quindi rilascia.';

  @override
  String get conciergeVoicePreviewFailed =>
      'Impossibile riprodurre un\'anteprima. Controlla il volume e riprova.';

  @override
  String get conciergeVoiceUnavailable =>
      'La voce non è disponibile su questo dispositivo.';

  @override
  String get conciergeVoiceSettingsTitle => 'Voce Luxora';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Scegli il suono di Luxora quando parla: accento, tono e ritmo. Utilizza le voci integrate del tuo dispositivo.';

  @override
  String get conciergeVoiceRateLabel => 'Ritmo di parola';

  @override
  String get conciergeVoiceRateSlow => 'Lento';

  @override
  String get conciergeVoiceRateNatural => 'Naturale';

  @override
  String get conciergeVoiceRateFast => 'Veloce';

  @override
  String get conciergeVoicePreview => 'Anteprima della voce';

  @override
  String get conciergeVoicePreviewCurrent => 'Anteprima voce attuale';

  @override
  String get conciergeVoicePreviewSample =>
      'Ciao, sono Luxora. Dimmi come vuoi che sia questo viaggio.';

  @override
  String get conciergeVoiceDeviceNote =>
      'Scarica più voci in Impostazioni iPhone → Accessibilità → Contenuto parlato → Voci. Torna qui e tocca Aggiorna.';

  @override
  String get conciergeVoiceDeviceSection => 'Voci su questo iPhone';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'Include le voci scaricate: toccane una per usarla per Luxora.';

  @override
  String get conciergeVoiceRefreshList => 'Aggiorna l\'elenco delle voci';

  @override
  String get conciergeVoiceShowAllLanguages => 'Mostra tutte le lingue';

  @override
  String get conciergeVoiceOpenSettings =>
      'Apri le impostazioni vocali dell\'iPhone';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'Nessuna voce trovata: scarica i pacchetti in Impostazioni, quindi aggiorna.';

  @override
  String get conciergeVoicePresetSection => 'Personaggi veloci';

  @override
  String get conciergeVoiceRegionRecommended => 'Raccomandato';

  @override
  String get conciergeVoiceRegionEnglish => 'Inglese';

  @override
  String get conciergeVoiceRegionRussian => 'russo';

  @override
  String get conciergeVoiceRegionSpanish => 'spagnolo';

  @override
  String get conciergeVoiceRegionFrench => 'francese';

  @override
  String get conciergeVoiceRegionGerman => 'tedesco';

  @override
  String get conciergeVoiceRegionOther => 'Altro';

  @override
  String get conciergeVoicePresetMatchApp =>
      'Predefinito Luxora · Kate (Premium)';

  @override
  String get conciergeVoicePresetEnUsF => 'Americana · Femmina';

  @override
  String get conciergeVoicePresetEnUsM => 'Americano · Maschio';

  @override
  String get conciergeVoicePresetEnGbF => 'Britannico · Femmina';

  @override
  String get conciergeVoicePresetEnGbM => 'Britannico · Maschio';

  @override
  String get conciergeVoicePresetRuF => 'Russo · Femmina';

  @override
  String get conciergeVoicePresetRuM => 'Russo · Maschio';

  @override
  String get conciergeVoicePresetEsF => 'Spagnolo · Femmina';

  @override
  String get conciergeVoicePresetEsM => 'Spagnolo · Maschio';

  @override
  String get conciergeVoicePresetFrF => 'Francese · Femmina';

  @override
  String get conciergeVoicePresetFrM => 'Francese · Maschio';

  @override
  String get conciergeVoicePresetDeF => 'Tedesco · Femmina';

  @override
  String get conciergeVoicePresetDeM => 'Tedesco · Maschio';

  @override
  String get conciergeThinking => 'Luxora sta pensando...';

  @override
  String get conciergeItinerarySynced =>
      'L\'ho aggiunto alla tua agenda: stesse fermate sulla mappa, pronte per essere condivise.';

  @override
  String get conciergeAgendaUpdatedSnack =>
      'La tua agenda è pronta su Mappa e Agenda';

  @override
  String get conciergeAgendaSyncFailed =>
      'La mappa e l\'agenda non sono state aggiornate. Prova una richiesta chiara, ad esempio: pianifica un viaggio Disney e Universal di 4 giorni.';

  @override
  String get conciergeViewAgendaOnMap => 'Visualizza l\'agenda';

  @override
  String get conciergeAgendaDealsIntro =>
      'Ho abbinato le offerte di biglietti autorizzate alle fermate nella tua agenda: confronta prima di acquistare all\'ingresso:';

  @override
  String get conciergeAgendaDealsSnack =>
      'Offerte di biglietti adatte alla tua agenda';

  @override
  String get conciergeViewTicketDeals => 'Visualizza le offerte';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · risparmio stimato di $amount tramite $source';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return '$count fermate nella tua agenda hanno offerte partner: confronta le offerte autorizzate prima di acquistare all\'ingresso.';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return 'Est. risparmi familiari · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals =>
      'Sfoglia le offerte per la tua agenda →';

  @override
  String get conciergeFreshThread =>
      'La tua agenda è su Mappa e Agenda. Ho archiviato questa chat e ho ricominciato da capo: modifica la giornata, trova offerte o chiedi qualcosa di nuovo.';

  @override
  String get conciergeThreadArchivedSnack =>
      'Chat archiviata: nuovo thread avviato';

  @override
  String get conciergeNewConversationTooltip => 'Nuova conversazione';

  @override
  String get itinerarySameAsMapAgenda =>
      'Il piano Concierge di oggi: appuntato anche sulla mappa. Condividi la scheda giornaliera qui sotto.';

  @override
  String get conciergeTicketsFoundIntro =>
      'Ho trovato offerte di biglietti autorizzate per il tuo viaggio: tocca Prenota biglietti su Agenda per collegamenti diretti:';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title: $price tramite $source (risparmia $savings)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'Ogni fermata corrispondente nell\'Agenda ora ha un pulsante Prenota biglietti con il collegamento del rivenditore.';

  @override
  String itineraryBookTickets(String amount) {
    return 'Prenota i biglietti · Risparmia $amount';
  }

  @override
  String get itineraryOpenTicketDeal => 'Prenota i biglietti';

  @override
  String conciergeTripSaved(String title) {
    return 'Salvato \"$title\" nei tuoi Viaggi: apri la scheda Viaggi in qualsiasi momento per rivisitarla.';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return 'Salvato \"$title\" con $count esperienze sul tuo diario.';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return 'Hai $count viaggi salvati:';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title ($dates) — $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      'Non hai ancora nessun viaggio salvato: chiedimi di pianificare qualcosa, quindi dì \"salva il mio viaggio\".';

  @override
  String get conciergeSavedTripsHint =>
      'Apri la scheda Viaggi per visualizzare le carte, condividere o modificare le date.';

  @override
  String get conciergeAiError =>
      'Non potrei raggiungere Luxora in questo momento. Controlla la connessione e riprova.';

  @override
  String get conciergeAiErrorVoice =>
      'Mi spiace, non sono riuscito a connettermi al concierge di Luxora in questo momento.';

  @override
  String get conciergeAiNotConfigured =>
      'Il concierge live di Luxora non è ancora collegato a questa build: l\'URL Supabase e la chiave anon devono essere inseriti nell\'app e la funzione edge implementata. La mappa e l\'itinerario funzionano ancora; vedere docs/CONCIERGE_AI.md per la configurazione.';

  @override
  String get conciergeAiOpenAiNotReady =>
      'Luxora ti ha sentito, ma il cervello del concierge non è ancora online. Imposta OPENAI_API_KEY nei segreti Supabase per la funzione edge (processore luminoso), quindi riprova.';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'Luxora non è riuscita a trovare la funzione concierge edge \"$function\". Distribuiscilo in Supabase o correggi SUPABASE_CONCIERGE_FUNCTION su questa build.';
  }

  @override
  String get conciergeAiAuthFailed =>
      'Luxora non è riuscita ad autenticarsi con Supabase: ricontrolla che SUPABASE_ANON_KEY corrisponda al tuo progetto.';

  @override
  String get mapAiPowers => 'Poteri della mappa dell\'IA';

  @override
  String get mapNavLayerTitle => 'Livello di navigazione AI (successivo)';

  @override
  String get mapNavLayerSubtitle =>
      'Oltre la scoperta: informazioni in tempo reale per capire se vale la pena fermarsi in questo momento.';

  @override
  String get mapBookingTitle =>
      'Prenotazione senza soluzione di continuità (partner)';

  @override
  String get mapCapMoodTitle => 'Percorsi basati sull\'umore';

  @override
  String get mapCapMoodDesc =>
      'Percorsi che si abbinano al romanticismo, al benessere, alla famiglia o all\'avventura, non solo al tempo di guida più breve.';

  @override
  String get mapCapDriveTitle => 'Ottimizzazione del tempo di guida';

  @override
  String get mapCapDriveDesc =>
      'Sequenze intelligenti per trascorrere il tempo con le emozioni, senza restare seduti nel traffico tra i momenti salienti.';

  @override
  String get mapCapWeatherTitle => 'Suggerimenti basati sul meteo';

  @override
  String get mapCapWeatherDesc =>
      'Percorsi di backup della pioggia e finestre live per spiagge, tetti e sorgenti.';

  @override
  String get mapCapSunsetTitle => 'Il miglior tramonto in questo momento';

  @override
  String get mapCapSunsetDesc =>
      'Dove l\'ora d\'oro colpisce meglio nei prossimi 90 minuti in base allo schema del cielo e della folla.';

  @override
  String get mapCapCrowdTitle => 'Previsione della folla';

  @override
  String get mapCapCrowdDesc =>
      'Quando i parchi, le sorgenti e i luoghi virali si calmano, prima del tuo arrivo.';

  @override
  String get mapCapGemsTitle => 'Gemme nascoste nelle vicinanze';

  @override
  String get mapCapGemsDesc =>
      'Segnalazioni privilegiate sono emerse lungo il tuo percorso, non solo tra le 10 principali fermate turistiche.';

  @override
  String get mapCapPersonalTitle => 'Personalizzazione del percorso';

  @override
  String get mapCapPersonalDesc =>
      'Le sensazioni, il ritmo e il budget del tuo viaggio rimodellano la mappa in tempo reale.';

  @override
  String get mapFutureCrowdTitle => 'Calore della folla dal vivo';

  @override
  String get mapFutureCrowdDesc =>
      'Densità in tempo reale su sorgenti, parchi e tetti virali: ne vale la pena adesso?';

  @override
  String get mapFutureParkingTitle => 'Difficoltà di parcheggio';

  @override
  String get mapFutureParkingDesc =>
      'Punteggio di attrito prima di impegnarti: parcheggiatore, garage o rideshare punto debole.';

  @override
  String get mapFutureTrafficTitle => 'Guida il punteggio di attrito';

  @override
  String get mapFutureTrafficDesc =>
      'Percorsi ponderati in base allo stress: non solo minuti, ma come si sentirà la guida.';

  @override
  String get mapFutureRerouteTitle => 'Reindirizzamento spontaneo';

  @override
  String get mapFutureRerouteDesc =>
      'Cambiamenti climatici o aumento della folla? Un tocco per rimodellare il resto della tua giornata.';

  @override
  String affiliateReserve(String category) {
    return 'Prenota · $category · partner premium (presto)';
  }

  @override
  String get affiliateHotels => 'Hotel e soggiorni';

  @override
  String get affiliateExperiences => 'Esperienze e tour';

  @override
  String get affiliateRestaurants => 'Prenotazioni ristoranti';

  @override
  String get affiliateThemeParks => 'Biglietti per parchi a tema';

  @override
  String get affiliateDayPasses => 'ResortPass/pass giornalieri';

  @override
  String get affiliateCarRentals => 'Noleggio auto';

  @override
  String get affiliateWellness => 'Prenotazioni benessere';

  @override
  String get tripsBadge => 'COLLEZIONI';

  @override
  String get tripsTitle => 'Viaggi salvati';

  @override
  String get tripsSubtitle =>
      'Tocca un viaggio per un\'istantanea in tempo reale: momento successivo, meteo, tramonto e sequenza temporale.';

  @override
  String get tripsFooter =>
      'Copertine di viaggio dal catalogo mood · Sincronizzazione Supabase Fase 2';

  @override
  String get tripsPlanNew => 'Pianifica un nuovo viaggio';

  @override
  String get tripsEmptyTitle => 'Nessun viaggio ancora salvato';

  @override
  String get tripsEmptyBody =>
      'Pianifica il tuo primo viaggio e apparirà qui, pronto per essere rivisitato in qualsiasi momento.';

  @override
  String get tripsDeleteTitle => 'Eliminare il viaggio?';

  @override
  String tripsDeleteBody(String title) {
    return 'Questa operazione rimuoverà \"$title\" dai tuoi viaggi salvati. Questa operazione non può essere annullata.';
  }

  @override
  String get tripsDeleted => 'Viaggio cancellato';

  @override
  String get tripsEditDates => 'Date del viaggio';

  @override
  String get tripsSaveDates => 'Salva le date';

  @override
  String get tripsDatesUpdated => 'Date del viaggio aggiornate';

  @override
  String get tripsDatesFlexible => 'Date flessibili';

  @override
  String get tripsLiveWeather => 'Meteo in diretta';

  @override
  String get tripsNextUp => 'Il prossimo passo';

  @override
  String get tripsSunsetWindow => 'Finestra al tramonto';

  @override
  String get tripsTimelineSnapshot => 'Istantanea della sequenza temporale';

  @override
  String get tripsOpenAgenda => 'Apri l\'agenda completa';

  @override
  String get tripsOpenTimeline => 'Apri la cronologia completa';

  @override
  String get tripsShare => 'Condividere';

  @override
  String get shareItineraryFooter =>
      'Progettato con Luxora, il tuo compagno della Florida emotivamente intelligente.';

  @override
  String get shareCardCta => 'Organizza il tuo a Luxora';

  @override
  String get shareCardDownloadHint =>
      'Gratuito su iOS e Android · luxora.ai/download';

  @override
  String shareCardShareMessage(String title, String url) {
    return '$title\n\nPianificato con Luxora AI: viaggio in Florida emotivamente intelligente.\nOttieni l\'app: $url';
  }

  @override
  String get conciergeLocalTryPlanning =>
      'Dimmi come vuoi che sia il viaggio, ad es. \"Pianifica un rilassante viaggio di 2 giorni a Orlando con sorgenti e cibo.\" Costruirò una vera agenda sul tuo dispositivo (non è richiesto il cloud).';

  @override
  String conciergeLocalPlanBuilt(String city, int count) {
    return 'Ho costruito la tua giornata in $city: $count fermate sequenziate in base all\'umore e al tempo di guida. Apri Agenda o Mappa per vedere il tuo percorso.';
  }

  @override
  String get conciergeLocalNoIntent =>
      'Descrivi la sensazione che desideri oppure dì \"Pianifica la mia giornata a Orlando\" e costruirò un vero percorso sul dispositivo.';

  @override
  String get ticketConciergeIntelBadge => 'Informazioni sulla portineria';

  @override
  String get ticketConciergeIntelAgenda =>
      'Abbinati alle fermate della tua agenda, non a un elenco di coupon generico.';

  @override
  String get agendaFixAfternoonRain =>
      'Pioggia in arrivo: sistema il mio pomeriggio';

  @override
  String agendaRainRerouteDone(int count, int score) {
    return 'Aggiornamento pomeridiano: $count fermate si sono spostate al chiuso. Punteggio vacanze $score/100.';
  }

  @override
  String get agendaRainRerouteNone =>
      'Il tuo piano funziona già per questo tempo.';

  @override
  String get cloudTripsTitle => 'Backup sul cloud';

  @override
  String get cloudTripsSubtitle =>
      'I tuoi viaggi salvati si sincronizzano su tutti i dispositivi quando accedi, incluso con qualsiasi sblocco della città.';

  @override
  String get cloudTripsMoreSubSignedOut =>
      'Accedi per eseguire il backup dei viaggi salvati';

  @override
  String cloudTripsMoreSubSignedIn(String email) {
    return 'Accedi come $email';
  }

  @override
  String get cloudTripsMoreSubSyncing => 'Sincronizzazione…';

  @override
  String get cloudTripsUnlockRequired =>
      'Sblocca un pacchetto città per abilitare il backup sul cloud';

  @override
  String get cloudTripsUnlockCta => 'Sblocca portineria';

  @override
  String get cloudTripsEmailHint => 'Indirizzo e-mail';

  @override
  String get cloudTripsSendCode => 'Invia il codice di accesso';

  @override
  String get cloudTripsCodeHint => 'Codice di 6 cifre dall\'e-mail';

  @override
  String get cloudTripsVerify => 'Verifica e accedi';

  @override
  String get cloudTripsCodeSent =>
      'Controlla la tua email per un codice di accesso';

  @override
  String get cloudTripsSignOut => 'disconnessione';

  @override
  String get cloudTripsSyncNow => 'Sincronizza ora';

  @override
  String get cloudTripsSyncSuccess => 'Viaggi sincronizzati';

  @override
  String get cloudTripsSyncError => 'Sincronizzazione non riuscita: riprova';

  @override
  String get cloudTripsBannerTitle => 'Fai il backup dei tuoi viaggi';

  @override
  String get cloudTripsBannerBody =>
      'Accedi per ripristinare i viaggi su un nuovo telefono o tablet.';

  @override
  String get cloudTripsBannerCta => 'Configura il backup sul cloud';

  @override
  String get cloudTripsNotConfigured =>
      'Il backup sul cloud richiede Supabase (configurazione di sviluppo)';

  @override
  String get paywallFeatureCloudBackup => 'Backup del viaggio nel cloud';

  @override
  String shareSubject(String title) {
    return 'Il mio $title';
  }

  @override
  String get itineraryBadge => 'LA TUA CRONOLOGIA';

  @override
  String get itineraryTagline =>
      'Ogni momento è connesso: anticipazione incorporata, stress escluso.';

  @override
  String itineraryDayTab(int day, String label) {
    return 'Giorno $day · $label';
  }

  @override
  String get detailWhySpecial => 'Perché è speciale';

  @override
  String get detailBestTime => 'Il momento migliore per andare';

  @override
  String get detailInsiderTips => 'Consigli utili';

  @override
  String get detailReserve => 'Prenota esperienza';

  @override
  String get detailReserveSoon => 'Partner di prenotazione in arrivo.';

  @override
  String get detailNearbyGems => 'Gemme vicine';

  @override
  String get detailDuration => 'Durata';

  @override
  String get detailPractical => 'Dettagli pratici';

  @override
  String get detailCostRange => 'Fascia di costo';

  @override
  String get detailBestFor => 'Meglio per';

  @override
  String get detailVibeMatch => 'Partita di vibrazioni';

  @override
  String get detailCrowd => 'Folla';

  @override
  String get detailTravelIntelTitle => 'Prospettive di attrito del viaggio';

  @override
  String get detailTravelIntelSubtitle =>
      'Previsione in base a categoria, tempo e distanza, non a sensori in tempo reale.';

  @override
  String detailCrowdOutlook(String level) {
    return 'Folla: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'Parcheggio: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'Attrito di guida: $score/90';
  }

  @override
  String get detailPrice => 'Prezzo';

  @override
  String get detailLocation => 'Posizione';

  @override
  String get detailGetDirections => 'Ottieni indicazioni stradali';

  @override
  String get detailParkMap => 'Mappa del parco';

  @override
  String get detailViewOnMap => 'Visualizza sulla mappa';

  @override
  String get detailMapsError =>
      'Impossibile aprire le mappe su questo dispositivo.';

  @override
  String get detailGoogleMaps => 'Google Maps';

  @override
  String get detailAppleMaps => 'Mappe di Apple';

  @override
  String get detailOpenInMaps => 'Apri nelle mappe';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time in auto da Orlando';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$time viaggio da $hub';
  }

  @override
  String get detailSaveToItinerary => 'Salva nell\'itinerario';

  @override
  String get detailSaved => 'Salvato';

  @override
  String get detailSavedSnack => 'Salvato nel tuo itinerario';

  @override
  String get detailRemovedSnack => 'Rimosso dal tuo itinerario';

  @override
  String get detailSetHomeBase => 'Imposta come base di partenza';

  @override
  String get detailHomeBaseActive => 'Il tuo viaggio di ritorno';

  @override
  String get detailHomeBaseHint =>
      'Il percorso della tua giornata inizia e finisce qui.';

  @override
  String get detailHomeBaseSetSnack =>
      'Imposta come base di partenza del viaggio';

  @override
  String get detailHomeBaseClearedSnack => 'Base liberata';

  @override
  String get detailMenuTitle => 'Punti salienti del menu';

  @override
  String get detailMenuDisclaimer =>
      'Punti salienti selezionati: il menu completo e i prezzi possono variare in base alla sede.';

  @override
  String get detailMenuComingSoon =>
      'Stiamo ancora curando questo menu. Nel frattempo visualizza il menu e i prezzi più recenti online.';

  @override
  String get detailViewMenuOnline => 'Visualizza il menu on-line';

  @override
  String get photoClose => 'Vicino';

  @override
  String get photoViewDestination => 'Visualizza destinazione';

  @override
  String get photoBy => 'Foto di';

  @override
  String get photoOn => 'SU';

  @override
  String milesFromOrlando(String distance) {
    return '$distance da Orlando';
  }

  @override
  String milesFromHub(String distance, String hub) {
    return '$distance da $hub';
  }

  @override
  String get landingBadge => 'FLORIDA · ORLANDO MVP';

  @override
  String get landingTitle1 => 'La vacanza';

  @override
  String get landingTitle2 => 'già iniziato.';

  @override
  String get landingSubtitle =>
      'Luxora AI è il tuo concierge emotivamente intelligente: gemme nascoste, tramonti sui tetti e momenti pensati per farti sentire indimenticabile prima ancora di fare le valigie.';

  @override
  String get landingBegin => 'Inizia il mio viaggio';

  @override
  String get landingTalk => 'Parla con Luxora';

  @override
  String get landingWhy => 'Perché lo stiamo costruendo';

  @override
  String get storyTitle => 'La nostra storia';

  @override
  String get storyHeroBadge => 'COSTRUITO CON INTENZIONE';

  @override
  String get storyHeroCreator => 'Creatore, Luxora AI';

  @override
  String get storyHeroSubtitle => 'Florida · Viaggio innanzitutto emozionale';

  @override
  String get storyHeading => 'Perché stiamo costruendo Luxora';

  @override
  String get storyProblemLead =>
      'Ci siamo resi conto che pianificare un viaggio in Florida/Orlando è sorprendentemente frammentato e travolgente.';

  @override
  String get storyJumpingBetween =>
      'Le persone di solito saltano da una parte all\'altra';

  @override
  String get storyProblemTail =>
      '…e finire comunque con piani turistici generici.';

  @override
  String get storyDifferentLead => 'Vogliamo costruire qualcosa di diverso.';

  @override
  String get storyNotPlannerTitle => 'Non solo un pianificatore di viaggio';

  @override
  String get storyNotPlannerBody =>
      'Un compagno di viaggio AI incentrato sulle emozioni.';

  @override
  String get storyInsteadOfAsking => 'Invece di chiedere';

  @override
  String get storyAppAsks => 'Chiede l\'app';

  @override
  String get storyInsteadQuestion => '\"Dove dovrei andare?\"';

  @override
  String get storyFeelQuestion => '\"Come vuoi che sia questo viaggio?\"';

  @override
  String get storyMoodBuildLine =>
      'Quindi l\'intelligenza artificiale crea un\'esperienza personalizzata attorno a quello stato d\'animo.';

  @override
  String get storyFloridaFirstTitle => 'Perché prima Florida/Orlando?';

  @override
  String get storyFloridaFirstLead => 'Orlando è un mercato di prova perfetto:';

  @override
  String get storyVisionTitle => 'La nostra visione';

  @override
  String get storyVisionLead => 'Combina:';

  @override
  String get storyVisionCard =>
      'Quindi l\'app sembra più vicina a un concierge AI di lusso, non a un altro noioso strumento di itinerario.';

  @override
  String get storyLongTermTitle => 'Opportunità a lungo termine';

  @override
  String get storySourceGoogleMaps => 'Google Maps';

  @override
  String get storySourceTikTok => 'TikTok';

  @override
  String get storySourceInstagram => 'Bobine di Instagram';

  @override
  String get storySourceTravelBlogs => 'blog di viaggio';

  @override
  String get storySourceRestaurantApps => 'app per ristoranti';

  @override
  String get storySourceWeatherApps => 'app meteo';

  @override
  String get storySourceTicketSites => 'siti web di biglietti';

  @override
  String get storySourceTop10 =>
      'articoli casuali sulla \"top 10 di Orlando\".';

  @override
  String get storyBulletMarket => 'Enorme mercato turistico';

  @override
  String get storyBulletAudience =>
      'Famiglie, coppie, viaggiatori di lusso e viaggiatori del benessere';

  @override
  String get storyBulletOptions =>
      'Infiniti ristoranti, resort, gemme nascoste, parchi a tema, sorgenti e vita notturna';

  @override
  String get storyBulletRepeat => 'Elevato comportamento di visita ripetuta';

  @override
  String get storyBulletLogisticsGap =>
      'La maggior parte delle app di viaggio si concentra sulla logistica, non sulla progettazione dell’esperienza';

  @override
  String get storyPillarAiItinerary => 'Generazione di itinerari AI';

  @override
  String get storyPillarMoodPlanning =>
      'Pianificazione del viaggio in base all\'umore';

  @override
  String get storyPillarLiveDiscovery =>
      'Esperienze di scoperta e tendenza dal vivo';

  @override
  String get storyPillarHiddenGems => 'Gemme locali nascoste';

  @override
  String get storyPillarRouting => 'Itinerario intelligente';

  @override
  String get storyPillarWeatherSunset => 'Informazioni su meteo e tramonti';

  @override
  String get storyPillarPremiumUx => 'UX estetica premium';

  @override
  String get storyOpportunityMultilingual => 'Espansione multilingue';

  @override
  String get storyOpportunityAffiliate =>
      'Partnership di affiliazione e prenotazione';

  @override
  String get storyOpportunityInventory => 'Ristoranti, esperienze e biglietti';

  @override
  String get storyOpportunitySubscriptions => 'Abbonamenti premium';

  @override
  String get storyOpportunityScale =>
      'Scalabile oltre la Florida → altre destinazioni in seguito';

  @override
  String get landingValues => 'Ricordi · Emozioni · Fuga · Connessione';

  @override
  String get landingRegionBadge => 'Regione di lancio';

  @override
  String get landingRegionTitle =>
      'Orlando e Florida: curati per il sentimento';

  @override
  String get onboardFinish => 'Incontra il tuo concierge';

  @override
  String get onboardBuilding => 'Creazione della tua avventura…';

  @override
  String get onboardStep1Title => 'Dove i sogni atterrano per primi';

  @override
  String get onboardStep1Subtitle => 'Dove sei diretto?';

  @override
  String get onboardDestination => 'Destinazione';

  @override
  String get onboardRegion => 'Regione';

  @override
  String get onboardCityLabel => 'Scegli la tua città';

  @override
  String get onboardCityUnlockNote =>
      'Ogni destinazione ha il proprio sblocco concierge: acquisto una tantum per città.';

  @override
  String get landingCityLabel => 'Dove stai andando?';

  @override
  String get paywallSwitchCity => 'Destinazione';

  @override
  String get paywallUnlockingDestination => 'Unlocking for this trip';

  @override
  String paywallUnifiedPriceHeadline(String price) {
    return 'Every City Pack unlocks for $price each';
  }

  @override
  String get paywallUnifiedPriceBody =>
      'Orlando, Miami, Florida Keys — plus the Disney & Universal pack. One-time purchase each at the same price. No subscription.';

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
  String get cityPickerUnlocked => 'Sbloccato';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Sblocca $price';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Componente aggiuntivo Orlando · Disney e Universal insieme';

  @override
  String get onboardStep2Title => 'È ora di sentirsi liberi';

  @override
  String get onboardStep2Subtitle => 'Quando inizia la tua fuga?';

  @override
  String get onboardStartDateLabel => 'Data di inizio';

  @override
  String get onboardEndDateLabel => 'Data di fine';

  @override
  String get onboardPickDate => 'Tocca per scegliere';

  @override
  String get onboardSelectStartDate => 'Scegli la data di inizio';

  @override
  String get onboardSelectEndDate => 'Scegli la data di fine';

  @override
  String get onboardDatesHint =>
      'Puoi modificarli in qualsiasi momento dalla scheda Viaggi.';

  @override
  String get onboardStepBudgetTitle => 'Pianifica con facilità';

  @override
  String get onboardStepBudgetSubtitle =>
      'Cosa ti sembra giusto per questa fuga?';

  @override
  String get onboardBudget => 'Budget del viaggio (USD)';

  @override
  String get onboardStep3Title => 'Chi condivide la storia';

  @override
  String get onboardStep3Subtitle => 'Chi viaggia con te?';

  @override
  String get onboardTravelers => 'Viaggiatori';

  @override
  String get onboardStep4Title => 'Il tuo ritmo';

  @override
  String get onboardStep4Subtitle =>
      'Come dovrebbero scorrere le tue giornate?';

  @override
  String get onboardNightlife => 'Interesse per la vita notturna';

  @override
  String get onboardFoodie => 'Passione gastronomica';

  @override
  String get onboardPoolside => 'A bordo piscina e tempi di inattività';

  @override
  String get onboardAdventure => 'Avventura e vita all\'aria aperta';

  @override
  String get onboardCulture => 'Cultura e visite turistiche';

  @override
  String get dayFlowSubtitle =>
      'Una giornata modellata su come vuoi sentirti, non su una lista di controllo.';

  @override
  String get dayFlowMorning => 'MATTINA';

  @override
  String get dayFlowMidday => 'MEZZOGIORNO';

  @override
  String get dayFlowAfternoon => 'POMERIGGIO';

  @override
  String get dayFlowEvening => 'SERA';

  @override
  String get dayFlowNight => 'NOTTE';

  @override
  String get dayFlowReasonMorningPool =>
      'Rilassati lentamente: a bordo piscina o nella spa prima che inizi la giornata.';

  @override
  String get dayFlowReasonMorningCalm => 'Un inizio delicato per dare il tono.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Ore di punta dell\'energia: la grande avventura mentre sei fresco.';

  @override
  String get dayFlowReasonMiddayCulture =>
      'Giro turistico mentre la luce è intensa.';

  @override
  String get dayFlowReasonMiddayIcon => 'Il momento clou della giornata.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Pomeriggio di pausa per ricaricarsi.';

  @override
  String get dayFlowReasonAfternoonGem =>
      'Una gemma nascosta lontano dalla folla.';

  @override
  String get dayFlowReasonEveningDining =>
      'Il pasto della giornata: la tua scelta gastronomica.';

  @override
  String get dayFlowReasonNightOut => 'Un ultimo bagliore: una serata fuori.';

  @override
  String weatherToday(String place) {
    return 'Proprio adesso a $place';
  }

  @override
  String weatherSunset(String time) {
    return 'Tramonto alle $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% di possibilità di pioggia: porta con te uno strato leggero.';
  }

  @override
  String get weatherConditionClear => 'Chiaro';

  @override
  String get weatherConditionPartlyCloudy => 'Parzialmente nuvoloso';

  @override
  String get weatherConditionCloudy => 'Nuvoloso';

  @override
  String get weatherConditionFog => 'Nebbia';

  @override
  String get weatherConditionDrizzle => 'Pioviggina';

  @override
  String get weatherConditionRain => 'Piovere';

  @override
  String get weatherConditionSnow => 'Nevicare';

  @override
  String get weatherConditionThunder => 'Temporali';

  @override
  String get weatherConciergeTitle => 'Portineria meteo';

  @override
  String get weatherConciergeTapHint => 'Tocca per previsioni di viaggio';

  @override
  String get weatherConciergeAdviceTitle => 'Consigli meteorologici a Luxora';

  @override
  String weatherFeelsLike(String temp) {
    return 'Sembra che $temp';
  }

  @override
  String get weatherHumidity => 'Umidità';

  @override
  String get weatherWind => 'Vento';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir a $speed mph';
  }

  @override
  String get weatherUv => 'Indice UV';

  @override
  String get weatherCloudCover => 'Copertura nuvolosa';

  @override
  String get weatherVisibility => 'Visibilità';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles mi';
  }

  @override
  String weatherSunrise(String time) {
    return 'Alba $time';
  }

  @override
  String get weatherStatRain => 'Piovere';

  @override
  String get weatherWhatToBring => 'Cosa portare oggi';

  @override
  String get weatherPlanImpact => 'Impatto sul tuo piano';

  @override
  String get weatherHourlyTitle => 'Prospettiva oraria';

  @override
  String get weatherHourlyUnavailable =>
      'La previsione oraria verrà visualizzata durante il caricamento dei dati.';

  @override
  String get weatherLiveRadar => 'Radar in diretta';

  @override
  String get weatherRadarComingSoon => 'Radar live in arrivo.';

  @override
  String get weatherRadarPlay => 'Gioca in loop';

  @override
  String get weatherRadarPause => 'Metti in pausa il ciclo';

  @override
  String get weatherRadarTapToExpand => 'Tocca per lo schermo intero';

  @override
  String get weatherRadarNow => 'Ora';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return '$minutes minuti fa';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes min';
  }

  @override
  String get weatherRadarStepBack => 'Telaio precedente';

  @override
  String get weatherRadarStepForward => 'Cornice successiva';

  @override
  String get weatherRadarJumpNow => 'Ora';

  @override
  String get weatherRadarJump1h => '-1 ora';

  @override
  String get weatherRadarJump2h => '−2 ore';

  @override
  String get weatherRadarJump30m => '+30 minuti';

  @override
  String get weatherRadarSpeedSlow => 'Lento';

  @override
  String get weatherRadarSpeedNormal => 'Normale';

  @override
  String get weatherRadarSpeedFast => 'Veloce';

  @override
  String get weatherRadarLoopNote =>
      'Circuito radar: ultime circa 2 ore con incrementi di 10 minuti, più nowcast a corto raggio quando disponibile, non una previsione a 4 ore.';

  @override
  String get shareMapPreviewCaption =>
      'Anteprima della mappa · ​​aperto a Luxora per indicazioni in tempo reale';

  @override
  String get shareRadarPreviewCaption =>
      'Radar Doppler in tempo reale · aperto a Luxora per il giro completo';

  @override
  String get weatherMapOverlays => 'Sovrapposizioni di mappe';

  @override
  String get weatherOverlayPrecip => 'Precipitazione';

  @override
  String get weatherOverlayTemp => 'Temperatura';

  @override
  String get weatherOverlayWind => 'Vento';

  @override
  String get weatherOverlayCloud => 'Copertura nuvolosa';

  @override
  String get weatherComingSoon => 'Prossimamente';

  @override
  String get weatherAdjustDay => 'Regola la mia giornata in base al meteo';

  @override
  String get weatherBestOutdoorWindow => 'La migliore finestra per esterni';

  @override
  String get weatherRainWindow => 'Probabile pioggia';

  @override
  String get weatherSunsetRec => 'Raccomandazione per il tramonto';

  @override
  String weatherOutdoorAtRisk(int count) {
    return 'Potrebbero essere interessate $count fermate all\'aperto';
  }

  @override
  String get weatherIndoorBackup => 'Idee di backup per interni';

  @override
  String get weatherAdviceLightJacket =>
      'Portatevi una giacca leggera questa sera.';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return 'Pianifica le attività all\'aperto prima delle ore $time.';
  }

  @override
  String get weatherAdviceHighUv =>
      'UV elevati oggi: porta una protezione solare ed evita l\'esposizione prolungata al sole diretto a mezzogiorno.';

  @override
  String get weatherAdviceRainLater =>
      'Il rischio di pioggia aumenta più tardi oggi, quindi sposta le esperienze indoor al pomeriggio.';

  @override
  String get weatherAdviceWindBeach =>
      'Oggi il vento può rendere meno confortevoli le attività in spiaggia o in barca.';

  @override
  String get weatherAdviceGreatSunset =>
      'Stasera le condizioni del tramonto sono ottime: considera una cena sul tetto o una passeggiata sul lago.';

  @override
  String get weatherAdviceDefault =>
      'I cieli sembrano gestibili: segui il tuo piano e tieni uno strato leggero a portata di mano.';

  @override
  String weatherSunsetRecRooftop(String time) {
    return 'Cieli sereni vicino alle ore $time: una cena sul tetto o una passeggiata sul lago potrebbero splendere.';
  }

  @override
  String get weatherPackSunscreen => 'Protezione solare';

  @override
  String get weatherPackSunglasses => 'Occhiali da sole';

  @override
  String get weatherPackUmbrella => 'Ombrello';

  @override
  String get weatherPackLightJacket => 'Giacca leggera';

  @override
  String get weatherPackShoes => 'Scarpe comode';

  @override
  String get weatherPackWater => 'Bottiglia d\'acqua';

  @override
  String get weatherPackHat => 'Cappello';

  @override
  String get weatherPackPoncho => 'Poncho';

  @override
  String get weatherPackSwimwear => 'Costumi da bagno';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return 'Il rischio di pioggia aumenta dopo le ore $time. Valuta la possibilità di spostare $outdoorStop prima e di salvare $indoorStop per dopo.';
  }

  @override
  String weatherImpactHeat(String time) {
    return 'A mezzogiorno fa caldo: pianifica le passeggiate all\'aperto prima delle ore $time.';
  }

  @override
  String get weatherImpactClear =>
      'Il cielo sembra amichevole per i tuoi programmi all\'aperto questa mattina.';

  @override
  String weatherImpactMixed(int count) {
    return '$count fermate all\'aperto potrebbero richiedere modifiche alla tempistica oggi.';
  }

  @override
  String get weatherImpactNoPlanRain =>
      'La pioggia è nel mix: costruisci prima la tua giornata con ancoraggi indoor.';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return 'La migliore finestra esterna sembra $start–$end prima che si accumuli il caldo o gli acquazzoni.';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      'Il tempo sembra stabile: tocca Pianifica la mia giornata quando sei pronto per mettere in sequenza le fermate.';

  @override
  String get weatherImpactIndoorFallback => 'una spa o un museo';

  @override
  String get hotelIntelBadge => 'INTELLIGENZA ALBERGHIERA';

  @override
  String get hotelIntelTitle => 'Trova la tua base di partenza';

  @override
  String get hotelIntelSubtitle =>
      'In base al viaggio che desideri fare, Luxora seleziona i soggiorni che modellano le tue giornate, non una griglia di prenotazione.';

  @override
  String get hotelDiscoveryTitle => 'Curato per Orlando';

  @override
  String get hotelMatchmakerTeaser =>
      'Racconta a Luxora il tuo stile di viaggio e ottieni tre soggiorni selezionati dal concierge con compromessi onesti.';

  @override
  String get hotelMatchmakerCta => 'Matchmaker dell\'hotel AI';

  @override
  String get hotelMatchmakerTitle => 'Matchmaker dell\'hotel';

  @override
  String get hotelMatchmakerSubtitle =>
      'Condividi come viaggi: Luxora ti consiglia dove ancorare le tue giornate.';

  @override
  String get hotelMatchmakerRun => 'Trova i miei 3 migliori soggiorni';

  @override
  String get hotelMatchBudget => 'Zona di comfort economica';

  @override
  String get hotelMatchTravelers => 'Viaggiatori';

  @override
  String get hotelMatchAdults => 'Adulti';

  @override
  String get hotelMatchKids => 'Bambini';

  @override
  String get hotelMatchAttractions => 'Attrazioni nella tua lista';

  @override
  String get hotelMatchLuxuryLevel => 'Livello di lusso desiderato';

  @override
  String get hotelMatchTransport => 'Andare in giro';

  @override
  String get hotelTransportCar => 'Auto a noleggio';

  @override
  String get hotelTransportRideshare => 'Ridesharing';

  @override
  String get hotelTransportShuttle => 'Navetta del resort';

  @override
  String get hotelTransportWalkable => 'Quartiere percorribile';

  @override
  String get hotelMatchResultsTitle => 'Le tue 3 migliori partite';

  @override
  String hotelMatchWhyTitle(int score) {
    return 'Punteggio della partita $score';
  }

  @override
  String get hotelMatchBestForLabel => 'Ideale per:';

  @override
  String get hotelMatchItineraryLabel => 'Itinerario:';

  @override
  String get hotelMatchTradeoffsLabel => 'Compromessi:';

  @override
  String get hotelMatchNearbyLabel => 'Nelle vicinanze:';

  @override
  String get hotelLuxoraScore => 'Luxora';

  @override
  String get hotelHomeBaseBadge => 'CASA BASE';

  @override
  String get hotelScoreLuxury => 'Lusso';

  @override
  String get hotelScoreFamily => 'Famiglia';

  @override
  String get hotelScoreRomance => 'Romanticismo';

  @override
  String get hotelScoreWalkability => 'Camminare';

  @override
  String get hotelWhyRecommendTitle => 'Perché Luxora lo consiglia';

  @override
  String get hotelItineraryImpactTitle => 'Come questo modella le tue giornate';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return 'Viaggio approssimativo dall\'hub: $driveTime. Punteggio di attrito di viaggio: $friction/90 (più basso è più calmo).';
  }

  @override
  String get hotelAddHomeBase => 'Aggiungi come base di partenza';

  @override
  String get hotelHomeBaseActive => 'Base operativa attiva';

  @override
  String get hotelViewOnMap => 'Visualizza sulla mappa';

  @override
  String get hotelGetDirections => 'Ottieni indicazioni stradali';

  @override
  String get hotelCheckRates => 'Controlla le tariffe';

  @override
  String get hotelVisitWebsite => 'Visita il sito web';

  @override
  String get hotelLinkUnavailable =>
      'Link di prenotazione non ancora disponibile per questo soggiorno.';

  @override
  String get hotelLinkOpenFailed =>
      'Impossibile aprire il collegamento: controlla il browser o riprova.';

  @override
  String get hotelSave => 'Salva Albergo';

  @override
  String get hotelSaved => 'Salvato';

  @override
  String get hotelDistanceTitle => 'Distanza dai punti chiave';

  @override
  String get hotelCompareTitle => 'Confronta soggiorni';

  @override
  String get hotelCompareSubtitle =>
      'Vista concierge affiancata: fino a tre hotel.';

  @override
  String hotelCompareSelected(int count) {
    return '$count selezionato';
  }

  @override
  String get hotelComparePrice => 'Fascia di prezzo';

  @override
  String get hotelCompareDriveImpact => 'Promuovi l\'impatto';

  @override
  String get hotelCompareNearby => 'Punti salienti nelle vicinanze';

  @override
  String get hotelPriceBudget => 'Bilancio';

  @override
  String get hotelPriceModerate => 'Moderare';

  @override
  String get hotelPriceUpscale => 'Di lusso';

  @override
  String get hotelPriceLuxury => 'Lusso';

  @override
  String get hotelTagCouples => 'Meglio per le coppie';

  @override
  String get hotelTagDisney => 'Il meglio per Disney';

  @override
  String get hotelTagUniversal => 'Meglio per l\'universale';

  @override
  String get hotelTagLuxuryStaycation => 'Soggiorno di lusso';

  @override
  String get hotelTagFamily => 'Adatto alle famiglie';

  @override
  String get hotelTagQuiet => 'Fuga tranquilla';

  @override
  String get hotelTagWalkableDining => 'Pranzo percorribile';

  @override
  String get hotelTagResort => 'Atmosfera da resort';

  @override
  String get hotelTagBudget => 'Economico';

  @override
  String get hotelReasonMatchesMood =>
      'Si abbina all\'umore e al ritmo del tuo viaggio.';

  @override
  String get hotelReasonCloseStops =>
      'Vicino alle fermate pianificate sulla tua sequenza temporale.';

  @override
  String hotelReasonSavesDrive(String time) {
    return 'Risparmia tempo di guida rispetto a un hub generico: circa $time dal centro.';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return 'Si adatta a una zona di comfort $range senza spendere troppo nel resort sbagliato.';
  }

  @override
  String get hotelReasonBetterGroup =>
      'Più adatto al tipo di gruppo e al livello di energia.';

  @override
  String get hotelReasonNearbyDining =>
      'Forte sala da pranzo nelle vicinanze per serate senza sforzo.';

  @override
  String get hotelReasonLowStress =>
      'Calma in stile resort: meno logistica, più vacanze.';

  @override
  String get hotelMatchAttractionsGeneral => 'le tue attrazioni pianificate';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return 'In base al tuo itinerario di $attractions, $hotel riduce il tempo di guida e semplifica le serate.';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$hotel a $neighborhood si adatta a come vuoi che sia questo viaggio.';
  }

  @override
  String get hotelMatchBestForFamily =>
      'Famiglie che desiderano giornate in piscina senza sacrificare l\'accesso al parco.';

  @override
  String get hotelMatchBestForCouple =>
      'Coppie che desiderano il romanticismo senza il caos dei parchi a tema.';

  @override
  String get hotelMatchBestForGroup =>
      'Gruppi che bilanciano comfort, accesso e logistica tranquilla.';

  @override
  String hotelMatchImpactDisney(String time) {
    return 'Corse Disney più brevi: circa $time per i parchi da casa tua.';
  }

  @override
  String get hotelMatchImpactUniversal =>
      'I vantaggi dell\'Universal Express o l\'accesso al taxi acqueo possono recuperare ore dalla tua giornata.';

  @override
  String get hotelMatchImpactWalkable =>
      'Vai a cena a piedi: meno stress da parcheggio dopo lunghe giornate al parco.';

  @override
  String hotelMatchImpactDefault(String time) {
    return 'Mantiene la media dei viaggi intorno alle ore $time in modo che il flusso della tua giornata rimanga rilassato.';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      'Prezzi resort premium: budget maggiore per la camera, minore altrove.';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      'Farai affidamento su un\'auto o su un rideshare, non su una base che porta ovunque.';

  @override
  String get hotelMatchTradeoffLessFamily =>
      'Meno concentrato sui servizi incentrati sui bambini rispetto ai resort per famiglie dedicati.';

  @override
  String get hotelMatchTradeoffLessRomantic =>
      'Più energia da parco a tema che tranquillo rifugio per coppie.';

  @override
  String get hotelMatchTradeoffDefault =>
      'Ogni soggiorno ha dei compromessi: Luxora lo ha scelto prima per le tue priorità.';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return 'Ristoranti ed esperienze nei dintorni di $neighborhood.';
  }

  @override
  String get mapHotelIntelBannerTitle => 'Scegli la base di partenza giusta';

  @override
  String get mapHotelIntelBannerBody =>
      'Il tuo hotel determina i tempi di guida, il flusso della giornata e dove mangi. Luxora ti aiuta a scegliere, senza pressioni sulla prenotazione.';

  @override
  String get mapHotelIntelBannerCta => 'Esplora l\'intelligenza alberghiera';

  @override
  String get sponsorLuxoraRecommended => 'Consigliato Luxora';

  @override
  String get sponsorBadgeFeaturedPartner => 'Partner in primo piano';

  @override
  String get sponsorBadgeSponsored => 'Sponsorizzato';

  @override
  String get sponsorBadgePromoted => 'Promosso';

  @override
  String get sponsorBadgePartnerOffer => 'Offerta partner';

  @override
  String get sponsorCtaVisitWebsite => 'Visita il sito web';

  @override
  String get sponsorCtaBookNow => 'Prenota ora';

  @override
  String get sponsorCtaCheckRates => 'Controlla le tariffe';

  @override
  String get sponsorCtaGetTickets => 'Ottieni i biglietti';

  @override
  String get sponsorCtaViewOffer => 'Visualizza l\'offerta';

  @override
  String get featuredStaysTitle => 'Soggiorni in evidenza';

  @override
  String get featuredStaysSubtitle =>
      'Posizionamenti dei partner: separati dai punteggi organici delle partite degli hotel Luxora.';

  @override
  String get featuredExperiencesTitle => 'Esperienze in primo piano';

  @override
  String get featuredExperiencesSubtitle =>
      'Scelte sponsorizzate in base al tuo umore: sempre etichettate, mai mascherate dal grado AI.';

  @override
  String get featuredDiningTitle => 'Pranzo in primo piano';

  @override
  String get featuredDiningSubtitle =>
      'Punti salienti dei ristoranti partner Luxora: la tua lista di gemme biologiche rimane indipendente.';

  @override
  String get featuredTicketPartnersTitle =>
      'Partner di biglietti in primo piano';

  @override
  String get featuredTicketPartnersSubtitle =>
      'Offerte di partner autorizzati: confronta con i risparmi organici di seguito.';

  @override
  String get featuredCityHomeTitle => 'Partner in primo piano';

  @override
  String get featuredCityHomeSubtitle =>
      'Opzioni partner utili per Orlando: chiaramente contrassegnate, mai nascoste come scelte dell\'intelligenza artificiale.';

  @override
  String get dayFlowVibeFoodie => 'Buongustai';

  @override
  String get dayFlowVibeNightlife => 'Vita notturna';

  @override
  String get dayFlowVibePoolside => 'A bordo piscina';

  @override
  String get dayFlowVibeAdventure => 'Avventuroso';

  @override
  String get dayFlowVibeCulture => 'Cultura';

  @override
  String get onboardStep5Title => 'Il cuore di Luxora';

  @override
  String get onboardStep5Subtitle => 'Come vuoi che SENTI questo viaggio?';

  @override
  String get onboardTripFeelHint =>
      'Cene al tramonto, mattine tranquille, risate con il mio partner...';

  @override
  String get onboardStepNameEyebrow => 'La tua storia inizia con un nome';

  @override
  String get onboardStepNameTitle => 'Come dovremmo chiamare questo viaggio?';

  @override
  String get onboardStepNameSubtitle =>
      'Luxora può creare un titolo in base alle tue vibrazioni o digitarne uno tuo.';

  @override
  String get onboardTripNameLuxora => 'Lascia che sia Luxora a dargli un nome';

  @override
  String get onboardTripNameYours => 'Lo nominerò';

  @override
  String get onboardTripNameHint =>
      'La nostra fuga per l\'anniversario di primavera...';

  @override
  String onboardTripNameSuggested(String name) {
    return 'Luxora suggerisce: $name';
  }

  @override
  String get conciergeTripNameLabel => 'Nome del viaggio';

  @override
  String get moodRomantic => 'Romantico';

  @override
  String get moodRelaxing => 'Rilassante';

  @override
  String get moodAdventurous => 'Avventuroso';

  @override
  String get moodLuxurious => 'Lussuoso';

  @override
  String get moodFamily => 'Legame familiare';

  @override
  String get moodSocial => 'Sociale';

  @override
  String get moodNature => 'Incentrato sulla natura';

  @override
  String get moodWellness => 'Ritiro di benessere';

  @override
  String get moodFoodie => 'Esperienza gastronomica';

  @override
  String get catHiddenGems => 'Gemme nascoste';

  @override
  String get catLuxuryStay => 'Soggiorni di lusso';

  @override
  String get catBeaches => 'Spiagge';

  @override
  String get catRooftop => 'Pranzo sul tetto';

  @override
  String get catSpas => 'Terme';

  @override
  String get catNightlife => 'Vita notturna';

  @override
  String get catFamily => 'Famiglia';

  @override
  String get catEco => 'Ecoturismo';

  @override
  String get catThemeParks => 'Parchi a tema';

  @override
  String get catRomantic => 'Fughe romantiche';

  @override
  String get catFood => 'Esperienze gastronomiche';

  @override
  String get catSprings => 'Sorgenti';

  @override
  String get catIslands => 'Da un\'isola all\'altra';

  @override
  String get catInfluencer => 'Degno di un influencer';

  @override
  String get placeCatBeach => 'Spiaggia';

  @override
  String get placeCatDining => 'Pranzo';

  @override
  String get placeCatNature => 'Natura';

  @override
  String get placeCatNightlife => 'Vita notturna';

  @override
  String get placeCatWellness => 'Benessere';

  @override
  String get placeCatFamily => 'Famiglia';

  @override
  String get placeCatSprings => 'Sorgenti';

  @override
  String get placeCatRomantic => 'Romantico';

  @override
  String get placeCatAdventure => 'Avventura';

  @override
  String get placeCatHotel => 'Albergo';

  @override
  String get styleLessCrowded => 'Meno affollato';

  @override
  String get styleLuxurySubtle => 'Lusso ma non appariscente';

  @override
  String get styleHiddenLuxury => 'Lusso nascosto';

  @override
  String get styleWalkable => 'Percorribile quando possibile';

  @override
  String get styleSlowMornings => 'Mattine lente';

  @override
  String get styleNoTraps => 'Nessuna trappola per turisti';

  @override
  String get styleNatureHeavy => 'Natura pesante';

  @override
  String get styleNatureWellness => 'Solo natura + benessere';

  @override
  String get styleAestheticDining => 'Pranzo estetico';

  @override
  String get styleFamilyEasy => 'Logistica a misura di famiglia';

  @override
  String get paywallHeroEyebrow => 'IL TUO CONCIERGE PERSONALE';

  @override
  String get paywallHeroHeadline => 'NON SPRECARE LA TUA VACANZA';

  @override
  String get paywallHeroSubheadline =>
      'Luxora pianifica il viaggio in modo che tu possa godertelo.';

  @override
  String get paywallEmotionalLine =>
      'Stai già spendendo migliaia di euro per le tue vacanze. Non lasciare l\'esperienza al caso.';

  @override
  String paywallHeadlineCouples(String cityName) {
    return 'La tua vacanza perfetta a $cityName inizia qui.';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return 'Dedica meno tempo alla pianificazione e più tempo alla creazione di ricordi a $cityName.';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return 'Sperimenta $cityName in modo diverso.';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return 'Scopri la $cityName che la maggior parte dei turisti non vede mai.';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return 'Assapora $cityName come un insider locale.';
  }

  @override
  String get paywallWhatYouUnlock => 'Cosa sblocchi';

  @override
  String get paywallFeatureAiConcierge => 'Portineria dell\'AI';

  @override
  String get paywallFeatureItineraries => 'Itinerari personalizzati';

  @override
  String get paywallFeatureHiddenGems => 'Gemme nascoste';

  @override
  String get paywallFeatureHotelIntel => 'Intelligenza alberghiera';

  @override
  String get paywallFeatureTicketSavings =>
      'Risparmio intelligente sui biglietti';

  @override
  String get paywallFeatureWeatherConcierge => 'Portineria meteo';

  @override
  String get paywallFeatureCrowdIntel => 'Intelligenza della folla';

  @override
  String get paywallFeatureGpsNav => 'Navigazione GPS';

  @override
  String get paywallFeatureLocalSecrets => 'Segreti locali';

  @override
  String get paywallFeatureDining => 'Consigli per i pasti';

  @override
  String get paywallFeatureUnlimitedPlanning =>
      'Pianificazione urbana illimitata';

  @override
  String get paywallWhyTravelersUnlock =>
      'Perché i viaggiatori sbloccano Luxora';

  @override
  String get paywallBenefitSaveTimeTitle => 'Risparmia tempo';

  @override
  String get paywallBenefitSaveTimeBody =>
      'Salta ore di ricerca e pianificazione.';

  @override
  String get paywallBenefitSaveMoneyTitle => 'Risparmia denaro';

  @override
  String get paywallBenefitSaveMoneyBody =>
      'Scopri sconti sui biglietti, offerte locali e scelte più intelligenti.';

  @override
  String get paywallBenefitAvoidTrapsTitle => 'Evita le trappole per turisti';

  @override
  String get paywallBenefitAvoidTrapsBody =>
      'Trova le esperienze effettivamente consigliate dalla gente del posto.';

  @override
  String get paywallBenefitTravelSmarterTitle =>
      'Viaggia in modo più intelligente';

  @override
  String get paywallBenefitTravelSmarterBody =>
      'Ricevi consigli basati sul meteo, sulla folla e sul tuo stile di viaggio.';

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
  String get paywallLockedPreviewTitle =>
      'Aspettando all\'interno del tuo concierge';

  @override
  String get paywallLockedPreviewSubtitle =>
      'Sblocca per rivelare percorsi e segreti su misura per il tuo viaggio.';

  @override
  String get paywallLockedDateNight =>
      'Percorsi romantici per appuntamenti notturni';

  @override
  String get paywallLockedHiddenLuxury => 'Esperienze di lusso nascoste';

  @override
  String get paywallLockedVipSecrets => 'Segreti locali VIP';

  @override
  String get paywallLockedConciergeRecs => 'Raccomandazioni della portineria';

  @override
  String get paywallLockedFamilyPlans => 'Piani antistress per famiglie';

  @override
  String get paywallLockedWeatherReroute =>
      'Reindirizzamento in base alle condizioni meteorologiche';

  @override
  String get paywallLockedHotelMatchmaker =>
      'Combinatore di hotel intelligente';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return 'Sblocca il concierge di $cityName';
  }

  @override
  String get paywallOneTimePurchase => 'Acquisto una tantum';

  @override
  String get paywallNoSubscription => 'Nessun abbonamento';

  @override
  String get paywallNoMonthlyFees => 'Nessun costo mensile';

  @override
  String paywallLifetimeAccess(String cityName) {
    return 'Accesso a vita a $cityName';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return 'Futuri aggiornamenti di $cityName inclusi';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return 'La maggior parte delle vacanze a $cityName costa $minUsd–$maxUsd+';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price una volta';
  }

  @override
  String get paywallLessThanDinner => 'Meno del costo di una cena in vacanza.';

  @override
  String get paywallSocialProofTitle =>
      'Viaggiatori che hanno sbloccato Luxora';

  @override
  String get paywallSocialProofHeading => 'Worth it before they even landed';

  @override
  String get paywallReview1 =>
      '\"Ci ha fatto risparmiare ore di pianificazione.\"';

  @override
  String get paywallReview2 =>
      '\"Ho trovato posti che non avremmo mai scoperto.\"';

  @override
  String get paywallReview3 =>
      '\"Ne vale la pena solo per le gemme nascoste.\"';

  @override
  String paywallCtaUnlock(String cityName) {
    return 'Sblocca il concierge di $cityName';
  }

  @override
  String get paywallContinueExploring => 'Continua a esplorare';

  @override
  String get paywallConciergePromise =>
      'Nessun abbonamento · Accesso città a vita';

  @override
  String get paywallRestorePurchases => 'Ripristina gli acquisti';

  @override
  String get paywallRestorePreviewDisabled =>
      'Restore is disabled in preview mode — use a full build to test restore.';

  @override
  String get paywallPurchaseSuccess =>
      'Acquisto completato: il tuo concierge è sbloccato.';

  @override
  String get paywallPurchasePending => 'Completamento dell\'acquisto…';

  @override
  String get paywallPurchaseFailed =>
      'Impossibile completare l\'acquisto. Riprova o ripristina gli acquisti.';

  @override
  String get paywallPurchaseCanceled => 'Acquisto annullato.';

  @override
  String get paywallRestoreComplete => 'Acquisti ripristinati.';

  @override
  String get paywallRestoreNone =>
      'Nessun acquisto precedente trovato per questo ID Apple o account Google.';

  @override
  String get paywallStoreUnavailable =>
      'La fatturazione dell\'App Store non è disponibile su questo dispositivo.';

  @override
  String get paywallProductUnavailable =>
      'Questo pacchetto non è ancora disponibile nel negozio.';

  @override
  String get settingsUnlockConciergeTitle => 'Sblocca il concierge cittadino';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'Pacchetto città una tantum: non un abbonamento';

  @override
  String get settingsOpenConciergeSubtitle => 'Apri la scheda Concierge AI';

  @override
  String get weatherMiamiHumidityIndoor =>
      'Alta umidità oggi. Vai prima in spiaggia o in piscina, poi a Wynwood o Brickell per cene al coperto e gallerie durante le ore più calde.';

  @override
  String get weatherMiamiHeatAdvisory =>
      'Condizioni di avviso di calore: tessuti leggeri, idratazione e pause all\'ombra tra le soste all\'aperto.';

  @override
  String get weatherMiamiBeachMorning =>
      'Forti raggi UV sulla sabbia: crema solare, cappello e tempo in spiaggia prima di mezzogiorno.';

  @override
  String get weatherMiamiBoatWind =>
      'Il vento è elevato: riconsidera le attività in barca o yacht; cenare sul tetto potrebbe ancora funzionare.';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return 'Finestra di pioggia in vista: scambia i programmi per gli esterni con $indoorSpot o il tempo in galleria.';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      'Il tramonto sembra forte: sul lungomare o sul tetto con una vista da est a ovest.';

  @override
  String get miamiBeachIntelTitle => 'Intelligenza sulla spiaggia';

  @override
  String miamiBeachBestTime(String time) {
    return 'Orario migliore: $time';
  }

  @override
  String get miamiBeachFamilyScore => 'Famiglia';

  @override
  String get miamiBeachCrowdScore => 'Folla';

  @override
  String get miamiBeachPhotoScore => 'Foto';

  @override
  String get miamiBeachRomanceScore => 'Romanticismo';

  @override
  String get miamiBeachSunsetScore => 'Tramonto';

  @override
  String miamiBeachParking(String level) {
    return 'Parcheggio: $level';
  }

  @override
  String get miamiNightlifeTitle => 'Portineria della vita notturna';

  @override
  String miamiNightlifeDressCode(String code) {
    return 'Codice di abbigliamento: $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return 'Miglior arrivo: $time';
  }

  @override
  String get miamiNightlifeReservation => 'Consigliata la prenotazione';

  @override
  String get miamiMoodRoutesTitle => 'Percorsi dell\'umore di Miami';

  @override
  String get tampaBayMoodRoutesTitle => 'Percorsi mood Tampa Bay';

  @override
  String get stAugustineMoodRoutesTitle => 'Percorsi mood St. Augustine';

  @override
  String get naplesMoodRoutesTitle => 'Percorsi mood Naples';

  @override
  String get destin30aMoodRoutesTitle => 'Percorsi mood Destin e 30A';

  @override
  String get vegasMoodRoutesTitle => 'Percorsi mood Las Vegas';

  @override
  String miamiMoodRouteStart(String time) {
    return 'Inizia intorno alle ore $time';
  }

  @override
  String get keysWaterIntelTitle => 'Tasti Intelligenza dell\'Acqua';

  @override
  String keysWaterBestTime(String time) {
    return 'Finestra migliore: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Acqua: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Fare snorkeling';

  @override
  String get keysWaterDivingScore => 'Tuffo';

  @override
  String get keysWaterBoatingScore => 'Barca';

  @override
  String get keysWaterFishingScore => 'Pescare';

  @override
  String get keysWaterWindScore => 'Vento';

  @override
  String get keysWaterSunsetScore => 'Tramonto';

  @override
  String get keysWaterCrowdScore => 'Folla';

  @override
  String get keysMoodRoutesTitle => 'Percorsi dell\'isola di Keys';

  @override
  String keysMoodRouteStart(String time) {
    return 'Inizio alle ore $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'VIVI MIAMI IN MODO DIVERSO';

  @override
  String get paywallHeadlineMiamiWeekend =>
      'NON SPRECARE IL TUO WEEKEND A MIAMI';

  @override
  String get paywallOrlandoAddonsHeading => 'Pacchetto parco a tema';

  @override
  String get paywallOrlandoBaseIncludes =>
      'Lo sblocco di Orlando include ristoranti, gemme nascoste, hotel ed esperienze non legate ai parchi. Aggiungi insieme il pacchetto parco a tema per Disney e Universal.';

  @override
  String get paywallAddonThemeParksTitle => 'Pacchetto Disney e universale';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World e Universal Orlando: tutti i parchi, le offerte, i percorsi e le informazioni sulla folla in un unico sblocco.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return 'Sblocca $packName · $price';
  }

  @override
  String get paywallAddonUnlocked => 'Sbloccato';

  @override
  String get paywallAddonRequiresOrlando =>
      'Richiede prima lo sblocco di Orlando';

  @override
  String paywallUnlockAddonPack(String packName) {
    return 'Sblocca $packName';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return 'Sblocca $packName';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      'Sbloccare Disney e Universal per Orlando?';

  @override
  String get orlandoThemeParksPromptBody =>
      'Aggiungi il pacchetto parchi a tema per Walt Disney World e Universal Orlando: tutti i parchi, le offerte sui biglietti, i percorsi e le informazioni sulla folla in un unico sblocco.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Sblocca · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Non adesso';

  @override
  String get onboardV2Eyebrow => 'Progettiamo il tuo viaggio perfetto';

  @override
  String get onboardV2StepTravelerEyebrow => 'Passaggio 1';

  @override
  String get onboardV2StepTravelerTitle => 'Con chi viaggi?';

  @override
  String get onboardV2StepTravelerSubtitle =>
      'Luxora personalizza i soggiorni, i pasti e il ritmo del tuo equipaggio.';

  @override
  String get onboardV2ChildrenLabel => 'Bambini in viaggio?';

  @override
  String get onboardV2StepStyleEyebrow => 'Passaggio 2';

  @override
  String get onboardV2StepStyleTitle => 'Che tipo di viaggio stai cercando?';

  @override
  String get onboardV2StepStyleSubtitle =>
      'Scegli tutto ciò che ti entusiasma.';

  @override
  String get onboardV2StepHotelEyebrow => 'Passaggio 3';

  @override
  String get onboardV2StepHotelTitle =>
      'Che tipo di posto ti piacerebbe soggiornare?';

  @override
  String get onboardV2StepHotelSubtitle =>
      'Abbineremo gemme di boutique e icone di resort.';

  @override
  String get onboardV2HotelBudgetLabel => 'Bilancio dell\'hotel';

  @override
  String get onboardV2HotelAmenitiesLabel => 'Servizi indispensabili';

  @override
  String get onboardV2StepFoodEyebrow => 'Passaggio 4';

  @override
  String get onboardV2StepFoodTitle => 'Che tipi di ristoranti ti piacciono?';

  @override
  String get onboardV2StepFoodSubtitle =>
      'Cucina e stile di ristorazione: scegli tutto ciò che ami.';

  @override
  String get onboardV2CuisineLabel => 'Tipi di cucina';

  @override
  String get onboardV2DiningStyleLabel => 'Stile da pranzo';

  @override
  String get onboardV2StepPaceEyebrow => 'Passaggio 5';

  @override
  String get onboardV2StepPaceTitle =>
      'Come vorresti che fossero programmate le tue giornate?';

  @override
  String get onboardV2StepPaceSubtitle =>
      'Mattinate rilassate o avventure ricche: scegli tu.';

  @override
  String get onboardV2PaceRelaxedTitle => 'Rilassato';

  @override
  String get onboardV2PaceRelaxedBody => '2-3 attività al giorno';

  @override
  String get onboardV2PaceBalancedTitle => 'Equilibrato';

  @override
  String get onboardV2PaceBalancedBody => '4-5 attività al giorno';

  @override
  String get onboardV2PacePackedTitle => 'Imballato';

  @override
  String get onboardV2PacePackedBody => 'Massimizza ogni giorno';

  @override
  String get onboardV2StepGoalsEyebrow => 'Passaggio 6';

  @override
  String get onboardV2StepGoalsTitle => 'Cosa conta di più in questo viaggio?';

  @override
  String get onboardV2StepGoalsSubtitle => 'Scegli fino a cinque priorità.';

  @override
  String get onboardV2StepExperienceEyebrow => 'Passaggio 7';

  @override
  String get onboardV2StepExperienceTitle => 'Quali esperienze ti piacerebbe?';

  @override
  String get onboardV2StepExperienceSubtitle =>
      'Li intesseremo nel tuo itinerario.';

  @override
  String get onboardV2StepAvoidEyebrow => 'Passaggio 8';

  @override
  String get onboardV2StepAvoidTitle => 'Cosa preferiresti evitare?';

  @override
  String get onboardV2StepAvoidSubtitle =>
      'Luxora evita ciò che prosciuga il tuo viaggio.';

  @override
  String get onboardV2StepEmotionEyebrow => 'Passaggio 9';

  @override
  String get onboardV2StepEmotionTitle =>
      'Cosa renderebbe questo viaggio un successo?';

  @override
  String get onboardV2StepEmotionSubtitle => 'Scegli un sentimento primario.';

  @override
  String get onboardV2StepSummaryEyebrow => 'LUXORA';

  @override
  String onboardV2StepSummaryTitle(String name) {
    return 'Perfetto, $name.';
  }

  @override
  String get onboardV2StepSummarySubtitle =>
      'Ho imparato un po\' che tipo di viaggiatore sei.\n\nUserò le tue preferenze per consigliare luoghi, esperienze, ristoranti e gemme nascoste adatte al tuo stile.\n\nOgni consiglio sarà su misura per te.\n\nVediamo cosa possiamo scoprire.';

  @override
  String get onboardSummaryHotels => 'Alberghi';

  @override
  String get onboardSummaryRestaurants => 'Ristoranti';

  @override
  String get onboardSummaryHiddenGems => 'Gemme nascoste';

  @override
  String get onboardSummaryExperiences => 'Esperienze';

  @override
  String get onboardSummaryHotelDefault =>
      'Soggiorni curati adatti al tuo budget';

  @override
  String onboardSummaryHotelType(String type) {
    return '$type soggiorno';
  }

  @override
  String get onboardSummaryRooftopDining => 'Esperienze culinarie sul tetto';

  @override
  String onboardSummaryCuisine(String cuisine) {
    return '$cuisine preferiti';
  }

  @override
  String onboardSummaryPace(String pace) {
    return '$pace ritmo giornaliero';
  }

  @override
  String get onboardSummaryRomantic => 'Esperienze romantiche al tramonto';

  @override
  String onboardSummaryEmotion(String emotion) {
    return 'Viaggio incentrato sulle $emotion';
  }

  @override
  String get onboardSummaryPremiumGems => 'Gemme nascoste premium';

  @override
  String get agendaSuggestionsForYou => 'Scelto per te';

  @override
  String get agendaSuggestionsAlternates => 'Anche fantastico';

  @override
  String get agendaSuggestionsBrowseAll => 'Sfoglia tutto';

  @override
  String get onboardPrefTravelerSolo => 'Da solo';

  @override
  String get onboardPrefTravelerCouple => 'Coppia';

  @override
  String get onboardPrefTravelerFamily => 'Famiglia';

  @override
  String get onboardPrefTravelerFriends => 'Amici';

  @override
  String get onboardPrefTravelerBusiness => 'Attività commerciale';

  @override
  String get onboardPrefChildrenNone => 'Niente bambini';

  @override
  String get onboardPrefChildrenToddlers => 'Bambini piccoli';

  @override
  String get onboardPrefChildrenElementary => 'Età elementare';

  @override
  String get onboardPrefChildrenTeenagers => 'Adolescenti';

  @override
  String get onboardPrefStyleLuxury => 'Lusso';

  @override
  String get onboardPrefStyleRelaxation => 'Relax';

  @override
  String get onboardPrefStyleAdventure => 'Avventura';

  @override
  String get onboardPrefStyleThemeParks => 'Parchi a tema';

  @override
  String get onboardPrefStyleFoodie => 'Buongustaio';

  @override
  String get onboardPrefStyleNightlife => 'Vita notturna';

  @override
  String get onboardPrefStyleRomance => 'Romanticismo';

  @override
  String get onboardPrefStyleShopping => 'Acquisti';

  @override
  String get onboardPrefStyleBeaches => 'Spiagge';

  @override
  String get onboardPrefStyleWellness => 'Benessere';

  @override
  String get onboardPrefStyleNature => 'Natura';

  @override
  String get onboardPrefStylePhotography => 'Fotografia';

  @override
  String get onboardPrefStyleHiddenGems => 'Gemme nascoste';

  @override
  String get onboardPrefStyleFamilyActivities => 'Attività familiari';

  @override
  String get onboardPrefStyleLocalExperiences => 'Esperienze locali';

  @override
  String get onboardPrefStyleEntertainment => 'Divertimento';

  @override
  String get onboardPrefHotelLuxuryResort => 'Resort di lusso';

  @override
  String get onboardPrefHotelBoutique => 'Albergo di charme';

  @override
  String get onboardPrefHotelFamilyResort => 'Resort per famiglie';

  @override
  String get onboardPrefHotelBudgetFriendly => 'Economico';

  @override
  String get onboardPrefHotelAdultsOnly => 'Solo adulti';

  @override
  String get onboardPrefHotelSpaResort => 'Stazione termale';

  @override
  String get onboardPrefHotelBeachfront => 'Fronte mare';

  @override
  String get onboardPrefHotelDowntown => 'Centro';

  @override
  String get onboardPrefHotelWalkable => 'Zona pedonabile';

  @override
  String get onboardPrefHotelThemeParkArea => 'Area del parco a tema';

  @override
  String get onboardPrefHotelModern => 'Albergo moderno';

  @override
  String get onboardPrefHotelHistoric => 'Albergo storico';

  @override
  String get onboardPrefBudgetOne => '\$';

  @override
  String get onboardPrefBudgetTwo => '\$\$';

  @override
  String get onboardPrefBudgetThree => '\$\$\$';

  @override
  String get onboardPrefBudgetFour => '\$\$\$\$';

  @override
  String get onboardPrefAmenityPool => 'Piscina';

  @override
  String get onboardPrefAmenitySpa => 'Centro benessere';

  @override
  String get onboardPrefAmenityGym => 'Palestra';

  @override
  String get onboardPrefAmenityBreakfast => 'Colazione gratuita';

  @override
  String get onboardPrefAmenityOceanView => 'Vista sull\'oceano';

  @override
  String get onboardPrefAmenityBalcony => 'Balcone';

  @override
  String get onboardPrefAmenityKitchen => 'Cucina';

  @override
  String get onboardPrefAmenityShuttle => 'Servizio Navetta';

  @override
  String get onboardPrefAmenityPetFriendly => 'Animali ammessi';

  @override
  String get onboardPrefCuisineAmerican => 'americano';

  @override
  String get onboardPrefCuisineItalian => 'Italiano';

  @override
  String get onboardPrefCuisineMexican => 'messicano';

  @override
  String get onboardPrefCuisineSeafood => 'Frutti di mare';

  @override
  String get onboardPrefCuisineSteakhouse => 'Bisteccheria';

  @override
  String get onboardPrefCuisineSushi => 'Sushi giapponese';

  @override
  String get onboardPrefCuisineCuban => 'cubano';

  @override
  String get onboardPrefCuisineMediterranean => 'mediterraneo';

  @override
  String get onboardPrefCuisineAsian => 'asiatico';

  @override
  String get onboardPrefCuisineBbq => 'barbecue';

  @override
  String get onboardPrefCuisineFineDining => 'Cucina raffinata';

  @override
  String get onboardPrefCuisineLocalFavorites => 'Preferiti locali';

  @override
  String get onboardPrefCuisineFoodTrucks => 'Camion del cibo';

  @override
  String get onboardPrefCuisineRooftop => 'Pranzo sul tetto';

  @override
  String get onboardPrefCuisineBrunch => 'Brunch';

  @override
  String get onboardPrefCuisineDessert => 'Dolci';

  @override
  String get onboardPrefDiningQuick => 'Servizio rapido';

  @override
  String get onboardPrefDiningCasual => 'Pranzo informale';

  @override
  String get onboardPrefDiningFamily => 'Adatto alle famiglie';

  @override
  String get onboardPrefDiningDateNight => 'Appuntamento notturno';

  @override
  String get onboardPrefDiningFine => 'Cucina raffinata';

  @override
  String get onboardPrefDiningWaterfront => 'Lungomare';

  @override
  String get onboardPrefDiningHiddenGems => 'Gemme nascoste';

  @override
  String get onboardPrefDiningLocal => 'Preferiti locali';

  @override
  String get onboardPrefGoalMakeMemories => 'Crea ricordi';

  @override
  String get onboardPrefGoalSaveMoney => 'Risparmia denaro';

  @override
  String get onboardPrefGoalAvoidCrowds => 'Evita la folla';

  @override
  String get onboardPrefGoalLuxury => 'Esperienze di lusso';

  @override
  String get onboardPrefGoalBestFood => 'Il miglior cibo';

  @override
  String get onboardPrefGoalHiddenGems => 'Gemme nascoste';

  @override
  String get onboardPrefGoalRelaxation => 'Relax';

  @override
  String get onboardPrefGoalAdventure => 'Avventura';

  @override
  String get onboardPrefGoalBestPhotos => 'Le migliori foto';

  @override
  String get onboardPrefGoalFamilyTime => 'Tempo in famiglia';

  @override
  String get onboardPrefGoalRomance => 'Romanticismo';

  @override
  String get onboardPrefGoalNightlife => 'Vita notturna';

  @override
  String get onboardPrefGoalLocal => 'Esperienze locali';

  @override
  String get onboardPrefGoalStressFree => 'Pianificazione senza stress';

  @override
  String get onboardPrefExpBoatTours => 'Giri in barca';

  @override
  String get onboardPrefExpSunsetCruises => 'Crociere al tramonto';

  @override
  String get onboardPrefExpAirboat => 'Tour in idroscivolante';

  @override
  String get onboardPrefExpThemeParks => 'Parchi a tema';

  @override
  String get onboardPrefExpMuseums => 'Musei';

  @override
  String get onboardPrefExpLiveShows => 'Spettacoli dal vivo';

  @override
  String get onboardPrefExpSpas => 'Terme';

  @override
  String get onboardPrefExpShopping => 'Acquisti';

  @override
  String get onboardPrefExpWaterParks => 'Parchi acquatici';

  @override
  String get onboardPrefExpGolf => 'Golf';

  @override
  String get onboardPrefExpFishing => 'Pesca';

  @override
  String get onboardPrefExpKayaking => 'Kayak';

  @override
  String get onboardPrefExpSnorkeling => 'Snorkeling subacqueo';

  @override
  String get onboardPrefExpRooftopBars => 'Bar sul tetto';

  @override
  String get onboardPrefExpNightclubs => 'Discoteche';

  @override
  String get onboardPrefExpWildlife => 'Esperienze sulla fauna selvatica';

  @override
  String get onboardPrefExpFoodTours => 'Tour gastronomici';

  @override
  String get onboardPrefExpScenicDrives => 'Strade panoramiche';

  @override
  String get onboardPrefAvoidCrowds => 'Folle';

  @override
  String get onboardPrefAvoidLongLines => 'Lunghe file';

  @override
  String get onboardPrefAvoidExpensiveRestaurants => 'Ristoranti costosi';

  @override
  String get onboardPrefAvoidWalking => 'Camminare per lunghe distanze';

  @override
  String get onboardPrefAvoidNightlife => 'Vita notturna';

  @override
  String get onboardPrefAvoidDriving => 'Guida';

  @override
  String get onboardPrefAvoidTouristTraps => 'Trappole per turisti';

  @override
  String get onboardPrefAvoidEarlyMornings => 'Mattina presto';

  @override
  String get onboardPrefAvoidLateNights => 'Tarde notti';

  @override
  String get onboardPrefAvoidFamilyAttractions => 'Attrazioni per famiglie';

  @override
  String get onboardPrefAvoidThemeParks => 'Parchi a tema';

  @override
  String get onboardPrefEmotionRelaxed => 'Rilassato';

  @override
  String get onboardPrefEmotionExcited => 'Eccitato';

  @override
  String get onboardPrefEmotionAdventurous => 'Avventuroso';

  @override
  String get onboardPrefEmotionRomantic => 'Romantico';

  @override
  String get onboardPrefEmotionLuxurious => 'Lussuoso';

  @override
  String get onboardPrefEmotionFamilyFocused => 'Incentrato sulla famiglia';

  @override
  String get onboardPrefEmotionMemorable => 'Memorabile';

  @override
  String get onboardPrefEmotionStressFree => 'Senza stress';

  @override
  String get onboardPrefEmotionInspiring => 'Ispirante';

  @override
  String get onboardPrefPaceSlow => 'Rilassato';

  @override
  String get onboardPrefPaceBalanced => 'Equilibrato';

  @override
  String get onboardPrefPacePacked => 'Imballato';

  @override
  String get onboardSummaryHiddenGemsInsight =>
      'Ristoranti e gemme locali nascosti';

  @override
  String get onboardBuildFailedHint =>
      'Abbiamo salvato le tue preferenze, ma l\'itinerario necessita di un altro momento. Tira per aggiornare l\'Agenda o aprire Concierge.';

  @override
  String get onboardV2ChildrenSubtitle =>
      'Seleziona tutte le fasce d\'età applicabili.';

  @override
  String get onboardTravelerNameEyebrow => 'Per prima cosa';

  @override
  String get onboardTravelerNameTitle => 'Come dovrebbe chiamarti Luxora?';

  @override
  String get onboardTravelerNameSubtitle =>
      'È sufficiente il tuo nome: Luxora lo utilizzerà quando chatti.';

  @override
  String get onboardTravelerNameLabel => 'Il tuo nome';

  @override
  String get onboardTravelerNameHint => 'per esempio. Maria';

  @override
  String conciergeWelcomeNamed(String name) {
    return 'Benvenuto, $name, il tuo compagno emotivamente intelligente della Florida.\n\nScegli un suggerimento qui sotto o descrivi l\'emozione che desideri che il tuo viaggio susciti.';
  }

  @override
  String conciergeWelcomeWarmNamed(String name) {
    return '$name, sono qui per modellare la Florida in base a come vuoi sentirti, non per un elenco di cose da vedere. Di cosa hai voglia oggi?';
  }

  @override
  String get onboardWelcomeEyebrow => 'LUXORA';

  @override
  String get onboardWelcomeTitle => 'Ciao, sono Luxora.';

  @override
  String get onboardWelcomeTagline => 'Il tuo concierge di viaggio personale.';

  @override
  String get onboardWelcomeBody =>
      'Sono qui per aiutarti a scoprire posti incredibili, evitare trappole turistiche e creare una vacanza che ricorderai per anni.\n\nIniziamo a pianificare qualcosa di indimenticabile.';

  @override
  String get onboardWelcomeCta => 'Inizia il mio viaggio';

  @override
  String get onboardLuxoraGuideBody =>
      'Da questo momento ti guiderò in ogni passo.\n\nChe tu cerchi gemme nascoste, cibo incredibile, esperienze indimenticabili o semplicemente una vacanza senza stress, ci penso io.';

  @override
  String get onboardLuxoraReplyClosing =>
      'Creiamo insieme la tua avventura perfetta.';

  @override
  String onboardBuildingTitle(String name) {
    return 'Scelta meravigliosa, $name.';
  }

  @override
  String get onboardBuildingBody =>
      'Sto creando un itinerario personalizzato in base al tuo stile, interessi, ritmo, preferenze gastronomiche e obiettivi di vacanza.\n\nPotrebbe volerci un momento.';

  @override
  String get onboardBuildingTagline =>
      'Le buone vacanze capitano per caso.\n\nLe grandi vacanze nascono con un piano.';

  @override
  String get onboardItineraryReadyTitle => 'La tua avventura è pronta.';

  @override
  String get onboardItineraryReadyBody =>
      'Ho selezionato con cura esperienze, ristoranti, attrazioni e gemme nascoste che corrispondono al viaggio che hai descritto.\n\nNaturalmente possiamo modificare tutto lungo il percorso.\n\nLe migliori vacanze evolvono mentre si svolgono.';

  @override
  String weatherRerouteLuxoraIntro(String name) {
    return '$name, il meteo potrebbe influenzare parte dei piani di oggi.';
  }

  @override
  String get weatherRerouteLuxoraClosing =>
      'A volte l\'imprevisto crea i ricordi migliori.';

  @override
  String rightNowLuxoraIntro(String name) {
    return '$name, in base alla tua posizione, al meteo attuale e alle tue preferenze, ecco cosa farei adesso.';
  }

  @override
  String get rightNowLuxoraClosing =>
      'Fidati di me.\n\nPenso che ti piacerà molto.';

  @override
  String paywallPersonalPitch(String name, String cityName) {
    return '$name, il tuo piano vacanze personalizzato sta già prendendo forma.\n\nIl Giorno 1 è pronto.\n\nIl resto del viaggio ti aspetta.\n\nSblocca $cityName Concierge per l\'itinerario completo, gemme nascoste, segreti locali, meteo intelligente e guida concierge illimitata.\n\nRendiamo indimenticabile questa vacanza.';
  }

  @override
  String get onboardLuxoraReplyEyebrow => 'LUXORA';

  @override
  String onboardLuxoraReplyTitle(String name) {
    return 'Piacere di conoscerti, $name.';
  }

  @override
  String onboardLuxoraGuideNamed(String name) {
    return 'Da questo momento ti guiderò in ogni passo.\n\nChe tu cerchi gemme nascoste, cibo incredibile, esperienze indimenticabili o semplicemente una vacanza senza stress, ci penso io.';
  }

  @override
  String get onboardLuxoraItineraryPromise =>
      'Creiamo insieme la tua avventura perfetta.';

  @override
  String get onboardReturningEyebrow => 'BENTORNATO';

  @override
  String onboardReturningTitle(String name) {
    return 'Bentornato, $name.';
  }

  @override
  String get onboardReturningTitleGeneric => 'Bentornato.';

  @override
  String get onboardReturningSubtitle =>
      'Pronto a continuare la tua avventura?\n\nHo salvato preferenze, luoghi preferiti e piani di viaggio per riprendere da dove avevamo lasciato.\n\nVediamo cosa ti aspetta oggi.';

  @override
  String get todayPlanSectionTitle => 'Il piano di oggi';

  @override
  String get todayNextActivityLabel => 'Il prossimo';

  @override
  String get todayStaysDiningSection => 'Soggiorni e scelte gastronomiche';

  @override
  String get todayStaysDiningCollapsedHint =>
      'Idee per hotel e ristoranti: tocca per espandere';

  @override
  String get todayPlanDetailsTitle => 'Programma completo';

  @override
  String todayPlanStopCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fermate oggi',
      one: '1 stop today',
    );
    return '$_temp0';
  }

  @override
  String get todayRainRerouteTitle => 'Deviazione meteo';

  @override
  String get todayExtrasSection => 'Biglietti e condivisione';

  @override
  String get todayExtrasCollapsedHint =>
      'Offerte, carte condivise e altro ancora';

  @override
  String freemiumVacationTitle(String cityName) {
    return 'La tua vacanza a $cityName';
  }

  @override
  String get freemiumDay1Ready => '✓ Giorno 1 pronto';

  @override
  String get freemiumUnlockFullPlan => 'Sblocca il piano vacanza completo';

  @override
  String freemiumLockedDayConcierge(int day) {
    return 'Giorno $day · Ottimizzato dal concierge';
  }

  @override
  String get freemiumLockedDayGems => 'Giorno 3 · Percorso gemme nascoste';

  @override
  String get freemiumLockedDayWeather => 'Giorno 4 · Pianificazione meteo';

  @override
  String get freemiumLockedDayDeparture => 'Giorno 5 · Strategia di partenza';

  @override
  String freemiumConciergeRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count domande gratuite rimaste',
      one: '1 domanda gratuita rimasta',
    );
    return '$_temp0';
  }

  @override
  String get freemiumConciergeLimitReached =>
      'Limite concierge gratuito raggiunto — sblocca pianificazione illimitata.';

  @override
  String freemiumLockedHotels(int count) {
    return '🔒 $count+ hotel aggiuntivi disponibili';
  }

  @override
  String freemiumLockedRestaurants(int count) {
    return '🔒 $count+ ristoranti aggiuntivi disponibili';
  }

  @override
  String freemiumLockedGems(int count) {
    return '🔒 $count+ gemme nascoste disponibili';
  }

  @override
  String freemiumLockedSecrets(int count) {
    return '🔒 $count+ segreti locali disponibili';
  }

  @override
  String freemiumLockedExperiences(int count) {
    return '🔒 $count+ esperienze disponibili';
  }

  @override
  String get freemiumLockedAttractions => '🔒 Altre attrazioni disponibili';

  @override
  String freemiumUnlockExplore(String cityName) {
    return 'Sblocca $cityName Concierge per continuare a esplorare.';
  }

  @override
  String freemiumUnlockConcierge(String cityName) {
    return 'Sblocca $cityName Concierge';
  }

  @override
  String freemiumHeadlineDayTwoPlus(String cityName) {
    return 'I prossimi giorni sono pronti — sblocca il piano completo di $cityName.';
  }

  @override
  String get freemiumHeadlineConciergeLimit =>
      'Continua a pianificare con accesso concierge illimitato.';

  @override
  String freemiumHeadlineHotels(String cityName) {
    return 'Sblocca $cityName Concierge per ogni consiglio sull\'alloggio.';
  }

  @override
  String freemiumHeadlineRestaurants(String cityName) {
    return 'Sblocca la collezione completa di ristoranti di $cityName.';
  }

  @override
  String get freemiumHeadlineGems =>
      'Preferiti locali e gemme nascoste ti aspettano.';

  @override
  String get freemiumHeadlineSecrets =>
      'Sblocca segreti di orari e parcheggio dei residenti.';

  @override
  String freemiumHeadlineExperiences(String cityName) {
    return 'Sblocca esperienze curate in tutta $cityName.';
  }

  @override
  String get freemiumHeadlineAttractions =>
      'Sblocca la collezione completa di attrazioni.';

  @override
  String get freemiumHeadlineHotelMatchmaker =>
      'Sblocca Hotel Intelligence per confrontare ogni soggiorno.';

  @override
  String get freemiumHeadlineFullItinerary =>
      'Sblocca il tuo piano vacanza completo.';

  @override
  String get freemiumLocalSecretsTitle => 'Segreti locali';

  @override
  String get freemiumLocalSecretsSubtitle =>
      'Orari, parcheggio e punti panoramici custoditi dai locali.';
}
