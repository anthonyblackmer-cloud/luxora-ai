// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => 'Paramètres';

  @override
  String get appearance => 'Apparence';

  @override
  String get dark_mode => 'Mode sombre';

  @override
  String get light_mode => 'Mode clair';

  @override
  String get language => 'Langue';

  @override
  String get settings_language_picker_note =>
      'Les changements s’appliquent immédiatement.';

  @override
  String get settings_regions_coming_title => 'Pays et villes';

  @override
  String get settings_regions_coming_subtitle =>
      'Hub de départ et packs de villes, bientôt disponibles.';

  @override
  String get commonSoon => 'Bientôt';

  @override
  String get commonContinue => 'Continuer';

  @override
  String get commonNew => 'Nouveau';

  @override
  String get commonRoadmap => 'Feuille de route';

  @override
  String get commonLive => 'En direct';

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get settingsStartOverSubtitle => 'Commencez un nouveau voyage à zéro';

  @override
  String get navConcierge => 'Concierge';

  @override
  String get navTimeline => 'Programme';

  @override
  String get navMap => 'Carte';

  @override
  String get navGems => 'Pépites';

  @override
  String get navFeed => 'Fil';

  @override
  String get navTrips => 'Voyages';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'Concierge';

  @override
  String conciergeTripFeel(String feel) {
    return 'Ambiance du voyage : “$feel”';
  }

  @override
  String get conciergeWelcome =>
      'Bienvenue sur Luxora, votre compagnon floridien émotionnellement intelligent.\n\nChoisissez une suggestion ci-dessous ou décrivez l’émotion que vous voulez créer pendant votre voyage.';

  @override
  String get conciergeQuickPrompts => 'Suggestions rapides';

  @override
  String get conciergeRemembering => 'Mémorisé pour ce voyage';

  @override
  String get conciergeStyleMemory => 'Mémoire de style';

  @override
  String get conciergeInputHint =>
      'Décrivez l’émotion que vous voulez créer pendant votre voyage…';

  @override
  String get conciergeGreetingMorning => 'Bonjour.';

  @override
  String get conciergeGreetingAfternoon => 'Bon après-midi.';

  @override
  String get conciergeGreetingEvening => 'Bonsoir.';

  @override
  String get conciergeWelcomeWarm =>
      'Je suis là pour façonner la Floride selon ce que vous voulez ressentir, pas une liste de sites. De quoi avez-vous envie aujourd’hui ?';

  @override
  String get conciergeRefineStyle => 'Affiner mon style';

  @override
  String get conciergeRecallReturning => 'Bon retour.';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'Je me souviens que vous aimez $prefs.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'Et vous vouliez que ce voyage évoque : « $feel ».';
  }

  @override
  String get conciergePromptRomantic => 'Escapade romantique';

  @override
  String get conciergePromptWellness => 'Pause bien-être';

  @override
  String get conciergePromptFamily => 'Magie en famille';

  @override
  String get conciergePromptHiddenLuxury => 'Luxe discret';

  @override
  String get conciergePromptFoodie => 'Aventure gourmande';

  @override
  String get conciergePromptSoftLuxury => 'Évasion luxe tout en douceur';

  @override
  String get conciergePromptAdventure => 'Mode aventure';

  @override
  String get conciergePromptDisney => 'Disney après la nuit';

  @override
  String get discoverSearchHint => 'Rechercher des destinations…';

  @override
  String get discoverSearchTitle => 'Trouver une destination';

  @override
  String get discoverFromOrlando => 'Depuis Orlando';

  @override
  String get discoverSearchScopeAll =>
      'Recherche dans tout le catalogue de Floride';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'À moins de $radius d’Orlando';
  }

  @override
  String get discoverSearchEmpty =>
      'Aucun résultat dans ce rayon : essayez un nom plus court, élargissez la distance sur Carte ou Fil, ou cherchez “plage”, “Disney” ou “sources”.';

  @override
  String get discoverFilterAll => 'Tout';

  @override
  String get discoverFilterHotels => 'Hôtels';

  @override
  String get discoverFilterRestaurants => 'Restaurants';

  @override
  String get discoverFilterDestinations => 'Destinations';

  @override
  String get discoverPopularInRadius => 'Populaire dans votre rayon';

  @override
  String get discoverTrySearching => 'Essayez une recherche';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count destinations · à moins de $radius d’Orlando';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count destinations · toute la Floride';
  }

  @override
  String get radius25 => '25 mi';

  @override
  String get radius50 => '50 mi';

  @override
  String get radius100 => '100 mi';

  @override
  String get radiusAllFlorida => 'Toute la Floride';

  @override
  String get radiusDesc25 => 'Excursions à la journée autour du cœur d’Orlando';

  @override
  String get radiusDesc50 => 'Sources, escapades côte, Space Coast';

  @override
  String get radiusDesc100 => 'Tampa Bay, Daytona, Golfe plus lointain';

  @override
  String get radiusDescAll => 'Keys, Miami et temps forts de l’État';

  @override
  String get feedBadge => 'DÉCOUVERTE EN DIRECT';

  @override
  String get feedTitle => 'Fil d’expériences';

  @override
  String get feedSubtitle =>
      'Ce qui bouge maintenant : lieux tendance, nouvelles ouvertures, choix de créateurs, itinéraires saisonniers et mises à jour en direct.';

  @override
  String get feedPillTrending => 'Tendance';

  @override
  String get feedPillNewOpenings => 'Nouvelles ouvertures';

  @override
  String get feedPillCreator => 'Choix de créateurs';

  @override
  String get feedPillLive => 'Mises à jour en direct';

  @override
  String get feedMoodPrompt => 'QUE VOULEZ-VOUS RESSENTIR ?';

  @override
  String get feedMoodAll => 'Tout';

  @override
  String get feedMoodRomantic => 'Romantique';

  @override
  String get feedMoodCalm => 'Calme';

  @override
  String get feedMoodAdventurous => 'Aventureux';

  @override
  String get feedMoodPampered => 'Choyé';

  @override
  String get feedMoodSocial => 'Animé';

  @override
  String get feedMoodFoodie => 'Gourmand';

  @override
  String get feedEmptyHint =>
      'Aucune carte dans ce rayon : essayez 50 mi ou Toute la Floride pour la côte du Golfe et les Keys.';

  @override
  String get gemsBadge => 'SÉLECTION D’INITIÉS';

  @override
  String get gemsTitle => 'Pépites cachées';

  @override
  String get gemsSubtitle =>
      'Découvertes secrètes que les locaux protègent : pourquoi c’est spécial, quand y aller, l’affluence et les conseils introuvables sur une carte postale.';

  @override
  String get gemsPillHidden => 'Lieux cachés';

  @override
  String get gemsPillLocal => 'Réservé aux locaux';

  @override
  String get gemsPillInsider => 'Conseils d’initiés';

  @override
  String get gemsPillCrowd => 'Infos affluence';

  @override
  String get gemsEmptyHint =>
      'Pas encore de pépites dans ce rayon : élargissez à 50 mi ou plus pour les sources et les secrets de la Space Coast.';

  @override
  String get gemsSearchHint =>
      'Rechercher des pépites cachées et destinations…';

  @override
  String get gemLocalSecret => 'SECRET LOCAL';

  @override
  String get gemsMatchedBadge => 'Votre style';

  @override
  String gemsMatchedNote(int count) {
    return '$count pépites correspondent à votre style';
  }

  @override
  String get gemWhySpecial => 'Pourquoi c’est spécial';

  @override
  String get gemBestTime => 'Meilleur moment pour y aller';

  @override
  String get gemCrowdLevel => 'Niveau d’affluence';

  @override
  String get gemInsiderTip => 'Conseil d’initié';

  @override
  String get gemLocalNote => 'Note réservée aux locaux';

  @override
  String get mapBadge => 'CARTE IA';

  @override
  String get mapTitle => 'Votre itinéraire intelligent';

  @override
  String get mapSubtitle =>
      'Repères pour votre journée sur mesure : les diamants dorés sont des Pépites, les marqueurs cyan indiquent le programme du jour et la ligne dorée suit l’ambiance.';

  @override
  String get mapPlanDayTitle => 'Planifier ma journée';

  @override
  String get mapPlanDaySuggested =>
      'Suggéré selon l’ambiance de votre voyage — ajoutez des lieux pour le personnaliser.';

  @override
  String get mapPlanDayEmpty =>
      'Ajoutez des destinations (♥) et Luxora crée un itinéraire optimisé depuis votre base d’Orlando : moins de route, plus d’émotion.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count arrêts · $miles · $time de route';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'Départ depuis $hotel';
  }

  @override
  String get mapCrowdLevelQuiet => 'Calme';

  @override
  String get mapCrowdLevelModerate => 'Modéré';

  @override
  String get mapCrowdLevelBusy => 'Animé';

  @override
  String get mapCrowdLevelPacked => 'Très animé';

  @override
  String mapCrowdAtStop(String level) {
    return 'Affluence : $level';
  }

  @override
  String get mapRerouteButton => 'Réorienter vers des arrêts plus calmes';

  @override
  String mapRerouteApplied(int count) {
    return 'Journée ajustée — $count arrêts échangés pour moins de foule.';
  }

  @override
  String get mapRerouteNone => 'Votre itinéraire semble déjà serein.';

  @override
  String get mapRerouteRainHint =>
      'Pluie probable — touchez pour réorienter vers des options couvertes.';

  @override
  String get mapAiPowers => 'Pouvoirs de la carte IA';

  @override
  String get mapNavLayerTitle => 'Couche de navigation IA (prochaine)';

  @override
  String get mapNavLayerSubtitle =>
      'Au-delà de la découverte : une intelligence en direct pour savoir si un arrêt vaut le coup maintenant.';

  @override
  String get mapBookingTitle => 'Réservation fluide (partenaires)';

  @override
  String get mapCapMoodTitle => 'Itinéraires selon l’ambiance';

  @override
  String get mapCapMoodDesc =>
      'Des parcours adaptés au romantique, au bien-être, à la famille ou à l’aventure, pas seulement au trajet le plus court.';

  @override
  String get mapCapDriveTitle => 'Optimisation du temps de route';

  @override
  String get mapCapDriveDesc =>
      'Un enchaînement intelligent pour passer plus de temps à ressentir et moins à attendre dans le trafic.';

  @override
  String get mapCapWeatherTitle => 'Suggestions météo-intelligentes';

  @override
  String get mapCapWeatherDesc =>
      'Plans de repli en cas de pluie et créneaux en direct pour plages, rooftops et sources.';

  @override
  String get mapCapSunsetTitle => 'Meilleur coucher de soleil maintenant';

  @override
  String get mapCapSunsetDesc =>
      'L’endroit où l’heure dorée sera la plus belle dans les 90 prochaines minutes selon le ciel et l’affluence.';

  @override
  String get mapCapCrowdTitle => 'Prévision d’affluence';

  @override
  String get mapCapCrowdDesc =>
      'Quand parcs, sources et spots viraux se calment, avant votre arrivée.';

  @override
  String get mapCapGemsTitle => 'Pépites cachées à proximité';

  @override
  String get mapCapGemsDesc =>
      'Des repères d’initiés proposés le long de votre route, pas seulement les incontournables touristiques.';

  @override
  String get mapCapPersonalTitle => 'Personnalisation de l’itinéraire';

  @override
  String get mapCapPersonalDesc =>
      'Votre ambiance, votre rythme et votre budget redessinent la carte en temps réel.';

  @override
  String get mapFutureCrowdTitle => 'Chaleur d’affluence en direct';

  @override
  String get mapFutureCrowdDesc =>
      'Densité en temps réel aux sources, parcs et rooftops viraux : est-ce que ça vaut le coup maintenant ?';

  @override
  String get mapFutureParkingTitle => 'Difficulté de stationnement';

  @override
  String get mapFutureParkingDesc =>
      'Score de friction avant de vous engager : voiturier, parking ou meilleur point de dépose.';

  @override
  String get mapFutureTrafficTitle => 'Score de friction de conduite';

  @override
  String get mapFutureTrafficDesc =>
      'Itinéraires pondérés par le stress : pas seulement les minutes, mais le ressenti du trajet.';

  @override
  String get mapFutureRerouteTitle => 'Réacheminement spontané';

  @override
  String get mapFutureRerouteDesc =>
      'Météo qui change ou foule soudaine ? Un geste pour remodeler le reste de la journée.';

  @override
  String affiliateReserve(String category) {
    return 'Réserver · $category · partenaire premium (bientôt)';
  }

  @override
  String get affiliateHotels => 'Hôtels et staycations';

  @override
  String get affiliateExperiences => 'Expériences et visites';

  @override
  String get affiliateRestaurants => 'Réservations de restaurants';

  @override
  String get affiliateThemeParks => 'Billets de parcs à thème';

  @override
  String get affiliateDayPasses => 'ResortPass / passes journée';

  @override
  String get affiliateCarRentals => 'Locations de voiture';

  @override
  String get affiliateWellness => 'Réservations bien-être';

  @override
  String get tripsBadge => 'COLLECTIONS';

  @override
  String get tripsTitle => 'Voyages enregistrés';

  @override
  String get tripsSubtitle =>
      'Touchez un voyage pour un aperçu en direct : prochain moment, météo, coucher de soleil et programme.';

  @override
  String get tripsFooter =>
      'Couvertures de voyage du catalogue d’ambiances · synchronisation Supabase Phase 2';

  @override
  String get tripsPlanNew => 'Planifier un nouveau voyage';

  @override
  String get tripsEmptyTitle => 'Aucun voyage enregistré';

  @override
  String get tripsEmptyBody =>
      'Planifiez votre premier voyage et il apparaîtra ici, prêt à être repris à tout moment.';

  @override
  String get tripsDeleteTitle => 'Supprimer le voyage ?';

  @override
  String tripsDeleteBody(String title) {
    return 'Cela retire « $title » de vos voyages enregistrés. Action irréversible.';
  }

  @override
  String get tripsDeleted => 'Voyage supprimé';

  @override
  String get tripsLiveWeather => 'Météo en direct';

  @override
  String get tripsNextUp => 'Ensuite';

  @override
  String get tripsSunsetWindow => 'Fenêtre coucher de soleil';

  @override
  String get tripsTimelineSnapshot => 'Instantané de la chronologie';

  @override
  String get tripsOpenTimeline => 'Ouvrir la chronologie complète';

  @override
  String get tripsShare => 'Partager';

  @override
  String get shareItineraryFooter =>
      'Conçu avec Luxora, votre compagnon de Floride émotionnellement intelligent.';

  @override
  String shareSubject(String title) {
    return 'Mon $title';
  }

  @override
  String get itineraryBadge => 'VOTRE PROGRAMME';

  @override
  String get itineraryTagline =>
      'Chaque moment relié : l’anticipation intégrée, le stress laissé dehors.';

  @override
  String itineraryDayTab(int day, String label) {
    return 'Jour $day · $label';
  }

  @override
  String get detailWhySpecial => 'Pourquoi c’est spécial';

  @override
  String get detailBestTime => 'Meilleur moment pour y aller';

  @override
  String get detailInsiderTips => 'Conseils d’initiés';

  @override
  String get detailReserve => 'Réserver l’expérience';

  @override
  String get detailReserveSoon =>
      'Partenaires de réservation bientôt disponibles.';

  @override
  String get detailNearbyGems => 'Pépites à proximité';

  @override
  String get detailDuration => 'Durée';

  @override
  String get detailPractical => 'Détails pratiques';

  @override
  String get detailCostRange => 'Fourchette de prix';

  @override
  String get detailBestFor => 'Idéal pour';

  @override
  String get detailVibeMatch => 'Match d\'ambiance';

  @override
  String get detailCrowd => 'Affluence';

  @override
  String get detailPrice => 'Prix';

  @override
  String get detailLocation => 'Lieu';

  @override
  String get detailGetDirections => 'Itinéraire';

  @override
  String get detailParkMap => 'Plan du parc';

  @override
  String get detailViewOnMap => 'Voir sur la carte';

  @override
  String get detailMapsError =>
      'Impossible d’ouvrir la carte sur cet appareil.';

  @override
  String get detailGoogleMaps => 'Google Maps';

  @override
  String get detailAppleMaps => 'Plans (Apple)';

  @override
  String get detailOpenInMaps => 'Ouvrir dans une carte';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time de route depuis Orlando';
  }

  @override
  String get detailSaveToItinerary => 'Ajouter à l’itinéraire';

  @override
  String get detailSaved => 'Enregistré';

  @override
  String get detailSavedSnack => 'Ajouté à votre itinéraire';

  @override
  String get detailRemovedSnack => 'Retiré de votre itinéraire';

  @override
  String get detailSetHomeBase => 'Définir comme camp de base';

  @override
  String get detailHomeBaseActive => 'Votre camp de base';

  @override
  String get detailHomeBaseHint =>
      'L’itinéraire de votre journée commence et se termine ici.';

  @override
  String get detailHomeBaseSetSnack =>
      'Défini comme camp de base de votre voyage';

  @override
  String get detailHomeBaseClearedSnack => 'Camp de base supprimé';

  @override
  String get detailMenuTitle => 'Sélection du menu';

  @override
  String get detailMenuDisclaimer =>
      'Sélection — le menu complet et les prix peuvent varier sur place.';

  @override
  String get detailMenuComingSoon =>
      'Nous préparons encore ce menu. En attendant, consultez le menu et les prix à jour en ligne.';

  @override
  String get detailViewMenuOnline => 'Voir le menu en ligne';

  @override
  String get photoClose => 'Fermer';

  @override
  String get photoViewDestination => 'Voir la destination';

  @override
  String get photoBy => 'Photo par';

  @override
  String get photoOn => 'sur';

  @override
  String milesFromOrlando(String distance) {
    return '$distance depuis Orlando';
  }

  @override
  String get landingBadge => 'FLORIDE · MVP ORLANDO';

  @override
  String get landingTitle1 => 'Les vacances';

  @override
  String get landingTitle2 => 'ont déjà commencé.';

  @override
  String get landingSubtitle =>
      'Luxora AI est votre concierge émotionnellement intelligent : pépites cachées, couchers de soleil sur rooftop et moments conçus pour sembler inoubliables avant même de faire vos valises.';

  @override
  String get landingBegin => 'Commencer votre voyage';

  @override
  String get landingTalk => 'Parler à Luxora';

  @override
  String get landingWhy => 'Pourquoi nous construisons cela';

  @override
  String get storyTitle => 'Notre histoire';

  @override
  String get storyHeroBadge => 'CONSTRUIT AVEC INTENTION';

  @override
  String get storyHeroCreator => 'Créateur, Luxora AI';

  @override
  String get storyHeroSubtitle => 'Floride · voyage axé sur l\'émotion';

  @override
  String get storyHeading => 'Pourquoi nous construisons Luxora';

  @override
  String get storyProblemLead =>
      'Nous avons réalisé que planifier un voyage Floride/Orlando est étonnamment fragmenté et écrasant.';

  @override
  String get storyJumpingBetween => 'Les gens sautent généralement entre';

  @override
  String get storyProblemTail =>
      '…et se retrouvent toujours avec des projets touristiques génériques.';

  @override
  String get storyDifferentLead =>
      'Nous voulons construire quelque chose de différent.';

  @override
  String get storyNotPlannerTitle => 'Pas seulement un planificateur de voyage';

  @override
  String get storyNotPlannerBody =>
      'Un compagnon de voyage IA axé sur l\'émotion.';

  @override
  String get storyInsteadOfAsking => 'Au lieu de demander';

  @override
  String get storyAppAsks => 'L\'application demande';

  @override
  String get storyInsteadQuestion => '« Où dois-je aller ?';

  @override
  String get storyFeelQuestion =>
      '« Comment voulez-vous que ce voyage se déroule ? »';

  @override
  String get storyMoodBuildLine =>
      'L’IA construit ensuite une expérience personnalisée autour de cette ambiance.';

  @override
  String get storyFloridaFirstTitle => 'Pourquoi Floride/Orlando d’abord ?';

  @override
  String get storyFloridaFirstLead => 'Orlando est un marché test parfait :';

  @override
  String get storyVisionTitle => 'Notre vision';

  @override
  String get storyVisionLead => 'Combiner:';

  @override
  String get storyVisionCard =>
      'L’application semble donc plus proche d’un concierge IA de luxe – et non d’un autre outil d’itinéraire ennuyeux.';

  @override
  String get storyLongTermTitle => 'Opportunité à long terme';

  @override
  String get storySourceGoogleMaps => 'Google Cartes';

  @override
  String get storySourceTikTok => 'Tik Tok';

  @override
  String get storySourceInstagram => 'Bobines Instagram';

  @override
  String get storySourceTravelBlogs => 'blogs de voyage';

  @override
  String get storySourceRestaurantApps => 'applications de restauration';

  @override
  String get storySourceWeatherApps => 'applications météo';

  @override
  String get storySourceTicketSites => 'sites de billets';

  @override
  String get storySourceTop10 =>
      'Articles aléatoires sur le « top 10 d’Orlando »';

  @override
  String get storyBulletMarket => 'Un immense marché touristique';

  @override
  String get storyBulletAudience =>
      'Familles, couples, voyageurs de luxe et voyageurs bien-être';

  @override
  String get storyBulletOptions =>
      'Une infinité de restaurants, de centres de villégiature, de trésors cachés, de parcs à thème, de sources et de vie nocturne';

  @override
  String get storyBulletRepeat => 'Comportement élevé de visites répétées';

  @override
  String get storyBulletLogisticsGap =>
      'La plupart des applications de voyage se concentrent sur la logistique et non sur la conception d\'expériences';

  @override
  String get storyPillarAiItinerary => 'Génération d\'itinéraire IA';

  @override
  String get storyPillarMoodPlanning =>
      'Planification de voyage basée sur l\'humeur';

  @override
  String get storyPillarLiveDiscovery =>
      'Expériences de découverte et de tendances en direct';

  @override
  String get storyPillarHiddenGems => 'Joyaux locaux cachés';

  @override
  String get storyPillarRouting => 'Routage intelligent';

  @override
  String get storyPillarWeatherSunset =>
      'Intelligence météo et coucher du soleil';

  @override
  String get storyPillarPremiumUx => 'UX esthétique haut de gamme';

  @override
  String get storyOpportunityMultilingual => 'Extension multilingue';

  @override
  String get storyOpportunityAffiliate =>
      'Partenariats d\'affiliation et de réservation';

  @override
  String get storyOpportunityInventory => 'Restaurants, expériences et billets';

  @override
  String get storyOpportunitySubscriptions => 'Abonnements premium';

  @override
  String get storyOpportunityScale =>
      'Évolutif au-delà de la Floride → d\'autres destinations plus tard';

  @override
  String get landingValues => 'Souvenirs · Émotion · Évasion · Connexion';

  @override
  String get landingRegionBadge => 'Région de lancement';

  @override
  String get landingRegionTitle =>
      'Orlando et Floride, sélectionnés pour l’émotion';

  @override
  String get onboardFinish => 'Rencontrez votre concierge';

  @override
  String get onboardStep1Title => 'Là où les rêves atterrissent d’abord';

  @override
  String get onboardStep1Subtitle => 'Où allez-vous ?';

  @override
  String get onboardDestination => 'Destination';

  @override
  String get onboardRegion => 'Région';

  @override
  String get onboardStep2Title => 'Le moment de se sentir libre';

  @override
  String get onboardStep2Subtitle => 'Quand commence votre évasion ?';

  @override
  String get onboardBudget => 'Budget du voyage (USD)';

  @override
  String get onboardStep3Title => 'Qui partage l’histoire';

  @override
  String get onboardStep3Subtitle => 'Qui voyage avec vous ?';

  @override
  String get onboardTravelers => 'Voyageurs';

  @override
  String get onboardStep4Title => 'Votre rythme';

  @override
  String get onboardStep4Subtitle =>
      'Comment vos journées doivent-elles se dérouler ?';

  @override
  String get onboardNightlife => 'Intérêt pour la vie nocturne';

  @override
  String get onboardFoodie => 'Passion gastronomique';

  @override
  String get onboardPoolside => 'Piscine et détente';

  @override
  String get onboardAdventure => 'Aventure et plein air';

  @override
  String get onboardCulture => 'Culture et visites';

  @override
  String get dayFlowSubtitle =>
      'Une journée pensée selon ce que vous voulez ressentir, pas une liste de tâches.';

  @override
  String get dayFlowMorning => 'MATIN';

  @override
  String get dayFlowMidday => 'MIDI';

  @override
  String get dayFlowAfternoon => 'APRÈS-MIDI';

  @override
  String get dayFlowEvening => 'SOIRÉE';

  @override
  String get dayFlowNight => 'NUIT';

  @override
  String get dayFlowReasonMorningPool =>
      'Démarrez en douceur : piscine ou spa avant le début de la journée.';

  @override
  String get dayFlowReasonMorningCalm =>
      'Un début tout en douceur pour donner le ton.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Heures de pleine énergie : la grande aventure tant que vous êtes en forme.';

  @override
  String get dayFlowReasonMiddayCulture =>
      'Visites à la plus belle lumière du jour.';

  @override
  String get dayFlowReasonMiddayIcon => 'Le moment phare de la journée.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Un temps calme l\'après-midi pour recharger.';

  @override
  String get dayFlowReasonAfternoonGem => 'Une pépite cachée loin de la foule.';

  @override
  String get dayFlowReasonEveningDining =>
      'Le repas du jour : votre choix gourmand.';

  @override
  String get dayFlowReasonNightOut =>
      'Une dernière étincelle : une sortie nocturne.';

  @override
  String weatherToday(String place) {
    return 'En ce moment à $place';
  }

  @override
  String weatherSunset(String time) {
    return 'Coucher du soleil $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% de risque de pluie — prévoyez une petite laine.';
  }

  @override
  String get weatherConditionClear => 'Dégagé';

  @override
  String get weatherConditionPartlyCloudy => 'Partiellement nuageux';

  @override
  String get weatherConditionCloudy => 'Nuageux';

  @override
  String get weatherConditionFog => 'Brouillard';

  @override
  String get weatherConditionDrizzle => 'Bruine';

  @override
  String get weatherConditionRain => 'Pluie';

  @override
  String get weatherConditionSnow => 'Neige';

  @override
  String get weatherConditionThunder => 'Orages';

  @override
  String get dayFlowVibeFoodie => 'Gourmand';

  @override
  String get dayFlowVibeNightlife => 'Vie nocturne';

  @override
  String get dayFlowVibePoolside => 'Piscine';

  @override
  String get dayFlowVibeAdventure => 'Aventureux';

  @override
  String get dayFlowVibeCulture => 'Culture';

  @override
  String get onboardStep5Title => 'Le cœur de Luxora';

  @override
  String get onboardStep5Subtitle =>
      'Que voulez-vous RESSENTIR pendant ce voyage ?';

  @override
  String get onboardTripFeelHint =>
      'Dîners au coucher du soleil, matinées lentes, rires avec mon partenaire…';

  @override
  String get moodRomantic => 'Romantique';

  @override
  String get moodRelaxing => 'Relaxant';

  @override
  String get moodAdventurous => 'Aventureux';

  @override
  String get moodLuxurious => 'Luxueux';

  @override
  String get moodFamily => 'Lien familial';

  @override
  String get moodSocial => 'Social';

  @override
  String get moodNature => 'Axé nature';

  @override
  String get moodWellness => 'Retraite bien-être';

  @override
  String get moodFoodie => 'Expérience gourmande';

  @override
  String get catHiddenGems => 'Pépites cachées';

  @override
  String get catLuxuryStay => 'Séjours luxe près de chez soi';

  @override
  String get catBeaches => 'Plages';

  @override
  String get catRooftop => 'Dîner sur rooftop';

  @override
  String get catSpas => 'Spas';

  @override
  String get catNightlife => 'Vie nocturne';

  @override
  String get catFamily => 'Famille';

  @override
  String get catEco => 'Écotourisme';

  @override
  String get catThemeParks => 'Parcs à thème';

  @override
  String get catRomantic => 'Escapades romantiques';

  @override
  String get catFood => 'Expériences culinaires';

  @override
  String get catSprings => 'Sources';

  @override
  String get catIslands => 'D’île en île';

  @override
  String get catInfluencer => 'Parfait pour les créateurs';

  @override
  String get placeCatBeach => 'Plage';

  @override
  String get placeCatDining => 'Restaurant';

  @override
  String get placeCatNature => 'Nature';

  @override
  String get placeCatNightlife => 'Vie nocturne';

  @override
  String get placeCatWellness => 'Bien-être';

  @override
  String get placeCatFamily => 'Famille';

  @override
  String get placeCatSprings => 'Sources';

  @override
  String get placeCatRomantic => 'Romantique';

  @override
  String get placeCatAdventure => 'Aventure';

  @override
  String get placeCatHotel => 'Hôtel';

  @override
  String get styleLessCrowded => 'Moins fréquenté';

  @override
  String get styleLuxurySubtle => 'Luxe sans ostentation';

  @override
  String get styleHiddenLuxury => 'Luxe discret';

  @override
  String get styleWalkable => 'À pied si possible';

  @override
  String get styleSlowMornings => 'Matinées lentes';

  @override
  String get styleNoTraps => 'Pas de pièges à touristes';

  @override
  String get styleNatureHeavy => 'Beaucoup de nature';

  @override
  String get styleNatureWellness => 'Nature et bien-être uniquement';

  @override
  String get styleAestheticDining => 'Restaurants esthétiques';

  @override
  String get styleFamilyEasy => 'Logistique facile en famille';
}
