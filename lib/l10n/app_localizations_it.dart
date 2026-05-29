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
  String get commonLive => 'Live';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get settingsStartOverSubtitle => 'Inizia un nuovo viaggio da zero';

  @override
  String get navConcierge => 'Concierge';

  @override
  String get navTimeline => 'Cronologia';

  @override
  String get navMap => 'Mappa';

  @override
  String get navGems => 'Gemme';

  @override
  String get navFeed => 'Foraggio';

  @override
  String get navTrips => 'Viaggi';

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
      'Sono qui per modellare la Florida su come vuoi sentirti, non su una lista di luoghi. Cosa desideri oggi?';

  @override
  String get conciergeRefineStyle => 'Affina il mio stile';

  @override
  String get conciergeRecallReturning => 'Bentornato.';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'Ricordo che ti piace $prefs.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'E volevi che questo viaggio trasmettesse: “$feel”.';
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
  String get discoverSearchScopeAll =>
      'Ricerca in tutta la Florida nel catalogo';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'Entro $radius da Orlando';
  }

  @override
  String get discoverSearchEmpty =>
      'Nessuna corrispondenza in questo raggio: prova un nome più breve, amplia il chip della distanza su Mappa o Feed oppure cerca \"spiaggia\", \"Disney\" o \"sorgenti\".';

  @override
  String get discoverFilterAll => 'Tutti';

  @override
  String get discoverFilterHotels => 'Hotel';

  @override
  String get discoverFilterRestaurants => 'Ristoranti';

  @override
  String get discoverFilterDestinations => 'Mete';

  @override
  String get discoverPopularInRadius => 'Popolare nel tuo raggio';

  @override
  String get discoverTrySearching => 'Prova a cercare';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count destinazioni · entro $radius da Orlando';
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
  String get feedBadge => 'SCOPERTA DAL VIVO';

  @override
  String get feedTitle => 'Feed dell\'esperienza';

  @override
  String get feedSubtitle =>
      'Cosa sta succedendo in questo momento: luoghi di tendenza, nuove aperture, scelte dei creatori, percorsi stagionali e aggiornamenti in tempo reale.';

  @override
  String get feedPillTrending => 'Tendenza';

  @override
  String get feedPillNewOpenings => 'Nuove aperture';

  @override
  String get feedPillCreator => 'Scelte del creatore';

  @override
  String get feedPillLive => 'Aggiornamenti in tempo reale';

  @override
  String get feedMoodPrompt => 'COME VUOI SENTIRTI?';

  @override
  String get feedMoodAll => 'Tutto';

  @override
  String get feedMoodRomantic => 'Romantico';

  @override
  String get feedMoodCalm => 'Tranquillo';

  @override
  String get feedMoodAdventurous => 'Avventuroso';

  @override
  String get feedMoodPampered => 'Coccolato';

  @override
  String get feedMoodSocial => 'Vivace';

  @override
  String get feedMoodFoodie => 'Gourmet';

  @override
  String get feedEmptyHint =>
      'Nessuna scheda feed in questo raggio: prova 50 miglia o Tutta la Florida per i punti salienti della costa del Golfo e delle Keys.';

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
    return '$count gemme in linea con il tuo stile';
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
      'Suggerito in base all’atmosfera del tuo viaggio: aggiungi luoghi per personalizzarlo.';

  @override
  String get mapPlanDayEmpty =>
      'Aggiungi destinazioni (♥) e Luxora crea un itinerario ottimizzato dal tuo hub di Orlando: meno guida, più emozione.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count tappe · $miles · $time in auto';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'Partenza da $hotel';
  }

  @override
  String get mapCrowdLevelQuiet => 'Tranquillo';

  @override
  String get mapCrowdLevelModerate => 'Moderato';

  @override
  String get mapCrowdLevelBusy => 'Affollato';

  @override
  String get mapCrowdLevelPacked => 'Molto affollato';

  @override
  String mapCrowdAtStop(String level) {
    return 'Affluenza: $level';
  }

  @override
  String get mapRerouteButton => 'Ricalcola per tappe più tranquille';

  @override
  String mapRerouteApplied(int count) {
    return 'Giornata aggiornata — $count tappe sostituite per meno folla.';
  }

  @override
  String get mapRerouteNone => 'Il tuo percorso sembra già tranquillo.';

  @override
  String get mapRerouteRainHint =>
      'Pioggia probabile — tocca per alternative al coperto.';

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
  String get tripsEmptyTitle => 'Nessun viaggio salvato';

  @override
  String get tripsEmptyBody =>
      'Pianifica il tuo primo viaggio e apparirà qui, pronto da riprendere quando vuoi.';

  @override
  String get tripsDeleteTitle => 'Eliminare il viaggio?';

  @override
  String tripsDeleteBody(String title) {
    return 'Rimuove “$title” dai tuoi viaggi salvati. Operazione irreversibile.';
  }

  @override
  String get tripsDeleted => 'Viaggio eliminato';

  @override
  String get tripsLiveWeather => 'Meteo in diretta';

  @override
  String get tripsNextUp => 'Il prossimo passo';

  @override
  String get tripsSunsetWindow => 'Finestra al tramonto';

  @override
  String get tripsTimelineSnapshot => 'Istantanea della sequenza temporale';

  @override
  String get tripsOpenTimeline => 'Apri la cronologia completa';

  @override
  String get tripsShare => 'Condividi';

  @override
  String get shareItineraryFooter =>
      'Pianificato con Luxora, il tuo compagno della Florida emotivamente intelligente.';

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
  String get detailPrice => 'Prezzo';

  @override
  String get detailLocation => 'Posizione';

  @override
  String get detailGetDirections => 'Indicazioni';

  @override
  String get detailParkMap => 'Mappa del parco';

  @override
  String get detailViewOnMap => 'Vedi sulla mappa';

  @override
  String get detailMapsError =>
      'Impossibile aprire le mappe su questo dispositivo.';

  @override
  String get detailGoogleMaps => 'Google Maps';

  @override
  String get detailAppleMaps => 'Apple Mappe';

  @override
  String get detailOpenInMaps => 'Apri nelle mappe';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time di auto da Orlando';
  }

  @override
  String get detailSaveToItinerary => 'Salva nell’itinerario';

  @override
  String get detailSaved => 'Salvato';

  @override
  String get detailSavedSnack => 'Salvato nel tuo itinerario';

  @override
  String get detailRemovedSnack => 'Rimosso dal tuo itinerario';

  @override
  String get detailSetHomeBase => 'Imposta come base';

  @override
  String get detailHomeBaseActive => 'La base del tuo viaggio';

  @override
  String get detailHomeBaseHint =>
      'Il percorso della tua giornata parte e finisce qui.';

  @override
  String get detailHomeBaseSetSnack => 'Impostato come base del tuo viaggio';

  @override
  String get detailHomeBaseClearedSnack => 'Base rimossa';

  @override
  String get detailMenuTitle => 'Piatti in evidenza';

  @override
  String get detailMenuDisclaimer =>
      'Selezione — menu completo e prezzi possono variare nel locale.';

  @override
  String get detailMenuComingSoon =>
      'Stiamo ancora curando questo menu. Nel frattempo consulta il menu e i prezzi aggiornati online.';

  @override
  String get detailViewMenuOnline => 'Vedi il menu online';

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
  String get onboardStep2Title => 'È ora di sentirsi liberi';

  @override
  String get onboardStep2Subtitle => 'Quando inizia la tua fuga?';

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
  String get onboardPoolside => 'Piscina e relax';

  @override
  String get onboardAdventure => 'Avventura e natura';

  @override
  String get onboardCulture => 'Cultura e visite';

  @override
  String get dayFlowSubtitle =>
      'Una giornata costruita su come vuoi sentirti, non una lista di cose da fare.';

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
      'Inizia con calma: piscina o spa prima che cominci la giornata.';

  @override
  String get dayFlowReasonMorningCalm => 'Un inizio delicato per dare il tono.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Ore di massima energia: la grande avventura mentre sei fresco.';

  @override
  String get dayFlowReasonMiddayCulture =>
      'Visite con la luce migliore del giorno.';

  @override
  String get dayFlowReasonMiddayIcon => 'Il momento clou della giornata.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Relax pomeridiano per ricaricarti.';

  @override
  String get dayFlowReasonAfternoonGem =>
      'Una gemma nascosta lontano dalla folla.';

  @override
  String get dayFlowReasonEveningDining =>
      'Il pasto della giornata: la tua scelta gourmet.';

  @override
  String get dayFlowReasonNightOut => 'Un ultimo bagliore: una serata fuori.';

  @override
  String weatherToday(String place) {
    return 'Adesso a $place';
  }

  @override
  String weatherSunset(String time) {
    return 'Tramonto $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% di probabilità di pioggia: porta una giacca leggera.';
  }

  @override
  String get weatherConditionClear => 'Sereno';

  @override
  String get weatherConditionPartlyCloudy => 'Parzialmente nuvoloso';

  @override
  String get weatherConditionCloudy => 'Nuvoloso';

  @override
  String get weatherConditionFog => 'Nebbia';

  @override
  String get weatherConditionDrizzle => 'Pioviggine';

  @override
  String get weatherConditionRain => 'Pioggia';

  @override
  String get weatherConditionSnow => 'Neve';

  @override
  String get weatherConditionThunder => 'Temporali';

  @override
  String get dayFlowVibeFoodie => 'Gourmet';

  @override
  String get dayFlowVibeNightlife => 'Vita notturna';

  @override
  String get dayFlowVibePoolside => 'Piscina';

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
  String get placeCatHotel => 'Hotel';

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
}
