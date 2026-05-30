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
      'Lujo cinematográfico o claridad legible — elige lo que encaje con tu día.';

  @override
  String get settingsThemeSectionLuxury => 'Lujo cinematográfico';

  @override
  String get settingsThemeSectionReadable => 'Claro y legible';

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
  String get navDiscover => 'Descubrir';

  @override
  String get navMap => 'Mapa';

  @override
  String get navTrips => 'Viajes';

  @override
  String get navMore => 'Más';

  @override
  String get navTimeline => 'Cronología';

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
    return 'Precios del $date';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'No se pudieron actualizar los precios — mostrando ofertas en caché.';

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
      'Key Largo, Islamorada y corredor del arrecife superior';

  @override
  String get radiusDesc50Keys =>
      'Marathon, Big Pine y playas de los Cayos medios';

  @override
  String get radiusDesc100Keys => 'Toda la Overseas Highway hasta Key West';

  @override
  String get radiusDescAllKeys =>
      'Toda la cadena de islas y aguas de excursiones';

  @override
  String get feedBadge => 'DESCUBRIMIENTO EN VIVO';

  @override
  String get feedTitle => 'Feed de experiencias';

  @override
  String get feedSubtitle =>
      'Lo que se mueve ahora: lugares en tendencia, nuevas aperturas, elecciones de creadores, rutas de temporada y actualizaciones en vivo.';

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
  String get feedMoodAll => 'Todo';

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
  String get feedEmptyHint =>
      'No hay tarjetas del feed en este radio; prueba 50 mi o Toda Florida para la costa del Golfo y los Cayos.';

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
  String get mapPlanDayTitle => 'La agenda de hoy';

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
    return '$time en coche · $miles desde la parada anterior';
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
  String get mapParkingLevelLimited => 'Limitado · llega temprano';

  @override
  String mapParkingAtStop(String level) {
    return 'Aparcamiento: $level';
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
      'Es probable que llueva: toque el desvío para realizar copias de seguridad en interiores.';

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
      'Permite el micrófono para que Luxora pueda escucharte.';

  @override
  String get conciergeVoiceListening => 'Luxora está escuchando…';

  @override
  String get conciergeVoiceRelease => 'Suelta para enviar';

  @override
  String get conciergeVoiceNoSpeech =>
      'No te entendí — mantén pulsado, habla y suelta.';

  @override
  String get conciergeVoicePreviewFailed =>
      'No se pudo reproducir la vista previa. Revisa el volumen e inténtalo de nuevo.';

  @override
  String get conciergeVoiceUnavailable =>
      'La voz no está disponible en este dispositivo.';

  @override
  String get conciergeVoiceSettingsTitle => 'Voz de Luxora';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Elige acento, tono y ritmo — usa las voces integradas de tu dispositivo.';

  @override
  String get conciergeVoiceRateLabel => 'Ritmo al hablar';

  @override
  String get conciergeVoiceRateSlow => 'Lento';

  @override
  String get conciergeVoiceRateNatural => 'Natural';

  @override
  String get conciergeVoiceRateFast => 'Rápido';

  @override
  String get conciergeVoicePreview => 'Probar voz';

  @override
  String get conciergeVoicePreviewSample =>
      'Hola — soy Luxora. Dime cómo quieres sentir este viaje.';

  @override
  String get conciergeVoiceDeviceNote =>
      'Las voces disponibles dependen de los paquetes de idioma de tu dispositivo.';

  @override
  String get conciergeVoiceRegionRecommended => 'Recomendado';

  @override
  String get conciergeVoiceRegionEnglish => 'Inglés';

  @override
  String get conciergeVoiceRegionRussian => 'Ruso';

  @override
  String get conciergeVoiceRegionSpanish => 'Español';

  @override
  String get conciergeVoiceRegionFrench => 'Francés';

  @override
  String get conciergeVoiceRegionGerman => 'Alemán';

  @override
  String get conciergeVoiceRegionOther => 'Otros';

  @override
  String get conciergeVoicePresetMatchApp => 'Idioma de la app · Femenina';

  @override
  String get conciergeVoicePresetEnUsF => 'Estadounidense · Femenina';

  @override
  String get conciergeVoicePresetEnUsM => 'Estadounidense · Masculina';

  @override
  String get conciergeVoicePresetEnGbF => 'Británica · Femenina';

  @override
  String get conciergeVoicePresetEnGbM => 'Británica · Masculina';

  @override
  String get conciergeVoicePresetRuF => 'Rusa · Femenina';

  @override
  String get conciergeVoicePresetRuM => 'Ruso · Masculino';

  @override
  String get conciergeVoicePresetEsF => 'Española · Femenina';

  @override
  String get conciergeVoicePresetEsM => 'Española · Masculina';

  @override
  String get conciergeVoicePresetFrF => 'Francesa · Femenina';

  @override
  String get conciergeVoicePresetFrM => 'Francés · Masculino';

  @override
  String get conciergeVoicePresetDeF => 'Alemana · Femenina';

  @override
  String get conciergeVoicePresetDeM => 'Alemán · Masculino';

  @override
  String get conciergeThinking => 'Luxora está pensando…';

  @override
  String get conciergeAiError =>
      'No pude contactar a Luxora. Comprueba tu conexión e inténtalo de nuevo.';

  @override
  String get conciergeAiNotConfigured =>
      'El concierge en vivo requiere Supabase + OpenAI. Añade SUPABASE_URL y SUPABASE_ANON_KEY a tu config local y despliega la función concierge-chat — ver docs/CONCIERGE_AI.md.';

  @override
  String get mapAiPowers => 'Poderes del mapa IA';

  @override
  String get mapNavLayerTitle => 'Inteligencia de fricción por parada';

  @override
  String get mapNavLayerSubtitle =>
      'Multitudes, aparcamiento y estrés de conducción en tu plan — más reruta espontánea.';

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
  String get mapFutureCrowdTitle => 'Perspectiva de multitudes';

  @override
  String get mapFutureCrowdDesc =>
      'Ventanas previstas de tranquilo a lleno en cada parada de Plan my day.';

  @override
  String get mapFutureParkingTitle => 'Perspectiva de aparcamiento';

  @override
  String get mapFutureParkingDesc =>
      'Fricción estimada de valet, garaje y llegada antes de salir.';

  @override
  String get mapFutureTrafficTitle => 'Drive friction score';

  @override
  String get mapFutureTrafficDesc =>
      'Puntuación de estrés por tramo en tu plan del día — no solo minutos.';

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
  String get tripsEditDates => 'Fechas del viaje';

  @override
  String get tripsSaveDates => 'Guardar fechas';

  @override
  String get tripsDatesUpdated => 'Fechas actualizadas';

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
  String get tripsOpenTimeline => 'Abrir línea de tiempo completa';

  @override
  String get tripsShare => 'Compartir';

  @override
  String get shareItineraryFooter =>
      'Planificado con Luxora, su compañero de Florida emocionalmente inteligente.';

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
  String get detailTravelIntelTitle => 'Perspectiva de fricción del viaje';

  @override
  String get detailTravelIntelSubtitle =>
      'Predicción por categoría, hora y distancia — sin sensores en vivo.';

  @override
  String detailCrowdOutlook(String level) {
    return 'Multitud: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'Aparcamiento: $level';
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
  String get landingBegin => 'Comienza tu viaje';

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
      'Cada destino tiene su propio desbloqueo de concierge — compra única por ciudad. Los parques de Orlando son un pack (Disney y Universal juntos).';

  @override
  String get landingCityLabel => '¿A dónde vas?';

  @override
  String get paywallSwitchCity => 'Destino';

  @override
  String get cityPickerUnlocked => 'Desbloqueado';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Desbloquear $price';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Complemento Orlando · Disney y Universal juntos';

  @override
  String get onboardStep2Title => 'Hora de sentirte libre';

  @override
  String get onboardStep2Subtitle => '¿Cuándo empieza tu escape?';

  @override
  String get onboardStartDateLabel => 'Fecha de inicio';

  @override
  String get onboardEndDateLabel => 'Fecha de fin';

  @override
  String get onboardPickDate => 'Toca para elegir';

  @override
  String get onboardSelectStartDate => 'Elegir fecha de inicio';

  @override
  String get onboardSelectEndDate => 'Elegir fecha de fin';

  @override
  String get onboardDatesHint =>
      'Puedes cambiarlas cuando quieras en la pestaña Viajes.';

  @override
  String get onboardStepBudgetTitle => 'Planifica con calma';

  @override
  String get onboardStepBudgetSubtitle => '¿Qué encaja con esta escapada?';

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
  String get weatherRadarPause => 'Pausar bucle';

  @override
  String get weatherRadarTapToExpand => 'Toca para pantalla completa';

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
      'Enlace de reserva no disponible para esta estancia.';

  @override
  String get hotelLinkOpenFailed =>
      'No se pudo abrir el enlace — inténtalo de nuevo en el navegador.';

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
      'Compra única · Conserje personal · Sin suscripción';

  @override
  String get settingsUnlockConciergeTitle =>
      'Desbloquear el conserje de la ciudad';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'Paquete de ciudad único: no es una suscripción';

  @override
  String get settingsOpenConciergeSubtitle =>
      'Abrir la pestaña del conserje con IA';

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
  String miamiMoodRouteStart(String time) {
    return 'Comienza alrededor de las $time';
  }

  @override
  String get keysWaterIntelTitle => 'Inteligencia acuática de los Cayos';

  @override
  String keysWaterBestTime(String time) {
    return 'Mejor ventana: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Agua: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Snorkel';

  @override
  String get keysWaterDivingScore => 'Buceo';

  @override
  String get keysWaterBoatingScore => 'Barco';

  @override
  String get keysWaterFishingScore => 'Pesca';

  @override
  String get keysWaterWindScore => 'Viento';

  @override
  String get keysWaterSunsetScore => 'Atardecer';

  @override
  String get keysWaterCrowdScore => 'Multitud';

  @override
  String get keysMoodRoutesTitle => 'Rutas isleñas de los Cayos';

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
  String get paywallOrlandoAddonsHeading => 'Pack de parques temáticos';

  @override
  String get paywallOrlandoBaseIncludes =>
      'Orlando incluye gastronomía, joyas ocultas, hoteles y experiencias fuera de parques. Añade el pack de parques para Disney y Universal juntos.';

  @override
  String get paywallAddonThemeParksTitle => 'Pack Disney y Universal';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World y Universal Orlando — todos los parques, ofertas, rutas e inteligencia de multitudes en un desbloqueo.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return 'Desbloquear $packName · $price';
  }

  @override
  String get paywallAddonUnlocked => 'Desbloqueado';

  @override
  String get paywallAddonRequiresOrlando =>
      'Requiere desbloquear Orlando primero';

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
      'Añade el pack de parques para Walt Disney World y Universal Orlando — todos los parques, ofertas de entradas, rutas e inteligencia de multitudes en un desbloqueo.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Desbloquear · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Ahora no';
}
