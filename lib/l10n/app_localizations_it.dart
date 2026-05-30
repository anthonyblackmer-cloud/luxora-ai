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
      'Lusso cinematografico o chiarezza leggibile — scegli ciò che si adatta alla tua giornata.';

  @override
  String get settingsThemeSectionLuxury => 'Lusso cinematografico';

  @override
  String get settingsThemeSectionReadable => 'Chiaro e leggibile';

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
  String get navAgenda => 'Agenda';

  @override
  String get navDiscover => 'Scoprire';

  @override
  String get navMap => 'Mappa';

  @override
  String get navTrips => 'Viaggi';

  @override
  String get navMore => 'Di più';

  @override
  String get navTimeline => 'Cronologia';

  @override
  String get agendaPageSubtitle =>
      'Il viaggio completo — tappe giorno per giorno, offerte biglietti e piano Concierge di oggi.';

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
  String get moreCardDiscoverSub => 'Trend dining, esperienze e scoperta live';

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
      'Impossibile aggiornare i prezzi — mostro le offerte in cache.';

  @override
  String get ticketDealsUpdating => 'Aggiornamento prezzi…';

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
      'Key Largo, Islamorada e corridoio della barriera settentrionale';

  @override
  String get radiusDesc50Keys =>
      'Marathon, Big Pine e spiagge delle Keys centrali';

  @override
  String get radiusDesc100Keys => 'Intera Overseas Highway fino a Key West';

  @override
  String get radiusDescAllKeys =>
      'Intera catena isolata e acque per gite giornaliere';

  @override
  String get feedBadge => 'SCOPERTA DAL VIVO';

  @override
  String get feedTitle => 'Feed dell\'esperienza';

  @override
  String get feedSubtitle =>
      'Cosa sta succedendo in questo momento: luoghi di tendenza, nuove aperture, scelte dei creatori, percorsi stagionali e aggiornamenti in tempo reale.';

  @override
  String get feedSubtitleFamily =>
      'Scelte per famiglie — parchi, idee facili e momenti che piacciono ai bambini.';

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
      'COME DOVREBBE SENTIRSI OGGI PER LA VOSTRA CREW?';

  @override
  String get feedMoodAll => 'Qualunque cosa';

  @override
  String get feedMoodFamily => 'Magia in famiglia';

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
  String get feedFamilyMoodHint =>
      'Theme parks, character meals, and easy parent wins — filtered for family tags.';

  @override
  String get feedEmptyHint =>
      'Nessuna scheda feed in questo raggio: prova 50 miglia o Tutta la Florida per i punti salienti della costa del Golfo e delle Keys.';

  @override
  String get feedEmptyHintFamily =>
      'No family-tagged cards in this radius — try Adventurous or Everything, or widen the radius.';

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
  String get mapPlanDayTitle => 'L\'agenda di oggi';

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
    return '$time di guida · $miles dalla tappa precedente';
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
  String get mapParkingLevelModerate => 'Moderato';

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
    return 'Stress di guida: $score/90';
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
      'Probabile pioggia: tocca reindirizza per i backup interni.';

  @override
  String get dayFlowSwapTitle => 'Cambia questa tappa';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'Dì a Luxora cosa preferiresti al posto di $current.';
  }

  @override
  String get dayFlowSwapTemplate => 'Stavo pensando a qualcosa tipo…';

  @override
  String get dayFlowSwapHint =>
      'e.g. a quiet park this morning, or seafood for dinner';

  @override
  String get dayFlowSwapApply => 'Aggiorna la mia giornata';

  @override
  String get dayFlowSwapViewPlace => 'Vedi tappa attuale';

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
  String get dayFlowSwapHoldSpeak => 'Tieni premuto per parlare';

  @override
  String get dayFlowSwapListening => 'In ascolto…';

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
  String get occasionUniversalAdventure => 'Avventura Universal';

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
      'Consenti il microfono così Luxora può ascoltarti.';

  @override
  String get conciergeVoiceListening => 'Luxora sta ascoltando…';

  @override
  String get conciergeVoiceSpeaking => 'Luxora sta parlando…';

  @override
  String get conciergeVoiceRelease => 'Rilascia per inviare';

  @override
  String get conciergeVoiceSend => 'Invia a Luxora';

  @override
  String get conciergeVoiceProcessing => 'Invio a Luxora…';

  @override
  String get conciergeVoiceNoSpeech =>
      'Non ho capito — tieni premuto, parla e rilascia.';

  @override
  String get conciergeVoicePreviewFailed =>
      'Anteprima non riprodotta. Controlla il volume e riprova.';

  @override
  String get conciergeVoiceUnavailable =>
      'La voce non è disponibile su questo dispositivo.';

  @override
  String get conciergeVoiceSettingsTitle => 'Voce di Luxora';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Scegli accento, tono e ritmo — usa le voci di sistema del dispositivo.';

  @override
  String get conciergeVoiceRateLabel => 'Ritmo di voce';

  @override
  String get conciergeVoiceRateSlow => 'Lento';

  @override
  String get conciergeVoiceRateNatural => 'Naturale';

  @override
  String get conciergeVoiceRateFast => 'Veloce';

  @override
  String get conciergeVoicePreview => 'Anteprima voce';

  @override
  String get conciergeVoicePreviewSample =>
      'Ciao — sono Luxora. Dimmi come vuoi sentirti in questo viaggio.';

  @override
  String get conciergeVoiceDeviceNote =>
      'Download more voices in iPhone Settings → Accessibility → Spoken Content → Voices. Return here and tap Refresh.';

  @override
  String get conciergeVoiceDeviceSection => 'Voci su questo iPhone';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'Includes voices you downloaded — tap one to use it for Luxora.';

  @override
  String get conciergeVoiceRefreshList => 'Aggiorna elenco voci';

  @override
  String get conciergeVoiceShowAllLanguages => 'Show all languages';

  @override
  String get conciergeVoiceOpenSettings => 'Open iPhone voice settings';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'No voices found — download packs in Settings, then refresh.';

  @override
  String get conciergeVoicePresetSection => 'Profili rapidi';

  @override
  String get conciergeVoiceRegionRecommended => 'Consigliato';

  @override
  String get conciergeVoiceRegionEnglish => 'Inglese';

  @override
  String get conciergeVoiceRegionRussian => 'Russo';

  @override
  String get conciergeVoiceRegionSpanish => 'Spagnolo';

  @override
  String get conciergeVoiceRegionFrench => 'Francese';

  @override
  String get conciergeVoiceRegionGerman => 'Tedesco';

  @override
  String get conciergeVoiceRegionOther => 'Altro';

  @override
  String get conciergeVoicePresetMatchApp => 'Lingua app · Femminile';

  @override
  String get conciergeVoicePresetEnUsF => 'Americana · Femminile';

  @override
  String get conciergeVoicePresetEnUsM => 'Americana · Maschile';

  @override
  String get conciergeVoicePresetEnGbF => 'Britannica · Femminile';

  @override
  String get conciergeVoicePresetEnGbM => 'Britannica · Maschile';

  @override
  String get conciergeVoicePresetRuF => 'Russa · Femminile';

  @override
  String get conciergeVoicePresetRuM => 'Russo · Maschile';

  @override
  String get conciergeVoicePresetEsF => 'Spagnola · Femminile';

  @override
  String get conciergeVoicePresetEsM => 'Spagnola · Maschile';

  @override
  String get conciergeVoicePresetFrF => 'Francese · Femminile';

  @override
  String get conciergeVoicePresetFrM => 'Francese · Maschile';

  @override
  String get conciergeVoicePresetDeF => 'Tedesca · Femminile';

  @override
  String get conciergeVoicePresetDeM => 'Tedesco · Maschile';

  @override
  String get conciergeThinking => 'Luxora sta pensando…';

  @override
  String get conciergeItinerarySynced =>
      'L\'ho aggiunto all\'agenda di oggi su Mappa e alla Timeline — stesse tappe, pronte da condividere.';

  @override
  String get conciergeAgendaUpdatedSnack => 'La tua agenda è pronta su Mappa';

  @override
  String get conciergeAgendaSyncFailed =>
      'Map and Timeline did not update. Try one clear request, for example: Plan a 4-day Disney and Universal trip.';

  @override
  String get conciergeViewAgendaOnMap => 'Vai alla Mappa';

  @override
  String get conciergeAgendaDealsIntro =>
      'Ho abbinato offerte autorizzate alle tappe della tua agenda — confronta prima di comprare al botteghino:';

  @override
  String get conciergeAgendaDealsSnack =>
      'Offerte biglietti abbinati alla tua agenda';

  @override
  String get conciergeViewTicketDeals => 'Vedi offerte';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · risparmio stim. $amount via $source';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return '$count tappe della tua agenda hanno offerte partner — confronta le offerte autorizzate prima di comprare al botteghino.';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return 'Risparmio famiglia stim. · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals => 'Sfoglia offerte per la tua agenda →';

  @override
  String get conciergeFreshThread =>
      'La tua agenda è su Mappa e Timeline. Ho archiviato questa chat e ne ho aperta una nuova — modifica la giornata, trova offerte o chiedi qualcos\'altro.';

  @override
  String get conciergeThreadArchivedSnack =>
      'Chat archiviata — nuova conversazione';

  @override
  String get conciergeNewConversationTooltip => 'Nuova conversazione';

  @override
  String get itinerarySameAsMapAgenda =>
      'Stesso piano dell\'agenda di oggi sulla scheda Mappa — condividi la giornata qui o da Mappa.';

  @override
  String get conciergeTicketsFoundIntro =>
      'Ho trovato offerte autorizzate per il tuo viaggio — tocca Prenota biglietti nella Timeline per i link diretti.';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title: $price via $source (risparmio $savings)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'Ogni tappa corrispondente nella Timeline ha un pulsante Prenota biglietti con il link del rivenditore.';

  @override
  String itineraryBookTickets(String amount) {
    return 'Prenota biglietti · Risparmia $amount';
  }

  @override
  String get itineraryOpenTicketDeal => 'Prenota biglietti';

  @override
  String conciergeTripSaved(String title) {
    return 'Ho salvato “$title” in Viaggi — apri la scheda Trips quando vuoi.';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return 'Ho salvato “$title” con $count esperienze sulla timeline.';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return 'Hai $count viaggio/i salvato/i:';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title ($dates) — $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      'Non hai ancora viaggi salvati — chiedimi di pianificare qualcosa, poi di “salva il mio viaggio”.';

  @override
  String get conciergeSavedTripsHint =>
      'Apri la scheda Trips per vedere le card, condividere o modificare le date.';

  @override
  String get conciergeAiError =>
      'Non riesco a raggiungere Luxora. Controlla la connessione e riprova.';

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
  String get mapAiPowers => 'Poteri della mappa dell\'IA';

  @override
  String get mapNavLayerTitle => 'Intelligenza attrito per tappa';

  @override
  String get mapNavLayerSubtitle =>
      'Folla, parcheggio e stress di guida nel piano — più reroute spontanea.';

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
  String get mapFutureCrowdTitle => 'Prospettiva folla';

  @override
  String get mapFutureCrowdDesc =>
      'Finestre previste da tranquillo a pieno su ogni tappa di Plan my day.';

  @override
  String get mapFutureParkingTitle => 'Prospettiva parcheggio';

  @override
  String get mapFutureParkingDesc =>
      'Attrito stimato per valet, garage e arrivo prima di partire.';

  @override
  String get mapFutureTrafficTitle => 'Drive friction score';

  @override
  String get mapFutureTrafficDesc =>
      'Punteggi di stress per tratta nel piano giornaliero — non solo minuti.';

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
  String get tripsSaveDates => 'Salva date';

  @override
  String get tripsDatesUpdated => 'Date aggiornate';

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
  String get tripsOpenAgenda => 'Apri agenda completa';

  @override
  String get tripsOpenTimeline => 'Apri la cronologia completa';

  @override
  String get tripsShare => 'Condividere';

  @override
  String get shareItineraryFooter =>
      'Progettato con Luxora, il tuo compagno della Florida emotivamente intelligente.';

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
  String get detailTravelIntelTitle => 'Prospettiva attrito viaggio';

  @override
  String get detailTravelIntelSubtitle =>
      'Previsione da categoria, ora e distanza — nessun sensore live.';

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
    return 'Stress di guida: $score/90';
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
  String get landingBegin => 'Inizia il tuo viaggio';

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
      'Ogni destinazione ha il proprio sblocco concierge — acquisto una tantum per città. I parchi di Orlando sono un pack (Disney e Universal insieme).';

  @override
  String get landingCityLabel => 'Dove stai andando?';

  @override
  String get paywallSwitchCity => 'Destinazione';

  @override
  String get cityPickerUnlocked => 'Sbloccato';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Sblocca $price';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Add-on Orlando · Disney e Universal insieme';

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
  String get onboardSelectStartDate => 'Scegli data di inizio';

  @override
  String get onboardSelectEndDate => 'Scegli data di fine';

  @override
  String get onboardDatesHint =>
      'Puoi modificarle in qualsiasi momento nella scheda Viaggi.';

  @override
  String get onboardStepBudgetTitle => 'Pianifica con calma';

  @override
  String get onboardStepBudgetSubtitle => 'Quale budget per questa fuga?';

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
  String get weatherRadarPlay => 'Avvia loop';

  @override
  String get weatherRadarPause => 'Pausa loop';

  @override
  String get weatherRadarTapToExpand => 'Tocca per schermo intero';

  @override
  String get weatherRadarNow => 'Adesso';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return '$minutes min fa';
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
      'Anteprima mappa · apri in Luxora per indicazioni live';

  @override
  String get shareRadarPreviewCaption =>
      'Radar Doppler live · apri in Luxora per il loop completo';

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
      'Link di prenotazione non disponibile per questo soggiorno.';

  @override
  String get hotelLinkOpenFailed =>
      'Impossibile aprire il link — riprova nel browser.';

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
      'Acquisto una tantum · Concierge personale · Nessun abbonamento';

  @override
  String get settingsUnlockConciergeTitle => 'Sblocca il concierge cittadino';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'Pacchetto città una tantum: non un abbonamento';

  @override
  String get settingsOpenConciergeSubtitle => 'Apri la scheda concierge IA';

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
  String miamiMoodRouteStart(String time) {
    return 'Inizia intorno alle ore $time';
  }

  @override
  String get keysWaterIntelTitle => 'Intelligence acquatica delle Keys';

  @override
  String keysWaterBestTime(String time) {
    return 'Finestra migliore: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Acqua: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Snorkel';

  @override
  String get keysWaterDivingScore => 'Immersioni';

  @override
  String get keysWaterBoatingScore => 'Barca';

  @override
  String get keysWaterFishingScore => 'Pesca';

  @override
  String get keysWaterWindScore => 'Vento';

  @override
  String get keysWaterSunsetScore => 'Tramonto';

  @override
  String get keysWaterCrowdScore => 'Folla';

  @override
  String get keysMoodRoutesTitle => 'Rotte insulari delle Keys';

  @override
  String keysMoodRouteStart(String time) {
    return 'Inizio $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'VIVI MIAMI IN MODO DIVERSO';

  @override
  String get paywallHeadlineMiamiWeekend =>
      'NON SPRECARE IL TUO WEEKEND A MIAMI';

  @override
  String get paywallOrlandoAddonsHeading => 'Pack parchi a tema';

  @override
  String get paywallOrlandoBaseIncludes =>
      'Orlando include ristoranti, gemme nascoste, hotel ed esperienze fuori parco. Aggiungi il pack parchi per Disney e Universal insieme.';

  @override
  String get paywallAddonThemeParksTitle => 'Pack Disney e Universal';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World e Universal Orlando — tutti i parchi, offerte, percorsi e intel affollamento in uno sblocco.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return 'Sblocca $packName · $price';
  }

  @override
  String get paywallAddonUnlocked => 'Sbloccato';

  @override
  String get paywallAddonRequiresOrlando => 'Richiede prima lo sblocco Orlando';

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
      'Aggiungi il pack parchi per Walt Disney World e Universal Orlando — tutti i parchi, offerte biglietti, percorsi e intel affollamento in uno sblocco.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Sblocca · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Non ora';
}
