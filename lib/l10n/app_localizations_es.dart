// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => 'Ajustes';

  @override
  String get appearance => 'Apariencia';

  @override
  String get settingsThemeIntro =>
      'Oscuro cinematográfico o resort claro — elige el ambiente de tu viaje.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get themeGoldenEmber => 'Golden Ember';

  @override
  String get themeGoldenEmberMood => 'Ultra lujo cálido';

  @override
  String get themeMidnightAmethyst => 'Midnight Amethyst';

  @override
  String get themeMidnightAmethystMood => 'Misterioso y exclusivo';

  @override
  String get themeEmeraldHaven => 'Emerald Haven';

  @override
  String get themeEmeraldHavenMood => 'Lujo tropical sereno';

  @override
  String get themeRivieraWhite => 'Riviera White';

  @override
  String get themeRivieraWhiteMood => 'Elegante revista de viajes de lujo';

  @override
  String get themeCoastalGlass => 'Coastal Glass';

  @override
  String get themeCoastalGlassMood => 'Energía vacacional premium y limpia';

  @override
  String get themeChampagneLuxe => 'Champagne Luxe';

  @override
  String get themeChampagneLuxeMood => 'Elegancia de concierge privado';

  @override
  String get themeBlackCard => 'Black Card';

  @override
  String get themeBlackCardMood => 'Prestigio de aviación privada';

  @override
  String get settingsThemeSectionLuxury => 'Cinemática de lujo';

  @override
  String get settingsThemeSectionReadable => 'Limpio y legible';

  @override
  String get settingsMapSkinSection => 'Mapa base';

  @override
  String get settingsMapSkinIntro =>
      'Elige el aspecto de los mosaicos del mapa en la pestaña Mapa.';

  @override
  String get mapSkinVoyager => 'Voyager';

  @override
  String get mapSkinVoyagerMood => 'Color suave — parques, agua, carreteras';

  @override
  String get mapSkinOsm => 'OpenStreetMap';

  @override
  String get mapSkinOsmMood => 'Clásico, tonos naturales';

  @override
  String get mapSkinCartoLight => 'Carto Light';

  @override
  String get mapSkinCartoLightMood => 'Minimalista y claro';

  @override
  String get mapSkinCartoDark => 'Carto Dark';

  @override
  String get mapSkinCartoDarkMood => 'Mapa base nocturno';

  @override
  String get mapSkinMapboxStreets => 'Mapbox Streets';

  @override
  String get mapSkinMapboxStreetsMood =>
      'Rico en detalle, estilo app de viajes';

  @override
  String get mapSkinMapboxOutdoors => 'Mapbox Outdoors';

  @override
  String get mapSkinMapboxOutdoorsMood => 'Énfasis en verdes y terreno';

  @override
  String get dark_mode => 'Modo oscuro';

  @override
  String get light_mode => 'Modo claro';

  @override
  String get language => 'Idioma';

  @override
  String get settings_language_picker_note =>
      'Los cambios se aplican de inmediato.';

  @override
  String get settings_regions_coming_title => 'Países y ciudades';

  @override
  String get settings_regions_coming_subtitle =>
      'Centro base y paquetes de ciudad, próximamente.';

  @override
  String get commonSoon => 'Pronto';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get commonNew => 'Nuevo';

  @override
  String get commonRoadmap => 'Hoja de ruta';

  @override
  String get commonLive => 'Vivir';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Borrar';

  @override
  String get settingsStartOverSubtitle => 'Comienza un nuevo viaje desde cero';

  @override
  String get navConcierge => 'Conserje';

  @override
  String get navAgenda => 'Hoy';

  @override
  String get navDiscover => 'Descubrir';

  @override
  String get navMap => 'Mapa';

  @override
  String get navTrips => 'Viajes';

  @override
  String get navMore => 'Más';

  @override
  String get navRestaurants => 'Restaurantes';

  @override
  String get navTimeline => 'Cronología';

  @override
  String get agendaTabItinerary => 'Días';

  @override
  String get agendaTabRestaurants => 'Restaurantes';

  @override
  String get restaurantsPageTitle => 'Restaurantes';

  @override
  String get restaurantsPageSubtitle =>
      'Explore los restaurantes que Luxora conoce: guarde sus favoritos o deje que el conserje elija la comida de esta noche.';

  @override
  String get restaurantsConciergePick => 'Elige un restaurante para mí';

  @override
  String restaurantsConciergePickDone(String name) {
    return '$name guardado: pídele al Concierge que lo agregue a tu viaje.';
  }

  @override
  String restaurantsSavedCount(int count) {
    return '$count guardado para tu viaje';
  }

  @override
  String get restaurantsEmptyHint =>
      'No hay restaurantes en su radio de descubrimiento: amplíe el radio en el mapa.';

  @override
  String get moreCardRestaurantsSub =>
      'Busque restaurantes y deje que el conserje elija por usted';

  @override
  String get agendaHotelSuggestionsTitle => 'donde alojarse';

  @override
  String agendaHotelSuggestionsSubtitle(int budget) {
    return 'La IA coincide con su presupuesto de viaje de ~$budget USD: toque para ver todas las opciones.';
  }

  @override
  String agendaHotelTopPick(String name) {
    return 'Primera elección: $name';
  }

  @override
  String get agendaStayDropdownHint => 'Seleccione un hotel';

  @override
  String get agendaDiningDropdownHint => 'Selecciona un restaurante';

  @override
  String get agendaDaySelectLabel => 'que dia';

  @override
  String get agendaDayDiningTitle => 'donde comer esta noche';

  @override
  String agendaDayDiningSubtitle(int budget, String tier) {
    return 'Sugerencias para su presupuesto de ~$budget USD (comida de $tier) según el plan de hoy.';
  }

  @override
  String get agendaDiningNearStops => 'Cerca de las paradas de hoy';

  @override
  String get agendaDiningFitsBudget => 'Se ajusta al presupuesto de tu viaje';

  @override
  String get agendaDiningMatchesDay => 'Coincide con el ambiente actual';

  @override
  String get agendaDiningFoodiePick => 'Favorito de los amantes de la comida';

  @override
  String get browseCatRecommended => 'Recomendado';

  @override
  String get browseCatDisneyHotels => 'zona disney';

  @override
  String get browseCatBudgetFriendly => 'Económico';

  @override
  String get browseCatUpscaleLuxury => 'Exclusivo y lujoso';

  @override
  String get browseCatUniversalHotels => 'Área universal';

  @override
  String get browseCatThemeParkDining => 'Cena en el parque temático';

  @override
  String get browseCatUpscaleDining => 'Restaurantes exclusivos y elegantes';

  @override
  String get browseSearchAllHotels =>
      'Busque en el catálogo completo de hoteles…';

  @override
  String get browseSearchAllRestaurants =>
      'Busca en el catálogo completo de restaurantes…';

  @override
  String get browseCategoryEmpty =>
      'No hay coincidencias en esta categoría para su radio: intente buscar o ampliar el descubrimiento.';

  @override
  String get browseFullCatalogHint =>
      'Utilice la búsqueda de arriba para ver el catálogo completo: todos los hoteles y restaurantes que Luxora conoce.';

  @override
  String get agendaPageSubtitle => '¿Qué estoy haciendo ahora?';

  @override
  String get navGems => 'Joyas';

  @override
  String get navFeed => 'Alimentar';

  @override
  String get navTicketSavings => 'Ahorros';

  @override
  String get navStays => 'Corsé';

  @override
  String get morePageTitle => 'Más';

  @override
  String get morePageSubtitle =>
      'Herramientas, cuentas y preferencias de viaje, seleccionadas para un acceso fácil.';

  @override
  String get moreSectionTravelTools => 'HERRAMIENTAS DE VIAJE';

  @override
  String get moreSectionAccount => 'CUENTA';

  @override
  String get moreSectionApp => 'APLICACIÓN';

  @override
  String get moreCardHotelsSub =>
      'La estancia inteligente se adapta a tu estado de ánimo';

  @override
  String get moreCardGemsSub => 'Descubrimientos internos de la guardia local';

  @override
  String get moreCardTicketsSub => 'Comparar ahorros de socios autorizados';

  @override
  String get moreCardWeatherSub => 'Guía diaria basada en el pronóstico';

  @override
  String get moreCardProfileTitle => 'Perfil de viaje';

  @override
  String get moreCardProfileSub => 'Quién viaja, cómo se debe sentir.';

  @override
  String get moreCardFavoritesSub => 'Destinos que has marcado';

  @override
  String get moreCardNotificationsTitle => 'Notificaciones';

  @override
  String get moreCardNotificationsSub =>
      'Alertas de viaje y actualizaciones de conserjería';

  @override
  String get moreCardSettingsSub => 'Tema, paquetes de ciudades y preferencias';

  @override
  String get moreCardAboutSub => 'Por qué estamos construyendo Luxora';

  @override
  String get moreCardHelpSub => 'Guías y soporte de conserjería.';

  @override
  String get moreCardCityPacksSub => 'Desbloquear conserjes de destino';

  @override
  String get moreCardPartnersSub => 'Experiencias de socios destacadas';

  @override
  String get moreCardItinerarySub => 'Tu escapada dorada del día a día';

  @override
  String get moreCardDiscoverSub =>
      'Cenas de moda, experiencias y descubrimientos en vivo';

  @override
  String get savedFavoritesTitle => 'Favoritos guardados';

  @override
  String get savedFavoritesEmpty =>
      'Marque destinos en el mapa o en el feed; aparecerán aquí.';

  @override
  String get helpCenterTitle => 'Centro de ayuda';

  @override
  String get helpCenterBody =>
      'Envíe un correo electrónico a support@luxora.ai para obtener ayuda de conserjería. Próximamente llegarán guías dentro de la aplicación.';

  @override
  String get notificationsComingSoon =>
      'Las notificaciones de viaje llegarán en una actualización futura.';

  @override
  String get partnerOffersTitle => 'Ofertas de socios';

  @override
  String get ticketSavingsTitle => 'Ahorro inteligente en boletos';

  @override
  String get ticketSavingsBadgeLabel => 'AHORRO PRIMA';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora muestra revendedores, paquetes y promociones autorizados para que se sienta como un asesor de lujo, no como un sitio de cupones.';

  @override
  String ticketSavingsBadge(int percent) {
    return 'AHORRE $percent%';
  }

  @override
  String get ticketOfficialPrice => 'Oficial';

  @override
  String get ticketDiscountPrice => 'Precio de Lúxora';

  @override
  String ticketSaveAmount(String amount) {
    return 'Ahorre $amount';
  }

  @override
  String get ticketSaveAmountLabel => 'Ahorros';

  @override
  String ticketSavePerTicket(String amount) {
    return 'Podrías ahorrar $amount por boleto.';
  }

  @override
  String ticketFamilySave(String amount) {
    return 'Ahorro familiar estimado: $amount.';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return 'Ahorro familiar estimado: $amount.';
  }

  @override
  String ticketSource(String source) {
    return 'Fuente: $source';
  }

  @override
  String ticketExpires(String date) {
    return 'Oferta hasta el $date';
  }

  @override
  String get ticketBetterOption => 'Luxora encontró una mejor opción.';

  @override
  String get ticketOverpaying =>
      'Es posible que esté pagando de más el precio de entrada.';

  @override
  String get ticketRecommendedSavings => 'Ahorros recomendados disponibles';

  @override
  String get ticketCalculatorTitle => 'Ahorros potenciales';

  @override
  String get ticketFilterLabel => 'Filtrar';

  @override
  String get ticketFilterAll => 'Todo';

  @override
  String get ticketFilterThemeParks => 'parques temáticos';

  @override
  String get ticketFilterAttractions => 'Atracciones';

  @override
  String get ticketFilterTours => 'Visitas guiadas';

  @override
  String get ticketFilterDining => 'Experiencias gastronómicas';

  @override
  String get ticketFilterWaterParks => 'parques acuáticos';

  @override
  String get ticketFilterFamily => 'actividades familiares';

  @override
  String get ticketFilterEntertainment => 'Entretenimiento';

  @override
  String get ticketSortLabel => 'Ordenar por';

  @override
  String get ticketSortHighestSavings => 'Mayores ahorros';

  @override
  String get ticketSortMostPopular => 'mas popular';

  @override
  String get ticketSortFamilyFriendly => 'Familiar';

  @override
  String get ticketSortLuxury => 'Experiencias de lujo';

  @override
  String get ticketSortClosest => 'mas cerca de mi';

  @override
  String get ticketDealsSectionTitle => 'Ofertas autorizadas';

  @override
  String ticketDealsPricesAsOf(String date) {
    return 'Precios al $date';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'No se pudieron actualizar los precios: se muestran ofertas almacenadas en caché.';

  @override
  String get ticketDealsUpdating => 'Actualizando precios…';

  @override
  String get ticketNoDeals =>
      'No hay ofertas en este filtro; pruebe con otra categoría.';

  @override
  String get ticketConfidenceHigh => 'Alta confianza';

  @override
  String get ticketConfidenceVerified => 'Revendedor verificado';

  @override
  String get ticketConfidenceLimited => 'tiempo limitado';

  @override
  String get ticketAiInsightTitle => 'Recomendación de Lúxora';

  @override
  String get ticketInsightDisneyPass =>
      'Según su itinerario, un pase de 3 días para Walt Disney World en lugar de boletos de un solo día podría ahorrarle a su familia aproximadamente 120 USD.';

  @override
  String get ticketInsightUniversalCombo =>
      'Su plan incluye Universal: un boleto para 2 parques es mejor que comprar días por separado para la mayoría de las familias.';

  @override
  String get ticketInsightSeaworldCombo =>
      'SeaWorld en su ruta: el combo Aquatica a menudo supera a dos entradas separadas.';

  @override
  String get ticketInsightGeneric =>
      'Luxora igualó los ahorros con las paradas de su itinerario: compare antes de comprar en la puerta.';

  @override
  String get ticketInsightMiamiCulture =>
      'La cultura se detiene en su plan: las ofertas de Vizcaya y los socios PAMM pueden superar los precios de entrada esta semana.';

  @override
  String get ticketInsightMiamiEverglades =>
      'El día de los Everglades en su itinerario: los espacios para hidrodeslizadores matutinos suelen ser más baratos a mitad de semana.';

  @override
  String get ticketInsightMiamiWynwood =>
      'Wynwood en su ruta: una caminata artística guiada puede superar el precio de los puestos sin cita previa.';

  @override
  String get ticketItineraryMatchTitle => 'Cheque de ahorro de itinerario';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'Conserje';

  @override
  String conciergeTripFeel(String feel) {
    return 'Sensación del viaje: “$feel”';
  }

  @override
  String get conciergeWelcome =>
      'Bienvenido a Luxora, tu compañero de Florida emocionalmente inteligente.\n\nElige una sugerencia abajo o describe la sensación que quieres que cree tu viaje.';

  @override
  String get conciergeQuickPrompts => 'Sugerencias rápidas';

  @override
  String get conciergeRemembering => 'Recordando para este viaje';

  @override
  String get conciergeStyleMemory => 'Memoria de estilo';

  @override
  String get conciergeInputHint =>
      'Describe la sensación que quieres que cree tu viaje…';

  @override
  String get conciergeGreetingMorning => 'Buen día.';

  @override
  String get conciergeGreetingAfternoon => 'Buenas tardes.';

  @override
  String get conciergeGreetingEvening => 'Buenas noches.';

  @override
  String get conciergeWelcomeWarm =>
      'Estoy aquí para darle forma a Florida según cómo usted quiere sentirse, no una lista de lugares de interés. ¿Qué se te antoja hoy?';

  @override
  String get conciergeRefineStyle => 'Refinar mi estilo';

  @override
  String get conciergeRecallReturning => 'Bienvenido de nuevo.';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'Recuerdo que te gusta $prefs.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'Y querías que este viaje se sintiera: “$feel”.';
  }

  @override
  String get conciergePromptRomantic => 'Escapada romántica';

  @override
  String get conciergePromptWellness => 'Reinicio de bienestar';

  @override
  String get conciergePromptFamily => 'Magia familiar';

  @override
  String get conciergePromptHiddenLuxury => 'Lujo oculto';

  @override
  String get conciergePromptFoodie => 'Aventura gastronómica';

  @override
  String get conciergePromptSoftLuxury => 'Escape de lujo sutil';

  @override
  String get conciergePromptAdventure => 'Modo aventura';

  @override
  String get conciergePromptDisney => 'Disney de noche';

  @override
  String get discoverSearchHint => 'Buscar destinos…';

  @override
  String get discoverSearchTitle => 'Encuentra un destino';

  @override
  String get discoverFromOrlando => 'Desde Orlando';

  @override
  String discoverFromHub(String hub) {
    return 'Desde $hub';
  }

  @override
  String get discoverSearchScopeAll =>
      'Buscando en todo el catálogo de Florida';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'A $radius de Orlando';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return 'Dentro de $radius de $hub';
  }

  @override
  String get discoverSearchEmpty =>
      'No hay coincidencias en este radio; prueba con un nombre más corto, amplía la distancia en Mapa o Feed, o busca “playa”, “Disney” o “manantiales”.';

  @override
  String get discoverFilterAll => 'Todo';

  @override
  String get discoverFilterHotels => 'Hoteles';

  @override
  String get discoverFilterRestaurants => 'Restaurantes';

  @override
  String get discoverFilterDestinations => 'Destinos';

  @override
  String get discoverPopularInRadius => 'Popular en tu radio';

  @override
  String get discoverTrySearching => 'Prueba a buscar';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count destinos · a $radius de Orlando';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$count destinos · dentro de $radius de $hub';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count destinos · toda Florida';
  }

  @override
  String get radius25 => '25 millas';

  @override
  String get radius50 => '50 millas';

  @override
  String get radius100 => '100 millas';

  @override
  String get radiusAllFlorida => 'Toda Florida';

  @override
  String get radiusDesc25 =>
      'Excursiones de un día cerca del centro de Orlando';

  @override
  String get radiusDesc50 => 'Manantiales, costa en el día, Space Coast';

  @override
  String get radiusDesc100 => 'Tampa Bay, Daytona, Golfo más profundo';

  @override
  String get radiusDescAll => 'Los Cayos, Miami y destacados estatales';

  @override
  String get radiusDesc25Miami =>
      'South Beach, Brickell y vecindarios principales';

  @override
  String get radiusDesc50Miami => 'Wynwood, Coconut Grove, Cayo Vizcaíno';

  @override
  String get radiusDesc100Miami =>
      'Everglades, Fort Lauderdale, el sur de Florida más profundo';

  @override
  String get radiusDescAllMiami =>
      'Sendero de los Cayos de Florida y aspectos destacados del estado';

  @override
  String get radiusDesc25Keys =>
      'Key Largo, Islamorada y corredor superior del arrecife';

  @override
  String get radiusDesc50Keys => 'Playas de Marathon, Big Pine y Middle Keys';

  @override
  String get radiusDesc100Keys =>
      'Carretera de ultramar completa a través de Key West';

  @override
  String get radiusDescAllKeys =>
      'Toda la cadena de islas y aguas para excursiones de un día.';

  @override
  String get feedBadge => 'DESCUBRIMIENTO EN VIVO';

  @override
  String get feedTitle => 'Feed de experiencias';

  @override
  String get feedSubtitle =>
      'Lo que se mueve ahora: lugares en tendencia, nuevas aperturas, elecciones de creadores, rutas de temporada y actualizaciones en vivo.';

  @override
  String get feedSubtitleFamily =>
      'Selecciones familiares para su equipo: parques, victorias fáciles y momentos que aterrizan con los niños (y los padres).';

  @override
  String get feedPillTrending => 'En tendencia';

  @override
  String get feedPillNewOpenings => 'Nuevas aperturas';

  @override
  String get feedPillCreator => 'Elecciones de creadores';

  @override
  String get feedPillLive => 'Actualizaciones en vivo';

  @override
  String get feedMoodPrompt => '¿CÓMO QUIERES SENTIRTE?';

  @override
  String get feedMoodPromptFamily =>
      '¿CÓMO DEBE SENTIRSE HOY POR SU TRIPULACIÓN?';

  @override
  String get feedMoodAll => 'Todo';

  @override
  String get feedMoodFamily => 'Magia familiar';

  @override
  String get feedMoodRomantic => 'Romántico';

  @override
  String get feedMoodCalm => 'Calma';

  @override
  String get feedMoodAdventurous => 'Aventurero';

  @override
  String get feedMoodPampered => 'mimado';

  @override
  String get feedMoodSocial => 'Zumbido';

  @override
  String get feedMoodFoodie => 'Conocedor gourmet';

  @override
  String get vibeSunsetReady => 'Atardecer';

  @override
  String get vibeViral => 'Viral';

  @override
  String get vibeFamilyApproved => 'Familiar';

  @override
  String get vibeHiddenGem => 'Joyita oculta';

  @override
  String get vibeRainSafe => 'Lluvia OK';

  @override
  String get vibeDateNight => 'Cita romántica';

  @override
  String get vibeNightVibe => 'Vibe nocturno';

  @override
  String get vibeFoodie => 'Foodie';

  @override
  String get vibeLuxury => 'Lujo';

  @override
  String get vibeTrending => 'Tendencia';

  @override
  String get vibeLive => 'En vivo';

  @override
  String get vibeSeasonal => 'De temporada';

  @override
  String get vibeLocalPick => 'Local';

  @override
  String get vibeAdventure => 'Aventura';

  @override
  String get vibeWellness => 'Bienestar';

  @override
  String get vibeBeachDay => 'Día de playa';

  @override
  String get vibeLuxoraPick => 'Elección Luxora';

  @override
  String get mapLayersTitle => 'CAPAS DE MAPA';

  @override
  String get mapLayerAll => 'Todos';

  @override
  String get mapLayerGems => 'Joyas';

  @override
  String get mapLayerNight => 'Noche';

  @override
  String get mapLayerDateNight => 'Cita';

  @override
  String get mapLayerWeather => 'Mejor clima';

  @override
  String get mapLayerItinerary => 'Itinerario';

  @override
  String get mapExpandMap => 'Ampliar mapa';

  @override
  String get mapFullscreenTitle => 'Mapa';

  @override
  String get mapCloseFullscreen => 'Cerrar mapa';

  @override
  String get mapItineraryDayLabel => 'Mostrar itinerario para';

  @override
  String get mapItineraryCurrentDay => 'Día actual';

  @override
  String get feedFamilyMoodHint =>
      'Parques temáticos, comidas con personajes y premios fáciles para padres: filtrados por etiquetas familiares.';

  @override
  String get feedEmptyHint =>
      'No hay tarjetas del feed en este radio; prueba 50 mi o Toda Florida para la costa del Golfo y los Cayos.';

  @override
  String get feedEmptyHintFamily =>
      'No hay tarjetas etiquetadas con familias en este radio: prueba Aventurero o Todo, o amplía el radio.';

  @override
  String get gemsBadge => 'CURADURÍA DE INSIDERS';

  @override
  String get gemsTitle => 'Joyas ocultas';

  @override
  String get gemsSubtitle =>
      'Descubrimientos secretos que los locales protegen: por qué son especiales, cuándo ir, cuánta gente hay y consejos que no verás en una postal.';

  @override
  String get gemsPillHidden => 'Lugares escondidos';

  @override
  String get gemsPillLocal => 'Solo locales';

  @override
  String get gemsPillInsider => 'Consejos insider';

  @override
  String get gemsPillCrowd => 'Info de multitudes';

  @override
  String get gemsEmptyHint =>
      'Aún no hay joyas en este radio; amplía a 50 mi o más para manantiales y secretos de Space Coast.';

  @override
  String get gemsSearchHint => 'Buscar joyas ocultas y destinos…';

  @override
  String get gemLocalSecret => 'SECRETO LOCAL';

  @override
  String get gemsMatchedBadge => 'tu estilo';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gemas coinciden con tu estilo',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
  }

  @override
  String get gemWhySpecial => 'Por qué es especial';

  @override
  String get gemBestTime => 'Mejor momento para ir';

  @override
  String get gemCrowdLevel => 'Nivel de gente';

  @override
  String get gemInsiderTip => 'Consejo insider';

  @override
  String get gemLocalNote => 'Nota solo para locales';

  @override
  String get mapBadge => 'MAPA IA';

  @override
  String get mapTitle => 'Tu ruta inteligente';

  @override
  String get mapSubtitle =>
      'Pines para tu día curado: diamantes dorados son Joyas, marcadores cian son la cronología de hoy y la línea dorada es la ruta emocional.';

  @override
  String get mapPlanDayTitle => 'planificar mi día';

  @override
  String get mapPlanDaySuggested =>
      'Sugerido según su estado de ánimo de viaje: marque lugares para hacerlo suyo.';

  @override
  String get mapPlanDayEmpty =>
      'Marque destinos (♥) y Luxora creará una ruta optimizada desde su centro de Orlando: menos conducción, más sensaciones.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count paradas · $miles · $time recorrido';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'A partir de $hotel';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '$time recorrido · $miles desde la parada anterior';
  }

  @override
  String get mapCrowdLevelQuiet => 'Tranquilo';

  @override
  String get mapCrowdLevelModerate => 'Moderado';

  @override
  String get mapCrowdLevelBusy => 'Ocupado';

  @override
  String get mapCrowdLevelPacked => 'Lleno';

  @override
  String mapCrowdAtStop(String level) {
    return 'Multitud: $level';
  }

  @override
  String get mapParkingLevelEasy => 'Fácil';

  @override
  String get mapParkingLevelModerate => 'Moderado';

  @override
  String get mapParkingLevelDifficult => 'Difícil';

  @override
  String get mapParkingLevelLimited => 'Limitado · llegar temprano';

  @override
  String mapParkingAtStop(String level) {
    return 'Estacionamiento: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'Fricción de conducción: $score/90';
  }

  @override
  String get mapRerouteButton => 'Desvíe la ruta para paradas más tranquilas';

  @override
  String mapRerouteApplied(int count) {
    return 'Día ajustado: $count paradas intercambiadas por multitudes más ligeras.';
  }

  @override
  String get mapRerouteNone => 'Tu ruta ya luce tranquila.';

  @override
  String get mapRerouteRainHint =>
      'No te preocupes — ya encontré alternativas cercanas para que tu día siga siendo agradable y sin estrés.';

  @override
  String get dayFlowSwapTitle => 'Cambiar esta parada';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'Dile a Luxora qué preferirías hacer en lugar de $current.';
  }

  @override
  String get dayFlowSwapTemplate => 'Estaba pensando en algo más como...';

  @override
  String get dayFlowSwapHint =>
      'p.ej. un parque tranquilo esta mañana o mariscos para cenar';

  @override
  String get dayFlowSwapApply => 'actualizar mi dia';

  @override
  String get dayFlowSwapViewPlace => 'Ver parada actual';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return 'Actualizado: $newStop es ahora tu parada de $phase.';
  }

  @override
  String get dayFlowSwapNoMatch =>
      'No se pudo encontrar una coincidencia cercana; intenta ser más específico.';

  @override
  String get dayFlowSwapTapToChange => 'Cambiar esta parada';

  @override
  String get dayFlowSwapHoldSpeak => 'Mantenga para hablar';

  @override
  String get dayFlowSwapListening => 'Escuchando…';

  @override
  String get rightNowButton => '¿Qué debemos hacer ahora?';

  @override
  String get rightNowEmpty =>
      'Aún no hay ningún momento fuerte en su radio: amplíe, descubra o marque algunos favoritos.';

  @override
  String get rightNowResultTitle => 'AHORA MISMO';

  @override
  String get rightNowTapForDetails => 'Toca para más detalles';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return 'Estás a $minutes minutos de $district. El clima es perfecto: toma un café en $place y luego camina por $walkArea antes de que llegue la multitud ($crowd crowds).';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return 'Estás a $minutes minutos de $district. Los cielos se ven fantásticos: dirígete a $place mientras la multitud sigue siendo $crowd.';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return 'Se acerca la hora dorada: sal en unos $minutes minutos hacia $place ($crowd al atardecer).';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return 'Lluvia en el radar: $minutes minutos para una acogedora elección interior: $place.';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return 'Calma durante la siesta: $minutes minutos para un fácil reinicio familiar en $place.';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return 'Energía para una cita nocturna: $minutes minutos hasta $place antes de las prisas.';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return 'Ventana de silencio: $minutes minutos hasta $place ($crowd ahora mismo).';
  }

  @override
  String get goldenHourTitle => 'hora dorada';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return 'Salga a las $time ($minutes minutos en coche) hacia $place; llegue ~15 minutos antes del atardecer.';
  }

  @override
  String get goldenHourKindBeach => 'Ventana del atardecer en la playa';

  @override
  String get goldenHourKindRooftop => 'Hora dorada en la azotea';

  @override
  String get goldenHourKindScenic => 'Momento de la fotografía escénica';

  @override
  String get vacationScoreTitle => 'Puntuación de vacaciones';

  @override
  String vacationScoreSubtitle(int score) {
    return 'Hoy parece un día de $score/100.';
  }

  @override
  String get onboardOccasionLabel => '¿Cuál es la ocasión?';

  @override
  String get onboardThemeParksOccasionHint =>
      'Desbloquea Disney y Universal para agregar eventos de parques temáticos a continuación; verás esos chips inmediatamente después de la compra.';

  @override
  String get occasionGeneral => 'Solo explorando';

  @override
  String get occasionAnniversary => 'Aniversario';

  @override
  String get occasionHoneymoon => 'Luna de miel';

  @override
  String get occasionDateNight => 'cita nocturna';

  @override
  String get occasionProposal => 'viaje de propuesta';

  @override
  String get occasionFamily => 'familia con niños';

  @override
  String get occasionDisneyAdventure => 'aventura disney';

  @override
  String get occasionUniversalAdventure => 'aventura universal';

  @override
  String get localSecretTitle => 'secreto local';

  @override
  String get localSecretWinterParkParkAvenue =>
      'Los lugareños se esconden en el patio del callejón detrás de la librería: no hay señales de tráfico.';

  @override
  String get localSecretWorldFoodTrucks =>
      'Ordene la pesca del día, no la hamburguesa: la fila se mueve más rápido en la ventana del fondo.';

  @override
  String get localSecretWekiwaSprings =>
      'Evite el paseo marítimo principal después de las 2 p. m.: el comienzo del sendero norte permanece tranquilo.';

  @override
  String get localSecretDisneySpringsParking =>
      'El mejor estacionamiento es el garaje naranja: camine por el lado del puerto deportivo, no por la entrada principal.';

  @override
  String get localSecretLakeEolaSunset =>
      'Mire hacia el lado del anfiteatro para tomar fotografías de cisnes mientras el cielo se vuelve dorado.';

  @override
  String get localSecretMiamiWynwoodAlley =>
      'Pase por el callejón de carga detrás de Panther Coffee: los lugareños fotografían murales sin la multitud principal.';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      'Compre primero el cafecito en el carrito de la ventana: los clientes habituales del banco se abren cuando sostiene un cortadito.';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      'Evite las prisas de la terraza principal: ingrese desde el jardín este y camine por el paseo marítimo de manglares en el sentido contrario a las agujas del reloj.';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      'Mire hacia el este a las 7 a. m. en Lummus: los pasteles art déco brillan antes de que llegue la multitud del brunch.';

  @override
  String get localSecretMiamiPantherAlley =>
      'Haga su pedido en la ventana, camine por el callejón en el sentido de las agujas del reloj: la mejor luz mural llega a la pared turquesa a las 8:45 a.m.';

  @override
  String get localSecretTampaBayRiverwalkParking =>
      'Usa el garaje de Whiting Street — camina hacia el sur junto al río para evitar cierres cerca del muelle.';

  @override
  String get localSecretTampaBayClearwaterSunset =>
      'Evita las multitudes del Pier 60 — camina hacia Sand Key 40 minutos antes del atardecer.';

  @override
  String get localSecretTampaBayDaliGarden =>
      'Reserva la última entrada de la tarde — el mirador del jardín este captura la luz del puente sin aglomeraciones.';

  @override
  String get localSecretTampaBayPierTiming =>
      'Entrada al muelle entre semana a las 4 PM — atardecer sin tráfico de carriolas de fin de semana.';

  @override
  String get localSecretTampaBayYborCourtyard =>
      'Pide sándwiches cubanos para llevar — come en el patio de ladrillo que usan los locales después de las 8 PM.';

  @override
  String get localSecretTampaBaySpongeDocks =>
      'Almuerza primero en el muelle, barcos de esponja después — los tours se reducen entre semana después de la 1 PM.';

  @override
  String get localSecretVegasBellagioFountains =>
      'Quédate en el césped central 15 min antes — la baranda delantera tapa la coreografía.';

  @override
  String get localSecretVegasFremontTiming =>
      'Martes a jueves 21:00 bajo la cúpula — show Viva Vision completo sin multitudes del sábado.';

  @override
  String get localSecretVegasCaesarsEntrance =>
      'Usa el pasaje del garaje — evita el cuello de botella del Strip a la hora de cena.';

  @override
  String get localSecretVegasVenetianWalk =>
      'Paseo canal cubierto al mediodía — cruce del Strip con aire sin alerta de calor.';

  @override
  String get nycMoodRoutesTitle => 'Rutas de ambiente Nueva York';

  @override
  String get localSecretNycTimesSquareStrategy =>
      'Entra por calles laterales de la 7ª Ave — evita el cruce abarrotado y mantén vistas a Broadway.';

  @override
  String get localSecretNycObservationDeck =>
      'Reserva el último turno antes del atardecer — luz dorada sin colas del mediodía.';

  @override
  String get localSecretNycCentralParkEntrance =>
      'Usa el cruce de la calle 72 — camino más rápido a Bethesda sin multitudes de Columbus Circle.';

  @override
  String get localSecretNycBroadwayTickets =>
      'La fila matinal TKTS abre temprano — asientos rush vencen precios turísticos.';

  @override
  String get localSecretNycBrooklynBridgePhoto =>
      'Washington Street DUMBO a las 8 AM — encuadre vacío antes de los grupos turísticos.';

  @override
  String get localSecretNycFerryGoldenHour =>
      'Ferry a Staten Island al atardecer — vuelta por el puerto gratis sin barco turístico.';

  @override
  String get momentsTitle => 'MOMENTOS DE LUXORA';

  @override
  String get momentsSubtitle => 'Busque un sentimiento, no un lugar.';

  @override
  String get momentFeelRelaxed => 'Siéntete relajado';

  @override
  String get momentImpressSpouse => 'Impresionar a mi cónyuge';

  @override
  String get momentPerfectSunset => 'Puesta de sol perfecta';

  @override
  String get momentFamilyMemory => 'Memoria familiar';

  @override
  String get momentLuxuryValue => 'Lujo sin gastar de más';

  @override
  String get momentPromptRelaxed =>
      'Quiero sentirme completamente relajado durante las próximas horas: lento, hermoso, sin multitudes.';

  @override
  String get momentPromptImpressSpouse =>
      'Esta noche quiero impresionar a mi cónyuge con algo romántico e inesperado.';

  @override
  String get momentPromptPerfectSunset =>
      'Quiero el momento perfecto del atardecer en Florida: ¿dónde deberíamos estar y cuándo deberíamos irnos?';

  @override
  String get momentPromptFamilyMemory =>
      'Quiero un momento familiar memorable que sea fácil para los padres y mágico para los niños.';

  @override
  String get momentPromptLuxuryValue =>
      'Quiero un lujo que parezca especial sin gastar una fortuna.';

  @override
  String get visualShareImageButton => 'Compartir tarjeta de imagen';

  @override
  String get tripStoryTitle => 'Tu historia de viaje';

  @override
  String tripStoryHeading(String title) {
    return '$title — tu historia de Florida';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return 'Viniste por $moods.';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return 'Este capítulo: $title.';
  }

  @override
  String get tripStoryBeatClosing =>
      'Luxora dio forma a los momentos: tú los viviste.';

  @override
  String get tripsOpenStory => 'tu historia';

  @override
  String get conciergeVoiceHold => 'Mantenga para hablar';

  @override
  String get conciergeVoiceSoon =>
      'El conserje por voz llegará pronto; por ahora, toque un momento o escriba cómo quiere sentirse.';

  @override
  String get conciergeVoiceListening => 'Luxora está escuchando...';

  @override
  String get conciergeVoiceSpeaking => 'Luxora está hablando...';

  @override
  String get conciergeVoiceRelease => 'Liberar para enviar';

  @override
  String get conciergeVoiceSend => 'Enviar a Lúxora';

  @override
  String get conciergeVoiceProcessing => 'Enviando a Luxora…';

  @override
  String get conciergeVoiceNoSpeech =>
      'No entendí eso: mantén presionado el botón, habla y luego suéltalo.';

  @override
  String get conciergeVoicePreviewFailed =>
      'No se pudo reproducir una vista previa. Comprueba tu volumen y vuelve a intentarlo.';

  @override
  String get conciergeVoiceUnavailable =>
      'La voz no está disponible en este dispositivo.';

  @override
  String get conciergeVoiceSettingsTitle => 'voz de luxora';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Elija cómo suena Luxora cuando habla: acento, tono y ritmo. Utiliza las voces integradas de su dispositivo.';

  @override
  String get conciergeVoiceRateLabel => 'ritmo de conversación';

  @override
  String get conciergeVoiceRateSlow => 'Lento';

  @override
  String get conciergeVoiceRateNatural => 'Natural';

  @override
  String get conciergeVoiceRateFast => 'Rápido';

  @override
  String get conciergeVoicePreview => 'Vista previa de voz';

  @override
  String get conciergeVoicePreviewSample =>
      'Hola, soy Luxora. Dime cómo quieres que se sienta este viaje.';

  @override
  String get conciergeVoiceDeviceNote =>
      'Descargue más voces en Configuración de iPhone → Accesibilidad → Contenido hablado → Voces. Regrese aquí y toque Actualizar.';

  @override
  String get conciergeVoiceDeviceSection => 'Voces en este iPhone';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'Incluye voces que descargaste: toca una para usarla en Luxora.';

  @override
  String get conciergeVoiceRefreshList => 'Actualizar lista de voces';

  @override
  String get conciergeVoiceShowAllLanguages => 'Mostrar todos los idiomas';

  @override
  String get conciergeVoiceOpenSettings =>
      'Abrir la configuración de voz del iPhone';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'No se encontraron voces: descargue paquetes en Configuración y luego actualice.';

  @override
  String get conciergeVoicePresetSection => 'personajes rapidos';

  @override
  String get conciergeVoiceRegionRecommended => 'Recomendado';

  @override
  String get conciergeVoiceRegionEnglish => 'Inglés';

  @override
  String get conciergeVoiceRegionRussian => 'ruso';

  @override
  String get conciergeVoiceRegionSpanish => 'Español';

  @override
  String get conciergeVoiceRegionFrench => 'Francés';

  @override
  String get conciergeVoiceRegionGerman => 'Alemán';

  @override
  String get conciergeVoiceRegionOther => 'Otro';

  @override
  String get conciergeVoicePresetMatchApp =>
      'Idioma de la aplicación Match · Femenino';

  @override
  String get conciergeVoicePresetEnUsF => 'Americana · Mujer';

  @override
  String get conciergeVoicePresetEnUsM => 'Americano · Masculino';

  @override
  String get conciergeVoicePresetEnGbF => 'Británico · Mujer';

  @override
  String get conciergeVoicePresetEnGbM => 'Británico · Masculino';

  @override
  String get conciergeVoicePresetRuF => 'Ruso · Mujer';

  @override
  String get conciergeVoicePresetRuM => 'Ruso · Masculino';

  @override
  String get conciergeVoicePresetEsF => 'Español · Mujer';

  @override
  String get conciergeVoicePresetEsM => 'Español · Masculino';

  @override
  String get conciergeVoicePresetFrF => 'Francés · Mujer';

  @override
  String get conciergeVoicePresetFrM => 'Francés · Masculino';

  @override
  String get conciergeVoicePresetDeF => 'Alemán · Mujer';

  @override
  String get conciergeVoicePresetDeM => 'Alemán · Masculino';

  @override
  String get conciergeThinking => 'Luxora está pensando...';

  @override
  String get conciergeItinerarySynced =>
      'Lo agregué a tu Agenda: las mismas paradas en el Mapa, listas para compartir.';

  @override
  String get conciergeAgendaUpdatedSnack =>
      'Tu agenda está lista en Mapa y Agenda';

  @override
  String get conciergeAgendaSyncFailed =>
      'El mapa y la agenda no se actualizaron. Pruebe con una solicitud clara, por ejemplo: planifique un viaje de 4 días a Disney y Universal.';

  @override
  String get conciergeViewAgendaOnMap => 'Ver agenda';

  @override
  String get conciergeAgendaDealsIntro =>
      'Relacioné las ofertas de boletos autorizados con las paradas en su agenda; compare antes de comprar en la puerta:';

  @override
  String get conciergeAgendaDealsSnack =>
      'Ofertas de entradas adaptadas a su agenda';

  @override
  String get conciergeViewTicketDeals => 'Ver ofertas';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · est. guardar $amount a través de $source';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return '$count paradas en tu agenda tienen ofertas de socios: compara las ofertas autorizadas antes de comprar en la puerta.';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return 'Est. ahorro familiar · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals => 'Busca ofertas para tu agenda →';

  @override
  String get conciergeFreshThread =>
      'Su agenda está en Mapa y Agenda. Archivé este chat y comencé de nuevo: modifiqué el día, encontré ofertas o pregunté algo nuevo.';

  @override
  String get conciergeThreadArchivedSnack =>
      'Chat archivado: nuevo hilo iniciado';

  @override
  String get conciergeNewConversationTooltip => 'Nueva conversación';

  @override
  String get itinerarySameAsMapAgenda =>
      'El plan Concierge de hoy, también fijado en el mapa. Comparte la tarjeta del día a continuación.';

  @override
  String get conciergeTicketsFoundIntro =>
      'Encontré ofertas de boletos autorizadas para su viaje: toque Reservar boletos en Agenda para obtener enlaces directos:';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title: $price a través de $source (ahorre $savings)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'Cada parada coincidente en Agenda ahora tiene un botón Reservar boletos con el enlace del revendedor.';

  @override
  String itineraryBookTickets(String amount) {
    return 'Reservar entradas · Ahorra $amount';
  }

  @override
  String get itineraryOpenTicketDeal => 'reservar entradas';

  @override
  String conciergeTripSaved(String title) {
    return '\"$title\" guardado en tus Viajes: abre la pestaña Viajes en cualquier momento para volver a visitarla.';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return 'Guardó \"$title\" con $count experiencias en su línea de tiempo.';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return 'Tienes $count viajes guardados:';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title ($dates) — $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      'Aún no tienes ningún viaje guardado; pídeme que planifique algo y luego di \"guardar mi viaje\".';

  @override
  String get conciergeSavedTripsHint =>
      'Abra la pestaña Viajes para ver tarjetas, compartir o editar fechas.';

  @override
  String get conciergeAiError =>
      'No pude comunicarme con Luxora en este momento. Comprueba tu conexión y vuelve a intentarlo.';

  @override
  String get conciergeAiErrorVoice =>
      'Lo siento, no pude conectarme con el conserje de Luxora en este momento.';

  @override
  String get conciergeAiNotConfigured =>
      'El conserje en vivo de Luxora aún no está conectado a esta compilación: la URL de Supabase y la clave anónima deben integrarse en la aplicación y se debe implementar la función perimetral. El mapa y el itinerario aún funcionan; consulte docs/CONCIERGE_AI.md para la configuración.';

  @override
  String get conciergeAiOpenAiNotReady =>
      'Luxora te escuchó, pero el cerebro del conserje aún no está en línea. Establezca OPENAI_API_KEY en los secretos de Supabase para la función perimetral (procesador brillante) y vuelva a intentarlo.';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'Luxora no pudo encontrar la función de conserjería \"$function\". Implementarlo en Supabase o arreglar SUPABASE_CONCIERGE_FUNCTION en esta compilación.';
  }

  @override
  String get conciergeAiAuthFailed =>
      'Luxora no pudo autenticarse con Supabase; verifique que SUPABASE_ANON_KEY coincida con su proyecto.';

  @override
  String get mapAiPowers => 'Poderes del mapa IA';

  @override
  String get mapNavLayerTitle => 'Capa de navegación IA (próxima)';

  @override
  String get mapNavLayerSubtitle =>
      'Más allá del descubrimiento: inteligencia en vivo sobre si una parada vale la pena ahora.';

  @override
  String get mapBookingTitle => 'Reservas sin fricción (partners)';

  @override
  String get mapCapMoodTitle => 'Rutas según el ánimo';

  @override
  String get mapCapMoodDesc =>
      'Caminos que encajan con romance, bienestar, familia o aventura, no solo el trayecto más corto.';

  @override
  String get mapCapDriveTitle => 'Optimización del tiempo de manejo';

  @override
  String get mapCapDriveDesc =>
      'Secuenciación inteligente para que pases más tiempo sintiendo y menos en tráfico entre destacados.';

  @override
  String get mapCapWeatherTitle => 'Sugerencias según el clima';

  @override
  String get mapCapWeatherDesc =>
      'Rutas alternativas por lluvia y ventanas en vivo para playas, terrazas y manantiales.';

  @override
  String get mapCapSunsetTitle => 'Mejor atardecer ahora';

  @override
  String get mapCapSunsetDesc =>
      'Dónde pega mejor la hora dorada en los próximos 90 minutos según cielo y patrones de gente.';

  @override
  String get mapCapCrowdTitle => 'Predicción de multitudes';

  @override
  String get mapCapCrowdDesc =>
      'Cuándo parques, manantiales y lugares virales se calman, antes de que llegues.';

  @override
  String get mapCapGemsTitle => 'Joyas ocultas cercanas';

  @override
  String get mapCapGemsDesc =>
      'Pines insider que aparecen en tu ruta, no solo paradas turísticas de top 10.';

  @override
  String get mapCapPersonalTitle => 'Personalización de ruta';

  @override
  String get mapCapPersonalDesc =>
      'La sensación, el ritmo y el presupuesto de tu viaje redibujan el mapa en tiempo real.';

  @override
  String get mapFutureCrowdTitle => 'Calor de multitudes en vivo';

  @override
  String get mapFutureCrowdDesc =>
      'Densidad en tiempo real en manantiales, parques y terrazas virales: ¿vale la pena ahora?';

  @override
  String get mapFutureParkingTitle => 'Dificultad de estacionamiento';

  @override
  String get mapFutureParkingDesc =>
      'Puntuación de fricción antes de decidir: valet, garaje o el punto ideal para rideshare.';

  @override
  String get mapFutureTrafficTitle => 'Puntuación de fricción al manejar';

  @override
  String get mapFutureTrafficDesc =>
      'Rutas ponderadas por estrés: no solo minutos, también cómo se sentirá el trayecto.';

  @override
  String get mapFutureRerouteTitle => 'Cambio espontáneo de ruta';

  @override
  String get mapFutureRerouteDesc =>
      '¿Cambio de clima o pico de gente? Un toque para rediseñar el resto del día.';

  @override
  String affiliateReserve(String category) {
    return 'Reservar · $category · partner premium (pronto)';
  }

  @override
  String get affiliateHotels => 'Hoteles y staycations';

  @override
  String get affiliateExperiences => 'Experiencias y tours';

  @override
  String get affiliateRestaurants => 'Reservas de restaurantes';

  @override
  String get affiliateThemeParks => 'Entradas a parques temáticos';

  @override
  String get affiliateDayPasses => 'ResortPass / pases de día';

  @override
  String get affiliateCarRentals => 'Alquiler de autos';

  @override
  String get affiliateWellness => 'Reservas de bienestar';

  @override
  String get tripsBadge => 'COLECCIONES';

  @override
  String get tripsTitle => 'Viajes guardados';

  @override
  String get tripsSubtitle =>
      'Toca un viaje para ver una instantánea en vivo: próximo momento, clima, atardecer y cronología.';

  @override
  String get tripsFooter =>
      'Portadas de viaje del catálogo de estados de ánimo · sincronización Supabase Fase 2';

  @override
  String get tripsPlanNew => 'Planifica un nuevo viaje';

  @override
  String get tripsEmptyTitle => 'Aún no hay viajes guardados';

  @override
  String get tripsEmptyBody =>
      'Planifica tu primer viaje y aparecerá aquí, listo para volver a visitarlo en cualquier momento.';

  @override
  String get tripsDeleteTitle => '¿Eliminar viaje?';

  @override
  String tripsDeleteBody(String title) {
    return 'Esto elimina \"$title\" de tus viajes guardados. Esto no se puede deshacer.';
  }

  @override
  String get tripsDeleted => 'Viaje eliminado';

  @override
  String get tripsEditDates => 'Fechas de viaje';

  @override
  String get tripsSaveDates => 'Guardar fechas';

  @override
  String get tripsDatesUpdated => 'Fechas de viaje actualizadas';

  @override
  String get tripsDatesFlexible => 'Fechas flexibles';

  @override
  String get tripsLiveWeather => 'Clima en vivo';

  @override
  String get tripsNextUp => 'Siguiente';

  @override
  String get tripsSunsetWindow => 'ventana del atardecer';

  @override
  String get tripsTimelineSnapshot => 'Instantánea de la línea de tiempo';

  @override
  String get tripsOpenAgenda => 'Abrir agenda completa';

  @override
  String get tripsOpenTimeline => 'Abrir línea de tiempo completa';

  @override
  String get tripsShare => 'Compartir';

  @override
  String get shareItineraryFooter =>
      'Planificado con Luxora, su compañero de Florida emocionalmente inteligente.';

  @override
  String get shareCardCta => 'Planifica el tuyo en Luxora';

  @override
  String get shareCardDownloadHint =>
      'Gratis en iOS y Android · luxora.ai/download';

  @override
  String shareCardShareMessage(String title, String url) {
    return '$title\n\nPlanificado con Luxora AI: viajes emocionalmente inteligentes a Florida.\nObtén la aplicación: $url';
  }

  @override
  String get conciergeLocalTryPlanning =>
      'Dime cómo quieres que se sienta el viaje, p. \"Planifique un viaje relajado de 2 días a Orlando con manantiales y comida\". Construiré una agenda real en tu dispositivo (no se requiere nube).';

  @override
  String conciergeLocalPlanBuilt(String city, int count) {
    return 'Creé tu día de $city: $count paradas secuenciadas por estado de ánimo y tiempo de conducción. Abra Agenda o Mapa para ver su ruta.';
  }

  @override
  String get conciergeLocalNoIntent =>
      'Describe la sensación que deseas, o di \"Planifica mi día en Orlando\", y crearé una ruta real en el dispositivo.';

  @override
  String get ticketConciergeIntelBadge => 'Información de conserjería';

  @override
  String get ticketConciergeIntelAgenda =>
      'Adaptado a las paradas de su agenda, no a una lista de cupones genérica.';

  @override
  String get agendaFixAfternoonRain => 'Lluvia entrante - arregla mi tarde';

  @override
  String agendaRainRerouteDone(int count, int score) {
    return 'Actualización por la tarde: $count paradas trasladadas al interior. Puntuación de vacaciones $score/100.';
  }

  @override
  String get agendaRainRerouteNone => 'Tu plan ya funciona para este clima.';

  @override
  String get cloudTripsTitle => 'Copia de seguridad en la nube';

  @override
  String get cloudTripsSubtitle =>
      'Tus viajes guardados se sincronizan en todos los dispositivos cuando inicias sesión, incluidos con el desbloqueo de cualquier ciudad.';

  @override
  String get cloudTripsMoreSubSignedOut =>
      'Inicia sesión para hacer una copia de seguridad de los viajes guardados';

  @override
  String cloudTripsMoreSubSignedIn(String email) {
    return 'Iniciaste sesión como $email';
  }

  @override
  String get cloudTripsMoreSubSyncing => 'Sincronizando…';

  @override
  String get cloudTripsUnlockRequired =>
      'Desbloquea un paquete de ciudad para habilitar la copia de seguridad en la nube';

  @override
  String get cloudTripsUnlockCta => 'Desbloquear conserje';

  @override
  String get cloudTripsEmailHint => 'Dirección de correo electrónico';

  @override
  String get cloudTripsSendCode => 'Enviar código de inicio de sesión';

  @override
  String get cloudTripsCodeHint =>
      'Código de 6 dígitos del correo electrónico.';

  @override
  String get cloudTripsVerify => 'Verificar e iniciar sesión';

  @override
  String get cloudTripsCodeSent =>
      'Revise su correo electrónico para obtener un código de inicio de sesión';

  @override
  String get cloudTripsSignOut => 'desconectar';

  @override
  String get cloudTripsSyncNow => 'Sincronizar ahora';

  @override
  String get cloudTripsSyncSuccess => 'Viajes sincronizados';

  @override
  String get cloudTripsSyncError =>
      'Error de sincronización: inténtalo de nuevo';

  @override
  String get cloudTripsBannerTitle =>
      'Haz una copia de seguridad de tus viajes';

  @override
  String get cloudTripsBannerBody =>
      'Inicia sesión para restaurar viajes en un nuevo teléfono o tableta.';

  @override
  String get cloudTripsBannerCta => 'Configurar copia de seguridad en la nube';

  @override
  String get cloudTripsNotConfigured =>
      'La copia de seguridad en la nube requiere Supabase (configuración de desarrollo)';

  @override
  String get paywallFeatureCloudBackup =>
      'Copia de seguridad de viaje en la nube';

  @override
  String shareSubject(String title) {
    return 'Mi $title';
  }

  @override
  String get itineraryBadge => 'TU CRONOLOGÍA';

  @override
  String get itineraryTagline =>
      'Cada momento conectado: la anticipación integrada, el estrés fuera.';

  @override
  String itineraryDayTab(int day, String label) {
    return 'Día $day · $label';
  }

  @override
  String get detailWhySpecial => 'Por qué es especial';

  @override
  String get detailBestTime => 'Mejor momento para ir';

  @override
  String get detailInsiderTips => 'Consejos insider';

  @override
  String get detailReserve => 'Reservar experiencia';

  @override
  String get detailReserveSoon => 'Partners de reserva próximamente.';

  @override
  String get detailNearbyGems => 'Joyas cercanas';

  @override
  String get detailDuration => 'Duración';

  @override
  String get detailPractical => 'Detalles prácticos';

  @override
  String get detailCostRange => 'rango de costos';

  @override
  String get detailBestFor => 'Lo mejor para';

  @override
  String get detailVibeMatch => 'Partido de ambiente';

  @override
  String get detailCrowd => 'Gente';

  @override
  String get detailTravelIntelTitle => 'Perspectiva de fricción en el viaje';

  @override
  String get detailTravelIntelSubtitle =>
      'Predicho a partir de categoría, tiempo y distancia, no de sensores en vivo.';

  @override
  String detailCrowdOutlook(String level) {
    return 'Multitud: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'Estacionamiento: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'Fricción de conducción: $score/90';
  }

  @override
  String get detailPrice => 'Precio';

  @override
  String get detailLocation => 'Ubicación';

  @override
  String get detailGetDirections => 'Obtener direcciones';

  @override
  String get detailParkMap => 'Mapa del parque';

  @override
  String get detailViewOnMap => 'Ver en el mapa';

  @override
  String get detailMapsError =>
      'No se pudieron abrir mapas en este dispositivo.';

  @override
  String get detailGoogleMaps => 'mapas de google';

  @override
  String get detailAppleMaps => 'Mapas de Apple';

  @override
  String get detailOpenInMaps => 'Abrir en mapas';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time en coche desde Orlando';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$time en coche desde $hub';
  }

  @override
  String get detailSaveToItinerary => 'Guardar en itinerario';

  @override
  String get detailSaved => 'Guardado';

  @override
  String get detailSavedSnack => 'Guardado en tu itinerario';

  @override
  String get detailRemovedSnack => 'Eliminado de tu itinerario';

  @override
  String get detailSetHomeBase => 'Establecer como base de operaciones';

  @override
  String get detailHomeBaseActive => 'Tu base de viaje';

  @override
  String get detailHomeBaseHint => 'La ruta de tu día comienza y termina aquí.';

  @override
  String get detailHomeBaseSetSnack =>
      'Establecer como base de inicio de su viaje';

  @override
  String get detailHomeBaseClearedSnack => 'Base de operaciones despejada';

  @override
  String get detailMenuTitle => 'Aspectos destacados del menú';

  @override
  String get detailMenuDisclaimer =>
      'Aspectos destacados seleccionados: el menú completo y los precios pueden variar según el lugar.';

  @override
  String get detailMenuComingSoon =>
      'Todavía estamos seleccionando este menú. Mientras tanto, vea el menú y los precios más recientes en línea.';

  @override
  String get detailViewMenuOnline => 'Ver menú en línea';

  @override
  String get photoClose => 'Cerrar';

  @override
  String get photoViewDestination => 'Ver destino';

  @override
  String get photoBy => 'Foto por';

  @override
  String get photoOn => 'en';

  @override
  String milesFromOrlando(String distance) {
    return '$distance desde Orlando';
  }

  @override
  String milesFromHub(String distance, String hub) {
    return '$distance desde $hub';
  }

  @override
  String get landingBadge => 'FLORIDA · MVP ORLANDO';

  @override
  String get landingTitle1 => 'Las vacaciones';

  @override
  String get landingTitle2 => 'ya comenzaron.';

  @override
  String get landingSubtitle =>
      'Luxora AI es tu concierge emocionalmente inteligente: joyas ocultas, atardeceres en rooftops y momentos diseñados para sentirse inolvidables incluso antes de hacer la maleta.';

  @override
  String get landingBegin => 'Comenzar mi viaje';

  @override
  String get landingTalk => 'Hablar con Luxora';

  @override
  String get landingWhy => 'Por qué estamos creando esto';

  @override
  String get storyTitle => 'nuestra historia';

  @override
  String get storyHeroBadge => 'CONSTRUIDO CON INTENCIÓN';

  @override
  String get storyHeroCreator => 'Creador, Luxora AI';

  @override
  String get storyHeroSubtitle =>
      'Florida · viajes donde las emociones son lo primero';

  @override
  String get storyHeading => 'Por qué estamos construyendo Luxora';

  @override
  String get storyProblemLead =>
      'Nos dimos cuenta de que planificar un viaje a Florida/Orlando es sorprendentemente fragmentado y abrumador.';

  @override
  String get storyJumpingBetween => 'La gente suele saltar entre';

  @override
  String get storyProblemTail =>
      '…y aún así acabar con planes turísticos genéricos.';

  @override
  String get storyDifferentLead => 'Queremos construir algo diferente.';

  @override
  String get storyNotPlannerTitle => 'No sólo un planificador de viajes';

  @override
  String get storyNotPlannerBody =>
      'Un compañero de viaje de IA que da prioridad a las emociones.';

  @override
  String get storyInsteadOfAsking => 'en lugar de preguntar';

  @override
  String get storyAppAsks => 'La aplicación pregunta';

  @override
  String get storyInsteadQuestion => '\"¿A dónde debería ir?\"';

  @override
  String get storyFeelQuestion => '“¿Cómo quieres que se sienta este viaje?”';

  @override
  String get storyMoodBuildLine =>
      'Luego, la IA crea una experiencia personalizada en torno a ese estado de ánimo.';

  @override
  String get storyFloridaFirstTitle => '¿Por qué Florida/Orlando primero?';

  @override
  String get storyFloridaFirstLead =>
      'Orlando es un mercado de prueba perfecto:';

  @override
  String get storyVisionTitle => 'Nuestra visión';

  @override
  String get storyVisionLead => 'Combinar:';

  @override
  String get storyVisionCard =>
      'Por lo tanto, la aplicación se parece más a un conserje de inteligencia artificial de lujo, no a otra aburrida herramienta de itinerarios.';

  @override
  String get storyLongTermTitle => 'Oportunidad a largo plazo';

  @override
  String get storySourceGoogleMaps => 'mapas de google';

  @override
  String get storySourceTikTok => 'tiktok';

  @override
  String get storySourceInstagram => 'Carretes de Instagram';

  @override
  String get storySourceTravelBlogs => 'blogs de viajes';

  @override
  String get storySourceRestaurantApps => 'aplicaciones de restaurante';

  @override
  String get storySourceWeatherApps => 'aplicaciones meteorológicas';

  @override
  String get storySourceTicketSites => 'sitios web de entradas';

  @override
  String get storySourceTop10 =>
      'Artículos aleatorios sobre los “10 mejores Orlando”';

  @override
  String get storyBulletMarket => 'Enorme mercado turístico';

  @override
  String get storyBulletAudience =>
      'Familias, parejas, viajeros de lujo y viajeros de bienestar.';

  @override
  String get storyBulletOptions =>
      'Un sinfín de restaurantes, complejos turísticos, joyas escondidas, parques temáticos, manantiales y vida nocturna';

  @override
  String get storyBulletRepeat => 'Alto comportamiento de visitas repetidas';

  @override
  String get storyBulletLogisticsGap =>
      'La mayoría de las aplicaciones de viajes se centran en la logística, no en el diseño de experiencias';

  @override
  String get storyPillarAiItinerary => 'Generación de itinerarios de IA';

  @override
  String get storyPillarMoodPlanning =>
      'Planificación de viajes basada en el estado de ánimo';

  @override
  String get storyPillarLiveDiscovery =>
      'Descubrimiento en vivo y experiencias de tendencias';

  @override
  String get storyPillarHiddenGems => 'Joyas locales escondidas';

  @override
  String get storyPillarRouting => 'Enrutamiento inteligente';

  @override
  String get storyPillarWeatherSunset =>
      'Inteligencia meteorológica y del atardecer';

  @override
  String get storyPillarPremiumUx => 'Experiencia de usuario estética premium';

  @override
  String get storyOpportunityMultilingual => 'Expansión multilingüe';

  @override
  String get storyOpportunityAffiliate => 'Afiliados y asociaciones de reserva';

  @override
  String get storyOpportunityInventory =>
      'Restaurantes, experiencias y entradas.';

  @override
  String get storyOpportunitySubscriptions => 'Suscripciones premium';

  @override
  String get storyOpportunityScale =>
      'Escalable más allá de Florida → otros destinos más adelante';

  @override
  String get landingValues => 'Recuerdos · Emoción · Escape · Conexión';

  @override
  String get landingRegionBadge => 'Región de lanzamiento';

  @override
  String get landingRegionTitle => 'Orlando y Florida, curados para sentir';

  @override
  String get onboardFinish => 'Conoce a tu concierge';

  @override
  String get onboardBuilding => 'Creando tu aventura…';

  @override
  String get onboardStep1Title => 'Donde aterrizan primero los sueños';

  @override
  String get onboardStep1Subtitle => '¿A dónde vas?';

  @override
  String get onboardDestination => 'Destino';

  @override
  String get onboardRegion => 'Región';

  @override
  String get onboardCityLabel => 'Elige tu ciudad';

  @override
  String get onboardCityUnlockNote =>
      'Cada destino tiene su propio desbloqueo de conserjería: compra única por ciudad.';

  @override
  String get landingCityLabel => '¿Adónde vas?';

  @override
  String get paywallSwitchCity => 'Destino';

  @override
  String get cityPickerUnlocked => 'desbloqueado';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Desbloquear $price';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Complemento de Orlando · Disney y Universal juntos';

  @override
  String get onboardStep2Title => 'Hora de sentirte libre';

  @override
  String get onboardStep2Subtitle => '¿Cuándo empieza tu escape?';

  @override
  String get onboardStartDateLabel => 'Fecha de inicio';

  @override
  String get onboardEndDateLabel => 'Fecha de finalización';

  @override
  String get onboardPickDate => 'Toca para elegir';

  @override
  String get onboardSelectStartDate => 'Elige fecha de inicio';

  @override
  String get onboardSelectEndDate => 'Elige la fecha de finalización';

  @override
  String get onboardDatesHint =>
      'Puedes cambiarlos en cualquier momento desde la pestaña Viajes.';

  @override
  String get onboardStepBudgetTitle => 'Planifica con facilidad';

  @override
  String get onboardStepBudgetSubtitle =>
      '¿Qué se siente bien para este escape?';

  @override
  String get onboardBudget => 'Presupuesto del viaje (USD)';

  @override
  String get onboardStep3Title => 'Quién comparte la historia';

  @override
  String get onboardStep3Subtitle => '¿Quién viaja contigo?';

  @override
  String get onboardTravelers => 'Viajeros';

  @override
  String get onboardStep4Title => 'Tu ritmo';

  @override
  String get onboardStep4Subtitle => '¿Cómo deberían fluir tus días?';

  @override
  String get onboardNightlife => 'Interés en vida nocturna';

  @override
  String get onboardFoodie => 'Pasión gastronómica';

  @override
  String get onboardPoolside => 'Junto a la piscina y tiempo de inactividad';

  @override
  String get onboardAdventure => 'Aventura y aire libre';

  @override
  String get onboardCulture => 'Cultura y turismo';

  @override
  String get dayFlowSubtitle =>
      'Un día basado en cómo quieres sentirte, no en una lista de verificación.';

  @override
  String get dayFlowMorning => 'MAÑANA';

  @override
  String get dayFlowMidday => 'MEDIODÍA';

  @override
  String get dayFlowAfternoon => 'TARDE';

  @override
  String get dayFlowEvening => 'NOCHE';

  @override
  String get dayFlowNight => 'NOCHE';

  @override
  String get dayFlowReasonMorningPool =>
      'Relájese lentamente: junto a la piscina o al spa antes de que comience el día.';

  @override
  String get dayFlowReasonMorningCalm =>
      'Un comienzo suave para marcar la pauta.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Horas de máxima energía: la gran aventura mientras estás fresco.';

  @override
  String get dayFlowReasonMiddayCulture =>
      'Hacer turismo mientras la luz es brillante.';

  @override
  String get dayFlowReasonMiddayIcon => 'El momento emblemático del día.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Tiempo libre por la tarde para recargar energías.';

  @override
  String get dayFlowReasonAfternoonGem =>
      'Una joya escondida lejos de las multitudes.';

  @override
  String get dayFlowReasonEveningDining =>
      'La comida del día: tu elección gastronómica.';

  @override
  String get dayFlowReasonNightOut => 'Un último brillo: una noche de fiesta.';

  @override
  String weatherToday(String place) {
    return 'Ahora mismo en $place';
  }

  @override
  String weatherSunset(String time) {
    return 'Puesta de sol $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% de probabilidad de lluvia: lleva una capa ligera.';
  }

  @override
  String get weatherConditionClear => 'Claro';

  @override
  String get weatherConditionPartlyCloudy => 'Parcialmente nublado';

  @override
  String get weatherConditionCloudy => 'Nublado';

  @override
  String get weatherConditionFog => 'Niebla';

  @override
  String get weatherConditionDrizzle => 'Llovizna';

  @override
  String get weatherConditionRain => 'Lluvia';

  @override
  String get weatherConditionSnow => 'Nieve';

  @override
  String get weatherConditionThunder => 'Tormentas';

  @override
  String get weatherConciergeTitle => 'Conserje del tiempo';

  @override
  String get weatherConciergeTapHint => 'Toca para ver el pronóstico de viajes';

  @override
  String get weatherConciergeAdviceTitle => 'Aviso meteorológico en Lúxora';

  @override
  String weatherFeelsLike(String temp) {
    return 'Se siente como $temp';
  }

  @override
  String get weatherHumidity => 'Humedad';

  @override
  String get weatherWind => 'Viento';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir a $speed mph';
  }

  @override
  String get weatherUv => 'índice ultravioleta';

  @override
  String get weatherCloudCover => 'Cubierta de nubes';

  @override
  String get weatherVisibility => 'Visibilidad';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles mi';
  }

  @override
  String weatherSunrise(String time) {
    return 'Amanecer $time';
  }

  @override
  String get weatherStatRain => 'Lluvia';

  @override
  String get weatherWhatToBring => 'Qué traer hoy';

  @override
  String get weatherPlanImpact => 'Impacto en su plan';

  @override
  String get weatherHourlyTitle => 'perspectiva horaria';

  @override
  String get weatherHourlyUnavailable =>
      'El pronóstico por hora aparecerá cuando se carguen los datos.';

  @override
  String get weatherLiveRadar => 'Radar en vivo';

  @override
  String get weatherRadarComingSoon => 'Próximamente radar en vivo.';

  @override
  String get weatherRadarPlay => 'Reproducir bucle';

  @override
  String get weatherRadarPause => 'Bucle de pausa';

  @override
  String get weatherRadarTapToExpand => 'Toca para pantalla completa';

  @override
  String get weatherRadarNow => 'Ahora';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return 'Hace $minutes minutos';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes min';
  }

  @override
  String get weatherRadarStepBack => 'fotograma anterior';

  @override
  String get weatherRadarStepForward => 'fotograma posterior';

  @override
  String get weatherRadarJumpNow => 'Ahora';

  @override
  String get weatherRadarJump1h => '−1 hora';

  @override
  String get weatherRadarJump2h => '−2 horas';

  @override
  String get weatherRadarJump30m => '+30 minutos';

  @override
  String get weatherRadarSpeedSlow => 'Lento';

  @override
  String get weatherRadarSpeedNormal => 'Normal';

  @override
  String get weatherRadarSpeedFast => 'Rápido';

  @override
  String get weatherRadarLoopNote =>
      'Bucle de radar: pasadas aproximadamente 2 horas en pasos de 10 minutos, además de pronóstico inmediato de corto alcance cuando esté disponible (no un pronóstico de 4 horas).';

  @override
  String get shareMapPreviewCaption =>
      'Vista previa del mapa · abrir en Luxora para obtener indicaciones en vivo';

  @override
  String get shareRadarPreviewCaption =>
      'Radar Doppler en vivo · abierto en Luxora para el circuito completo';

  @override
  String get weatherMapOverlays => 'Superposiciones de mapas';

  @override
  String get weatherOverlayPrecip => 'Precipitación';

  @override
  String get weatherOverlayTemp => 'Temperatura';

  @override
  String get weatherOverlayWind => 'Viento';

  @override
  String get weatherOverlayCloud => 'Cubierta de nubes';

  @override
  String get weatherComingSoon => 'Muy pronto';

  @override
  String get weatherAdjustDay => 'Ajustar mi día según el clima';

  @override
  String get weatherBestOutdoorWindow => 'La mejor ventana exterior';

  @override
  String get weatherRainWindow => 'Probable lluvia';

  @override
  String get weatherSunsetRec => 'Recomendación de puesta de sol';

  @override
  String weatherOutdoorAtRisk(int count) {
    return '$count paradas al aire libre pueden verse afectadas';
  }

  @override
  String get weatherIndoorBackup => 'Ideas de respaldo en interiores';

  @override
  String get weatherAdviceLightJacket => 'Trae una chaqueta ligera esta noche.';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return 'Planifique actividades al aire libre antes de las $time.';
  }

  @override
  String get weatherAdviceHighUv =>
      'Alta radiación ultravioleta hoy: lleve protector solar y evite la exposición prolongada al sol directo al mediodía.';

  @override
  String get weatherAdviceRainLater =>
      'El riesgo de lluvia aumenta más tarde hoy, así que traslade las experiencias en interiores a la tarde.';

  @override
  String get weatherAdviceWindBeach =>
      'El viento puede hacer que las actividades en la playa o en barco sean menos cómodas hoy.';

  @override
  String get weatherAdviceGreatSunset =>
      'Excelentes condiciones para el atardecer esta noche: considere una cena en la azotea o un paseo por el lago.';

  @override
  String get weatherAdviceDefault =>
      'Los cielos parecen manejables: sigue tu plan y ten a mano una capa ligera.';

  @override
  String weatherSunsetRecRooftop(String time) {
    return 'Cielos despejados cerca de las $time: una cena en la azotea o un paseo por el lago podrían brillar.';
  }

  @override
  String get weatherPackSunscreen => 'protector solar';

  @override
  String get weatherPackSunglasses => 'Gafas de sol';

  @override
  String get weatherPackUmbrella => 'Paraguas';

  @override
  String get weatherPackLightJacket => 'chaqueta ligera';

  @override
  String get weatherPackShoes => 'Zapatos cómodos';

  @override
  String get weatherPackWater => 'botella de agua';

  @override
  String get weatherPackHat => 'Sombrero';

  @override
  String get weatherPackPoncho => 'Poncho';

  @override
  String get weatherPackSwimwear => 'Trajes de baño';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return 'El riesgo de lluvia aumenta después de $time. Considere mover $outdoorStop antes y guardar $indoorStop para más tarde.';
  }

  @override
  String weatherImpactHeat(String time) {
    return 'Mediodía con mucho calor: planifique caminatas al aire libre antes de las $time.';
  }

  @override
  String get weatherImpactClear =>
      'Los cielos lucen amigables para tus planes al aire libre esta mañana.';

  @override
  String weatherImpactMixed(int count) {
    return 'Es posible que hoy sea necesario ajustar el tiempo de $count paradas al aire libre.';
  }

  @override
  String get weatherImpactNoPlanRain =>
      'La lluvia está presente: primero prepare su día con anclajes interiores.';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return 'La mejor ventana exterior luce entre $start y $end antes de que se acumule el calor o las lluvias.';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      'El clima parece estable: toca Planificar mi día cuando estés listo para secuenciar las paradas.';

  @override
  String get weatherImpactIndoorFallback => 'un spa o museo';

  @override
  String get hotelIntelBadge => 'INTELIGENCIA HOTELERA';

  @override
  String get hotelIntelTitle => 'Encuentre su base de operaciones';

  @override
  String get hotelIntelSubtitle =>
      'Según el viaje que desea realizar, Luxora selecciona estadías que moldean sus días, no una cuadrícula de reservas.';

  @override
  String get hotelDiscoveryTitle => 'Comisariada para Orlando';

  @override
  String get hotelMatchmakerTeaser =>
      'Cuéntele a Luxora su estilo de viaje y obtenga tres estadías seleccionadas por el conserje con compensaciones honestas.';

  @override
  String get hotelMatchmakerCta => 'Casamentero de hoteles con IA';

  @override
  String get hotelMatchmakerTitle => 'Casamentero de hoteles';

  @override
  String get hotelMatchmakerSubtitle =>
      'Comparte cómo viajas: Luxora te recomienda dónde anclar tus días.';

  @override
  String get hotelMatchmakerRun => 'Encuentra mis 3 mejores estancias';

  @override
  String get hotelMatchBudget => 'Zona de confort económica';

  @override
  String get hotelMatchTravelers => 'Viajeros';

  @override
  String get hotelMatchAdults => 'Adultos';

  @override
  String get hotelMatchKids => 'Niños';

  @override
  String get hotelMatchAttractions => 'Atracciones en tu lista';

  @override
  String get hotelMatchLuxuryLevel => 'Nivel de lujo deseado';

  @override
  String get hotelMatchTransport => 'Moverse';

  @override
  String get hotelTransportCar => 'Coche de alquiler';

  @override
  String get hotelTransportRideshare => 'Viaje compartido';

  @override
  String get hotelTransportShuttle => 'Servicio de transporte al complejo';

  @override
  String get hotelTransportWalkable => 'Barrio transitable';

  @override
  String get hotelMatchResultsTitle => 'Tus 3 mejores partidos';

  @override
  String hotelMatchWhyTitle(int score) {
    return 'Puntuación del partido $score';
  }

  @override
  String get hotelMatchBestForLabel => 'Lo mejor para:';

  @override
  String get hotelMatchItineraryLabel => 'Itinerario:';

  @override
  String get hotelMatchTradeoffsLabel => 'Compensaciones:';

  @override
  String get hotelMatchNearbyLabel => 'Cercano:';

  @override
  String get hotelLuxoraScore => 'Lúxora';

  @override
  String get hotelHomeBaseBadge => 'BASE DE INICIO';

  @override
  String get hotelScoreLuxury => 'Lujo';

  @override
  String get hotelScoreFamily => 'Familia';

  @override
  String get hotelScoreRomance => 'romance';

  @override
  String get hotelScoreWalkability => 'Caminar';

  @override
  String get hotelWhyRecommendTitle => 'Por qué Luxora recomienda esto';

  @override
  String get hotelItineraryImpactTitle => 'Cómo esto da forma a tus días';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return 'Unidad aproximada desde el concentrador: $driveTime. Puntuación de fricción de viaje: $friction/90 (menor es más tranquilo).';
  }

  @override
  String get hotelAddHomeBase => 'Agregar como base de operaciones';

  @override
  String get hotelHomeBaseActive => 'Base de operaciones activa';

  @override
  String get hotelViewOnMap => 'Ver en el mapa';

  @override
  String get hotelGetDirections => 'Obtener direcciones';

  @override
  String get hotelCheckRates => 'Consultar Tarifas';

  @override
  String get hotelVisitWebsite => 'Visitar sitio web';

  @override
  String get hotelLinkUnavailable =>
      'El enlace de reserva aún no está disponible para esta estancia.';

  @override
  String get hotelLinkOpenFailed =>
      'No se pudo abrir el enlace: revisa tu navegador o inténtalo nuevamente.';

  @override
  String get hotelSave => 'Guardar Hotel';

  @override
  String get hotelSaved => 'Guardado';

  @override
  String get hotelDistanceTitle => 'Distancia a puntos clave';

  @override
  String get hotelCompareTitle => 'Comparar estancias';

  @override
  String get hotelCompareSubtitle =>
      'Vista de conserjería lado a lado: hasta tres hoteles.';

  @override
  String hotelCompareSelected(int count) {
    return '$count seleccionado';
  }

  @override
  String get hotelComparePrice => 'Gama de precios';

  @override
  String get hotelCompareDriveImpact => 'Impulsar el impacto';

  @override
  String get hotelCompareNearby => 'Aspectos destacados cercanos';

  @override
  String get hotelPriceBudget => 'Presupuesto';

  @override
  String get hotelPriceModerate => 'Moderado';

  @override
  String get hotelPriceUpscale => 'Exclusivo';

  @override
  String get hotelPriceLuxury => 'Lujo';

  @override
  String get hotelTagCouples => 'Lo mejor para parejas';

  @override
  String get hotelTagDisney => 'Lo mejor para Disney';

  @override
  String get hotelTagUniversal => 'Lo mejor para Universal';

  @override
  String get hotelTagLuxuryStaycation => 'Vacaciones de lujo';

  @override
  String get hotelTagFamily => 'Familiar';

  @override
  String get hotelTagQuiet => 'escape tranquilo';

  @override
  String get hotelTagWalkableDining => 'Comedor transitable';

  @override
  String get hotelTagResort => 'Sensación de resort';

  @override
  String get hotelTagBudget => 'Económico';

  @override
  String get hotelReasonMatchesMood =>
      'Se adapta a tu estado de ánimo y ritmo de viaje.';

  @override
  String get hotelReasonCloseStops =>
      'Cerca de las paradas planificadas en tu cronograma.';

  @override
  String hotelReasonSavesDrive(String time) {
    return 'Ahorra tiempo de conducción en comparación con un centro genérico: aproximadamente $time desde el centro.';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return 'Se adapta a una zona de confort de $range sin gastar demasiado en el resort equivocado.';
  }

  @override
  String get hotelReasonBetterGroup =>
      'Se adapta mejor a su tipo de grupo y nivel de energía.';

  @override
  String get hotelReasonNearbyDining =>
      'Restaurantes fuertes y cercanos para veladas sin esfuerzo.';

  @override
  String get hotelReasonLowStress =>
      'Calma estilo centro turístico: menos logística, más vacaciones.';

  @override
  String get hotelMatchAttractionsGeneral => 'tus atracciones planeadas';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return 'Según su itinerario de $attractions, $hotel reduce el tiempo de viaje y facilita las noches.';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$hotel en $neighborhood se adapta a cómo quieres que se sienta este viaje.';
  }

  @override
  String get hotelMatchBestForFamily =>
      'Familias que quieren días de piscina sin sacrificar el acceso al parque.';

  @override
  String get hotelMatchBestForCouple =>
      'Parejas que quieren romance sin el caos de los parques temáticos.';

  @override
  String get hotelMatchBestForGroup =>
      'Grupos que equilibran comodidad, acceso y logística tranquila.';

  @override
  String hotelMatchImpactDisney(String time) {
    return 'Rutas más cortas de Disney: aproximadamente $time hasta los parques desde tu puerta.';
  }

  @override
  String get hotelMatchImpactUniversal =>
      'Los beneficios de Universal Express o el acceso al taxi acuático pueden recuperar horas de su día.';

  @override
  String get hotelMatchImpactWalkable =>
      'Camine hasta cenar: menos estrés al estacionar después de largos días en el parque.';

  @override
  String hotelMatchImpactDefault(String time) {
    return 'Mantiene el promedio de recorridos alrededor de $time para que el flujo del día se mantenga relajado.';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      'Precios de resort premium: presupuesta más para la habitación, menos para otros lugares.';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      'Dependerá de un automóvil o de un viaje compartido, no de una base para caminar a todas partes.';

  @override
  String get hotelMatchTradeoffLessFamily =>
      'Menos centrado en servicios centrados en los niños que los complejos turísticos familiares.';

  @override
  String get hotelMatchTradeoffLessRomantic =>
      'Más energía de un parque temático que un retiro tranquilo para parejas.';

  @override
  String get hotelMatchTradeoffDefault =>
      'Cada estadía tiene sus ventajas y desventajas: Luxora eligió esto primero como sus prioridades.';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return 'Cenas y experiencias en $neighborhood.';
  }

  @override
  String get mapHotelIntelBannerTitle =>
      'Elija la base de operaciones adecuada';

  @override
  String get mapHotelIntelBannerBody =>
      'Su hotel determina los tiempos de viaje, el flujo del día y el lugar donde come. Luxora le ayuda a elegir, sin presión de reserva.';

  @override
  String get mapHotelIntelBannerCta => 'Explora la inteligencia hotelera';

  @override
  String get sponsorLuxoraRecommended => 'Recomendado en Lúxora';

  @override
  String get sponsorBadgeFeaturedPartner => 'Socio destacado';

  @override
  String get sponsorBadgeSponsored => 'Patrocinado';

  @override
  String get sponsorBadgePromoted => 'Promovido';

  @override
  String get sponsorBadgePartnerOffer => 'Oferta de socio';

  @override
  String get sponsorCtaVisitWebsite => 'Visitar sitio web';

  @override
  String get sponsorCtaBookNow => 'Reserva ahora';

  @override
  String get sponsorCtaCheckRates => 'Consultar Tarifas';

  @override
  String get sponsorCtaGetTickets => 'Obtener entradas';

  @override
  String get sponsorCtaViewOffer => 'Ver oferta';

  @override
  String get featuredStaysTitle => 'Estancias destacadas';

  @override
  String get featuredStaysSubtitle =>
      'Ubicaciones de socios: separadas de las puntuaciones de coincidencia orgánica de hoteles de Luxora.';

  @override
  String get featuredExperiencesTitle => 'Experiencias destacadas';

  @override
  String get featuredExperiencesSubtitle =>
      'Selecciones promocionadas según su estado de ánimo: siempre etiquetadas, nunca disfrazadas de rango de IA.';

  @override
  String get featuredDiningTitle => 'Comedor destacado';

  @override
  String get featuredDiningSubtitle =>
      'Restaurantes asociados destacados de Luxora: su lista de gemas orgánicas permanece independiente.';

  @override
  String get featuredTicketPartnersTitle => 'Socios de entradas destacados';

  @override
  String get featuredTicketPartnersSubtitle =>
      'Ofertas de socios autorizados: compárelas con los ahorros orgánicos a continuación.';

  @override
  String get featuredCityHomeTitle => 'Socios destacados';

  @override
  String get featuredCityHomeSubtitle =>
      'Opciones útiles de socios para Orlando: claramente marcadas, nunca ocultas como selecciones de la IA.';

  @override
  String get dayFlowVibeFoodie => 'entusiasta de la comida';

  @override
  String get dayFlowVibeNightlife => 'Vida nocturna';

  @override
  String get dayFlowVibePoolside => 'junto a la piscina';

  @override
  String get dayFlowVibeAdventure => 'Aventurero';

  @override
  String get dayFlowVibeCulture => 'Cultura';

  @override
  String get onboardStep5Title => 'El corazón de Luxora';

  @override
  String get onboardStep5Subtitle => '¿Qué quieres SENTIR en este viaje?';

  @override
  String get onboardTripFeelHint =>
      'Cenas al atardecer, mañanas lentas, risas con mi pareja…';

  @override
  String get onboardStepNameEyebrow => 'Tu historia comienza con un nombre.';

  @override
  String get onboardStepNameTitle => '¿Cómo deberíamos llamar a este viaje?';

  @override
  String get onboardStepNameSubtitle =>
      'Luxora puede crear un título a partir de tu estilo o escribir el tuyo propio.';

  @override
  String get onboardTripNameLuxora => 'Deja que Luxora lo nombre';

  @override
  String get onboardTripNameYours => 'lo nombraré';

  @override
  String get onboardTripNameHint =>
      'Nuestra escapada de aniversario de primavera...';

  @override
  String onboardTripNameSuggested(String name) {
    return 'Luxora sugiere: $name';
  }

  @override
  String get conciergeTripNameLabel => 'Nombre del viaje';

  @override
  String get moodRomantic => 'Romántico';

  @override
  String get moodRelaxing => 'Relajante';

  @override
  String get moodAdventurous => 'Aventurero';

  @override
  String get moodLuxurious => 'Lujoso';

  @override
  String get moodFamily => 'Conexión familiar';

  @override
  String get moodSocial => 'Social';

  @override
  String get moodNature => 'Centrado en la naturaleza';

  @override
  String get moodWellness => 'Retiro de bienestar';

  @override
  String get moodFoodie => 'Experiencia gastronómica';

  @override
  String get catHiddenGems => 'Joyas ocultas';

  @override
  String get catLuxuryStay => 'Staycations de lujo';

  @override
  String get catBeaches => 'Playas';

  @override
  String get catRooftop => 'Cena en rooftop';

  @override
  String get catSpas => 'Balnearios';

  @override
  String get catNightlife => 'Vida nocturna';

  @override
  String get catFamily => 'Familia';

  @override
  String get catEco => 'Ecoturismo';

  @override
  String get catThemeParks => 'Parques temáticos';

  @override
  String get catRomantic => 'Escapadas románticas';

  @override
  String get catFood => 'Experiencias gastronómicas';

  @override
  String get catSprings => 'Manantiales';

  @override
  String get catIslands => 'De isla en isla';

  @override
  String get catInfluencer => 'Perfecto para influencers';

  @override
  String get placeCatBeach => 'Playa';

  @override
  String get placeCatDining => 'Gastronomía';

  @override
  String get placeCatNature => 'Naturaleza';

  @override
  String get placeCatNightlife => 'Vida nocturna';

  @override
  String get placeCatWellness => 'Bienestar';

  @override
  String get placeCatFamily => 'Familia';

  @override
  String get placeCatSprings => 'Manantiales';

  @override
  String get placeCatRomantic => 'Romántico';

  @override
  String get placeCatAdventure => 'Aventura';

  @override
  String get placeCatHotel => 'Hotel';

  @override
  String get styleLessCrowded => 'Menos concurrido';

  @override
  String get styleLuxurySubtle => 'Lujo sin ostentación';

  @override
  String get styleHiddenLuxury => 'Lujo oculto';

  @override
  String get styleWalkable => 'Caminable cuando sea posible';

  @override
  String get styleSlowMornings => 'Mañanas lentas';

  @override
  String get styleNoTraps => 'Sin trampas turísticas';

  @override
  String get styleNatureHeavy => 'Mucha naturaleza';

  @override
  String get styleNatureWellness => 'Solo naturaleza y bienestar';

  @override
  String get styleAestheticDining => 'Gastronomía estética';

  @override
  String get styleFamilyEasy => 'Logística fácil para familias';

  @override
  String get paywallHeroEyebrow => 'SU CONSERJE PERSONAL';

  @override
  String get paywallHeroHeadline => 'NO DESPERDICES TUS VACACIONES';

  @override
  String get paywallHeroSubheadline =>
      'Luxora planifica el viaje para que puedas disfrutarlo.';

  @override
  String get paywallEmotionalLine =>
      'Ya estás gastando miles en tus vacaciones. No dejes la experiencia al azar.';

  @override
  String paywallHeadlineCouples(String cityName) {
    return 'Tu escapada perfecta a $cityName comienza aquí.';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return 'Dedica menos tiempo a planificar y más tiempo a crear recuerdos en $cityName.';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return 'Experimente $cityName de manera diferente.';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return 'Descubra la $cityName que la mayoría de los turistas nunca ven.';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return 'Pruebe $cityName como un experto local.';
  }

  @override
  String get paywallWhatYouUnlock => 'Lo que desbloqueas';

  @override
  String get paywallFeatureAiConcierge => 'Conserje de IA';

  @override
  String get paywallFeatureItineraries => 'Itinerarios personalizados';

  @override
  String get paywallFeatureHiddenGems => 'Gemas ocultas';

  @override
  String get paywallFeatureHotelIntel => 'Inteligencia hotelera';

  @override
  String get paywallFeatureTicketSavings => 'Ahorro inteligente en boletos';

  @override
  String get paywallFeatureWeatherConcierge => 'Conserje del tiempo';

  @override
  String get paywallFeatureCrowdIntel => 'Inteligencia de multitudes';

  @override
  String get paywallFeatureGpsNav => 'Navegación GPS';

  @override
  String get paywallFeatureLocalSecrets => 'Secretos locales';

  @override
  String get paywallFeatureDining => 'Recomendaciones para cenar';

  @override
  String get paywallFeatureUnlimitedPlanning =>
      'Planificación urbana ilimitada';

  @override
  String get paywallWhyTravelersUnlock =>
      'Por qué los viajeros descubren Luxora';

  @override
  String get paywallBenefitSaveTimeTitle => 'Ahorra tiempo';

  @override
  String get paywallBenefitSaveTimeBody =>
      'Evite horas de investigación y planificación.';

  @override
  String get paywallBenefitSaveMoneyTitle => 'Ahorre dinero';

  @override
  String get paywallBenefitSaveMoneyBody =>
      'Descubra ahorros en boletos, ofertas locales y opciones más inteligentes.';

  @override
  String get paywallBenefitAvoidTrapsTitle => 'Evite las trampas para turistas';

  @override
  String get paywallBenefitAvoidTrapsBody =>
      'Encuentra experiencias que los lugareños realmente recomiendan.';

  @override
  String get paywallBenefitTravelSmarterTitle => 'Viaja más inteligentemente';

  @override
  String get paywallBenefitTravelSmarterBody =>
      'Obtenga recomendaciones basadas en el clima, las multitudes y su estilo de viaje.';

  @override
  String get paywallLockedPreviewTitle => 'Esperando dentro de su conserje';

  @override
  String get paywallLockedPreviewSubtitle =>
      'Desbloquea para revelar rutas y secretos adaptados a tu viaje.';

  @override
  String get paywallLockedDateNight => 'Rutas románticas para citas nocturnas';

  @override
  String get paywallLockedHiddenLuxury => 'Experiencias de lujo ocultas';

  @override
  String get paywallLockedVipSecrets => 'Secretos locales VIP';

  @override
  String get paywallLockedConciergeRecs => 'Recomendaciones de conserjería';

  @override
  String get paywallLockedFamilyPlans => 'Planes familiares sin estrés';

  @override
  String get paywallLockedWeatherReroute => 'Redirección según el clima';

  @override
  String get paywallLockedHotelMatchmaker => 'Casamentero de hotel inteligente';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return 'Desbloquear el conserje de $cityName';
  }

  @override
  String get paywallOneTimePurchase => 'Compra única';

  @override
  String get paywallNoSubscription => 'Sin suscripción';

  @override
  String get paywallNoMonthlyFees => 'Sin tarifas mensuales';

  @override
  String paywallLifetimeAccess(String cityName) {
    return 'Acceso de por vida a $cityName';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return 'Actualizaciones futuras de $cityName incluidas';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return 'La mayoría de las vacaciones en $cityName cuestan $minUsd–$maxUsd+';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price una vez';
  }

  @override
  String get paywallLessThanDinner =>
      'Menos que el costo de una cena de vacaciones.';

  @override
  String get paywallSocialProofTitle => 'Viajeros que desbloquearon Luxora';

  @override
  String get paywallReview1 => '\"Nos ahorró horas de planificación\".';

  @override
  String get paywallReview2 =>
      '\"Encontramos lugares que nunca hubiéramos descubierto.\"';

  @override
  String get paywallReview3 =>
      '\"Vale la pena sólo por las joyas escondidas.\"';

  @override
  String paywallCtaUnlock(String cityName) {
    return 'Desbloquear el conserje de $cityName';
  }

  @override
  String get paywallContinueExploring => 'Continuar explorando';

  @override
  String get paywallConciergePromise =>
      'Sin suscripción · Acceso de por vida a la ciudad';

  @override
  String get paywallRestorePurchases => 'Restaurar compras';

  @override
  String get paywallPurchaseSuccess =>
      'Compra completa: tu conserje está desbloqueado.';

  @override
  String get paywallPurchasePending => 'Completando compra...';

  @override
  String get paywallPurchaseFailed =>
      'No se pudo completar la compra. Inténtalo de nuevo o restablece las compras.';

  @override
  String get paywallPurchaseCanceled => 'Compra cancelada.';

  @override
  String get paywallRestoreComplete => 'Compras restauradas.';

  @override
  String get paywallRestoreNone =>
      'No se encontraron compras anteriores para este ID de Apple o cuenta de Google.';

  @override
  String get paywallStoreUnavailable =>
      'La facturación de App Store no está disponible en este dispositivo.';

  @override
  String get paywallProductUnavailable =>
      'Este paquete aún no está disponible en la tienda.';

  @override
  String get settingsUnlockConciergeTitle =>
      'Desbloquear el conserje de la ciudad';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'Paquete de ciudad único: no es una suscripción';

  @override
  String get settingsOpenConciergeSubtitle =>
      'Abra la pestaña de conserjería de IA';

  @override
  String get weatherMiamiHumidityIndoor =>
      'Alta humedad hoy. Vaya a la playa o a la piscina más temprano, luego a Wynwood o Brickell para disfrutar de cenas en el interior y galerías durante las horas más calurosas.';

  @override
  String get weatherMiamiHeatAdvisory =>
      'Condiciones de advertencia de calor: telas ligeras, hidratación y descansos a la sombra entre paradas al aire libre.';

  @override
  String get weatherMiamiBeachMorning =>
      'Fuertes rayos UV en la arena: protector solar, sombrero y tiempo de playa antes del mediodía.';

  @override
  String get weatherMiamiBoatWind =>
      'El viento es elevado: reconsidere las actividades en barco o yate; Es posible que aún funcione cenar en la azotea.';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return 'Ventana de lluvia más adelante: cambie los planos exteriores por $indoorSpot o tiempo de galería.';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      'El atardecer parece fuerte: frente al mar o en la azotea con una vista de este a oeste.';

  @override
  String get miamiBeachIntelTitle => 'Inteligencia de playa';

  @override
  String miamiBeachBestTime(String time) {
    return 'Mejor momento: $time';
  }

  @override
  String get miamiBeachFamilyScore => 'Familia';

  @override
  String get miamiBeachCrowdScore => 'Multitud';

  @override
  String get miamiBeachPhotoScore => 'Foto';

  @override
  String get miamiBeachRomanceScore => 'romance';

  @override
  String get miamiBeachSunsetScore => 'Atardecer';

  @override
  String miamiBeachParking(String level) {
    return 'Estacionamiento: $level';
  }

  @override
  String get miamiNightlifeTitle => 'Conserjería de vida nocturna';

  @override
  String miamiNightlifeDressCode(String code) {
    return 'Código de vestimenta: $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return 'Mejor llegada: $time';
  }

  @override
  String get miamiNightlifeReservation => 'Se recomienda reservar';

  @override
  String get miamiMoodRoutesTitle => 'Rutas del humor en Miami';

  @override
  String get tampaBayMoodRoutesTitle => 'Rutas de ambiente Tampa Bay';

  @override
  String get stAugustineMoodRoutesTitle => 'Rutas de ambiente St. Augustine';

  @override
  String get naplesMoodRoutesTitle => 'Rutas de ambiente Naples';

  @override
  String get destin30aMoodRoutesTitle => 'Rutas de ambiente Destin y 30A';

  @override
  String get vegasMoodRoutesTitle => 'Rutas de ambiente Las Vegas';

  @override
  String miamiMoodRouteStart(String time) {
    return 'Comienza alrededor de las $time';
  }

  @override
  String get keysWaterIntelTitle => 'Claves de la inteligencia del agua';

  @override
  String keysWaterBestTime(String time) {
    return 'Mejor ventana: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Agua: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Esnórquel';

  @override
  String get keysWaterDivingScore => 'Bucear';

  @override
  String get keysWaterBoatingScore => 'Bote';

  @override
  String get keysWaterFishingScore => 'Pez';

  @override
  String get keysWaterWindScore => 'Viento';

  @override
  String get keysWaterSunsetScore => 'Atardecer';

  @override
  String get keysWaterCrowdScore => 'Multitud';

  @override
  String get keysMoodRoutesTitle => 'Rutas de la isla de los Cayos';

  @override
  String keysMoodRouteStart(String time) {
    return 'Inicio $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'EXPERIMENTA MIAMI DIFERENTE';

  @override
  String get paywallHeadlineMiamiWeekend =>
      'NO DESPERDICES TU FIN DE SEMANA EN MIAMI';

  @override
  String get paywallOrlandoAddonsHeading => 'Paquete de parque temático';

  @override
  String get paywallOrlandoBaseIncludes =>
      'El desbloqueo de Orlando incluye restaurantes, gemas ocultas, hoteles y experiencias fuera del parque. Añade el pack de parques temáticos de Disney y Universal juntos.';

  @override
  String get paywallAddonThemeParksTitle => 'Paquete Disney y Universal';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World y Universal Orlando: todos los parques, ofertas, rutas e información sobre multitudes en un solo desbloqueo.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return 'Desbloquear $packName · $price';
  }

  @override
  String get paywallAddonUnlocked => 'desbloqueado';

  @override
  String get paywallAddonRequiresOrlando =>
      'Requiere el desbloqueo de Orlando primero';

  @override
  String paywallUnlockAddonPack(String packName) {
    return 'Desbloquear $packName';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return 'Desbloquear $packName';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      '¿Desbloquear Disney y Universal para Orlando?';

  @override
  String get orlandoThemeParksPromptBody =>
      'Agregue el paquete de parques temáticos para Walt Disney World y Universal Orlando: todos los parques, ofertas de boletos, rutas e información sobre multitudes en un solo desbloqueo.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Desbloquear · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Ahora no';

  @override
  String get onboardV2Eyebrow => 'Diseñemos tu viaje perfecto';

  @override
  String get onboardV2StepTravelerEyebrow => 'Paso 1';

  @override
  String get onboardV2StepTravelerTitle => '¿Con quién viajas?';

  @override
  String get onboardV2StepTravelerSubtitle =>
      'Luxora adapta las estancias, las comidas y el ritmo de su tripulación.';

  @override
  String get onboardV2ChildrenLabel => '¿Niños viajando?';

  @override
  String get onboardV2StepStyleEyebrow => 'Paso 2';

  @override
  String get onboardV2StepStyleTitle => '¿Qué tipo de viaje estás buscando?';

  @override
  String get onboardV2StepStyleSubtitle => 'Elige todo lo que te entusiasme.';

  @override
  String get onboardV2StepHotelEyebrow => 'Paso 3';

  @override
  String get onboardV2StepHotelTitle =>
      '¿En qué tipo de lugar te gustaría quedarte?';

  @override
  String get onboardV2StepHotelSubtitle =>
      'Combinaremos gemas boutique e íconos de resorts.';

  @override
  String get onboardV2HotelBudgetLabel => 'Presupuesto del hotel';

  @override
  String get onboardV2HotelAmenitiesLabel => 'Servicios imprescindibles';

  @override
  String get onboardV2StepFoodEyebrow => 'Paso 4';

  @override
  String get onboardV2StepFoodTitle => '¿Qué tipo de restaurantes te gustan?';

  @override
  String get onboardV2StepFoodSubtitle =>
      'Cocina y estilo gastronómico: elige todo lo que te guste.';

  @override
  String get onboardV2CuisineLabel => 'Tipos de cocina';

  @override
  String get onboardV2DiningStyleLabel => 'Estilo de comedor';

  @override
  String get onboardV2StepPaceEyebrow => 'Paso 5';

  @override
  String get onboardV2StepPaceTitle => '¿Cómo te gustaría planificar tus días?';

  @override
  String get onboardV2StepPaceSubtitle =>
      'Mañanas relajadas o aventuras repletas de aventuras, tú eliges.';

  @override
  String get onboardV2PaceRelaxedTitle => 'Relajado';

  @override
  String get onboardV2PaceRelaxedBody => '2-3 actividades por día';

  @override
  String get onboardV2PaceBalancedTitle => 'Equilibrado';

  @override
  String get onboardV2PaceBalancedBody => '4-5 actividades por día';

  @override
  String get onboardV2PacePackedTitle => 'Lleno';

  @override
  String get onboardV2PacePackedBody => 'Maximizar cada día';

  @override
  String get onboardV2StepGoalsEyebrow => 'Paso 6';

  @override
  String get onboardV2StepGoalsTitle =>
      '¿Qué es lo más importante en este viaje?';

  @override
  String get onboardV2StepGoalsSubtitle => 'Elija hasta cinco prioridades.';

  @override
  String get onboardV2StepExperienceEyebrow => 'Paso 7';

  @override
  String get onboardV2StepExperienceTitle => '¿Qué experiencias disfrutarías?';

  @override
  String get onboardV2StepExperienceSubtitle =>
      'Los incluiremos en su itinerario.';

  @override
  String get onboardV2StepAvoidEyebrow => 'Paso 8';

  @override
  String get onboardV2StepAvoidTitle => '¿Qué preferirías evitar?';

  @override
  String get onboardV2StepAvoidSubtitle =>
      'Luxora se mantiene alejada de lo que agota su viaje.';

  @override
  String get onboardV2StepEmotionEyebrow => 'Paso 9';

  @override
  String get onboardV2StepEmotionTitle =>
      '¿Qué haría que este viaje se sintiera exitoso?';

  @override
  String get onboardV2StepEmotionSubtitle => 'Elija un sentimiento primario.';

  @override
  String get onboardV2StepSummaryEyebrow => 'LUXORA';

  @override
  String onboardV2StepSummaryTitle(String name) {
    return 'Perfecto, $name.';
  }

  @override
  String get onboardV2StepSummarySubtitle =>
      'He aprendido un poco sobre el tipo de viajero que eres.\n\nAhora usaré tus preferencias para recomendar lugares, experiencias, restaurantes y joyas ocultas que encajen contigo.\n\nCada recomendación será específicamente para ti.\n\nVeamos qué podemos descubrir.';

  @override
  String get onboardSummaryHotels => 'Hoteles';

  @override
  String get onboardSummaryRestaurants => 'Restaurantes';

  @override
  String get onboardSummaryHiddenGems => 'Gemas ocultas';

  @override
  String get onboardSummaryExperiences => 'Experiencias';

  @override
  String get onboardSummaryHotelDefault =>
      'Estancias seleccionadas que se ajustan a su presupuesto';

  @override
  String onboardSummaryHotelType(String type) {
    return '$type estancia';
  }

  @override
  String get onboardSummaryRooftopDining =>
      'Experiencias gastronómicas en la azotea';

  @override
  String onboardSummaryCuisine(String cuisine) {
    return '$cuisine favoritos';
  }

  @override
  String onboardSummaryPace(String pace) {
    return '$pace ritmo diario';
  }

  @override
  String get onboardSummaryRomantic => 'Experiencias románticas al atardecer';

  @override
  String onboardSummaryEmotion(String emotion) {
    return 'Viaje centrado en las $emotion';
  }

  @override
  String get onboardSummaryPremiumGems => 'Gemas ocultas premium';

  @override
  String get agendaSuggestionsForYou => 'elegido para ti';

  @override
  String get agendaSuggestionsAlternates => 'También genial';

  @override
  String get agendaSuggestionsBrowseAll => 'Explorar todo';

  @override
  String get onboardPrefTravelerSolo => 'En solitario';

  @override
  String get onboardPrefTravelerCouple => 'Pareja';

  @override
  String get onboardPrefTravelerFamily => 'Familia';

  @override
  String get onboardPrefTravelerFriends => 'Amigos';

  @override
  String get onboardPrefTravelerBusiness => 'Negocio';

  @override
  String get onboardPrefChildrenNone => 'sin niños';

  @override
  String get onboardPrefChildrenToddlers => 'niños pequeños';

  @override
  String get onboardPrefChildrenElementary => 'Edad elemental';

  @override
  String get onboardPrefChildrenTeenagers => 'Adolescentes';

  @override
  String get onboardPrefStyleLuxury => 'Lujo';

  @override
  String get onboardPrefStyleRelaxation => 'Relajación';

  @override
  String get onboardPrefStyleAdventure => 'Aventura';

  @override
  String get onboardPrefStyleThemeParks => 'Parques Temáticos';

  @override
  String get onboardPrefStyleFoodie => 'Conocedor gourmet';

  @override
  String get onboardPrefStyleNightlife => 'Vida nocturna';

  @override
  String get onboardPrefStyleRomance => 'romance';

  @override
  String get onboardPrefStyleShopping => 'Compras';

  @override
  String get onboardPrefStyleBeaches => 'Playas';

  @override
  String get onboardPrefStyleWellness => 'Bienestar';

  @override
  String get onboardPrefStyleNature => 'Naturaleza';

  @override
  String get onboardPrefStylePhotography => 'Fotografía';

  @override
  String get onboardPrefStyleHiddenGems => 'Gemas ocultas';

  @override
  String get onboardPrefStyleFamilyActivities => 'Actividades familiares';

  @override
  String get onboardPrefStyleLocalExperiences => 'Experiencias locales';

  @override
  String get onboardPrefStyleEntertainment => 'Entretenimiento';

  @override
  String get onboardPrefHotelLuxuryResort => 'Complejo turístico de lujo';

  @override
  String get onboardPrefHotelBoutique => 'Hotel Boutique';

  @override
  String get onboardPrefHotelFamilyResort => 'Resort familiar';

  @override
  String get onboardPrefHotelBudgetFriendly => 'Económico';

  @override
  String get onboardPrefHotelAdultsOnly => 'Sólo adultos';

  @override
  String get onboardPrefHotelSpaResort => 'Balneario';

  @override
  String get onboardPrefHotelBeachfront => 'Frente a la playa';

  @override
  String get onboardPrefHotelDowntown => 'Centro';

  @override
  String get onboardPrefHotelWalkable => 'Área transitable';

  @override
  String get onboardPrefHotelThemeParkArea => 'Área del parque temático';

  @override
  String get onboardPrefHotelModern => 'Hotel moderno';

  @override
  String get onboardPrefHotelHistoric => 'Hotel histórico';

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
  String get onboardPrefAmenitySpa => 'Balneario';

  @override
  String get onboardPrefAmenityGym => 'Gimnasia';

  @override
  String get onboardPrefAmenityBreakfast => 'Desayuno Gratis';

  @override
  String get onboardPrefAmenityOceanView => 'Vista al mar';

  @override
  String get onboardPrefAmenityBalcony => 'Balcón';

  @override
  String get onboardPrefAmenityKitchen => 'Cocina';

  @override
  String get onboardPrefAmenityShuttle => 'Servicio de transporte';

  @override
  String get onboardPrefAmenityPetFriendly => 'Se admiten mascotas';

  @override
  String get onboardPrefCuisineAmerican => 'Americano';

  @override
  String get onboardPrefCuisineItalian => 'italiano';

  @override
  String get onboardPrefCuisineMexican => 'mexicano';

  @override
  String get onboardPrefCuisineSeafood => 'Mariscos';

  @override
  String get onboardPrefCuisineSteakhouse => 'asador';

  @override
  String get onboardPrefCuisineSushi => 'sushi';

  @override
  String get onboardPrefCuisineCuban => 'cubano';

  @override
  String get onboardPrefCuisineMediterranean => 'mediterráneo';

  @override
  String get onboardPrefCuisineAsian => 'asiático';

  @override
  String get onboardPrefCuisineBbq => 'barbacoa';

  @override
  String get onboardPrefCuisineFineDining => 'Cena elegante';

  @override
  String get onboardPrefCuisineLocalFavorites => 'Favoritos locales';

  @override
  String get onboardPrefCuisineFoodTrucks => 'Camiones de comida';

  @override
  String get onboardPrefCuisineRooftop => 'Comedor en la azotea';

  @override
  String get onboardPrefCuisineBrunch => 'Desalmuerzo';

  @override
  String get onboardPrefCuisineDessert => 'Postre';

  @override
  String get onboardPrefDiningQuick => 'Servicio rápido';

  @override
  String get onboardPrefDiningCasual => 'Cenas informales';

  @override
  String get onboardPrefDiningFamily => 'Ideal para familias';

  @override
  String get onboardPrefDiningDateNight => 'cita nocturna';

  @override
  String get onboardPrefDiningFine => 'Cena elegante';

  @override
  String get onboardPrefDiningWaterfront => 'Frente al mar';

  @override
  String get onboardPrefDiningHiddenGems => 'Gemas ocultas';

  @override
  String get onboardPrefDiningLocal => 'Favoritos locales';

  @override
  String get onboardPrefGoalMakeMemories => 'Hacer recuerdos';

  @override
  String get onboardPrefGoalSaveMoney => 'Ahorre dinero';

  @override
  String get onboardPrefGoalAvoidCrowds => 'Evite las multitudes';

  @override
  String get onboardPrefGoalLuxury => 'Experiencias de lujo';

  @override
  String get onboardPrefGoalBestFood => 'La mejor comida';

  @override
  String get onboardPrefGoalHiddenGems => 'Gemas ocultas';

  @override
  String get onboardPrefGoalRelaxation => 'Relajación';

  @override
  String get onboardPrefGoalAdventure => 'Aventura';

  @override
  String get onboardPrefGoalBestPhotos => 'Mejores fotos';

  @override
  String get onboardPrefGoalFamilyTime => 'Tiempo en familia';

  @override
  String get onboardPrefGoalRomance => 'romance';

  @override
  String get onboardPrefGoalNightlife => 'Vida nocturna';

  @override
  String get onboardPrefGoalLocal => 'Experiencias locales';

  @override
  String get onboardPrefGoalStressFree => 'Planificación sin estrés';

  @override
  String get onboardPrefExpBoatTours => 'Paseos en barco';

  @override
  String get onboardPrefExpSunsetCruises => 'Cruceros al atardecer';

  @override
  String get onboardPrefExpAirboat => 'Tours en hidrodeslizador';

  @override
  String get onboardPrefExpThemeParks => 'Parques Temáticos';

  @override
  String get onboardPrefExpMuseums => 'Museos';

  @override
  String get onboardPrefExpLiveShows => 'Shows en vivo';

  @override
  String get onboardPrefExpSpas => 'Balnearios';

  @override
  String get onboardPrefExpShopping => 'Compras';

  @override
  String get onboardPrefExpWaterParks => 'Parques acuáticos';

  @override
  String get onboardPrefExpGolf => 'Golf';

  @override
  String get onboardPrefExpFishing => 'Pesca';

  @override
  String get onboardPrefExpKayaking => 'kayak';

  @override
  String get onboardPrefExpSnorkeling => 'snorkel';

  @override
  String get onboardPrefExpRooftopBars => 'Bares en la azotea';

  @override
  String get onboardPrefExpNightclubs => 'discotecas';

  @override
  String get onboardPrefExpWildlife => 'Experiencias de vida silvestre';

  @override
  String get onboardPrefExpFoodTours => 'Tours gastronómicos';

  @override
  String get onboardPrefExpScenicDrives => 'Rutas panorámicas';

  @override
  String get onboardPrefAvoidCrowds => 'Multitudes';

  @override
  String get onboardPrefAvoidLongLines => 'Largas colas';

  @override
  String get onboardPrefAvoidExpensiveRestaurants => 'Restaurantes caros';

  @override
  String get onboardPrefAvoidWalking => 'Caminar largas distancias';

  @override
  String get onboardPrefAvoidNightlife => 'Vida nocturna';

  @override
  String get onboardPrefAvoidDriving => 'Conduciendo';

  @override
  String get onboardPrefAvoidTouristTraps => 'Trampas para turistas';

  @override
  String get onboardPrefAvoidEarlyMornings => 'Temprano en la mañana';

  @override
  String get onboardPrefAvoidLateNights => 'Tarde en la noche';

  @override
  String get onboardPrefAvoidFamilyAttractions => 'Atracciones familiares';

  @override
  String get onboardPrefAvoidThemeParks => 'Parques Temáticos';

  @override
  String get onboardPrefEmotionRelaxed => 'Relajado';

  @override
  String get onboardPrefEmotionExcited => 'Entusiasmado';

  @override
  String get onboardPrefEmotionAdventurous => 'Aventurero';

  @override
  String get onboardPrefEmotionRomantic => 'Romántico';

  @override
  String get onboardPrefEmotionLuxurious => 'Lujoso';

  @override
  String get onboardPrefEmotionFamilyFocused => 'Centrado en la familia';

  @override
  String get onboardPrefEmotionMemorable => 'Inolvidable';

  @override
  String get onboardPrefEmotionStressFree => 'Sin estrés';

  @override
  String get onboardPrefEmotionInspiring => 'inspirador';

  @override
  String get onboardPrefPaceSlow => 'Relajado';

  @override
  String get onboardPrefPaceBalanced => 'Equilibrado';

  @override
  String get onboardPrefPacePacked => 'Lleno';

  @override
  String get onboardSummaryHiddenGemsInsight =>
      'Restaurantes locales escondidos y joyas';

  @override
  String get onboardBuildFailedHint =>
      'Guardamos tus preferencias, pero el itinerario necesita un momento más. Tire para actualizar en Agenda o abra Concierge.';

  @override
  String get onboardV2ChildrenSubtitle =>
      'Seleccione todos los grupos de edad que correspondan.';

  @override
  String get onboardTravelerNameEyebrow => 'Lo primero es lo primero';

  @override
  String get onboardTravelerNameTitle => '¿Cómo debería llamarte Luxora?';

  @override
  String get onboardTravelerNameSubtitle =>
      'Tu nombre es suficiente: Luxora lo usará cuando chatees.';

  @override
  String get onboardTravelerNameLabel => 'tu nombre';

  @override
  String get onboardTravelerNameHint => 'p.ej. María';

  @override
  String conciergeWelcomeNamed(String name) {
    return 'Bienvenido, $name, tu compañero de Florida emocionalmente inteligente.\n\nElija un mensaje a continuación o describa la sensación que desea que cree su viaje.';
  }

  @override
  String conciergeWelcomeWarmNamed(String name) {
    return '$name, estoy aquí para darle forma a Florida según cómo quieres sentirte, no para una lista de lugares de interés. ¿Qué se te antoja hoy?';
  }

  @override
  String get onboardWelcomeEyebrow => 'LUXORA';

  @override
  String get onboardWelcomeTitle => 'Hola, soy Luxora.';

  @override
  String get onboardWelcomeTagline => 'Tu concierge de viajes personal.';

  @override
  String get onboardWelcomeBody =>
      'Estoy aquí para ayudarte a descubrir lugares increíbles, evitar trampas turísticas y crear unas vacaciones que recordarás durante años.\n\nEmpecemos a planear algo inolvidable.';

  @override
  String get onboardWelcomeCta => 'Comenzar mi viaje';

  @override
  String get onboardLuxoraGuideBody =>
      'A partir de ahora, te guiaré en cada paso del camino.\n\nYa sea joyas ocultas, comida increíble, experiencias inolvidables o simplemente unas vacaciones sin estrés, te tengo cubierto.';

  @override
  String get onboardLuxoraReplyClosing =>
      'Creemos juntos tu aventura perfecta.';

  @override
  String onboardBuildingTitle(String name) {
    return 'Excelente elección, $name.';
  }

  @override
  String get onboardBuildingBody =>
      'Estoy creando un itinerario personalizado según tu estilo de viaje, intereses, ritmo, preferencias gastronómicas y objetivos de vacaciones.\n\nEsto puede tomar un momento.';

  @override
  String get onboardBuildingTagline =>
      'Las buenas vacaciones suceden por casualidad.\n\nLas grandes vacaciones suceden con un plan.';

  @override
  String get onboardItineraryReadyTitle => 'Tu aventura está lista.';

  @override
  String get onboardItineraryReadyBody =>
      'He seleccionado cuidadosamente experiencias, restaurantes, atracciones y joyas ocultas que coinciden con el viaje que describiste.\n\nPor supuesto, podemos ajustar cualquier cosa en el camino.\n\nAl fin y al cabo, las mejores vacaciones evolucionan mientras ocurren.';

  @override
  String weatherRerouteLuxoraIntro(String name) {
    return '$name, parece que el clima podría afectar parte de los planes de hoy.';
  }

  @override
  String get weatherRerouteLuxoraClosing =>
      'A veces lo inesperado crea los mejores recuerdos.';

  @override
  String rightNowLuxoraIntro(String name) {
    return '$name, según tu ubicación, el clima actual y tus preferencias, esto es lo que haría ahora mismo.';
  }

  @override
  String get rightNowLuxoraClosing =>
      'Confía en mí.\n\nCreo que te va a encantar.';

  @override
  String paywallPersonalPitch(String name, String cityName) {
    return '$name, tu plan de vacaciones personalizado ya está tomando forma.\n\nEl Día 1 está listo.\n\nEl resto de tu viaje te espera.\n\nDesbloquea $cityName Concierge para acceder a tu itinerario completo, joyas ocultas, secretos locales, inteligencia meteorológica y orientación concierge ilimitada.\n\nHagamos inolvidables estas vacaciones.';
  }

  @override
  String get onboardLuxoraReplyEyebrow => 'LÚXORA';

  @override
  String onboardLuxoraReplyTitle(String name) {
    return 'Encantado de conocerte, $name.';
  }

  @override
  String onboardLuxoraGuideNamed(String name) {
    return 'A partir de ahora, te guiaré en cada paso del camino.\n\nYa sea joyas ocultas, comida increíble, experiencias inolvidables o simplemente unas vacaciones sin estrés, te tengo cubierto.';
  }

  @override
  String get onboardLuxoraItineraryPromise =>
      'Creemos juntos tu aventura perfecta.';

  @override
  String get onboardReturningEyebrow => 'BIENVENIDO DE NUEVO';

  @override
  String onboardReturningTitle(String name) {
    return 'Bienvenido de nuevo, $name.';
  }

  @override
  String get onboardReturningTitleGeneric => 'Bienvenido de nuevo.';

  @override
  String get onboardReturningSubtitle =>
      '¿Listo para continuar tu aventura?\n\nHe guardado tus preferencias, lugares favoritos y planes de viaje para retomar justo donde lo dejamos.\n\nVeamos qué te espera hoy.';

  @override
  String get todayPlanSectionTitle => 'El plan de hoy';

  @override
  String get todayNextActivityLabel => 'A continuación';

  @override
  String get todayStaysDiningSection => 'Estancias y selecciones gastronómicas';

  @override
  String get todayStaysDiningCollapsedHint =>
      'Ideas de hoteles y restaurantes: toque para ampliar';

  @override
  String get todayPlanDetailsTitle => 'Horario completo';

  @override
  String todayPlanStopCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paradas hoy',
      one: '1 stop today',
    );
    return '$_temp0';
  }

  @override
  String get todayRainRerouteTitle => 'Cambio por clima';

  @override
  String get todayExtrasSection => 'Entradas y compartir';

  @override
  String get todayExtrasCollapsedHint => 'Ofertas, compartir tarjeta y más';

  @override
  String freemiumVacationTitle(String cityName) {
    return 'Tus vacaciones en $cityName';
  }

  @override
  String get freemiumDay1Ready => '✓ Día 1 listo';

  @override
  String get freemiumUnlockFullPlan => 'Desbloquea tu plan vacacional completo';

  @override
  String freemiumLockedDayConcierge(int day) {
    return 'Día $day · Optimizado por concierge';
  }

  @override
  String get freemiumLockedDayGems => 'Día 3 · Ruta de joyas ocultas';

  @override
  String get freemiumLockedDayWeather => 'Día 4 · Planificación según el clima';

  @override
  String get freemiumLockedDayDeparture => 'Día 5 · Estrategia de salida';

  @override
  String freemiumConciergeRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count preguntas gratis restantes',
      one: '1 pregunta gratis restante',
    );
    return '$_temp0';
  }

  @override
  String get freemiumConciergeLimitReached =>
      'Límite gratuito de concierge alcanzado — desbloquea planificación ilimitada.';

  @override
  String freemiumLockedHotels(int count) {
    return '🔒 $count+ hoteles adicionales disponibles';
  }

  @override
  String freemiumLockedRestaurants(int count) {
    return '🔒 $count+ restaurantes adicionales disponibles';
  }

  @override
  String freemiumLockedGems(int count) {
    return '🔒 $count+ joyas ocultas disponibles';
  }

  @override
  String freemiumLockedSecrets(int count) {
    return '🔒 $count+ secretos locales disponibles';
  }

  @override
  String freemiumLockedExperiences(int count) {
    return '🔒 $count+ experiencias disponibles';
  }

  @override
  String get freemiumLockedAttractions => '🔒 Más atracciones disponibles';

  @override
  String freemiumUnlockExplore(String cityName) {
    return 'Desbloquea $cityName Concierge para seguir explorando.';
  }

  @override
  String freemiumUnlockConcierge(String cityName) {
    return 'Desbloquear $cityName Concierge';
  }

  @override
  String freemiumHeadlineDayTwoPlus(String cityName) {
    return 'Tus próximos días están listos — desbloquea el plan completo de $cityName.';
  }

  @override
  String get freemiumHeadlineConciergeLimit =>
      'Sigue planificando con acceso ilimitado al concierge.';

  @override
  String freemiumHeadlineHotels(String cityName) {
    return 'Desbloquea $cityName Concierge para cada recomendación de hotel.';
  }

  @override
  String freemiumHeadlineRestaurants(String cityName) {
    return 'Desbloquea la colección completa de restaurantes de $cityName.';
  }

  @override
  String get freemiumHeadlineGems =>
      'Favoritos locales y joyas ocultas te esperan.';

  @override
  String get freemiumHeadlineSecrets =>
      'Desbloquea secretos de horarios y estacionamiento de residentes.';

  @override
  String freemiumHeadlineExperiences(String cityName) {
    return 'Desbloquea experiencias curadas en todo $cityName.';
  }

  @override
  String get freemiumHeadlineAttractions =>
      'Desbloquea la colección completa de atracciones.';

  @override
  String get freemiumHeadlineHotelMatchmaker =>
      'Desbloquea Hotel Intelligence para comparar cada estancia.';

  @override
  String get freemiumHeadlineFullItinerary =>
      'Desbloquea tu plan vacacional completo.';

  @override
  String get freemiumLocalSecretsTitle => 'Secretos locales';

  @override
  String get freemiumLocalSecretsSubtitle =>
      'Horarios, estacionamiento y miradores que los locales protegen.';
}
