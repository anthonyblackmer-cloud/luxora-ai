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
  String get commonClose => 'Cerrar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get settingsStartOverSubtitle => 'Empieza un viaje nuevo desde cero';

  @override
  String get navConcierge => 'Concierge';

  @override
  String get navTimeline => 'Cronología';

  @override
  String get navMap => 'Mapa';

  @override
  String get navGems => 'Joyas';

  @override
  String get navFeed => 'Feed';

  @override
  String get navTrips => 'Viajes';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'Concierge';

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
  String get discoverSearchScopeAll =>
      'Buscando en todo el catálogo de Florida';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'A $radius de Orlando';
  }

  @override
  String get discoverSearchEmpty =>
      'No hay coincidencias en este radio; prueba con un nombre más corto, amplía la distancia en Mapa o Feed, o busca “playa”, “Disney” o “manantiales”.';

  @override
  String get discoverFilterAll => 'Todos';

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
  String scopeDestinationsAll(int count) {
    return '$count destinos · toda Florida';
  }

  @override
  String get radius25 => '25 mi';

  @override
  String get radius50 => '50 mi';

  @override
  String get radius100 => '100 mi';

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
  String get mapPlanDayTitle => 'Planear mi día';

  @override
  String get mapPlanDaySuggested =>
      'Sugerido según el ánimo de tu viaje: marca lugares para personalizarlo.';

  @override
  String get mapPlanDayEmpty =>
      'Marca destinos (♥) y Luxora crea una ruta optimizada desde tu base en Orlando: menos conducción, más emoción.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count paradas · $miles · $time en coche';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'Saliendo desde $hotel';
  }

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
  String get tripsPlanNew => 'Planificar un nuevo viaje';

  @override
  String get tripsEmptyTitle => 'Aún no hay viajes guardados';

  @override
  String get tripsEmptyBody =>
      'Planifica tu primer viaje y aparecerá aquí, listo para retomarlo cuando quieras.';

  @override
  String get tripsDeleteTitle => '¿Eliminar viaje?';

  @override
  String tripsDeleteBody(String title) {
    return 'Esto elimina “$title” de tus viajes guardados. No se puede deshacer.';
  }

  @override
  String get tripsDeleted => 'Viaje eliminado';

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
  String get detailPrice => 'Precio';

  @override
  String get detailLocation => 'Ubicación';

  @override
  String get detailGetDirections => 'Cómo llegar';

  @override
  String get detailParkMap => 'Mapa del parque';

  @override
  String get detailViewOnMap => 'Ver en el mapa';

  @override
  String get detailMapsError => 'No se pudo abrir el mapa en este dispositivo.';

  @override
  String get detailGoogleMaps => 'Google Maps';

  @override
  String get detailAppleMaps => 'Apple Maps';

  @override
  String get detailOpenInMaps => 'Abrir en mapas';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time en coche desde Orlando';
  }

  @override
  String get detailSaveToItinerary => 'Guardar en el itinerario';

  @override
  String get detailSaved => 'Guardado';

  @override
  String get detailSavedSnack => 'Guardado en tu itinerario';

  @override
  String get detailRemovedSnack => 'Eliminado de tu itinerario';

  @override
  String get detailSetHomeBase => 'Establecer como base';

  @override
  String get detailHomeBaseActive => 'Tu base del viaje';

  @override
  String get detailHomeBaseHint => 'La ruta de tu día empieza y termina aquí.';

  @override
  String get detailHomeBaseSetSnack => 'Establecido como base de tu viaje';

  @override
  String get detailHomeBaseClearedSnack => 'Base eliminada';

  @override
  String get detailMenuTitle => 'Destacados del menú';

  @override
  String get detailMenuDisclaimer =>
      'Selección destacada — el menú completo y los precios pueden variar en el local.';

  @override
  String get detailMenuComingSoon =>
      'Todavía estamos preparando este menú. Mientras tanto, consulta el menú y los precios más recientes en línea.';

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
  String get onboardStep2Title => 'Hora de sentirte libre';

  @override
  String get onboardStep2Subtitle => '¿Cuándo empieza tu escape?';

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
  String get onboardPoolside => 'Piscina y descanso';

  @override
  String get onboardAdventure => 'Aventura y aire libre';

  @override
  String get onboardCulture => 'Cultura y turismo';

  @override
  String get dayFlowSubtitle =>
      'Un día diseñado según cómo quieres sentirte, no una lista de tareas.';

  @override
  String get dayFlowMorning => 'MAÑANA';

  @override
  String get dayFlowMidday => 'MEDIODÍA';

  @override
  String get dayFlowAfternoon => 'TARDE';

  @override
  String get dayFlowEvening => 'ATARDECER';

  @override
  String get dayFlowNight => 'NOCHE';

  @override
  String get dayFlowReasonMorningPool =>
      'Empieza sin prisa: piscina o spa antes de que arranque el día.';

  @override
  String get dayFlowReasonMorningCalm =>
      'Un comienzo tranquilo para marcar el tono.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Horas de máxima energía: la gran aventura mientras estás fresco.';

  @override
  String get dayFlowReasonMiddayCulture => 'Turismo con la mejor luz del día.';

  @override
  String get dayFlowReasonMiddayIcon => 'El momento estrella del día.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Descanso por la tarde para recargar.';

  @override
  String get dayFlowReasonAfternoonGem =>
      'Un tesoro escondido lejos de las multitudes.';

  @override
  String get dayFlowReasonEveningDining =>
      'La comida del día: tu elección gastronómica.';

  @override
  String get dayFlowReasonNightOut => 'Un último brillo: una noche fuera.';

  @override
  String get dayFlowVibeFoodie => 'Gastronómico';

  @override
  String get dayFlowVibeNightlife => 'Vida nocturna';

  @override
  String get dayFlowVibePoolside => 'Piscina';

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
  String get catSpas => 'Spas';

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
}
