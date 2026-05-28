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
  String get commonClose => 'Vicino';

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
