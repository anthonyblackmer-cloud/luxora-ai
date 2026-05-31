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
  String get settingsThemeIntro =>
      'Cinématographique de luxe ou lisibilité nette : choisissez ce qui convient à votre journée.';

  @override
  String get settingsThemeSectionLuxury => 'Cinématique de luxe';

  @override
  String get settingsThemeSectionReadable => 'Propre et lisible';

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
  String get settingsStartOverSubtitle =>
      'Commencez un nouveau voyage à partir de zéro';

  @override
  String get navConcierge => 'Concierge';

  @override
  String get navAgenda => 'Aujourd\'hui';

  @override
  String get navDiscover => 'Découvrir';

  @override
  String get navMap => 'Carte';

  @override
  String get navTrips => 'Voyages';

  @override
  String get navMore => 'Plus';

  @override
  String get navRestaurants => 'Restaurants';

  @override
  String get navTimeline => 'Programme';

  @override
  String get agendaTabItinerary => 'Jours';

  @override
  String get agendaTabRestaurants => 'Restaurants';

  @override
  String get restaurantsPageTitle => 'Restaurants';

  @override
  String get restaurantsPageSubtitle =>
      'Parcourez les restaurants que Luxora connaît : enregistrez vos favoris ou laissez le concierge choisir le repas de ce soir.';

  @override
  String get restaurantsConciergePick => 'Choisissez un restaurant pour moi';

  @override
  String restaurantsConciergePickDone(String name) {
    return '$name enregistré : demandez au concierge de l\'ajouter à votre voyage.';
  }

  @override
  String restaurantsSavedCount(int count) {
    return '$count enregistrés pour votre voyage';
  }

  @override
  String get restaurantsEmptyHint =>
      'Aucun restaurant dans votre rayon de découverte — élargissez le rayon sur la carte.';

  @override
  String get moreCardRestaurantsSub =>
      'Parcourez les restaurants et laissez le concierge choisir pour vous';

  @override
  String get agendaHotelSuggestionsTitle => 'Où loger';

  @override
  String agendaHotelSuggestionsSubtitle(int budget) {
    return 'Adapté à l\'IA à votre budget de voyage de ~$budget USD : appuyez pour voir toutes les options.';
  }

  @override
  String agendaHotelTopPick(String name) {
    return 'Premier choix : $name';
  }

  @override
  String get agendaStayDropdownHint => 'Sélectionnez un hôtel';

  @override
  String get agendaDiningDropdownHint => 'Sélectionnez un restaurant';

  @override
  String get agendaDaySelectLabel => 'Quel jour';

  @override
  String get agendaDayDiningTitle => 'Où manger ce soir';

  @override
  String agendaDayDiningSubtitle(int budget, String tier) {
    return 'Suggestions pour votre budget de ~$budget USD (repas $tier) basées sur le plan du jour.';
  }

  @override
  String get agendaDiningNearStops => 'Près des arrêts d\'aujourd\'hui';

  @override
  String get agendaDiningFitsBudget => 'Convient à votre budget de voyage';

  @override
  String get agendaDiningMatchesDay =>
      'Correspond à l\'ambiance d\'aujourd\'hui';

  @override
  String get agendaDiningFoodiePick => 'Coup de cœur des gourmets';

  @override
  String get browseCatRecommended => 'Recommandé';

  @override
  String get browseCatDisneyHotels => 'Espace Disney';

  @override
  String get browseCatBudgetFriendly => 'Économique';

  @override
  String get browseCatUpscaleLuxury => 'Haut de gamme et luxe';

  @override
  String get browseCatUniversalHotels => 'Zone universelle';

  @override
  String get browseCatThemeParkDining => 'Restauration dans un parc à thème';

  @override
  String get browseCatUpscaleDining => 'Cuisine haut de gamme et raffinée';

  @override
  String get browseSearchAllHotels =>
      'Recherchez dans le catalogue complet des hôtels…';

  @override
  String get browseSearchAllRestaurants =>
      'Recherchez dans le catalogue complet des restaurants…';

  @override
  String get browseCategoryEmpty =>
      'Aucune correspondance dans cette catégorie pour votre rayon – essayez de rechercher ou d\'élargir la découverte.';

  @override
  String get browseFullCatalogHint =>
      'Utilisez la recherche ci-dessus pour le catalogue complet – tous les hôtels et restaurants que Luxora connaît.';

  @override
  String get agendaPageSubtitle => 'Qu\'est-ce que je fais en ce moment ?';

  @override
  String get navGems => 'Pépites';

  @override
  String get navFeed => 'Fil';

  @override
  String get navTicketSavings => 'Économies';

  @override
  String get navStays => 'Séjours';

  @override
  String get morePageTitle => 'Plus';

  @override
  String get morePageSubtitle =>
      'Outils de voyage, compte et préférences — organisés pour un accès aisé.';

  @override
  String get moreSectionTravelTools => 'OUTILS DE VOYAGE';

  @override
  String get moreSectionAccount => 'COMPTE';

  @override
  String get moreSectionApp => 'APPLICATION';

  @override
  String get moreCardHotelsSub =>
      'Des séjours intelligents adaptés à votre humeur';

  @override
  String get moreCardGemsSub => 'Les locaux gardent les découvertes d\'initiés';

  @override
  String get moreCardTicketsSub =>
      'Comparez les économies des partenaires autorisés';

  @override
  String get moreCardWeatherSub => 'Guidage journalier basé sur les prévisions';

  @override
  String get moreCardProfileTitle => 'Profil de voyage';

  @override
  String get moreCardProfileSub => 'Qui voyage, comment ça devrait se sentir';

  @override
  String get moreCardFavoritesSub =>
      'Destinations que vous avez mises en favoris';

  @override
  String get moreCardNotificationsTitle => 'Notifications';

  @override
  String get moreCardNotificationsSub =>
      'Alertes de voyage et mises à jour du concierge';

  @override
  String get moreCardSettingsSub => 'Thèmes, packs de villes et préférences';

  @override
  String get moreCardAboutSub => 'Pourquoi nous construisons Luxora';

  @override
  String get moreCardHelpSub => 'Guides et conciergerie';

  @override
  String get moreCardCityPacksSub => 'Débloquez les concierges de destination';

  @override
  String get moreCardPartnersSub => 'Expériences partenaires en vedette';

  @override
  String get moreCardItinerarySub => 'Votre évasion dorée au quotidien';

  @override
  String get moreCardDiscoverSub =>
      'Restaurants tendance, expériences et découvertes en direct';

  @override
  String get savedFavoritesTitle => 'Favoris enregistrés';

  @override
  String get savedFavoritesEmpty =>
      'Ajoutez des destinations à vos favoris sur la carte ou le flux : elles apparaîtront ici.';

  @override
  String get helpCenterTitle => 'Centre d\'aide';

  @override
  String get helpCenterBody =>
      'Envoyez un e-mail à support@luxora.ai pour obtenir de l\'aide du concierge. Des guides intégrés à l\'application seront bientôt disponibles.';

  @override
  String get notificationsComingSoon =>
      'Les notifications de voyage arriveront dans une prochaine mise à jour.';

  @override
  String get partnerOffersTitle => 'Offres partenaires';

  @override
  String get ticketSavingsTitle => 'Économies intelligentes sur les billets';

  @override
  String get ticketSavingsBadgeLabel => 'ÉCONOMIES DE PRIMES';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora présente des revendeurs agréés, des offres groupées et des promotions afin que vous vous sentiez comme un conseiller en luxe et non comme un site de coupons.';

  @override
  String ticketSavingsBadge(int percent) {
    return 'ÉCONOMISEZ $percent %';
  }

  @override
  String get ticketOfficialPrice => 'Officiel';

  @override
  String get ticketDiscountPrice => 'Prix ​​​​de Louxora';

  @override
  String ticketSaveAmount(String amount) {
    return 'Économisez $amount';
  }

  @override
  String get ticketSaveAmountLabel => 'Économies';

  @override
  String ticketSavePerTicket(String amount) {
    return 'Vous pourriez économiser $amount par billet.';
  }

  @override
  String ticketFamilySave(String amount) {
    return 'Économies familiales estimées : $amount.';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return 'Économies familiales estimées : $amount.';
  }

  @override
  String ticketSource(String source) {
    return 'Source : $source';
  }

  @override
  String ticketExpires(String date) {
    return 'Offre jusqu\'au $date';
  }

  @override
  String get ticketBetterOption => 'Luxora a trouvé une meilleure option.';

  @override
  String get ticketOverpaying =>
      'Vous payez peut-être trop cher au prix d\'entrée.';

  @override
  String get ticketRecommendedSavings => 'Économies recommandées disponibles';

  @override
  String get ticketCalculatorTitle => 'Économies potentielles';

  @override
  String get ticketFilterLabel => 'Filtre';

  @override
  String get ticketFilterAll => 'Tous';

  @override
  String get ticketFilterThemeParks => 'Parcs à thème';

  @override
  String get ticketFilterAttractions => 'Attractions';

  @override
  String get ticketFilterTours => 'Visites';

  @override
  String get ticketFilterDining => 'Expériences culinaires';

  @override
  String get ticketFilterWaterParks => 'Parcs aquatiques';

  @override
  String get ticketFilterFamily => 'Activités familiales';

  @override
  String get ticketFilterEntertainment => 'Divertissement';

  @override
  String get ticketSortLabel => 'Trier par';

  @override
  String get ticketSortHighestSavings => 'Économies les plus élevées';

  @override
  String get ticketSortMostPopular => 'Le plus populaire';

  @override
  String get ticketSortFamilyFriendly => 'Familial';

  @override
  String get ticketSortLuxury => 'Expériences de luxe';

  @override
  String get ticketSortClosest => 'Le plus proche de moi';

  @override
  String get ticketDealsSectionTitle => 'Offres autorisées';

  @override
  String ticketDealsPricesAsOf(String date) {
    return 'Prix ​​au $date';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'Impossible d\'actualiser les prix (affichage des offres mises en cache).';

  @override
  String get ticketDealsUpdating => 'Mise à jour des prix…';

  @override
  String get ticketNoDeals =>
      'Aucune offre dans ce filtre – essayez une autre catégorie.';

  @override
  String get ticketConfidenceHigh => 'Confiance élevée';

  @override
  String get ticketConfidenceVerified => 'Revendeur vérifié';

  @override
  String get ticketConfidenceLimited => 'Durée limitée';

  @override
  String get ticketAiInsightTitle => 'Recommandation Louxora';

  @override
  String get ticketInsightDisneyPass =>
      'En fonction de votre itinéraire, un pass Walt Disney World de 3 jours au lieu de billets d\'une journée pourrait permettre à votre famille d\'économiser environ 120 USD.';

  @override
  String get ticketInsightUniversalCombo =>
      'Votre forfait inclut Universal – un billet pour 2 parcs vaut mieux acheter des jours séparément pour la plupart des familles.';

  @override
  String get ticketInsightSeaworldCombo =>
      'SeaWorld sur votre itinéraire — le combo Aquatica bat souvent deux entrées distinctes.';

  @override
  String get ticketInsightGeneric =>
      'Luxora a assorti les économies aux arrêts de votre itinéraire - comparez avant d\'acheter à la porte.';

  @override
  String get ticketInsightMiamiCulture =>
      'La culture s\'arrête sur votre forfait – Les offres des partenaires Vizcaya et PAMM pourraient battre les prix d\'entrée cette semaine.';

  @override
  String get ticketInsightMiamiEverglades =>
      'Journée dans les Everglades sur votre itinéraire : les créneaux horaires des hydroglisseurs du matin sont souvent moins chers en milieu de semaine.';

  @override
  String get ticketInsightMiamiWynwood =>
      'Wynwood sur votre itinéraire : une promenade artistique guidée peut battre le prix d\'un stand sans rendez-vous.';

  @override
  String get ticketItineraryMatchTitle => 'Chèque d\'épargne itinéraire';

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
  String get conciergeGreetingEvening => 'Bonne soirée.';

  @override
  String get conciergeWelcomeWarm =>
      'Je suis ici pour façonner la Floride en fonction de ce que vous souhaitez ressentir – et non d\'une liste de sites touristiques. De quoi as-tu envie aujourd’hui ?';

  @override
  String get conciergeRefineStyle => 'Affiner mon style';

  @override
  String get conciergeRecallReturning => 'Content de te revoir.';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'Je me souviens que tu aimais $prefs.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'Et vous vouliez que ce voyage ressente : « $feel ».';
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
  String discoverFromHub(String hub) {
    return 'Depuis $hub';
  }

  @override
  String get discoverSearchScopeAll =>
      'Recherche dans tout le catalogue de Floride';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'À moins de $radius d’Orlando';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return 'Dans $radius de $hub';
  }

  @override
  String get discoverSearchEmpty =>
      'Aucun résultat dans ce rayon : essayez un nom plus court, élargissez la distance sur Carte ou Fil, ou cherchez “plage”, “Disney” ou “sources”.';

  @override
  String get discoverFilterAll => 'Tous';

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
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$count destinations · dans un rayon de $radius autour de $hub';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count destinations · toute la Floride';
  }

  @override
  String get radius25 => '25 km';

  @override
  String get radius50 => '50 milles';

  @override
  String get radius100 => '100 milles';

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
  String get radiusDesc25Miami =>
      'South Beach, Brickell et les quartiers centraux';

  @override
  String get radiusDesc50Miami => 'Wynwood, Coconut Grove, Key Biscayne';

  @override
  String get radiusDesc100Miami =>
      'Everglades, Fort Lauderdale, plus profond du sud de la Floride';

  @override
  String get radiusDescAllMiami =>
      'Sentier des Florida Keys et points forts de l\'État';

  @override
  String get radiusDesc25Keys =>
      'Key Largo, Islamorada et couloir supérieur du récif';

  @override
  String get radiusDesc50Keys => 'Plages de Marathon, Big Pine et Middle Keys';

  @override
  String get radiusDesc100Keys =>
      'Autoroute d\'outre-mer complète traversant Key West';

  @override
  String get radiusDescAllKeys =>
      'Chaîne d\'îles entière et eaux d\'excursion d\'une journée';

  @override
  String get feedBadge => 'DÉCOUVERTE EN DIRECT';

  @override
  String get feedTitle => 'Fil d’expériences';

  @override
  String get feedSubtitle =>
      'Ce qui bouge maintenant : lieux tendance, nouvelles ouvertures, choix de créateurs, itinéraires saisonniers et mises à jour en direct.';

  @override
  String get feedSubtitleFamily =>
      'Des choix familiaux pour votre équipe : des parcs, des victoires faciles et des moments inoubliables avec les enfants (et les parents).';

  @override
  String get feedPillTrending => 'Tendance';

  @override
  String get feedPillNewOpenings => 'Nouvelles ouvertures';

  @override
  String get feedPillCreator => 'Choix de créateurs';

  @override
  String get feedPillLive => 'Mises à jour en direct';

  @override
  String get feedMoodPrompt => 'COMMENT VOULEZ-VOUS VOUS SENTIR ?';

  @override
  String get feedMoodPromptFamily =>
      'QUE DEVRAIT SE SENTIR AUJOURD’HUI POUR VOTRE ÉQUIPAGE ?';

  @override
  String get feedMoodAll => 'Tout';

  @override
  String get feedMoodFamily => 'Magie familiale';

  @override
  String get feedMoodRomantic => 'Romantique';

  @override
  String get feedMoodCalm => 'Calme';

  @override
  String get feedMoodAdventurous => 'Aventureux';

  @override
  String get feedMoodPampered => 'Choyé';

  @override
  String get feedMoodSocial => 'Bourdonnement';

  @override
  String get feedMoodFoodie => 'Fin gourmet';

  @override
  String get feedFamilyMoodHint =>
      'Parcs à thème, repas de personnages et gains faciles pour les parents – filtrés pour les balises familiales.';

  @override
  String get feedEmptyHint =>
      'Aucune carte dans ce rayon : essayez 50 mi ou Toute la Floride pour la côte du Golfe et les Keys.';

  @override
  String get feedEmptyHintFamily =>
      'Aucune carte familiale dans ce rayon : essayez Aventureux ou Tout, ou élargissez le rayon.';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gemmes correspondent à votre style',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
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
      'Suggéré en fonction de votre humeur de voyage : ajoutez des lieux à vos favoris pour en faire le vôtre.';

  @override
  String get mapPlanDayEmpty =>
      'Ajoutez des destinations (♥) et Luxora crée un itinéraire optimisé à partir de votre hub d\'Orlando : moins de conduite, plus de sensations.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count arrêts · $miles · $time trajet';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'À partir de $hotel';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '$time trajet · $miles depuis l\'arrêt précédent';
  }

  @override
  String get mapCrowdLevelQuiet => 'Calme';

  @override
  String get mapCrowdLevelModerate => 'Modéré';

  @override
  String get mapCrowdLevelBusy => 'Occupé';

  @override
  String get mapCrowdLevelPacked => 'Emballé';

  @override
  String mapCrowdAtStop(String level) {
    return 'Foule : $level';
  }

  @override
  String get mapParkingLevelEasy => 'Facile';

  @override
  String get mapParkingLevelModerate => 'Modéré';

  @override
  String get mapParkingLevelDifficult => 'Difficile';

  @override
  String get mapParkingLevelLimited => 'Limité · arriver tôt';

  @override
  String mapParkingAtStop(String level) {
    return 'Stationnement : $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'Frottement d\'entraînement : $score/90';
  }

  @override
  String get mapRerouteButton => 'Réacheminer vers des arrêts plus calmes';

  @override
  String mapRerouteApplied(int count) {
    return 'Jour ajusté – $count arrêts remplacés par des foules plus légères.';
  }

  @override
  String get mapRerouteNone => 'Votre itinéraire s\'annonce déjà calme.';

  @override
  String get mapRerouteRainHint =>
      'Ne vous inquiétez pas — j\'ai déjà trouvé des alternatives à proximité pour que votre journée reste agréable et sans stress.';

  @override
  String get dayFlowSwapTitle => 'Changer cet arrêt';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'Dites à Luxora ce que vous préférez faire au lieu de $current.';
  }

  @override
  String get dayFlowSwapTemplate => 'Je pensais plutôt à quelque chose comme…';

  @override
  String get dayFlowSwapHint =>
      'par ex. un parc tranquille ce matin, ou des fruits de mer pour le dîner';

  @override
  String get dayFlowSwapApply => 'Mettre à jour ma journée';

  @override
  String get dayFlowSwapViewPlace => 'Afficher l\'arrêt actuel';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return 'Mise à jour : $newStop est désormais votre arrêt $phase.';
  }

  @override
  String get dayFlowSwapNoMatch =>
      'Impossible de trouver une correspondance à proximité : essayez d\'être plus précis.';

  @override
  String get dayFlowSwapTapToChange => 'Changer cet arrêt';

  @override
  String get dayFlowSwapHoldSpeak => 'Attends pour parler';

  @override
  String get dayFlowSwapListening => 'Écoute…';

  @override
  String get rightNowButton => 'Que devrions-nous faire maintenant ?';

  @override
  String get rightNowEmpty =>
      'Pas encore de moment fort dans votre rayon – élargissez votre découverte ou ajoutez quelques favoris à vos favoris.';

  @override
  String get rightNowResultTitle => 'TOUT DE SUITE';

  @override
  String get rightNowTapForDetails => 'Appuyez pour plus de détails';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return 'Vous êtes à $minutes minutes de $district. Le temps est parfait : prenez un café à $place, puis promenez-vous dans $walkArea avant l\'arrivée des foules ($crowd foules).';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return 'Vous êtes à $minutes minutes de $district. Le ciel est superbe : dirigez-vous vers $place alors que les foules sont encore $crowd.';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return 'L\'heure dorée approche : partez dans environ $minutes minutes pour $place ($crowd au coucher du soleil).';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return 'Pluie sur le radar – $minutes minutes jusqu\'à un choix confortable à l\'intérieur : $place.';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return 'Calme de la fenêtre de sieste – $minutes minutes pour une réinitialisation familiale facile à $place.';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return 'Énergie du soir – $minutes minutes à $place avant le rush.';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return 'Fenêtre silencieuse : $minutes minutes avant $place ($crowd en ce moment).';
  }

  @override
  String get goldenHourTitle => 'Heure d\'or';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return 'Partez avant $time ($minutes min de route) pour $place : arrivez environ 15 minutes avant le coucher du soleil.';
  }

  @override
  String get goldenHourKindBeach => 'Fenêtre coucher de soleil sur la plage';

  @override
  String get goldenHourKindRooftop => 'Heure dorée sur les toits';

  @override
  String get goldenHourKindScenic => 'Calendrier de photographie panoramique';

  @override
  String get vacationScoreTitle => 'Score de vacances';

  @override
  String vacationScoreSubtitle(int score) {
    return 'Aujourd’hui, c’est comme une journée de type $score/100.';
  }

  @override
  String get onboardOccasionLabel => 'Quelle est l\'occasion ?';

  @override
  String get onboardThemeParksOccasionHint =>
      'Débloquez Disney et Universal pour ajouter des événements dans des parcs à thème ci-dessous – vous verrez ces jetons juste après l\'achat.';

  @override
  String get occasionGeneral => 'Je viens d\'explorer';

  @override
  String get occasionAnniversary => 'Anniversaire';

  @override
  String get occasionHoneymoon => 'Lune de miel';

  @override
  String get occasionDateNight => 'Soirée de rendez-vous';

  @override
  String get occasionProposal => 'Voyage de proposition';

  @override
  String get occasionFamily => 'Famille avec enfants';

  @override
  String get occasionDisneyAdventure => 'Aventure Disney';

  @override
  String get occasionUniversalAdventure => 'Aventure universelle';

  @override
  String get localSecretTitle => 'Secret local';

  @override
  String get localSecretWinterParkParkAvenue =>
      'Les habitants se dirigent vers la cour de la ruelle derrière la librairie – aucun panneau de signalisation.';

  @override
  String get localSecretWorldFoodTrucks =>
      'Commandez la prise quotidienne, pas le hamburger : la file d\'attente se déplace plus rapidement à la fenêtre la plus éloignée.';

  @override
  String get localSecretWekiwaSprings =>
      'Évitez la promenade principale après 14 heures : le début du sentier nord reste calme.';

  @override
  String get localSecretDisneySpringsParking =>
      'Le meilleur parking est le garage orange – marchez du côté de la marina, pas du côté de l’entrée principale.';

  @override
  String get localSecretLakeEolaSunset =>
      'Faites face au côté amphithéâtre pour prendre des photos de cygnes alors que le ciel devient doré.';

  @override
  String get localSecretMiamiWynwoodAlley =>
      'Parcourez l\'allée de chargement derrière Panther Coffee - les habitants réalisent des peintures murales sans la foule principale.';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      'Achetez d\'abord un cafécito au chariot de la fenêtre - les habitués du banc secondaire s\'ouvrent lorsque vous tenez un cortadito.';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      'Évitez la ruée sur la terrasse principale : entrez par le jardin est et parcourez la promenade de la mangrove dans le sens inverse des aiguilles d\'une montre.';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      'Faites face à l’est à 7 heures du matin sur Lummus – les pastels art déco brillent avant l’arrivée de la foule du brunch.';

  @override
  String get localSecretMiamiPantherAlley =>
      'Commandez à la fenêtre, parcourez l\'allée dans le sens des aiguilles d\'une montre – la meilleure lumière murale frappe le mur turquoise à 8h45.';

  @override
  String get localSecretTampaBayRiverwalkParking =>
      'Garage Whiting Street — marchez vers le sud le long de la rivière pour éviter les fermetures près du quai.';

  @override
  String get localSecretTampaBayClearwaterSunset =>
      'Évitez la foule du Pier 60 — approche Sand Key au nord 40 min avant le coucher du soleil.';

  @override
  String get localSecretTampaBayDaliGarden =>
      'Réservez la dernière entrée de l\'après-midi — le jardin est capture la lumière du pont sans foule.';

  @override
  String get localSecretTampaBayPierTiming =>
      'Entrée du môle en semaine à 16 h — coucher de soleil sans poussettes du week-end.';

  @override
  String get localSecretTampaBayYborCourtyard =>
      'Sandwichs cubains à emporter — cour intérieure en briques que les locaux utilisent après 20 h.';

  @override
  String get localSecretTampaBaySpongeDocks =>
      'Déjeuner au quai d\'abord, bateaux éponges ensuite — groupes plus calmes en semaine après 13 h.';

  @override
  String get localSecretVegasBellagioFountains =>
      'Placez-vous au centre de la pelouse 15 min avant — la rambarde bloque la chorégraphie.';

  @override
  String get localSecretVegasFremontTiming =>
      'En semaine 21 h sous la canopée — boucle Viva Vision complète sans foule du samedi.';

  @override
  String get localSecretVegasCaesarsEntrance =>
      'Passerelle du parking — évitez l\'embouteillage du Strip à l\'heure du dîner.';

  @override
  String get localSecretVegasVenetianWalk =>
      'Promenade canal couverte à midi — traversez le Strip climatisé sans chaleur extrême.';

  @override
  String get nycMoodRoutesTitle => 'Parcours d\'ambiance New York';

  @override
  String get localSecretNycTimesSquareStrategy =>
      'Entrez par les rues latérales de la 7e Ave — évitez la foule du carrefour, gardez Broadway en vue.';

  @override
  String get localSecretNycObservationDeck =>
      'Réservez le dernier créneau avant le coucher du soleil — lumière dorée sans file de midi.';

  @override
  String get localSecretNycCentralParkEntrance =>
      'Traverse de la 72e rue — accès plus rapide à Bethesda sans foule de Columbus Circle.';

  @override
  String get localSecretNycBroadwayTickets =>
      'La file matinale TKTS ouvre tôt — places rush meilleures que les tarifs touristiques.';

  @override
  String get localSecretNycBrooklynBridgePhoto =>
      'Washington Street DUMBO à 8 h — cadre pavé vide avant les groupes touristiques.';

  @override
  String get localSecretNycFerryGoldenHour =>
      'Ferry Staten Island au coucher du soleil — boucle du port gratuite sans bateau touristique.';

  @override
  String get momentsTitle => 'MOMENTS LUXORA';

  @override
  String get momentsSubtitle => 'Recherchez un sentiment – ​​pas un lieu.';

  @override
  String get momentFeelRelaxed => 'Sentez-vous détendu';

  @override
  String get momentImpressSpouse => 'Impressionner mon conjoint';

  @override
  String get momentPerfectSunset => 'Coucher de soleil parfait';

  @override
  String get momentFamilyMemory => 'Mémoire de famille';

  @override
  String get momentLuxuryValue => 'Le luxe sans dépenses excessives';

  @override
  String get momentPromptRelaxed =>
      'Je veux me sentir complètement détendu pendant les prochaines heures – lent, beau, pas de foule.';

  @override
  String get momentPromptImpressSpouse =>
      'Je veux impressionner mon conjoint avec quelque chose de romantique et d\'inattendu ce soir.';

  @override
  String get momentPromptPerfectSunset =>
      'Je veux le moment parfait du coucher de soleil en Floride : où devrions-nous être et quand devrions-nous partir ?';

  @override
  String get momentPromptFamilyMemory =>
      'Je veux un moment familial mémorable, facile pour les parents et magique pour les enfants.';

  @override
  String get momentPromptLuxuryValue =>
      'Je veux un luxe spécial sans dépenser une fortune.';

  @override
  String get visualShareImageButton => 'Partager la fiche image';

  @override
  String get tripStoryTitle => 'Le récit de votre voyage';

  @override
  String tripStoryHeading(String title) {
    return '$title — votre histoire en Floride';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return 'Vous êtes venu pour $moods.';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return 'Ce chapitre : $title.';
  }

  @override
  String get tripStoryBeatClosing =>
      'Luxora a façonné les moments – vous les avez vécus.';

  @override
  String get tripsOpenStory => 'Votre histoire';

  @override
  String get conciergeVoiceHold => 'Attends pour parler';

  @override
  String get conciergeVoiceSoon =>
      'Le concierge vocal sera bientôt disponible : pour l\'instant, appuyez sur un instant ou saisissez ce que vous souhaitez ressentir.';

  @override
  String get conciergeVoiceListening => 'Luxora écoute…';

  @override
  String get conciergeVoiceSpeaking => 'Louxora parle…';

  @override
  String get conciergeVoiceRelease => 'Libérer pour envoyer';

  @override
  String get conciergeVoiceSend => 'Envoyer à Louxora';

  @override
  String get conciergeVoiceProcessing => 'Envoi à Louxora…';

  @override
  String get conciergeVoiceNoSpeech =>
      'Je n\'ai pas compris : maintenez le bouton enfoncé, parlez, puis relâchez.';

  @override
  String get conciergeVoicePreviewFailed =>
      'Impossible de lire un aperçu. Vérifiez votre volume et réessayez.';

  @override
  String get conciergeVoiceUnavailable =>
      'La voix n\'est pas disponible sur cet appareil.';

  @override
  String get conciergeVoiceSettingsTitle => 'Voix de Louxora';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Choisissez le son de Luxora lorsqu\'elle parle : accent, ton et rythme. Utilise les voix intégrées de votre appareil.';

  @override
  String get conciergeVoiceRateLabel => 'Rythme de parole';

  @override
  String get conciergeVoiceRateSlow => 'Lent';

  @override
  String get conciergeVoiceRateNatural => 'Naturel';

  @override
  String get conciergeVoiceRateFast => 'Rapide';

  @override
  String get conciergeVoicePreview => 'Aperçu de la voix';

  @override
  String get conciergeVoicePreviewSample =>
      'Bonjour, je m\'appelle Luxora. Dites-moi ce que vous voulez ressentir lors de ce voyage.';

  @override
  String get conciergeVoiceDeviceNote =>
      'Téléchargez plus de voix dans Paramètres iPhone → Accessibilité → Contenu parlé → Voix. Revenez ici et appuyez sur Actualiser.';

  @override
  String get conciergeVoiceDeviceSection => 'Voix sur cet iPhone';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'Inclut les voix que vous avez téléchargées : appuyez sur une pour l\'utiliser pour Luxora.';

  @override
  String get conciergeVoiceRefreshList => 'Actualiser la liste vocale';

  @override
  String get conciergeVoiceShowAllLanguages => 'Afficher toutes les langues';

  @override
  String get conciergeVoiceOpenSettings =>
      'Ouvrez les paramètres vocaux de l\'iPhone';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'Aucune voix trouvée : téléchargez les packs dans Paramètres, puis actualisez.';

  @override
  String get conciergeVoicePresetSection => 'Personnages rapides';

  @override
  String get conciergeVoiceRegionRecommended => 'Recommandé';

  @override
  String get conciergeVoiceRegionEnglish => 'Anglais';

  @override
  String get conciergeVoiceRegionRussian => 'russe';

  @override
  String get conciergeVoiceRegionSpanish => 'Espagnol';

  @override
  String get conciergeVoiceRegionFrench => 'Français';

  @override
  String get conciergeVoiceRegionGerman => 'Allemand';

  @override
  String get conciergeVoiceRegionOther => 'Autre';

  @override
  String get conciergeVoicePresetMatchApp =>
      'Langue de l\'application de correspondance · Femme';

  @override
  String get conciergeVoicePresetEnUsF => 'Américain · Femme';

  @override
  String get conciergeVoicePresetEnUsM => 'Américain · Homme';

  @override
  String get conciergeVoicePresetEnGbF => 'Britannique · Femme';

  @override
  String get conciergeVoicePresetEnGbM => 'Britannique · Homme';

  @override
  String get conciergeVoicePresetRuF => 'Russe · Femme';

  @override
  String get conciergeVoicePresetRuM => 'Russe · Homme';

  @override
  String get conciergeVoicePresetEsF => 'Espagnol · Femme';

  @override
  String get conciergeVoicePresetEsM => 'Espagnol · Homme';

  @override
  String get conciergeVoicePresetFrF => 'Français · Femme';

  @override
  String get conciergeVoicePresetFrM => 'Français · Homme';

  @override
  String get conciergeVoicePresetDeF => 'Allemand · Femme';

  @override
  String get conciergeVoicePresetDeM => 'Allemand · Homme';

  @override
  String get conciergeThinking => 'Luxora réfléchit…';

  @override
  String get conciergeItinerarySynced =>
      'J\'ai ajouté cela à votre agenda : mêmes arrêts sur la carte, prêts à être partagés.';

  @override
  String get conciergeAgendaUpdatedSnack =>
      'Votre agenda est prêt sur Map and Agenda';

  @override
  String get conciergeAgendaSyncFailed =>
      'La carte et l\'agenda n\'ont pas été mis à jour. Essayez une demande claire, par exemple : planifiez un voyage Disney et Universal de 4 jours.';

  @override
  String get conciergeViewAgendaOnMap => 'Voir l\'ordre du jour';

  @override
  String get conciergeAgendaDealsIntro =>
      'J\'ai fait correspondre les offres de billets autorisées aux arrêts de votre agenda — comparez avant d\'acheter à la porte :';

  @override
  String get conciergeAgendaDealsSnack =>
      'Offres de billets adaptées à votre agenda';

  @override
  String get conciergeViewTicketDeals => 'Voir les offres';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · est. économiser $amount via $source';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return '$count arrêts inscrits à votre agenda proposent des offres partenaires : comparez les offres autorisées avant d\'acheter à la porte.';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return 'HNE. épargne familiale · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals =>
      'Parcourir les offres pour votre agenda →';

  @override
  String get conciergeFreshThread =>
      'Votre agenda est sur Carte et Agenda. J\'ai archivé cette discussion et j\'ai recommencé : modifiez la journée, trouvez des offres ou demandez quelque chose de nouveau.';

  @override
  String get conciergeThreadArchivedSnack =>
      'Chat archivé – nouveau fil de discussion démarré';

  @override
  String get conciergeNewConversationTooltip => 'Nouvelle conversation';

  @override
  String get itinerarySameAsMapAgenda =>
      'Le plan de conciergerie du jour — également épinglé sur la carte. Partagez la carte du jour ci-dessous.';

  @override
  String get conciergeTicketsFoundIntro =>
      'J\'ai trouvé des offres de billets autorisées pour votre voyage – appuyez sur Réserver des billets sur Agenda pour accéder aux liens directs :';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title : $price via $source (économisez $savings)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'Chaque arrêt correspondant sur Agenda dispose désormais d\'un bouton Réserver des billets avec le lien revendeur.';

  @override
  String itineraryBookTickets(String amount) {
    return 'Réservez des billets · Économisez $amount';
  }

  @override
  String get itineraryOpenTicketDeal => 'Réserver des billets';

  @override
  String conciergeTripSaved(String title) {
    return '« $title » enregistré dans vos voyages : ouvrez l\'onglet Voyages à tout moment pour y revenir.';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return '« $title » enregistré avec $count expériences sur votre chronologie.';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return 'Vous avez $count voyages enregistrés :';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title ($dates) – $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      'Vous n\'avez pas encore enregistré de voyage : demandez-moi de planifier quelque chose, puis dites \"enregistrer mon voyage\".';

  @override
  String get conciergeSavedTripsHint =>
      'Ouvrez l\'onglet Voyages pour afficher les cartes, partager ou modifier des dates.';

  @override
  String get conciergeAiError =>
      'Je ne pouvais pas atteindre Luxora pour le moment. Vérifiez votre connexion et réessayez.';

  @override
  String get conciergeAiErrorVoice =>
      'Désolé, je n\'ai pas pu me connecter au concierge de Luxora pour le moment.';

  @override
  String get conciergeAiNotConfigured =>
      'Le concierge en direct de Luxora n\'est pas encore connecté à cette version : l\'URL Supabase et la clé anonyme doivent être intégrées à l\'application et la fonction Edge déployée. La carte et l\'itinéraire fonctionnent toujours ; voir docs/CONCIERGE_AI.md pour la configuration.';

  @override
  String get conciergeAiOpenAiNotReady =>
      'Luxora vous a entendu, mais le cerveau du concierge n\'est pas encore en ligne. Définissez OPENAI_API_KEY dans les secrets Supabase pour la fonction Edge (processeur lumineux), puis réessayez.';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'Luxora n\'a pas trouvé la fonction de conciergerie \"$function\". Déployez-le dans Supabase ou corrigez SUPABASE_CONCIERGE_FUNCTION sur cette version.';
  }

  @override
  String get conciergeAiAuthFailed =>
      'Luxora n\'a pas pu s\'authentifier auprès de Supabase : vérifiez que SUPABASE_ANON_KEY correspond à votre projet.';

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
  String get tripsEmptyTitle => 'Aucun voyage enregistré pour l\'instant';

  @override
  String get tripsEmptyBody =>
      'Planifiez votre premier voyage et il apparaîtra ici, prêt à être revisité à tout moment.';

  @override
  String get tripsDeleteTitle => 'Supprimer le voyage ?';

  @override
  String tripsDeleteBody(String title) {
    return 'Cela supprime « $title » de vos voyages enregistrés. Cela ne peut pas être annulé.';
  }

  @override
  String get tripsDeleted => 'Voyage supprimé';

  @override
  String get tripsEditDates => 'Dates du voyage';

  @override
  String get tripsSaveDates => 'Enregistrer les dates';

  @override
  String get tripsDatesUpdated => 'Dates de voyage mises à jour';

  @override
  String get tripsDatesFlexible => 'Dates flexibles';

  @override
  String get tripsLiveWeather => 'Météo en direct';

  @override
  String get tripsNextUp => 'Ensuite';

  @override
  String get tripsSunsetWindow => 'Fenêtre coucher de soleil';

  @override
  String get tripsTimelineSnapshot => 'Instantané de la chronologie';

  @override
  String get tripsOpenAgenda => 'Ouvrir l\'agenda complet';

  @override
  String get tripsOpenTimeline => 'Ouvrir la chronologie complète';

  @override
  String get tripsShare => 'Partager';

  @override
  String get shareItineraryFooter =>
      'Prévu avec Luxora, votre compagnon de Floride émotionnellement intelligent.';

  @override
  String get shareCardCta => 'Planifiez le vôtre à Louxora';

  @override
  String get shareCardDownloadHint =>
      'Gratuit sur iOS et Android · luxora.ai/download';

  @override
  String shareCardShareMessage(String title, String url) {
    return '$title\n\nPlanifié avec Luxora AI : un voyage émotionnellement intelligent en Floride.\nTélécharger l\'application : $url';
  }

  @override
  String get conciergeLocalTryPlanning =>
      'Dites-moi comment vous souhaitez ressentir le voyage, par ex. \"Planifiez un voyage détendu de 2 jours à Orlando avec des sources et de la nourriture.\" Je créerai un véritable agenda sur votre appareil (aucun cloud requis).';

  @override
  String conciergeLocalPlanBuilt(String city, int count) {
    return 'J\'ai construit votre journée en $city – $count arrêts séquencés en fonction de votre humeur et de la durée de votre trajet. Ouvrez l\'Agenda ou la Carte pour voir votre itinéraire.';
  }

  @override
  String get conciergeLocalNoIntent =>
      'Décrivez le sentiment que vous souhaitez – ou dites « Planifier ma journée à Orlando » – et je créerai un véritable itinéraire sur l\'appareil.';

  @override
  String get ticketConciergeIntelBadge => 'Informations du concierge';

  @override
  String get ticketConciergeIntelAgenda =>
      'Adapté aux arrêts de votre agenda – pas à une liste de coupons générique.';

  @override
  String get agendaFixAfternoonRain => 'Pluie entrante - répare mon après-midi';

  @override
  String agendaRainRerouteDone(int count, int score) {
    return 'Après-midi mis à jour – $count arrêts déplacés à l\'intérieur. Score de vacances $score/100.';
  }

  @override
  String get agendaRainRerouteNone =>
      'Votre plan fonctionne déjà pour cette météo.';

  @override
  String get cloudTripsTitle => 'Sauvegarde dans le cloud';

  @override
  String get cloudTripsSubtitle =>
      'Vos trajets enregistrés sont synchronisés sur tous les appareils lorsque vous vous connectez – inclus avec le déverrouillage de n\'importe quelle ville.';

  @override
  String get cloudTripsMoreSubSignedOut =>
      'Connectez-vous pour sauvegarder les voyages enregistrés';

  @override
  String cloudTripsMoreSubSignedIn(String email) {
    return 'Connecté en tant que $email';
  }

  @override
  String get cloudTripsMoreSubSyncing => 'Synchronisation…';

  @override
  String get cloudTripsUnlockRequired =>
      'Débloquez un pack ville pour activer la sauvegarde dans le cloud';

  @override
  String get cloudTripsUnlockCta => 'Débloquez le concierge';

  @override
  String get cloudTripsEmailHint => 'Adresse email';

  @override
  String get cloudTripsSendCode => 'Envoyer le code de connexion';

  @override
  String get cloudTripsCodeHint => 'Code à 6 chiffres reçu par e-mail';

  @override
  String get cloudTripsVerify => 'Vérifier et se connecter';

  @override
  String get cloudTripsCodeSent =>
      'Vérifiez votre courrier électronique pour un code de connexion';

  @override
  String get cloudTripsSignOut => 'se déconnecter';

  @override
  String get cloudTripsSyncNow => 'Synchronisez maintenant';

  @override
  String get cloudTripsSyncSuccess => 'Voyages synchronisés';

  @override
  String get cloudTripsSyncError => 'La synchronisation a échoué : réessayez';

  @override
  String get cloudTripsBannerTitle => 'Sauvegardez vos voyages';

  @override
  String get cloudTripsBannerBody =>
      'Connectez-vous pour restaurer des voyages sur un nouveau téléphone ou une nouvelle tablette.';

  @override
  String get cloudTripsBannerCta => 'Configurer la sauvegarde cloud';

  @override
  String get cloudTripsNotConfigured =>
      'La sauvegarde cloud nécessite Supabase (configuration du développeur)';

  @override
  String get paywallFeatureCloudBackup => 'Sauvegarde de voyage dans le cloud';

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
  String get detailTravelIntelTitle =>
      'Perspectives de friction lors des déplacements';

  @override
  String get detailTravelIntelSubtitle =>
      'Prédit à partir de la catégorie, du temps et de la distance – et non de capteurs en direct.';

  @override
  String detailCrowdOutlook(String level) {
    return 'Foule : $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'Stationnement : $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'Frottement d\'entraînement : $score/90';
  }

  @override
  String get detailPrice => 'Prix';

  @override
  String get detailLocation => 'Lieu';

  @override
  String get detailGetDirections => 'Obtenir un itinéraire';

  @override
  String get detailParkMap => 'Plan du parc';

  @override
  String get detailViewOnMap => 'Voir sur la carte';

  @override
  String get detailMapsError =>
      'Impossible d\'ouvrir les cartes sur cet appareil.';

  @override
  String get detailGoogleMaps => 'Google Cartes';

  @override
  String get detailAppleMaps => 'Cartes Apple';

  @override
  String get detailOpenInMaps => 'Ouvrir dans les cartes';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time en voiture depuis Orlando';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$time en voiture depuis $hub';
  }

  @override
  String get detailSaveToItinerary => 'Enregistrer dans l\'itinéraire';

  @override
  String get detailSaved => 'Enregistré';

  @override
  String get detailSavedSnack => 'Enregistré dans votre itinéraire';

  @override
  String get detailRemovedSnack => 'Supprimé de votre itinéraire';

  @override
  String get detailSetHomeBase => 'Définir comme port d\'attache';

  @override
  String get detailHomeBaseActive => 'Votre point de départ pour votre voyage';

  @override
  String get detailHomeBaseHint =>
      'L’itinéraire de votre journée commence et se termine ici.';

  @override
  String get detailHomeBaseSetSnack =>
      'Définir comme base de départ de votre voyage';

  @override
  String get detailHomeBaseClearedSnack => 'Base d\'attache dégagée';

  @override
  String get detailMenuTitle => 'Points forts du menu';

  @override
  String get detailMenuDisclaimer =>
      'Points forts sélectionnés – le menu complet et les prix peuvent varier selon le lieu.';

  @override
  String get detailMenuComingSoon =>
      'Nous sommes toujours en train de préparer ce menu. En attendant, consultez le dernier menu et les prix en ligne.';

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
  String milesFromHub(String distance, String hub) {
    return '$distance de $hub';
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
  String get landingBegin => 'Commencer mon voyage';

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
  String get onboardBuilding => 'Création de votre aventure…';

  @override
  String get onboardStep1Title => 'Là où les rêves atterrissent d’abord';

  @override
  String get onboardStep1Subtitle => 'Où allez-vous ?';

  @override
  String get onboardDestination => 'Destination';

  @override
  String get onboardRegion => 'Région';

  @override
  String get onboardCityLabel => 'Choisissez votre ville';

  @override
  String get onboardCityUnlockNote =>
      'Chaque destination dispose de son propre déverrouillage de concierge : achat unique par ville.';

  @override
  String get landingCityLabel => 'Où vas-tu?';

  @override
  String get paywallSwitchCity => 'Destination';

  @override
  String get cityPickerUnlocked => 'Débloqué';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Débloquez $price';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Module complémentaire Orlando · Disney et Universal ensemble';

  @override
  String get onboardStep2Title => 'Le moment de se sentir libre';

  @override
  String get onboardStep2Subtitle => 'Quand commence votre évasion ?';

  @override
  String get onboardStartDateLabel => 'Date de début';

  @override
  String get onboardEndDateLabel => 'Date de fin';

  @override
  String get onboardPickDate => 'Appuyez pour choisir';

  @override
  String get onboardSelectStartDate => 'Choisissez la date de début';

  @override
  String get onboardSelectEndDate => 'Choisissez la date de fin';

  @override
  String get onboardDatesHint =>
      'Vous pouvez les modifier à tout moment depuis votre onglet Voyages.';

  @override
  String get onboardStepBudgetTitle => 'Planifiez en toute simplicité';

  @override
  String get onboardStepBudgetSubtitle =>
      'Qu’est-ce qui vous convient pour cette évasion ?';

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
  String get onboardPoolside => 'Au bord de la piscine et temps d\'arrêt';

  @override
  String get onboardAdventure => 'Aventure et plein air';

  @override
  String get onboardCulture => 'Culture et tourisme';

  @override
  String get dayFlowSubtitle =>
      'Une journée façonnée autour de ce que vous voulez ressentir – pas d’une liste de contrôle.';

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
      'Installez-vous lentement au bord de la piscine ou au spa avant le début de la journée.';

  @override
  String get dayFlowReasonMorningCalm =>
      'Un début en douceur pour donner le ton.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Heures de pointe d\'énergie : la grande aventure pendant que vous êtes frais.';

  @override
  String get dayFlowReasonMiddayCulture =>
      'Faire du tourisme pendant que la lumière est vive.';

  @override
  String get dayFlowReasonMiddayIcon => 'Le moment signature de la journée.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Temps d\'arrêt l\'après-midi pour recharger.';

  @override
  String get dayFlowReasonAfternoonGem => 'Un joyau caché loin de la foule.';

  @override
  String get dayFlowReasonEveningDining =>
      'Le repas du jour – votre choix gourmand.';

  @override
  String get dayFlowReasonNightOut => 'Une dernière lueur – une soirée.';

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
    return '$percent % de probabilité de pluie – emportez une couche légère.';
  }

  @override
  String get weatherConditionClear => 'Clair';

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
  String get weatherConciergeTitle => 'Conciergerie Météo';

  @override
  String get weatherConciergeTapHint =>
      'Appuyez pour obtenir des prévisions adaptées aux voyages';

  @override
  String get weatherConciergeAdviceTitle => 'Conseils météo à Louxora';

  @override
  String weatherFeelsLike(String temp) {
    return 'On dirait $temp';
  }

  @override
  String get weatherHumidity => 'Humidité';

  @override
  String get weatherWind => 'Vent';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir à $speed mph';
  }

  @override
  String get weatherUv => 'Indice UV';

  @override
  String get weatherCloudCover => 'Couverture nuageuse';

  @override
  String get weatherVisibility => 'Visibilité';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles mi';
  }

  @override
  String weatherSunrise(String time) {
    return 'Lever du soleil $time';
  }

  @override
  String get weatherStatRain => 'Pluie';

  @override
  String get weatherWhatToBring => 'Quoi apporter aujourd\'hui';

  @override
  String get weatherPlanImpact => 'Impact sur votre régime';

  @override
  String get weatherHourlyTitle => 'Perspectives horaires';

  @override
  String get weatherHourlyUnavailable =>
      'Les prévisions horaires apparaîtront lors du chargement des données.';

  @override
  String get weatherLiveRadar => 'Radar en direct';

  @override
  String get weatherRadarComingSoon => 'Radar en direct à venir.';

  @override
  String get weatherRadarPlay => 'Jouer en boucle';

  @override
  String get weatherRadarPause => 'Boucle de pause';

  @override
  String get weatherRadarTapToExpand => 'Appuyez pour le plein écran';

  @override
  String get weatherRadarNow => 'Maintenant';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return 'il y a $minutes minutes';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes min';
  }

  @override
  String get weatherRadarStepBack => 'Cadre antérieur';

  @override
  String get weatherRadarStepForward => 'Cadre ultérieur';

  @override
  String get weatherRadarJumpNow => 'Maintenant';

  @override
  String get weatherRadarJump1h => '−1 heure';

  @override
  String get weatherRadarJump2h => '−2 heures';

  @override
  String get weatherRadarJump30m => '+30 minutes';

  @override
  String get weatherRadarSpeedSlow => 'Lent';

  @override
  String get weatherRadarSpeedNormal => 'Normale';

  @override
  String get weatherRadarSpeedFast => 'Rapide';

  @override
  String get weatherRadarLoopNote =>
      'Boucle radar : dernières heures d\'environ 2 heures par étapes de 10 minutes, plus prévision immédiate à courte portée lorsqu\'elle est disponible – et non une prévision sur 4 heures.';

  @override
  String get shareMapPreviewCaption =>
      'Aperçu de la carte · ouvert à Louxora pour les directions en direct';

  @override
  String get shareRadarPreviewCaption =>
      'Radar Doppler en direct · ouvert à Louxora pour la boucle complète';

  @override
  String get weatherMapOverlays => 'Superpositions de cartes';

  @override
  String get weatherOverlayPrecip => 'Précipitation';

  @override
  String get weatherOverlayTemp => 'Température';

  @override
  String get weatherOverlayWind => 'Vent';

  @override
  String get weatherOverlayCloud => 'Couverture nuageuse';

  @override
  String get weatherComingSoon => 'À venir';

  @override
  String get weatherAdjustDay => 'Ajuster ma journée en fonction de la météo';

  @override
  String get weatherBestOutdoorWindow => 'Meilleure fenêtre extérieure';

  @override
  String get weatherRainWindow => 'Pluie probable';

  @override
  String get weatherSunsetRec => 'Recommandation au coucher du soleil';

  @override
  String weatherOutdoorAtRisk(int count) {
    return '$count arrêts extérieurs peuvent être affectés';
  }

  @override
  String get weatherIndoorBackup => 'Idées de sauvegarde en intérieur';

  @override
  String get weatherAdviceLightJacket => 'Apportez une veste légère ce soir.';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return 'Planifiez des activités de plein air avant $time.';
  }

  @override
  String get weatherAdviceHighUv =>
      'UV élevés aujourd’hui – apportez de la crème solaire et évitez une longue exposition directe au soleil à midi.';

  @override
  String get weatherAdviceRainLater =>
      'Le risque de pluie augmente plus tard dans la journée, alors déplacez les expériences en intérieur vers l\'après-midi.';

  @override
  String get weatherAdviceWindBeach =>
      'Le vent peut rendre les activités sur la plage ou en bateau moins confortables aujourd\'hui.';

  @override
  String get weatherAdviceGreatSunset =>
      'Excellentes conditions de coucher de soleil ce soir – envisagez un dîner sur le toit ou une promenade sur le lac.';

  @override
  String get weatherAdviceDefault =>
      'Le ciel semble gérable – suivez votre plan et gardez une couche légère à portée de main.';

  @override
  String weatherSunsetRecRooftop(String time) {
    return 'Ciel dégagé près de $time : un dîner sur le toit ou une promenade sur le lac pourraient briller.';
  }

  @override
  String get weatherPackSunscreen => 'Crème solaire';

  @override
  String get weatherPackSunglasses => 'Lunettes de soleil';

  @override
  String get weatherPackUmbrella => 'Parapluie';

  @override
  String get weatherPackLightJacket => 'Veste légère';

  @override
  String get weatherPackShoes => 'Chaussures confortables';

  @override
  String get weatherPackWater => 'Bouteille d\'eau';

  @override
  String get weatherPackHat => 'Chapeau';

  @override
  String get weatherPackPoncho => 'Poncho';

  @override
  String get weatherPackSwimwear => 'Maillots de bain';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return 'Le risque de pluie augmente après $time. Pensez à déplacer $outdoorStop plus tôt et à enregistrer $indoorStop pour plus tard.';
  }

  @override
  String weatherImpactHeat(String time) {
    return 'Chaleur élevée à midi : planifiez des promenades en plein air avant $time.';
  }

  @override
  String get weatherImpactClear =>
      'Le ciel semble convivial pour vos projets extérieurs ce matin.';

  @override
  String weatherImpactMixed(int count) {
    return '$count arrêts extérieurs nécessiteront peut-être des ajustements de timing aujourd\'hui.';
  }

  @override
  String get weatherImpactNoPlanRain =>
      'La pluie est de la partie – construisez d’abord votre journée avec des ancrages intérieurs.';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return 'La meilleure fenêtre extérieure ressemble à $start–$end avant que la chaleur ou les douches ne s\'accumulent.';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      'La météo semble stable : appuyez sur Planifier ma journée lorsque vous êtes prêt à séquencer les arrêts.';

  @override
  String get weatherImpactIndoorFallback => 'un spa ou un musée';

  @override
  String get hotelIntelBadge => 'INTELLIGENCE HÔTELIÈRE';

  @override
  String get hotelIntelTitle => 'Trouvez votre port d\'attache';

  @override
  String get hotelIntelSubtitle =>
      'En fonction du voyage que vous souhaitez réaliser, Luxora sélectionne des séjours qui façonnent vos journées, et non une grille de réservation.';

  @override
  String get hotelDiscoveryTitle => 'Organisé pour Orlando';

  @override
  String get hotelMatchmakerTeaser =>
      'Dites à Luxora votre style de voyage et bénéficiez de trois séjours sélectionnés par le concierge avec des compromis honnêtes.';

  @override
  String get hotelMatchmakerCta => 'Entremetteur d’hôtels IA';

  @override
  String get hotelMatchmakerTitle => 'Entremetteur d’hôtel';

  @override
  String get hotelMatchmakerSubtitle =>
      'Partagez comment vous voyagez – Luxora vous recommande où ancrer vos journées.';

  @override
  String get hotelMatchmakerRun => 'Trouvez mes 3 meilleurs séjours';

  @override
  String get hotelMatchBudget => 'Zone de confort budgétaire';

  @override
  String get hotelMatchTravelers => 'Voyageurs';

  @override
  String get hotelMatchAdults => 'Adultes';

  @override
  String get hotelMatchKids => 'Enfants';

  @override
  String get hotelMatchAttractions => 'Attractions sur votre liste';

  @override
  String get hotelMatchLuxuryLevel => 'Niveau de luxe souhaité';

  @override
  String get hotelMatchTransport => 'Se déplacer';

  @override
  String get hotelTransportCar => 'Voiture de location';

  @override
  String get hotelTransportRideshare => 'Covoiturage';

  @override
  String get hotelTransportShuttle => 'Navette station';

  @override
  String get hotelTransportWalkable => 'Quartier accessible à pied';

  @override
  String get hotelMatchResultsTitle => 'Vos 3 meilleurs matchs';

  @override
  String hotelMatchWhyTitle(int score) {
    return 'Score du match $score';
  }

  @override
  String get hotelMatchBestForLabel => 'Idéal pour :';

  @override
  String get hotelMatchItineraryLabel => 'Itinéraire:';

  @override
  String get hotelMatchTradeoffsLabel => 'Compromis :';

  @override
  String get hotelMatchNearbyLabel => 'Proche:';

  @override
  String get hotelLuxoraScore => 'Louxor';

  @override
  String get hotelHomeBaseBadge => 'BASE D\'ACCUEIL';

  @override
  String get hotelScoreLuxury => 'Luxe';

  @override
  String get hotelScoreFamily => 'Famille';

  @override
  String get hotelScoreRomance => 'Romance';

  @override
  String get hotelScoreWalkability => 'Marcher';

  @override
  String get hotelWhyRecommendTitle => 'Pourquoi Luxora le recommande';

  @override
  String get hotelItineraryImpactTitle => 'Comment cela façonne vos journées';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return 'Disque approximatif depuis le hub : $driveTime. Score de friction de voyage : $friction/90 (le plus bas est plus calme).';
  }

  @override
  String get hotelAddHomeBase => 'Ajouter comme base d\'attache';

  @override
  String get hotelHomeBaseActive => 'Base d\'attache active';

  @override
  String get hotelViewOnMap => 'Afficher sur la carte';

  @override
  String get hotelGetDirections => 'Obtenir un itinéraire';

  @override
  String get hotelCheckRates => 'Vérifier les tarifs';

  @override
  String get hotelVisitWebsite => 'Visitez le site Web';

  @override
  String get hotelLinkUnavailable =>
      'Lien de réservation pas encore disponible pour ce séjour.';

  @override
  String get hotelLinkOpenFailed =>
      'Impossible d\'ouvrir le lien : vérifiez votre navigateur ou réessayez.';

  @override
  String get hotelSave => 'Sauvegarder l’hôtel';

  @override
  String get hotelSaved => 'Enregistré';

  @override
  String get hotelDistanceTitle => 'Distance aux points clés';

  @override
  String get hotelCompareTitle => 'Comparez les séjours';

  @override
  String get hotelCompareSubtitle =>
      'Vue du concierge côte à côte : jusqu\'à trois hôtels.';

  @override
  String hotelCompareSelected(int count) {
    return '$count sélectionnés';
  }

  @override
  String get hotelComparePrice => 'Gamme de prix';

  @override
  String get hotelCompareDriveImpact => 'Stimuler l\'impact';

  @override
  String get hotelCompareNearby => 'Points forts à proximité';

  @override
  String get hotelPriceBudget => 'Budget';

  @override
  String get hotelPriceModerate => 'Modéré';

  @override
  String get hotelPriceUpscale => 'Haut de gamme';

  @override
  String get hotelPriceLuxury => 'Luxe';

  @override
  String get hotelTagCouples => 'Idéal pour les couples';

  @override
  String get hotelTagDisney => 'Idéal pour Disney';

  @override
  String get hotelTagUniversal => 'Idéal pour universel';

  @override
  String get hotelTagLuxuryStaycation => 'Séjour de luxe';

  @override
  String get hotelTagFamily => 'Familial';

  @override
  String get hotelTagQuiet => 'Évasion tranquille';

  @override
  String get hotelTagWalkableDining => 'Restauration accessible à pied';

  @override
  String get hotelTagResort => 'Ambiance de villégiature';

  @override
  String get hotelTagBudget => 'Économique';

  @override
  String get hotelReasonMatchesMood =>
      'Correspond à votre humeur et à votre rythme de voyage.';

  @override
  String get hotelReasonCloseStops =>
      'Proche des arrêts prévus sur votre timeline.';

  @override
  String hotelReasonSavesDrive(String time) {
    return 'Permet d\'économiser du temps de trajet par rapport à un hub générique : environ $time depuis le centre.';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return 'S\'adapte à une zone de confort de $range sans dépenser trop pour une mauvaise station.';
  }

  @override
  String get hotelReasonBetterGroup =>
      'Mieux adapté à votre type de groupe et à votre niveau d’énergie.';

  @override
  String get hotelReasonNearbyDining =>
      'Restauration solide à proximité pour des soirées sans effort.';

  @override
  String get hotelReasonLowStress =>
      'Calme de style resort : moins de logistique, plus de vacances.';

  @override
  String get hotelMatchAttractionsGeneral => 'vos attractions prévues';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return 'En fonction de votre itinéraire $attractions, $hotel réduit le temps de trajet et facilite les soirées.';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$hotel dans $neighborhood correspond à ce que vous souhaitez ressentir lors de ce voyage.';
  }

  @override
  String get hotelMatchBestForFamily =>
      'Les familles qui veulent des journées à la piscine sans sacrifier l\'accès au parc.';

  @override
  String get hotelMatchBestForCouple =>
      'Les couples qui veulent de la romance sans le chaos des parcs à thème.';

  @override
  String get hotelMatchBestForGroup =>
      'Groupes conciliant confort, accès et calme logistique.';

  @override
  String hotelMatchImpactDisney(String time) {
    return 'Des courses Disney plus courtes : environ $time pour rejoindre les parcs depuis votre porte.';
  }

  @override
  String get hotelMatchImpactUniversal =>
      'Les avantages Universal Express ou l’accès aux bateaux-taxis peuvent récupérer des heures de votre journée.';

  @override
  String get hotelMatchImpactWalkable =>
      'Marchez jusqu\'au dîner : moins de stress lié au stationnement après de longues journées au parc.';

  @override
  String hotelMatchImpactDefault(String time) {
    return 'Maintient les trajets moyens autour de $time afin que votre flux quotidien reste détendu.';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      'Tarifs de villégiature haut de gamme : prévoyez plus pour la chambre, moins ailleurs.';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      'Vous compterez sur une voiture ou un covoiturage, pas sur une base accessible à pied partout.';

  @override
  String get hotelMatchTradeoffLessFamily =>
      'Moins axé sur les équipements destinés aux enfants que sur les complexes familiaux dédiés.';

  @override
  String get hotelMatchTradeoffLessRomantic =>
      'Plus d\'énergie dans un parc à thème qu\'une retraite tranquille en couple.';

  @override
  String get hotelMatchTradeoffDefault =>
      'Chaque séjour comporte des compromis - Luxora a d\'abord choisi cela comme priorité.';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return 'Dîners et expériences autour de $neighborhood.';
  }

  @override
  String get mapHotelIntelBannerTitle => 'Choisissez le bon port d\'attache';

  @override
  String get mapHotelIntelBannerBody =>
      'Votre hôtel détermine les temps de trajet, le déroulement de la journée et l\'endroit où vous mangez. Luxora vous aide à choisir, sans pression de réservation.';

  @override
  String get mapHotelIntelBannerCta => 'Explorez l’intelligence hôtelière';

  @override
  String get sponsorLuxoraRecommended => 'Louxora recommandé';

  @override
  String get sponsorBadgeFeaturedPartner => 'Partenaire en vedette';

  @override
  String get sponsorBadgeSponsored => 'Sponsorisé';

  @override
  String get sponsorBadgePromoted => 'Promu';

  @override
  String get sponsorBadgePartnerOffer => 'Offre partenaire';

  @override
  String get sponsorCtaVisitWebsite => 'Visitez le site Web';

  @override
  String get sponsorCtaBookNow => 'Réservez maintenant';

  @override
  String get sponsorCtaCheckRates => 'Vérifier les tarifs';

  @override
  String get sponsorCtaGetTickets => 'Obtenez des billets';

  @override
  String get sponsorCtaViewOffer => 'Voir l\'offre';

  @override
  String get featuredStaysTitle => 'Séjours en vedette';

  @override
  String get featuredStaysSubtitle =>
      'Placements de partenaires — distincts des scores de correspondance organiques des hôtels de Luxora.';

  @override
  String get featuredExperiencesTitle => 'Expériences en vedette';

  @override
  String get featuredExperiencesSubtitle =>
      'Des choix sponsorisés en fonction de votre humeur – toujours étiquetés, jamais déguisés en rang IA.';

  @override
  String get featuredDiningTitle => 'Restauration en vedette';

  @override
  String get featuredDiningSubtitle =>
      'Restaurants partenaires Points forts de Luxora — votre liste de joyaux bio reste indépendante.';

  @override
  String get featuredTicketPartnersTitle => 'Partenaires de billets en vedette';

  @override
  String get featuredTicketPartnersSubtitle =>
      'Offres des partenaires autorisés – comparez avec les économies organiques ci-dessous.';

  @override
  String get featuredCityHomeTitle => 'Partenaires en vedette';

  @override
  String get featuredCityHomeSubtitle =>
      'Options de partenaires utiles pour Orlando – clairement indiquées, jamais cachées lors des choix de l’IA.';

  @override
  String get dayFlowVibeFoodie => 'Avant-gardiste';

  @override
  String get dayFlowVibeNightlife => 'Vie nocturne';

  @override
  String get dayFlowVibePoolside => 'Au bord de la piscine';

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
  String get onboardStepNameEyebrow => 'Votre histoire commence par un nom';

  @override
  String get onboardStepNameTitle =>
      'Comment devrions-nous appeler ce voyage ?';

  @override
  String get onboardStepNameSubtitle =>
      'Luxora peut créer un titre à partir de votre ambiance ou saisir le vôtre.';

  @override
  String get onboardTripNameLuxora => 'Laissez Luxora le nommer';

  @override
  String get onboardTripNameYours => 'je vais le nommer';

  @override
  String get onboardTripNameHint => 'Notre escapade anniversaire de printemps…';

  @override
  String onboardTripNameSuggested(String name) {
    return 'Luxora suggère : $name';
  }

  @override
  String get conciergeTripNameLabel => 'Nom du voyage';

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
  String get moodSocial => 'Sociale';

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

  @override
  String get paywallHeroEyebrow => 'VOTRE CONCIERGE PERSONNEL';

  @override
  String get paywallHeroHeadline => 'NE GÂCHEZ PAS VOS VACANCES';

  @override
  String get paywallHeroSubheadline =>
      'Luxora planifie le voyage pour que vous puissiez en profiter.';

  @override
  String get paywallEmotionalLine =>
      'Vous dépensez déjà des milliers de dollars en vacances. Ne laissez pas l\'expérience au hasard.';

  @override
  String paywallHeadlineCouples(String cityName) {
    return 'Votre escapade parfaite à $cityName commence ici.';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return 'Passez moins de temps à planifier et plus de temps à créer des souvenirs à $cityName.';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return 'Découvrez $cityName différemment.';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return 'Découvrez la $cityName que la plupart des touristes ne voient jamais.';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return 'Goûtez à $cityName comme un initié local.';
  }

  @override
  String get paywallWhatYouUnlock => 'Ce que vous débloquez';

  @override
  String get paywallFeatureAiConcierge => 'Conciergerie IA';

  @override
  String get paywallFeatureItineraries => 'Itinéraires personnalisés';

  @override
  String get paywallFeatureHiddenGems => 'Joyaux cachés';

  @override
  String get paywallFeatureHotelIntel => 'Intelligence hôtelière';

  @override
  String get paywallFeatureTicketSavings =>
      'Économies intelligentes sur les billets';

  @override
  String get paywallFeatureWeatherConcierge => 'Conciergerie Météo';

  @override
  String get paywallFeatureCrowdIntel => 'Intelligence des foules';

  @override
  String get paywallFeatureGpsNav => 'Navigation GPS';

  @override
  String get paywallFeatureLocalSecrets => 'Secrets locaux';

  @override
  String get paywallFeatureDining => 'Recommandations de restauration';

  @override
  String get paywallFeatureUnlimitedPlanning => 'Urbanisme illimité';

  @override
  String get paywallWhyTravelersUnlock =>
      'Pourquoi les voyageurs débloquent Luxora';

  @override
  String get paywallBenefitSaveTimeTitle => 'Gagnez du temps';

  @override
  String get paywallBenefitSaveTimeBody =>
      'Évitez les heures de recherche et de planification.';

  @override
  String get paywallBenefitSaveMoneyTitle => 'Économisez de l\'argent';

  @override
  String get paywallBenefitSaveMoneyBody =>
      'Découvrez des réductions sur les billets, des offres locales et des choix plus intelligents.';

  @override
  String get paywallBenefitAvoidTrapsTitle => 'Évitez les pièges à touristes';

  @override
  String get paywallBenefitAvoidTrapsBody =>
      'Trouvez des expériences que les locaux recommandent réellement.';

  @override
  String get paywallBenefitTravelSmarterTitle => 'Voyagez plus intelligemment';

  @override
  String get paywallBenefitTravelSmarterBody =>
      'Obtenez des recommandations basées sur la météo, la foule et votre style de voyage.';

  @override
  String get paywallLockedPreviewTitle =>
      'Attendre à l\'intérieur de votre concierge';

  @override
  String get paywallLockedPreviewSubtitle =>
      'Débloquez pour révéler des itinéraires et des secrets adaptés à votre voyage.';

  @override
  String get paywallLockedDateNight =>
      'Itinéraires romantiques pour un rendez-vous nocturne';

  @override
  String get paywallLockedHiddenLuxury => 'Expériences de luxe cachées';

  @override
  String get paywallLockedVipSecrets => 'Secrets locaux VIP';

  @override
  String get paywallLockedConciergeRecs => 'Recommandations du concierge';

  @override
  String get paywallLockedFamilyPlans => 'Plans familiaux sans stress';

  @override
  String get paywallLockedWeatherReroute =>
      'Réacheminement en fonction des conditions météorologiques';

  @override
  String get paywallLockedHotelMatchmaker =>
      'Entremetteur d’hôtels intelligents';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return 'Débloquez le concierge $cityName';
  }

  @override
  String get paywallOneTimePurchase => 'Achat unique';

  @override
  String get paywallNoSubscription => 'Aucun abonnement';

  @override
  String get paywallNoMonthlyFees => 'Pas de frais mensuels';

  @override
  String paywallLifetimeAccess(String cityName) {
    return 'Accès à vie à $cityName';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return 'Futures mises à jour de $cityName incluses';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return 'La plupart des vacances à $cityName coûtent $minUsd–$maxUsd+';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price Une fois';
  }

  @override
  String get paywallLessThanDinner =>
      'Moins que le prix d\'un dîner de vacances.';

  @override
  String get paywallSocialProofTitle => 'Les voyageurs qui ont débloqué Luxora';

  @override
  String get paywallReview1 =>
      '\"Nous avons économisé des heures de planification.\"';

  @override
  String get paywallReview2 =>
      '\"J\'ai trouvé des endroits que nous n\'aurions jamais découverts.\"';

  @override
  String get paywallReview3 =>
      '\"Ça vaut le coup rien que pour les joyaux cachés.\"';

  @override
  String paywallCtaUnlock(String cityName) {
    return 'Débloquez le concierge $cityName';
  }

  @override
  String get paywallContinueExploring => 'Continuer à explorer';

  @override
  String get paywallConciergePromise => 'Sans abonnement · Accès ville à vie';

  @override
  String get paywallRestorePurchases => 'Restaurer les achats';

  @override
  String get paywallPurchaseSuccess =>
      'Achat terminé — votre concierge est débloqué.';

  @override
  String get paywallPurchasePending => 'Finalisation de l\'achat…';

  @override
  String get paywallPurchaseFailed =>
      'L\'achat n\'a pas pu être finalisé. Réessayez ou restaurez les achats.';

  @override
  String get paywallPurchaseCanceled => 'Achat annulé.';

  @override
  String get paywallRestoreComplete => 'Achats restaurés.';

  @override
  String get paywallRestoreNone =>
      'Aucun achat antérieur trouvé pour cet identifiant Apple ou ce compte Google.';

  @override
  String get paywallStoreUnavailable =>
      'La facturation sur l\'App Store n\'est pas disponible sur cet appareil.';

  @override
  String get paywallProductUnavailable =>
      'Ce pack n\'est pas encore disponible en magasin.';

  @override
  String get settingsUnlockConciergeTitle =>
      'Débloquez le concierge de la ville';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'Pack ville unique — pas un abonnement';

  @override
  String get settingsOpenConciergeSubtitle =>
      'Ouvrez votre onglet Concierge IA';

  @override
  String get weatherMiamiHumidityIndoor =>
      'Forte humidité aujourd\'hui. Allez à la plage ou à la piscine plus tôt, puis à Wynwood ou Brickell pour des repas à l\'intérieur et des galeries pendant les heures les plus chaudes.';

  @override
  String get weatherMiamiHeatAdvisory =>
      'Conditions d\'avertissement de chaleur : tissus légers, hydratation et pauses ombragées entre les arrêts extérieurs.';

  @override
  String get weatherMiamiBeachMorning =>
      'Forts UV sur le sable – crème solaire, chapeau et plage avant midi.';

  @override
  String get weatherMiamiBoatWind =>
      'Le vent est élevé – reconsidérez les activités en bateau ou en yacht ; les repas sur le toit peuvent toujours fonctionner.';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return 'Fenêtre de pluie à venir : échangez vos plans extérieurs contre $indoorSpot ou du temps dans la galerie.';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      'Le coucher du soleil semble fort – au bord de l’eau ou sur un toit avec une vue d’est en ouest.';

  @override
  String get miamiBeachIntelTitle => 'Renseignements sur la plage';

  @override
  String miamiBeachBestTime(String time) {
    return 'Meilleur moment : $time';
  }

  @override
  String get miamiBeachFamilyScore => 'Famille';

  @override
  String get miamiBeachCrowdScore => 'Foule';

  @override
  String get miamiBeachPhotoScore => 'Photo';

  @override
  String get miamiBeachRomanceScore => 'Romance';

  @override
  String get miamiBeachSunsetScore => 'Coucher de soleil';

  @override
  String miamiBeachParking(String level) {
    return 'Stationnement : $level';
  }

  @override
  String get miamiNightlifeTitle => 'Conciergerie Vie Nocturne';

  @override
  String miamiNightlifeDressCode(String code) {
    return 'Code vestimentaire : $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return 'Meilleure arrivée : $time';
  }

  @override
  String get miamiNightlifeReservation => 'Réservation conseillée';

  @override
  String get miamiMoodRoutesTitle => 'Itinéraires d\'ambiance à Miami';

  @override
  String get tampaBayMoodRoutesTitle => 'Itinéraires d\'ambiance Tampa Bay';

  @override
  String get stAugustineMoodRoutesTitle =>
      'Itinéraires d\'ambiance St. Augustine';

  @override
  String get naplesMoodRoutesTitle => 'Itinéraires d\'ambiance Naples';

  @override
  String get destin30aMoodRoutesTitle =>
      'Itinéraires d\'ambiance Destin et 30A';

  @override
  String get vegasMoodRoutesTitle => 'Parcours d\'ambiance Las Vegas';

  @override
  String miamiMoodRouteStart(String time) {
    return 'Commencez vers $time';
  }

  @override
  String get keysWaterIntelTitle => 'Clés Intelligence Eau';

  @override
  String keysWaterBestTime(String time) {
    return 'Meilleure fenêtre : $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Eau : $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Tuba';

  @override
  String get keysWaterDivingScore => 'Plonger';

  @override
  String get keysWaterBoatingScore => 'Bateau';

  @override
  String get keysWaterFishingScore => 'Poisson';

  @override
  String get keysWaterWindScore => 'Vent';

  @override
  String get keysWaterSunsetScore => 'Coucher de soleil';

  @override
  String get keysWaterCrowdScore => 'Foule';

  @override
  String get keysMoodRoutesTitle => 'Itinéraires des îles Keys';

  @override
  String keysMoodRouteStart(String time) {
    return 'Démarrer $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'VIVRE MIAMI DIFFÉREMMENT';

  @override
  String get paywallHeadlineMiamiWeekend =>
      'NE PERDEZ PAS VOTRE WEEK-END À MIAMI';

  @override
  String get paywallOrlandoAddonsHeading => 'Pack parc à thème';

  @override
  String get paywallOrlandoBaseIncludes =>
      'Orlando Unlock comprend des restaurants, des joyaux cachés, des hôtels et des expériences hors parc. Ajoutez le pack parc à thème pour Disney et Universal ensemble.';

  @override
  String get paywallAddonThemeParksTitle => 'Pack Disney & Universel';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World et Universal Orlando : tous les parcs, offres, itinéraires et informations sur la foule en un seul déverrouillage.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return 'Débloquez $packName · $price';
  }

  @override
  String get paywallAddonUnlocked => 'Débloqué';

  @override
  String get paywallAddonRequiresOrlando =>
      'Nécessite d\'abord le déverrouillage d\'Orlando';

  @override
  String paywallUnlockAddonPack(String packName) {
    return 'Débloquez $packName';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return 'Débloquez $packName';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      'Débloquer Disney et Universal pour Orlando ?';

  @override
  String get orlandoThemeParksPromptBody =>
      'Ajoutez le pack de parcs à thème pour Walt Disney World et Universal Orlando : tous les parcs, offres de billets, itinéraires et informations sur la foule en un seul déverrouillage.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Débloquez · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Pas maintenant';

  @override
  String get onboardV2Eyebrow => 'Concevons votre voyage parfait';

  @override
  String get onboardV2StepTravelerEyebrow => 'Étape 1';

  @override
  String get onboardV2StepTravelerTitle => 'Avec qui voyagez-vous ?';

  @override
  String get onboardV2StepTravelerSubtitle =>
      'Luxora adapte les séjours, les repas et le rythme à votre équipage.';

  @override
  String get onboardV2ChildrenLabel => 'Des enfants qui voyagent ?';

  @override
  String get onboardV2StepStyleEyebrow => 'Étape 2';

  @override
  String get onboardV2StepStyleTitle =>
      'Quel genre de voyage recherchez-vous ?';

  @override
  String get onboardV2StepStyleSubtitle =>
      'Choisissez tout ce qui vous passionne.';

  @override
  String get onboardV2StepHotelEyebrow => 'Étape 3';

  @override
  String get onboardV2StepHotelTitle =>
      'Dans quel type d\'endroit aimeriez-vous séjourner ?';

  @override
  String get onboardV2StepHotelSubtitle =>
      'Nous associerons les joyaux des boutiques et les icônes des centres de villégiature.';

  @override
  String get onboardV2HotelBudgetLabel => 'Budget hôtel';

  @override
  String get onboardV2HotelAmenitiesLabel => 'Des commodités indispensables';

  @override
  String get onboardV2StepFoodEyebrow => 'Étape 4';

  @override
  String get onboardV2StepFoodTitle =>
      'Quels types de restaurants appréciez-vous ?';

  @override
  String get onboardV2StepFoodSubtitle =>
      'Cuisine et style de restauration : choisissez tout ce que vous aimez.';

  @override
  String get onboardV2CuisineLabel => 'Types de cuisine';

  @override
  String get onboardV2DiningStyleLabel => 'Style de restauration';

  @override
  String get onboardV2StepPaceEyebrow => 'Étape 5';

  @override
  String get onboardV2StepPaceTitle =>
      'Comment aimeriez-vous que vos journées soient planifiées ?';

  @override
  String get onboardV2StepPaceSubtitle =>
      'Matinées détendues ou aventure bien remplie – à vous de choisir.';

  @override
  String get onboardV2PaceRelaxedTitle => 'Détendu';

  @override
  String get onboardV2PaceRelaxedBody => '2 à 3 activités par jour';

  @override
  String get onboardV2PaceBalancedTitle => 'Équilibré';

  @override
  String get onboardV2PaceBalancedBody => '4 à 5 activités par jour';

  @override
  String get onboardV2PacePackedTitle => 'Emballé';

  @override
  String get onboardV2PacePackedBody => 'Maximisez chaque jour';

  @override
  String get onboardV2StepGoalsEyebrow => 'Étape 6';

  @override
  String get onboardV2StepGoalsTitle =>
      'Qu’est-ce qui compte le plus dans ce voyage ?';

  @override
  String get onboardV2StepGoalsSubtitle =>
      'Choisissez jusqu\'à cinq priorités.';

  @override
  String get onboardV2StepExperienceEyebrow => 'Étape 7';

  @override
  String get onboardV2StepExperienceTitle =>
      'Quelles expériences aimeriez-vous ?';

  @override
  String get onboardV2StepExperienceSubtitle =>
      'Nous les intégrerons à votre itinéraire.';

  @override
  String get onboardV2StepAvoidEyebrow => 'Étape 8';

  @override
  String get onboardV2StepAvoidTitle => 'Que préféreriez-vous éviter ?';

  @override
  String get onboardV2StepAvoidSubtitle =>
      'Luxora évite ce qui draine votre voyage.';

  @override
  String get onboardV2StepEmotionEyebrow => 'Étape 9';

  @override
  String get onboardV2StepEmotionTitle =>
      'Qu’est-ce qui ferait de ce voyage un succès ?';

  @override
  String get onboardV2StepEmotionSubtitle =>
      'Choisissez un sentiment principal.';

  @override
  String get onboardV2StepSummaryEyebrow => 'LUXORA';

  @override
  String onboardV2StepSummaryTitle(String name) {
    return 'Parfait, $name.';
  }

  @override
  String get onboardV2StepSummarySubtitle =>
      'J\'ai appris un peu quel type de voyageur vous êtes.\n\nJ\'utiliserai vos préférences pour recommander des lieux, expériences, restaurants et trésors cachés adaptés à votre style.\n\nChaque recommandation sera taillée pour vous.\n\nVoyons ce que nous pouvons découvrir.';

  @override
  String get onboardSummaryHotels => 'Hôtels';

  @override
  String get onboardSummaryRestaurants => 'Restaurants';

  @override
  String get onboardSummaryHiddenGems => 'Joyaux cachés';

  @override
  String get onboardSummaryExperiences => 'Expériences';

  @override
  String get onboardSummaryHotelDefault =>
      'Des séjours sélectionnés et adaptés à votre budget';

  @override
  String onboardSummaryHotelType(String type) {
    return '$type rester';
  }

  @override
  String get onboardSummaryRooftopDining =>
      'Expériences culinaires sur les toits';

  @override
  String onboardSummaryCuisine(String cuisine) {
    return '$cuisine favoris';
  }

  @override
  String onboardSummaryPace(String pace) {
    return '$pace rythme quotidien';
  }

  @override
  String get onboardSummaryRomantic =>
      'Expériences romantiques au coucher du soleil';

  @override
  String onboardSummaryEmotion(String emotion) {
    return 'voyage axé sur l\'$emotion';
  }

  @override
  String get onboardSummaryPremiumGems => 'Joyaux cachés haut de gamme';

  @override
  String get agendaSuggestionsForYou => 'Choisi pour toi';

  @override
  String get agendaSuggestionsAlternates => 'Super aussi';

  @override
  String get agendaSuggestionsBrowseAll => 'Parcourir tout';

  @override
  String get onboardPrefTravelerSolo => 'Seul(e)';

  @override
  String get onboardPrefTravelerCouple => 'En couple';

  @override
  String get onboardPrefTravelerFamily => 'Famille';

  @override
  String get onboardPrefTravelerFriends => 'Amis';

  @override
  String get onboardPrefTravelerBusiness => 'Entreprise';

  @override
  String get onboardPrefChildrenNone => 'Pas d\'enfants';

  @override
  String get onboardPrefChildrenToddlers => 'Les tout-petits';

  @override
  String get onboardPrefChildrenElementary => 'Âge élémentaire';

  @override
  String get onboardPrefChildrenTeenagers => 'Adolescents';

  @override
  String get onboardPrefStyleLuxury => 'Luxe';

  @override
  String get onboardPrefStyleRelaxation => 'Détente';

  @override
  String get onboardPrefStyleAdventure => 'Aventure';

  @override
  String get onboardPrefStyleThemeParks => 'Parcs à thème';

  @override
  String get onboardPrefStyleFoodie => 'Fin gourmet';

  @override
  String get onboardPrefStyleNightlife => 'Vie nocturne';

  @override
  String get onboardPrefStyleRomance => 'Romantisme';

  @override
  String get onboardPrefStyleShopping => 'Achats';

  @override
  String get onboardPrefStyleBeaches => 'Plages';

  @override
  String get onboardPrefStyleWellness => 'Bien-être';

  @override
  String get onboardPrefStyleNature => 'Nature';

  @override
  String get onboardPrefStylePhotography => 'Photographie';

  @override
  String get onboardPrefStyleHiddenGems => 'Joyaux cachés';

  @override
  String get onboardPrefStyleFamilyActivities => 'Activités familiales';

  @override
  String get onboardPrefStyleLocalExperiences => 'Expériences locales';

  @override
  String get onboardPrefStyleEntertainment => 'Divertissement';

  @override
  String get onboardPrefHotelLuxuryResort => 'Complexe de luxe';

  @override
  String get onboardPrefHotelBoutique => 'Hôtel de charme';

  @override
  String get onboardPrefHotelFamilyResort => 'Station familiale';

  @override
  String get onboardPrefHotelBudgetFriendly => 'Économique';

  @override
  String get onboardPrefHotelAdultsOnly => 'Adultes seulement';

  @override
  String get onboardPrefHotelSpaResort => 'Station thermale';

  @override
  String get onboardPrefHotelBeachfront => 'Front de mer';

  @override
  String get onboardPrefHotelDowntown => 'Centre-ville';

  @override
  String get onboardPrefHotelWalkable => 'Zone accessible à pied';

  @override
  String get onboardPrefHotelThemeParkArea => 'Zone du parc à thème';

  @override
  String get onboardPrefHotelModern => 'Hôtel moderne';

  @override
  String get onboardPrefHotelHistoric => 'Hôtel historique';

  @override
  String get onboardPrefBudgetOne => '\$';

  @override
  String get onboardPrefBudgetTwo => '\$\$';

  @override
  String get onboardPrefBudgetThree => '\$\$\$';

  @override
  String get onboardPrefBudgetFour => '\$\$\$\$';

  @override
  String get onboardPrefAmenityPool => 'Piscine';

  @override
  String get onboardPrefAmenitySpa => 'Spa';

  @override
  String get onboardPrefAmenityGym => 'Salle de sport';

  @override
  String get onboardPrefAmenityBreakfast => 'Petit-déjeuner gratuit';

  @override
  String get onboardPrefAmenityOceanView => 'Vue sur l\'océan';

  @override
  String get onboardPrefAmenityBalcony => 'Balcon';

  @override
  String get onboardPrefAmenityKitchen => 'Cuisine';

  @override
  String get onboardPrefAmenityShuttle => 'Service de navette';

  @override
  String get onboardPrefAmenityPetFriendly => 'Animaux acceptés';

  @override
  String get onboardPrefCuisineAmerican => 'Américain';

  @override
  String get onboardPrefCuisineItalian => 'italien';

  @override
  String get onboardPrefCuisineMexican => 'mexicain';

  @override
  String get onboardPrefCuisineSeafood => 'Fruit de mer';

  @override
  String get onboardPrefCuisineSteakhouse => 'Grillades';

  @override
  String get onboardPrefCuisineSushi => 'Sushis';

  @override
  String get onboardPrefCuisineCuban => 'cubain';

  @override
  String get onboardPrefCuisineMediterranean => 'méditerranéen';

  @override
  String get onboardPrefCuisineAsian => 'asiatique';

  @override
  String get onboardPrefCuisineBbq => 'barbecue';

  @override
  String get onboardPrefCuisineFineDining => 'Gastronomie';

  @override
  String get onboardPrefCuisineLocalFavorites => 'Favoris locaux';

  @override
  String get onboardPrefCuisineFoodTrucks => 'Camions de restauration';

  @override
  String get onboardPrefCuisineRooftop => 'Restauration sur le toit';

  @override
  String get onboardPrefCuisineBrunch => 'Brunch';

  @override
  String get onboardPrefCuisineDessert => 'Desserts';

  @override
  String get onboardPrefDiningQuick => 'Service rapide';

  @override
  String get onboardPrefDiningCasual => 'Dîner décontracté';

  @override
  String get onboardPrefDiningFamily => 'Pour toute la famille';

  @override
  String get onboardPrefDiningDateNight => 'Soirée de rendez-vous';

  @override
  String get onboardPrefDiningFine => 'Gastronomie';

  @override
  String get onboardPrefDiningWaterfront => 'Bord de l\'eau';

  @override
  String get onboardPrefDiningHiddenGems => 'Joyaux cachés';

  @override
  String get onboardPrefDiningLocal => 'Favoris locaux';

  @override
  String get onboardPrefGoalMakeMemories => 'Créez des souvenirs';

  @override
  String get onboardPrefGoalSaveMoney => 'Économisez de l\'argent';

  @override
  String get onboardPrefGoalAvoidCrowds => 'Évitez les foules';

  @override
  String get onboardPrefGoalLuxury => 'Expériences de luxe';

  @override
  String get onboardPrefGoalBestFood => 'Meilleure nourriture';

  @override
  String get onboardPrefGoalHiddenGems => 'Joyaux cachés';

  @override
  String get onboardPrefGoalRelaxation => 'Détente';

  @override
  String get onboardPrefGoalAdventure => 'Aventure';

  @override
  String get onboardPrefGoalBestPhotos => 'Meilleures photos';

  @override
  String get onboardPrefGoalFamilyTime => 'Temps en famille';

  @override
  String get onboardPrefGoalRomance => 'Romantisme';

  @override
  String get onboardPrefGoalNightlife => 'Vie nocturne';

  @override
  String get onboardPrefGoalLocal => 'Expériences locales';

  @override
  String get onboardPrefGoalStressFree => 'Planification sans stress';

  @override
  String get onboardPrefExpBoatTours => 'Excursions en bateau';

  @override
  String get onboardPrefExpSunsetCruises => 'Croisières au coucher du soleil';

  @override
  String get onboardPrefExpAirboat => 'Excursions en hydroglisseur';

  @override
  String get onboardPrefExpThemeParks => 'Parcs à thème';

  @override
  String get onboardPrefExpMuseums => 'Musées';

  @override
  String get onboardPrefExpLiveShows => 'Spectacles en direct';

  @override
  String get onboardPrefExpSpas => 'Spas';

  @override
  String get onboardPrefExpShopping => 'Achats';

  @override
  String get onboardPrefExpWaterParks => 'Parcs aquatiques';

  @override
  String get onboardPrefExpGolf => 'Golf';

  @override
  String get onboardPrefExpFishing => 'Pêche';

  @override
  String get onboardPrefExpKayaking => 'Kayak';

  @override
  String get onboardPrefExpSnorkeling => 'Plongée en apnée';

  @override
  String get onboardPrefExpRooftopBars => 'Barres sur le toit';

  @override
  String get onboardPrefExpNightclubs => 'Boîtes de nuit';

  @override
  String get onboardPrefExpWildlife => 'Expériences avec la faune';

  @override
  String get onboardPrefExpFoodTours => 'Visites gastronomiques';

  @override
  String get onboardPrefExpScenicDrives => 'Routes panoramiques';

  @override
  String get onboardPrefAvoidCrowds => 'Foules';

  @override
  String get onboardPrefAvoidLongLines => 'Longues lignes';

  @override
  String get onboardPrefAvoidExpensiveRestaurants => 'Restaurants chers';

  @override
  String get onboardPrefAvoidWalking => 'Marcher sur de longues distances';

  @override
  String get onboardPrefAvoidNightlife => 'Vie nocturne';

  @override
  String get onboardPrefAvoidDriving => 'Conduite';

  @override
  String get onboardPrefAvoidTouristTraps => 'Pièges à touristes';

  @override
  String get onboardPrefAvoidEarlyMornings => 'Tôt le matin';

  @override
  String get onboardPrefAvoidLateNights => 'Tard dans la nuit';

  @override
  String get onboardPrefAvoidFamilyAttractions => 'Attractions familiales';

  @override
  String get onboardPrefAvoidThemeParks => 'Parcs à thème';

  @override
  String get onboardPrefEmotionRelaxed => 'Détendu';

  @override
  String get onboardPrefEmotionExcited => 'Excité';

  @override
  String get onboardPrefEmotionAdventurous => 'Aventureux';

  @override
  String get onboardPrefEmotionRomantic => 'Romantique';

  @override
  String get onboardPrefEmotionLuxurious => 'Luxueux';

  @override
  String get onboardPrefEmotionFamilyFocused => 'Axé sur la famille';

  @override
  String get onboardPrefEmotionMemorable => 'Mémorable';

  @override
  String get onboardPrefEmotionStressFree => 'Sans stress';

  @override
  String get onboardPrefEmotionInspiring => 'Inspirant';

  @override
  String get onboardPrefPaceSlow => 'Détendu';

  @override
  String get onboardPrefPaceBalanced => 'Équilibré';

  @override
  String get onboardPrefPacePacked => 'Emballé';

  @override
  String get onboardSummaryHiddenGemsInsight =>
      'Restaurants et joyaux locaux cachés';

  @override
  String get onboardBuildFailedHint =>
      'Nous avons enregistré vos préférences, mais l\'itinéraire nécessite un autre moment. Tirez pour actualiser l’Agenda ou ouvrir Concierge.';

  @override
  String get onboardV2ChildrenSubtitle =>
      'Sélectionnez tous les groupes d’âge qui s’appliquent.';

  @override
  String get onboardTravelerNameEyebrow => 'Tout d\'abord';

  @override
  String get onboardTravelerNameTitle =>
      'Comment Luxora devrait-il vous appeler ?';

  @override
  String get onboardTravelerNameSubtitle =>
      'Votre prénom suffit – Luxora l’utilisera lorsque vous discuterez.';

  @override
  String get onboardTravelerNameLabel => 'Votre prénom';

  @override
  String get onboardTravelerNameHint => 'par ex. Marie';

  @override
  String conciergeWelcomeNamed(String name) {
    return 'Bienvenue, $name, votre compagnon de Floride émotionnellement intelligent.\n\nChoisissez une invite ci-dessous ou décrivez le sentiment que vous souhaitez que votre voyage crée.';
  }

  @override
  String conciergeWelcomeWarmNamed(String name) {
    return '$name, je suis ici pour façonner la Floride en fonction de ce que vous souhaitez ressentir, et non d\'une liste de sites touristiques. De quoi as-tu envie aujourd’hui ?';
  }

  @override
  String get onboardWelcomeEyebrow => 'LUXORA';

  @override
  String get onboardWelcomeTitle => 'Bonjour, je suis Luxora.';

  @override
  String get onboardWelcomeTagline => 'Votre concierge de voyage personnel.';

  @override
  String get onboardWelcomeBody =>
      'Je suis là pour vous aider à découvrir des lieux incroyables, éviter les pièges à touristes et créer des vacances dont vous vous souviendrez pendant des années.\n\nCommençons à planifier quelque chose d\'inoubliable.';

  @override
  String get onboardWelcomeCta => 'Commencer mon voyage';

  @override
  String get onboardLuxoraGuideBody =>
      'À partir de maintenant, je vous guide à chaque étape.\n\nQue vous cherchiez des trésors cachés, une cuisine incroyable, des expériences inoubliables ou simplement des vacances sans stress, je suis là pour vous.';

  @override
  String get onboardLuxoraReplyClosing =>
      'Créons ensemble votre aventure parfaite.';

  @override
  String onboardBuildingTitle(String name) {
    return 'Excellent choix, $name.';
  }

  @override
  String get onboardBuildingBody =>
      'Je construis un itinéraire personnalisé selon votre style, vos intérêts, votre rythme, vos préférences culinaires et vos objectifs de vacances.\n\nCela peut prendre un instant.';

  @override
  String get onboardBuildingTagline =>
      'Les bonnes vacances arrivent par hasard.\n\nLes grandes vacances naissent d\'un plan.';

  @override
  String get onboardItineraryReadyTitle => 'Votre aventure est prête.';

  @override
  String get onboardItineraryReadyBody =>
      'J\'ai soigneusement sélectionné expériences, restaurants, attractions et trésors cachés correspondant au voyage que vous avez décrit.\n\nBien sûr, nous pouvons ajuster quoi que ce soit en cours de route.\n\nLes meilleures vacances évoluent en se déroulant.';

  @override
  String weatherRerouteLuxoraIntro(String name) {
    return '$name, la météo pourrait impacter une partie des plans d\'aujourd\'hui.';
  }

  @override
  String get weatherRerouteLuxoraClosing =>
      'Parfois, l\'imprévu crée les plus beaux souvenirs.';

  @override
  String rightNowLuxoraIntro(String name) {
    return '$name, selon votre position, la météo actuelle et vos préférences, voici ce que je ferais maintenant.';
  }

  @override
  String get rightNowLuxoraClosing =>
      'Faites-moi confiance.\n\nJe pense que vous allez adorer.';

  @override
  String paywallPersonalPitch(String name, String cityName) {
    return '$name, votre plan de vacances personnalisé prend déjà forme.\n\nLe Jour 1 est prêt.\n\nLe reste de votre voyage vous attend.\n\nDébloquez $cityName Concierge pour accéder à l\'itinéraire complet, trésors cachés, secrets locaux, météo intelligente et guidance concierge illimitée.\n\nRendons ces vacances inoubliables.';
  }

  @override
  String get onboardLuxoraReplyEyebrow => 'LUXORA';

  @override
  String onboardLuxoraReplyTitle(String name) {
    return 'Ravi de vous rencontrer, $name.';
  }

  @override
  String onboardLuxoraGuideNamed(String name) {
    return 'À partir de maintenant, je vous guide à chaque étape.\n\nQue vous cherchiez des trésors cachés, une cuisine incroyable, des expériences inoubliables ou simplement des vacances sans stress, je suis là pour vous.';
  }

  @override
  String get onboardLuxoraItineraryPromise =>
      'Créons ensemble votre aventure parfaite.';

  @override
  String get onboardReturningEyebrow => 'BON RETOUR';

  @override
  String onboardReturningTitle(String name) {
    return 'Bon retour, $name.';
  }

  @override
  String get onboardReturningTitleGeneric => 'Bon retour.';

  @override
  String get onboardReturningSubtitle =>
      'Prêt à poursuivre votre aventure ?\n\nJ\'ai enregistré vos préférences, lieux favoris et plans pour reprendre exactement où nous nous sommes arrêtés.\n\nVoyons ce qui vous attend aujourd\'hui.';

  @override
  String get todayPlanSectionTitle => 'Le plan d\'aujourd\'hui';

  @override
  String get todayNextActivityLabel => 'À suivre';

  @override
  String get todayStaysDiningSection => 'Séjours et choix de restauration';

  @override
  String get todayStaysDiningCollapsedHint =>
      'Idées d\'hôtels et de restaurants — appuyez pour agrandir';

  @override
  String get todayPlanDetailsTitle => 'Programme complet';

  @override
  String todayPlanStopCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arrêts aujourd\'hui',
      one: '1 stop today',
    );
    return '$_temp0';
  }

  @override
  String get todayRainRerouteTitle => 'Réacheminement météo';

  @override
  String get todayExtrasSection => 'Billets et partage';

  @override
  String get todayExtrasCollapsedHint =>
      'Offres, carte de partage et plus encore';

  @override
  String freemiumVacationTitle(String cityName) {
    return 'Vos vacances à $cityName';
  }

  @override
  String get freemiumDay1Ready => '✓ Jour 1 prêt';

  @override
  String get freemiumUnlockFullPlan => 'Débloquer votre plan vacances complet';

  @override
  String freemiumLockedDayConcierge(int day) {
    return 'Jour $day · Optimisé par concierge';
  }

  @override
  String get freemiumLockedDayGems => 'Jour 3 · Route des trésors cachés';

  @override
  String get freemiumLockedDayWeather => 'Jour 4 · Planification météo';

  @override
  String get freemiumLockedDayDeparture => 'Jour 5 · Stratégie de départ';

  @override
  String freemiumConciergeRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count questions gratuites restantes',
      one: '1 question gratuite restante',
    );
    return '$_temp0';
  }

  @override
  String get freemiumConciergeLimitReached =>
      'Limite concierge gratuite atteinte — débloquez une planification illimitée.';

  @override
  String freemiumLockedHotels(int count) {
    return '🔒 $count+ hôtels supplémentaires disponibles';
  }

  @override
  String freemiumLockedRestaurants(int count) {
    return '🔒 $count+ restaurants supplémentaires disponibles';
  }

  @override
  String freemiumLockedGems(int count) {
    return '🔒 $count+ trésors cachés disponibles';
  }

  @override
  String freemiumLockedSecrets(int count) {
    return '🔒 $count+ secrets locaux disponibles';
  }

  @override
  String freemiumLockedExperiences(int count) {
    return '🔒 $count+ expériences disponibles';
  }

  @override
  String get freemiumLockedAttractions => '🔒 Autres attractions disponibles';

  @override
  String freemiumUnlockExplore(String cityName) {
    return 'Débloquez $cityName Concierge pour continuer à explorer.';
  }

  @override
  String freemiumUnlockConcierge(String cityName) {
    return 'Débloquer $cityName Concierge';
  }

  @override
  String freemiumHeadlineDayTwoPlus(String cityName) {
    return 'Vos prochains jours sont prêts — débloquez le plan complet de $cityName.';
  }

  @override
  String get freemiumHeadlineConciergeLimit =>
      'Continuez à planifier avec un accès concierge illimité.';

  @override
  String freemiumHeadlineHotels(String cityName) {
    return 'Débloquez $cityName Concierge pour chaque recommandation d\'hôtel.';
  }

  @override
  String freemiumHeadlineRestaurants(String cityName) {
    return 'Débloquez la collection complète de restaurants de $cityName.';
  }

  @override
  String get freemiumHeadlineGems =>
      'Favoris locaux et trésors cachés vous attendent.';

  @override
  String get freemiumHeadlineSecrets =>
      'Débloquez les secrets d\'horaires et de stationnement des résidents.';

  @override
  String freemiumHeadlineExperiences(String cityName) {
    return 'Débloquez des expériences curatées dans tout $cityName.';
  }

  @override
  String get freemiumHeadlineAttractions =>
      'Débloquez la collection complète d\'attractions.';

  @override
  String get freemiumHeadlineHotelMatchmaker =>
      'Débloquez Hotel Intelligence pour comparer chaque séjour.';

  @override
  String get freemiumHeadlineFullItinerary =>
      'Débloquez votre plan vacances complet.';

  @override
  String get freemiumLocalSecretsTitle => 'Secrets locaux';

  @override
  String get freemiumLocalSecretsSubtitle =>
      'Horaires, stationnement et points de vue que les locaux gardent.';
}
