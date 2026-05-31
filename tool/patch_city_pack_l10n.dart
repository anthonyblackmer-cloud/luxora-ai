// ignore_for_file: avoid_print
//
// Translates city-pack UI strings (freemium, Tampa local secrets, mood routes).
// Run: dart run tool/patch_city_pack_l10n.dart && flutter gen-l10n

import 'dart:convert';
import 'dart:io';

void main() {
  const locales = [
    'de',
    'es',
    'fr',
    'it',
    'pt',
    'ru',
    'hi',
    'tr',
    'ja',
    'ko',
    'zh',
  ];

  final translations = _translations();
  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map = jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map.addAll(translations[locale]!);
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, Map<String, dynamic>> _translations() => {
      'de': _de(),
      'es': _es(),
      'fr': _fr(),
      'it': _it(),
      'pt': _pt(),
      'ru': _ru(),
      'hi': _hi(),
      'tr': _tr(),
      'ja': _ja(),
      'ko': _ko(),
      'zh': _zh(),
    };

Map<String, dynamic> _shared({
  required String tampaRiverwalk,
  required String tampaClearwater,
  required String tampaDali,
  required String tampaPier,
  required String tampaYbor,
  required String tampaSponge,
  required String tampaMoodRoutes,
  required String stAugustineMoodRoutes,
  required String naplesMoodRoutes,
  required String destinMoodRoutes,
  required String freemiumVacationTitle,
  required String freemiumDay1Ready,
  required String freemiumUnlockFullPlan,
  required String freemiumLockedDayConcierge,
  required String freemiumLockedDayGems,
  required String freemiumLockedDayWeather,
  required String freemiumLockedDayDeparture,
  required String freemiumConciergeRemaining,
  required String freemiumConciergeLimitReached,
  required String freemiumLockedHotels,
  required String freemiumLockedRestaurants,
  required String freemiumLockedGems,
  required String freemiumLockedSecrets,
  required String freemiumLockedExperiences,
  required String freemiumLockedAttractions,
  required String freemiumUnlockExplore,
  required String freemiumUnlockConcierge,
  required String freemiumHeadlineDayTwoPlus,
  required String freemiumHeadlineConciergeLimit,
  required String freemiumHeadlineHotels,
  required String freemiumHeadlineRestaurants,
  required String freemiumHeadlineGems,
  required String freemiumHeadlineSecrets,
  required String freemiumHeadlineExperiences,
  required String freemiumHeadlineAttractions,
  required String freemiumHeadlineHotelMatchmaker,
  required String freemiumHeadlineFullItinerary,
  required String freemiumLocalSecretsTitle,
  required String freemiumLocalSecretsSubtitle,
}) =>
    {
      'localSecretTampaBayRiverwalkParking': tampaRiverwalk,
      'localSecretTampaBayClearwaterSunset': tampaClearwater,
      'localSecretTampaBayDaliGarden': tampaDali,
      'localSecretTampaBayPierTiming': tampaPier,
      'localSecretTampaBayYborCourtyard': tampaYbor,
      'localSecretTampaBaySpongeDocks': tampaSponge,
      'tampaBayMoodRoutesTitle': tampaMoodRoutes,
      'stAugustineMoodRoutesTitle': stAugustineMoodRoutes,
      'naplesMoodRoutesTitle': naplesMoodRoutes,
      'destin30aMoodRoutesTitle': destinMoodRoutes,
      'freemiumVacationTitle': freemiumVacationTitle,
      'freemiumDay1Ready': freemiumDay1Ready,
      'freemiumUnlockFullPlan': freemiumUnlockFullPlan,
      'freemiumLockedDayConcierge': freemiumLockedDayConcierge,
      'freemiumLockedDayGems': freemiumLockedDayGems,
      'freemiumLockedDayWeather': freemiumLockedDayWeather,
      'freemiumLockedDayDeparture': freemiumLockedDayDeparture,
      'freemiumConciergeRemaining': freemiumConciergeRemaining,
      'freemiumConciergeLimitReached': freemiumConciergeLimitReached,
      'freemiumLockedHotels': freemiumLockedHotels,
      'freemiumLockedRestaurants': freemiumLockedRestaurants,
      'freemiumLockedGems': freemiumLockedGems,
      'freemiumLockedSecrets': freemiumLockedSecrets,
      'freemiumLockedExperiences': freemiumLockedExperiences,
      'freemiumLockedAttractions': freemiumLockedAttractions,
      'freemiumUnlockExplore': freemiumUnlockExplore,
      'freemiumUnlockConcierge': freemiumUnlockConcierge,
      'freemiumHeadlineDayTwoPlus': freemiumHeadlineDayTwoPlus,
      'freemiumHeadlineConciergeLimit': freemiumHeadlineConciergeLimit,
      'freemiumHeadlineHotels': freemiumHeadlineHotels,
      'freemiumHeadlineRestaurants': freemiumHeadlineRestaurants,
      'freemiumHeadlineGems': freemiumHeadlineGems,
      'freemiumHeadlineSecrets': freemiumHeadlineSecrets,
      'freemiumHeadlineExperiences': freemiumHeadlineExperiences,
      'freemiumHeadlineAttractions': freemiumHeadlineAttractions,
      'freemiumHeadlineHotelMatchmaker': freemiumHeadlineHotelMatchmaker,
      'freemiumHeadlineFullItinerary': freemiumHeadlineFullItinerary,
      'freemiumLocalSecretsTitle': freemiumLocalSecretsTitle,
      'freemiumLocalSecretsSubtitle': freemiumLocalSecretsSubtitle,
    };

Map<String, dynamic> _de() => _shared(
      tampaRiverwalk:
          'Whiting-Street-Parkhaus nutzen — südlich am Fluss entlanggehen und Sperrungen am Kai vermeiden.',
      tampaClearwater:
          'Pier-60-Geländer meiden — 40 Min. vor Sonnenuntergang nördlichen Sand-Key-Zugang für Gulf-Farben.',
      tampaDali:
          'Letzten Nachmittagseintritt buchen — Ostgarten-Aussicht fängt Brückenlicht ohne Terrassen-Andrang.',
      tampaPier:
          'Wochentags 16 Uhr Pier-Eintritt — Sonnenuntergang ohne Wochenend-Kinderwagen-Verkehr.',
      tampaYbor:
          'Cubano zum Mitnehmen — im Backstein-Innenhof der Seitenstraße essen, den Einheimische nach 20 Uhr nutzen.',
      tampaSponge:
          'Erst am Dock essen, dann Schwammboote — Tourgruppen lichten sich werktags nach 13 Uhr.',
      tampaMoodRoutes: 'Tampa-Bay-Stimmungsrouten',
      stAugustineMoodRoutes: 'St.-Augustine-Stimmungsrouten',
      naplesMoodRoutes: 'Naples-Stimmungsrouten',
      destinMoodRoutes: 'Destin-&-30A-Stimmungsrouten',
      freemiumVacationTitle: 'Dein {cityName}-Urlaub',
      freemiumDay1Ready: '✓ Tag 1 bereit',
      freemiumUnlockFullPlan: 'Gesamten Urlaubsplan freischalten',
      freemiumLockedDayConcierge: 'Tag {day} · Concierge-optimiert',
      freemiumLockedDayGems: 'Tag 3 · Geheimtipps-Route',
      freemiumLockedDayWeather: 'Tag 4 · Wetterbewusste Planung',
      freemiumLockedDayDeparture: 'Tag 5 · Abreise-Strategie',
      freemiumConciergeRemaining:
          '{count, plural, =1{1 kostenlose Frage übrig} other{{count} kostenlose Fragen übrig}}',
      freemiumConciergeLimitReached:
          'Kostenloses Concierge-Limit erreicht — für unbegrenzte Planung freischalten.',
      freemiumLockedHotels: '🔒 {count}+ weitere Hotels verfügbar',
      freemiumLockedRestaurants: '🔒 {count}+ weitere Restaurants verfügbar',
      freemiumLockedGems: '🔒 {count}+ Geheimtipps verfügbar',
      freemiumLockedSecrets: '🔒 {count}+ lokale Geheimnisse verfügbar',
      freemiumLockedExperiences: '🔒 {count}+ Erlebnisse verfügbar',
      freemiumLockedAttractions: '🔒 Weitere Attraktionen verfügbar',
      freemiumUnlockExplore:
          '{cityName} Concierge freischalten, um weiter zu entdecken.',
      freemiumUnlockConcierge: '{cityName} Concierge freischalten',
      freemiumHeadlineDayTwoPlus:
          'Deine nächsten Tage sind bereit — schalte den vollen {cityName}-Plan frei.',
      freemiumHeadlineConciergeLimit:
          'Weiterplanen mit unbegrenztem Concierge-Zugang.',
      freemiumHeadlineHotels:
          '{cityName} Concierge freischalten für jede Unterkunftsempfehlung.',
      freemiumHeadlineRestaurants:
          'Schalte die komplette Restaurant-Sammlung für {cityName} frei.',
      freemiumHeadlineGems:
          'Lokale Favoriten und Insider-Geheimtipps warten.',
      freemiumHeadlineSecrets:
          'Schalte Insider-Timing und Parkgeheimnisse frei.',
      freemiumHeadlineExperiences:
          'Schalte kuratierte Erlebnisse in ganz {cityName} frei.',
      freemiumHeadlineAttractions:
          'Schalte die komplette Attraktionen-Sammlung frei.',
      freemiumHeadlineHotelMatchmaker:
          'Hotel Intelligence freischalten, um jeden Aufenthalt zu vergleichen.',
      freemiumHeadlineFullItinerary: 'Schalte deinen vollen Urlaubsplan frei.',
      freemiumLocalSecretsTitle: 'Lokale Geheimnisse',
      freemiumLocalSecretsSubtitle:
          'Insider-Timing, Parken und Aussichtspunkte, die Einheimische hüten.',
    );

Map<String, dynamic> _es() => _shared(
      tampaRiverwalk:
          'Usa el garaje de Whiting Street — camina hacia el sur junto al río para evitar cierres cerca del muelle.',
      tampaClearwater:
          'Evita las multitudes del Pier 60 — camina hacia Sand Key 40 minutos antes del atardecer.',
      tampaDali:
          'Reserva la última entrada de la tarde — el mirador del jardín este captura la luz del puente sin aglomeraciones.',
      tampaPier:
          'Entrada al muelle entre semana a las 4 PM — atardecer sin tráfico de carriolas de fin de semana.',
      tampaYbor:
          'Pide sándwiches cubanos para llevar — come en el patio de ladrillo que usan los locales después de las 8 PM.',
      tampaSponge:
          'Almuerza primero en el muelle, barcos de esponja después — los tours se reducen entre semana después de la 1 PM.',
      tampaMoodRoutes: 'Rutas de ambiente Tampa Bay',
      stAugustineMoodRoutes: 'Rutas de ambiente St. Augustine',
      naplesMoodRoutes: 'Rutas de ambiente Naples',
      destinMoodRoutes: 'Rutas de ambiente Destin y 30A',
      freemiumVacationTitle: 'Tus vacaciones en {cityName}',
      freemiumDay1Ready: '✓ Día 1 listo',
      freemiumUnlockFullPlan: 'Desbloquea tu plan vacacional completo',
      freemiumLockedDayConcierge: 'Día {day} · Optimizado por concierge',
      freemiumLockedDayGems: 'Día 3 · Ruta de joyas ocultas',
      freemiumLockedDayWeather: 'Día 4 · Planificación según el clima',
      freemiumLockedDayDeparture: 'Día 5 · Estrategia de salida',
      freemiumConciergeRemaining:
          '{count, plural, =1{1 pregunta gratis restante} other{{count} preguntas gratis restantes}}',
      freemiumConciergeLimitReached:
          'Límite gratuito de concierge alcanzado — desbloquea planificación ilimitada.',
      freemiumLockedHotels: '🔒 {count}+ hoteles adicionales disponibles',
      freemiumLockedRestaurants: '🔒 {count}+ restaurantes adicionales disponibles',
      freemiumLockedGems: '🔒 {count}+ joyas ocultas disponibles',
      freemiumLockedSecrets: '🔒 {count}+ secretos locales disponibles',
      freemiumLockedExperiences: '🔒 {count}+ experiencias disponibles',
      freemiumLockedAttractions: '🔒 Más atracciones disponibles',
      freemiumUnlockExplore:
          'Desbloquea {cityName} Concierge para seguir explorando.',
      freemiumUnlockConcierge: 'Desbloquear {cityName} Concierge',
      freemiumHeadlineDayTwoPlus:
          'Tus próximos días están listos — desbloquea el plan completo de {cityName}.',
      freemiumHeadlineConciergeLimit:
          'Sigue planificando con acceso ilimitado al concierge.',
      freemiumHeadlineHotels:
          'Desbloquea {cityName} Concierge para cada recomendación de hotel.',
      freemiumHeadlineRestaurants:
          'Desbloquea la colección completa de restaurantes de {cityName}.',
      freemiumHeadlineGems:
          'Favoritos locales y joyas ocultas te esperan.',
      freemiumHeadlineSecrets:
          'Desbloquea secretos de horarios y estacionamiento de residentes.',
      freemiumHeadlineExperiences:
          'Desbloquea experiencias curadas en todo {cityName}.',
      freemiumHeadlineAttractions:
          'Desbloquea la colección completa de atracciones.',
      freemiumHeadlineHotelMatchmaker:
          'Desbloquea Hotel Intelligence para comparar cada estancia.',
      freemiumHeadlineFullItinerary: 'Desbloquea tu plan vacacional completo.',
      freemiumLocalSecretsTitle: 'Secretos locales',
      freemiumLocalSecretsSubtitle:
          'Horarios, estacionamiento y miradores que los locales protegen.',
    );

Map<String, dynamic> _fr() => _shared(
      tampaRiverwalk:
          'Garage Whiting Street — marchez vers le sud le long de la rivière pour éviter les fermetures près du quai.',
      tampaClearwater:
          'Évitez la foule du Pier 60 — approche Sand Key au nord 40 min avant le coucher du soleil.',
      tampaDali:
          'Réservez la dernière entrée de l\'après-midi — le jardin est capture la lumière du pont sans foule.',
      tampaPier:
          'Entrée du môle en semaine à 16 h — coucher de soleil sans poussettes du week-end.',
      tampaYbor:
          'Sandwichs cubains à emporter — cour intérieure en briques que les locaux utilisent après 20 h.',
      tampaSponge:
          'Déjeuner au quai d\'abord, bateaux éponges ensuite — groupes plus calmes en semaine après 13 h.',
      tampaMoodRoutes: 'Itinéraires d\'ambiance Tampa Bay',
      stAugustineMoodRoutes: 'Itinéraires d\'ambiance St. Augustine',
      naplesMoodRoutes: 'Itinéraires d\'ambiance Naples',
      destinMoodRoutes: 'Itinéraires d\'ambiance Destin et 30A',
      freemiumVacationTitle: 'Vos vacances à {cityName}',
      freemiumDay1Ready: '✓ Jour 1 prêt',
      freemiumUnlockFullPlan: 'Débloquer votre plan vacances complet',
      freemiumLockedDayConcierge: 'Jour {day} · Optimisé par concierge',
      freemiumLockedDayGems: 'Jour 3 · Route des trésors cachés',
      freemiumLockedDayWeather: 'Jour 4 · Planification météo',
      freemiumLockedDayDeparture: 'Jour 5 · Stratégie de départ',
      freemiumConciergeRemaining:
          '{count, plural, =1{1 question gratuite restante} other{{count} questions gratuites restantes}}',
      freemiumConciergeLimitReached:
          'Limite concierge gratuite atteinte — débloquez une planification illimitée.',
      freemiumLockedHotels: '🔒 {count}+ hôtels supplémentaires disponibles',
      freemiumLockedRestaurants: '🔒 {count}+ restaurants supplémentaires disponibles',
      freemiumLockedGems: '🔒 {count}+ trésors cachés disponibles',
      freemiumLockedSecrets: '🔒 {count}+ secrets locaux disponibles',
      freemiumLockedExperiences: '🔒 {count}+ expériences disponibles',
      freemiumLockedAttractions: '🔒 Autres attractions disponibles',
      freemiumUnlockExplore:
          'Débloquez {cityName} Concierge pour continuer à explorer.',
      freemiumUnlockConcierge: 'Débloquer {cityName} Concierge',
      freemiumHeadlineDayTwoPlus:
          'Vos prochains jours sont prêts — débloquez le plan complet de {cityName}.',
      freemiumHeadlineConciergeLimit:
          'Continuez à planifier avec un accès concierge illimité.',
      freemiumHeadlineHotels:
          'Débloquez {cityName} Concierge pour chaque recommandation d\'hôtel.',
      freemiumHeadlineRestaurants:
          'Débloquez la collection complète de restaurants de {cityName}.',
      freemiumHeadlineGems:
          'Favoris locaux et trésors cachés vous attendent.',
      freemiumHeadlineSecrets:
          'Débloquez les secrets d\'horaires et de stationnement des résidents.',
      freemiumHeadlineExperiences:
          'Débloquez des expériences curatées dans tout {cityName}.',
      freemiumHeadlineAttractions:
          'Débloquez la collection complète d\'attractions.',
      freemiumHeadlineHotelMatchmaker:
          'Débloquez Hotel Intelligence pour comparer chaque séjour.',
      freemiumHeadlineFullItinerary: 'Débloquez votre plan vacances complet.',
      freemiumLocalSecretsTitle: 'Secrets locaux',
      freemiumLocalSecretsSubtitle:
          'Horaires, stationnement et points de vue que les locaux gardent.',
    );

Map<String, dynamic> _it() => _shared(
      tampaRiverwalk:
          'Usa il parcheggio Whiting Street — cammina a sud lungo il fiume per evitare chiusure vicino al molo.',
      tampaClearwater:
          'Evita la folla del Pier 60 — avvicinati a Sand Key 40 minuti prima del tramonto.',
      tampaDali:
          'Prenota l\'ultimo ingresso del pomeriggio — il giardino est cattura la luce del ponte senza affollamento.',
      tampaPier:
          'Ingresso al molo nei giorni feriali alle 16 — tramonto senza passeggini del weekend.',
      tampaYbor:
          'Cuban sandwich da asporto — mangia nel cortile di mattoni usato dai locali dopo le 20.',
      tampaSponge:
          'Pranzo al molo, barche delle spugne dopo — tour più tranquilli nei feriali dopo le 13.',
      tampaMoodRoutes: 'Percorsi mood Tampa Bay',
      stAugustineMoodRoutes: 'Percorsi mood St. Augustine',
      naplesMoodRoutes: 'Percorsi mood Naples',
      destinMoodRoutes: 'Percorsi mood Destin e 30A',
      freemiumVacationTitle: 'La tua vacanza a {cityName}',
      freemiumDay1Ready: '✓ Giorno 1 pronto',
      freemiumUnlockFullPlan: 'Sblocca il piano vacanza completo',
      freemiumLockedDayConcierge: 'Giorno {day} · Ottimizzato dal concierge',
      freemiumLockedDayGems: 'Giorno 3 · Percorso gemme nascoste',
      freemiumLockedDayWeather: 'Giorno 4 · Pianificazione meteo',
      freemiumLockedDayDeparture: 'Giorno 5 · Strategia di partenza',
      freemiumConciergeRemaining:
          '{count, plural, =1{1 domanda gratuita rimasta} other{{count} domande gratuite rimaste}}',
      freemiumConciergeLimitReached:
          'Limite concierge gratuito raggiunto — sblocca pianificazione illimitata.',
      freemiumLockedHotels: '🔒 {count}+ hotel aggiuntivi disponibili',
      freemiumLockedRestaurants: '🔒 {count}+ ristoranti aggiuntivi disponibili',
      freemiumLockedGems: '🔒 {count}+ gemme nascoste disponibili',
      freemiumLockedSecrets: '🔒 {count}+ segreti locali disponibili',
      freemiumLockedExperiences: '🔒 {count}+ esperienze disponibili',
      freemiumLockedAttractions: '🔒 Altre attrazioni disponibili',
      freemiumUnlockExplore:
          'Sblocca {cityName} Concierge per continuare a esplorare.',
      freemiumUnlockConcierge: 'Sblocca {cityName} Concierge',
      freemiumHeadlineDayTwoPlus:
          'I prossimi giorni sono pronti — sblocca il piano completo di {cityName}.',
      freemiumHeadlineConciergeLimit:
          'Continua a pianificare con accesso concierge illimitato.',
      freemiumHeadlineHotels:
          'Sblocca {cityName} Concierge per ogni consiglio sull\'alloggio.',
      freemiumHeadlineRestaurants:
          'Sblocca la collezione completa di ristoranti di {cityName}.',
      freemiumHeadlineGems: 'Preferiti locali e gemme nascoste ti aspettano.',
      freemiumHeadlineSecrets:
          'Sblocca segreti di orari e parcheggio dei residenti.',
      freemiumHeadlineExperiences:
          'Sblocca esperienze curate in tutta {cityName}.',
      freemiumHeadlineAttractions:
          'Sblocca la collezione completa di attrazioni.',
      freemiumHeadlineHotelMatchmaker:
          'Sblocca Hotel Intelligence per confrontare ogni soggiorno.',
      freemiumHeadlineFullItinerary: 'Sblocca il tuo piano vacanza completo.',
      freemiumLocalSecretsTitle: 'Segreti locali',
      freemiumLocalSecretsSubtitle:
          'Orari, parcheggio e punti panoramici custoditi dai locali.',
    );

Map<String, dynamic> _pt() => _shared(
      tampaRiverwalk:
          'Use o estacionamento Whiting Street — caminhe ao sul pelo rio para evitar fechamentos perto do cais.',
      tampaClearwater:
          'Evite a multidão do Pier 60 — aproxime-se de Sand Key 40 minutos antes do pôr do sol.',
      tampaDali:
          'Reserve a última entrada da tarde — o jardim leste captura a luz da ponte sem aglomeração.',
      tampaPier:
          'Entrada no píer em dias úteis às 16h — pôr do sol sem carrinhos de fim de semana.',
      tampaYbor:
          'Sanduíches cubanos para viagem — coma no pátio de tijolos que os locais usam após 20h.',
      tampaSponge:
          'Almoço no cais primeiro, barcos de esponja depois — tours diminuem em dias úteis após 13h.',
      tampaMoodRoutes: 'Rotas de mood Tampa Bay',
      stAugustineMoodRoutes: 'Rotas de mood St. Augustine',
      naplesMoodRoutes: 'Rotas de mood Naples',
      destinMoodRoutes: 'Rotas de mood Destin e 30A',
      freemiumVacationTitle: 'Suas férias em {cityName}',
      freemiumDay1Ready: '✓ Dia 1 pronto',
      freemiumUnlockFullPlan: 'Desbloqueie seu plano de férias completo',
      freemiumLockedDayConcierge: 'Dia {day} · Otimizado pelo concierge',
      freemiumLockedDayGems: 'Dia 3 · Rota de joias escondidas',
      freemiumLockedDayWeather: 'Dia 4 · Planejamento com clima',
      freemiumLockedDayDeparture: 'Dia 5 · Estratégia de partida',
      freemiumConciergeRemaining:
          '{count, plural, =1{1 pergunta grátis restante} other{{count} perguntas grátis restantes}}',
      freemiumConciergeLimitReached:
          'Limite gratuito do concierge atingido — desbloqueie planejamento ilimitado.',
      freemiumLockedHotels: '🔒 {count}+ hotéis adicionais disponíveis',
      freemiumLockedRestaurants: '🔒 {count}+ restaurantes adicionais disponíveis',
      freemiumLockedGems: '🔒 {count}+ joias escondidas disponíveis',
      freemiumLockedSecrets: '🔒 {count}+ segredos locais disponíveis',
      freemiumLockedExperiences: '🔒 {count}+ experiências disponíveis',
      freemiumLockedAttractions: '🔒 Mais atrações disponíveis',
      freemiumUnlockExplore:
          'Desbloqueie {cityName} Concierge para continuar explorando.',
      freemiumUnlockConcierge: 'Desbloquear {cityName} Concierge',
      freemiumHeadlineDayTwoPlus:
          'Seus próximos dias estão prontos — desbloqueie o plano completo de {cityName}.',
      freemiumHeadlineConciergeLimit:
          'Continue planejando com acesso ilimitado ao concierge.',
      freemiumHeadlineHotels:
          'Desbloqueie {cityName} Concierge para cada recomendação de hotel.',
      freemiumHeadlineRestaurants:
          'Desbloqueie a coleção completa de restaurantes de {cityName}.',
      freemiumHeadlineGems: 'Favoritos locais e joias escondidas esperam por você.',
      freemiumHeadlineSecrets:
          'Desbloqueie segredos de horários e estacionamento dos moradores.',
      freemiumHeadlineExperiences:
          'Desbloqueie experiências curadas em todo {cityName}.',
      freemiumHeadlineAttractions:
          'Desbloqueie a coleção completa de atrações.',
      freemiumHeadlineHotelMatchmaker:
          'Desbloqueie Hotel Intelligence para comparar cada estadia.',
      freemiumHeadlineFullItinerary: 'Desbloqueie seu plano de férias completo.',
      freemiumLocalSecretsTitle: 'Segredos locais',
      freemiumLocalSecretsSubtitle:
          'Horários, estacionamento e mirantes que os locais guardam.',
    );

Map<String, dynamic> _ru() => _shared(
      tampaRiverwalk:
          'Парковка Whiting Street — идите на юг вдоль реки, чтобы обойти перекрытия у причала.',
      tampaClearwater:
          'Избегайте толпы Pier 60 — подойдите к Sand Key за 40 минут до заката.',
      tampaDali:
          'Бронируйте последний дневной вход — восточный сад ловит свет моста без толпы.',
      tampaPier:
          'Пирс в будни в 16:00 — закат без колясок выходного дня.',
      tampaYbor:
          'Кубинские сэндвичи с собой — ешьте во дворике из кирпича, куда местные идут после 20:00.',
      tampaSponge:
          'Сначала обед у причала, потом губки — группы редеют в будни после 13:00.',
      tampaMoodRoutes: 'Маршруты настроения Tampa Bay',
      stAugustineMoodRoutes: 'Маршруты настроения St. Augustine',
      naplesMoodRoutes: 'Маршруты настроения Naples',
      destinMoodRoutes: 'Маршруты настроения Destin и 30A',
      freemiumVacationTitle: 'Ваш отдых в {cityName}',
      freemiumDay1Ready: '✓ День 1 готов',
      freemiumUnlockFullPlan: 'Разблокировать полный план отпуска',
      freemiumLockedDayConcierge: 'День {day} · Оптимизация консьержа',
      freemiumLockedDayGems: 'День 3 · Маршрут скрытых жемчужин',
      freemiumLockedDayWeather: 'День 4 · План с учётом погоды',
      freemiumLockedDayDeparture: 'День 5 · Стратегия отъезда',
      freemiumConciergeRemaining:
          '{count, plural, =1{Остался 1 бесплатный вопрос} few{Осталось {count} бесплатных вопроса} many{Осталось {count} бесплатных вопросов} other{Осталось {count} бесплатных вопросов}}',
      freemiumConciergeLimitReached:
          'Бесплатный лимит консьержа исчерпан — разблокируйте безлимитное планирование.',
      freemiumLockedHotels: '🔒 Ещё {count}+ отелей доступно',
      freemiumLockedRestaurants: '🔒 Ещё {count}+ ресторанов доступно',
      freemiumLockedGems: '🔒 Ещё {count}+ скрытых жемчужин доступно',
      freemiumLockedSecrets: '🔒 Ещё {count}+ местных секретов доступно',
      freemiumLockedExperiences: '🔒 Ещё {count}+ впечатлений доступно',
      freemiumLockedAttractions: '🔒 Доступно больше достопримечательностей',
      freemiumUnlockExplore:
          'Разблокируйте {cityName} Concierge, чтобы продолжить исследование.',
      freemiumUnlockConcierge: 'Разблокировать {cityName} Concierge',
      freemiumHeadlineDayTwoPlus:
          'Следующие дни готовы — разблокируйте полный план {cityName}.',
      freemiumHeadlineConciergeLimit:
          'Продолжайте планирование с безлимитным консьержем.',
      freemiumHeadlineHotels:
          'Разблокируйте {cityName} Concierge для всех рекомендаций отелей.',
      freemiumHeadlineRestaurants:
          'Разблокируйте полную коллекцию ресторанов {cityName}.',
      freemiumHeadlineGems: 'Местные избранное и скрытые жемчужины ждут.',
      freemiumHeadlineSecrets:
          'Разблокируйте секреты времени и парковки местных жителей.',
      freemiumHeadlineExperiences:
          'Разблокируйте кураторские впечатления по всему {cityName}.',
      freemiumHeadlineAttractions:
          'Разблокируйте полную коллекцию достопримечательностей.',
      freemiumHeadlineHotelMatchmaker:
          'Разблокируйте Hotel Intelligence для сравнения всех отелей.',
      freemiumHeadlineFullItinerary: 'Разблокируйте полный план отпуска.',
      freemiumLocalSecretsTitle: 'Местные секреты',
      freemiumLocalSecretsSubtitle:
          'Время, парковка и виды, которые хранят местные.',
    );

Map<String, dynamic> _hi() => _shared(
      tampaRiverwalk:
          'Whiting Street गैरेज का उपयोग करें — घाट के पास बंद रास्तों से बचने के लिए नदी के किनारे दक्षिण चलें।',
      tampaClearwater:
          'Pier 60 की भीड़ छोड़ें — सूर्यास्त से 40 मिनट पहले Sand Key पहुँचें।',
      tampaDali:
          'दोपहर की अंतिम एंट्री बुक करें — पूर्वी garden overlook बिना भीड़ के पुल की रोशनी पकड़ता है।',
      tampaPier:
          'सप्ताह के दिन शाम 4 बजे pier entry — weekend stroller traffic के बिना sunset।',
      tampaYbor:
          'Cuban sandwich to-go — 8 PM के बाद locals जो side street courtyard इस्तेमाल करते हैं वहाँ खाएँ।',
      tampaSponge:
          'पहले dock पर lunch, फिर sponge boats — weekday 1 PM के बाद tours कम होते हैं।',
      tampaMoodRoutes: 'Tampa Bay मूड रूट',
      stAugustineMoodRoutes: 'St. Augustine मूड रूट',
      naplesMoodRoutes: 'Naples मूड रूट',
      destinMoodRoutes: 'Destin और 30A मूड रूट',
      freemiumVacationTitle: 'आपकी {cityName} छुट्टी',
      freemiumDay1Ready: '✓ दिन 1 तैयार',
      freemiumUnlockFullPlan: 'पूरा vacation plan अनलॉक करें',
      freemiumLockedDayConcierge: 'दिन {day} · Concierge अनुकूलित',
      freemiumLockedDayGems: 'दिन 3 · छिपे हुए रत्न मार्ग',
      freemiumLockedDayWeather: 'दिन 4 · मौसम-जागरूक योजना',
      freemiumLockedDayDeparture: 'दिन 5 · प्रस्थान रणनीति',
      freemiumConciergeRemaining:
          '{count, plural, =1{1 मुफ्त प्रश्न शेष} other{{count} मुफ्त प्रश्न शेष}}',
      freemiumConciergeLimitReached:
          'मुफ्त concierge सीमा पूरी — असीमित planning के लिए अनलॉक करें।',
      freemiumLockedHotels: '🔒 {count}+ और hotels उपलब्ध',
      freemiumLockedRestaurants: '🔒 {count}+ और restaurants उपलब्ध',
      freemiumLockedGems: '🔒 {count}+ hidden gems उपलब्ध',
      freemiumLockedSecrets: '🔒 {count}+ local secrets उपलब्ध',
      freemiumLockedExperiences: '🔒 {count}+ experiences उपलब्ध',
      freemiumLockedAttractions: '🔒 और attractions उपलब्ध',
      freemiumUnlockExplore:
          'और explore करने के लिए {cityName} Concierge अनलॉक करें।',
      freemiumUnlockConcierge: '{cityName} Concierge अनलॉक करें',
      freemiumHeadlineDayTwoPlus:
          'आपके अगले दिन तैयार हैं — पूरा {cityName} plan अनलॉक करें।',
      freemiumHeadlineConciergeLimit:
          'असीमित concierge access के साथ planning जारी रखें।',
      freemiumHeadlineHotels:
          'हर stay recommendation के लिए {cityName} Concierge अनलॉक करें।',
      freemiumHeadlineRestaurants:
          '{cityName} का पूरा restaurant collection अनलॉक करें।',
      freemiumHeadlineGems: 'स्थानीय favorites और insider gems इंतज़ार कर रहे हैं।',
      freemiumHeadlineSecrets:
          'निवासियों के timing और parking secrets अनलॉक करें।',
      freemiumHeadlineExperiences:
          'पूरे {cityName} में curated experiences अनलॉक करें।',
      freemiumHeadlineAttractions:
          'पूरा attractions collection अनलॉक करें।',
      freemiumHeadlineHotelMatchmaker:
          'हर stay compare करने के लिए Hotel Intelligence अनलॉक करें।',
      freemiumHeadlineFullItinerary: 'अपना पूरा vacation plan अनलॉक करें।',
      freemiumLocalSecretsTitle: 'स्थानीय रहस्य',
      freemiumLocalSecretsSubtitle:
          'Insider timing, parking और viewpoints जो locals संभालते हैं।',
    );

Map<String, dynamic> _tr() => _shared(
      tampaRiverwalk:
          'Whiting Street garajını kullanın — iskele yakınındaki kapanışlardan kaçınmak için nehir boyunca güneye yürüyün.',
      tampaClearwater:
          'Pier 60 kalabalığından kaçının — gün batımından 40 dk önce Sand Key yaklaşımı.',
      tampaDali:
          'Son öğleden sonra girişini ayırtın — doğu bahçe köprü ışığını teras kalabalığı olmadan yakalar.',
      tampaPier:
          'Hafta içi 16:00 iskele girişi — hafta sonu bebek arabası trafiği olmadan gün batımı.',
      tampaYbor:
          'Paket Cuban sandwich — akşam 8\'den sonra yerel halkın kullandığı tuğla avluda yiyin.',
      tampaSponge:
          'Önce iskelede öğle yemeği, sonra sünger botları — hafta içi 13:00 sonrası turlar seyrekleşir.',
      tampaMoodRoutes: 'Tampa Bay ruh hali rotaları',
      stAugustineMoodRoutes: 'St. Augustine ruh hali rotaları',
      naplesMoodRoutes: 'Naples ruh hali rotaları',
      destinMoodRoutes: 'Destin ve 30A ruh hali rotaları',
      freemiumVacationTitle: '{cityName} tatiliniz',
      freemiumDay1Ready: '✓ 1. gün hazır',
      freemiumUnlockFullPlan: 'Tam tatil planının kilidini aç',
      freemiumLockedDayConcierge: 'Gün {day} · Concierge optimize',
      freemiumLockedDayGems: 'Gün 3 · Gizli mücevher rotası',
      freemiumLockedDayWeather: 'Gün 4 · Hava durumuna duyarlı plan',
      freemiumLockedDayDeparture: 'Gün 5 · Ayrılış stratejisi',
      freemiumConciergeRemaining:
          '{count, plural, =1{1 ücretsiz soru kaldı} other{{count} ücretsiz soru kaldı}}',
      freemiumConciergeLimitReached:
          'Ücretsiz concierge limitine ulaşıldı — sınırsız planlama için kilidi açın.',
      freemiumLockedHotels: '🔒 {count}+ ek otel mevcut',
      freemiumLockedRestaurants: '🔒 {count}+ ek restoran mevcut',
      freemiumLockedGems: '🔒 {count}+ gizli mücevher mevcut',
      freemiumLockedSecrets: '🔒 {count}+ yerel sır mevcut',
      freemiumLockedExperiences: '🔒 {count}+ deneyim mevcut',
      freemiumLockedAttractions: '🔒 Ek cazibe merkezleri mevcut',
      freemiumUnlockExplore:
          'Keşfe devam etmek için {cityName} Concierge kilidini açın.',
      freemiumUnlockConcierge: '{cityName} Concierge kilidini aç',
      freemiumHeadlineDayTwoPlus:
          'Sonraki günleriniz hazır — tam {cityName} planının kilidini açın.',
      freemiumHeadlineConciergeLimit:
          'Sınırsız concierge erişimiyle planlamaya devam edin.',
      freemiumHeadlineHotels:
          'Her konaklama önerisi için {cityName} Concierge kilidini açın.',
      freemiumHeadlineRestaurants:
          '{cityName} için tam restoran koleksiyonunun kilidini açın.',
      freemiumHeadlineGems: 'Yerel favoriler ve gizli mücevherler bekliyor.',
      freemiumHeadlineSecrets:
          'Yerel sakinlerin zamanlama ve park sırlarının kilidini açın.',
      freemiumHeadlineExperiences:
          '{cityName} genelinde küratörlü deneyimlerin kilidini açın.',
      freemiumHeadlineAttractions:
          'Tam cazibe merkezi koleksiyonunun kilidini açın.',
      freemiumHeadlineHotelMatchmaker:
          'Her konaklamayı karşılaştırmak için Hotel Intelligence kilidini açın.',
      freemiumHeadlineFullItinerary: 'Tam tatil planınızın kilidini açın.',
      freemiumLocalSecretsTitle: 'Yerel sırlar',
      freemiumLocalSecretsSubtitle:
          'Yerel halkın sakladığı zamanlama, park ve manzara noktaları.',
    );

Map<String, dynamic> _ja() => _shared(
      tampaRiverwalk:
          'Whiting Street 駐車場を利用 — 川沿いに南へ歩き、埠頭付近の通行止めを避ける。',
      tampaClearwater:
          'Pier 60 の混雑を避け — 日没40分前に Sand Key 側へ。',
      tampaDali:
          '午後最終入場を予約 — 東庭園はテラス混雑なしで橋の光を捉える。',
      tampaPier:
          '平日16時ピア入場 — 週末のベビーカー混雑なしのサンセット。',
      tampaYbor:
          'キューバサンドイッチ持ち帰り — 20時以降地元が使うレンガの中庭で。',
      tampaSponge:
          'まず埠頭でランチ、次にスポンジボート — 平日13時以降はツアーが少ない。',
      tampaMoodRoutes: 'タンパベイ・ムードルート',
      stAugustineMoodRoutes: 'セントオーガスティン・ムードルート',
      naplesMoodRoutes: 'ナプレス・ムードルート',
      destinMoodRoutes: 'デスティン＆30A・ムードルート',
      freemiumVacationTitle: '{cityName}のバケーション',
      freemiumDay1Ready: '✓ 1日目準備完了',
      freemiumUnlockFullPlan: 'バケーション全体のプランを解除',
      freemiumLockedDayConcierge: '{day}日目 · コンシェルジュ最適化',
      freemiumLockedDayGems: '3日目 · 隠れた名所ルート',
      freemiumLockedDayWeather: '4日目 · 天気対応プラン',
      freemiumLockedDayDeparture: '5日目 · 出発戦略',
      freemiumConciergeRemaining:
          '{count, plural, =1{無料質問残り1件} other{無料質問残り{count}件}}',
      freemiumConciergeLimitReached:
          '無料コンシェルジュ上限に達しました — 無制限プランのために解除。',
      freemiumLockedHotels: '🔒 あと{count}件以上のホテル',
      freemiumLockedRestaurants: '🔒 あと{count}件以上のレストラン',
      freemiumLockedGems: '🔒 あと{count}件以上の隠れた名所',
      freemiumLockedSecrets: '🔒 あと{count}件以上のローカル秘密',
      freemiumLockedExperiences: '🔒 あと{count}件以上の体験',
      freemiumLockedAttractions: '🔒 さらにアトラクションあり',
      freemiumUnlockExplore: '{cityName} Conciergeを解除して探索を続ける。',
      freemiumUnlockConcierge: '{cityName} Conciergeを解除',
      freemiumHeadlineDayTwoPlus:
          '次の日程の準備完了 — {cityName}の全プランを解除。',
      freemiumHeadlineConciergeLimit: '無制限コンシェルジュで計画を続ける。',
      freemiumHeadlineHotels: 'すべての宿泊提案のために{cityName} Conciergeを解除。',
      freemiumHeadlineRestaurants: '{cityName}の全レストランコレクションを解除。',
      freemiumHeadlineGems: '地元のおすすめと隠れた名所が待っています。',
      freemiumHeadlineSecrets: '地元の時間帯と駐車の秘密を解除。',
      freemiumHeadlineExperiences: '{cityName}全体の厳選体験を解除。',
      freemiumHeadlineAttractions: '全アトラクションコレクションを解除。',
      freemiumHeadlineHotelMatchmaker:
          'すべての宿を比較するHotel Intelligenceを解除。',
      freemiumHeadlineFullItinerary: 'バケーション全体のプランを解除。',
      freemiumLocalSecretsTitle: 'ローカル秘密',
      freemiumLocalSecretsSubtitle:
          '地元が守る時間帯、駐車、絶景スポット。',
    );

Map<String, dynamic> _ko() => _shared(
      tampaRiverwalk:
          'Whiting Street 주차장 이용 — 강을 따라 남쪽으로 걸어 부두 근처 통제 구간을 피하세요.',
      tampaClearwater:
          'Pier 60 혼잡 피하기 — 일몰 40분 전 Sand Key 접근로.',
      tampaDali:
          '오후 마지막 입장 예약 — 동쪽 정원 전망대는 테라스 혼잡 없이 다리 빛.',
      tampaPier:
          '평일 오후 4시 pier 입장 — 주말 유모차 혼잡 없는 일몰.',
      tampaYbor:
          '쿠반 샌드위치 포장 — 오후 8시 이후 현지인이 쓰는 벽돌 안뜰에서.',
      tampaSponge:
          '먼저 부두에서 점심, 스펀지 보트는 그다음 — 평일 오후 1시 이후 투어 감소.',
      tampaMoodRoutes: '탬파베이 무드 루트',
      stAugustineMoodRoutes: '세인트오거스틴 무드 루트',
      naplesMoodRoutes: '네이플스 무드 루트',
      destinMoodRoutes: '데스틴 & 30A 무드 루트',
      freemiumVacationTitle: '{cityName} 휴가',
      freemiumDay1Ready: '✓ 1일차 준비됨',
      freemiumUnlockFullPlan: '전체 휴가 계획 잠금 해제',
      freemiumLockedDayConcierge: '{day}일차 · 컨시어지 최적화',
      freemiumLockedDayGems: '3일차 · 숨은 보석 루트',
      freemiumLockedDayWeather: '4일차 · 날씨 대응 계획',
      freemiumLockedDayDeparture: '5일차 · 출발 전략',
      freemiumConciergeRemaining:
          '{count, plural, =1{무료 질문 1개 남음} other{무료 질문 {count}개 남음}}',
      freemiumConciergeLimitReached:
          '무료 컨시어지 한도 도달 — 무제한 계획을 위해 잠금 해제.',
      freemiumLockedHotels: '🔒 {count}개 이상의 추가 호텔',
      freemiumLockedRestaurants: '🔒 {count}개 이상의 추가 레스토랑',
      freemiumLockedGems: '🔒 {count}개 이상의 숨은 보석',
      freemiumLockedSecrets: '🔒 {count}개 이상의 로컬 시크릿',
      freemiumLockedExperiences: '🔒 {count}개 이상의 체험',
      freemiumLockedAttractions: '🔒 추가 명소 이용 가능',
      freemiumUnlockExplore:
          '계속 탐색하려면 {cityName} Concierge 잠금 해제.',
      freemiumUnlockConcierge: '{cityName} Concierge 잠금 해제',
      freemiumHeadlineDayTwoPlus:
          '다음 날짜가 준비됐습니다 — {cityName} 전체 계획 잠금 해제.',
      freemiumHeadlineConciergeLimit:
          '무제한 컨시어지로 계획을 계속하세요.',
      freemiumHeadlineHotels:
          '모든 숙소 추천을 위해 {cityName} Concierge 잠금 해제.',
      freemiumHeadlineRestaurants:
          '{cityName} 전체 레스토랑 컬렉션 잠금 해제.',
      freemiumHeadlineGems: '로컬 즐겨찾기와 숨은 보석이 기다립니다.',
      freemiumHeadlineSecrets:
          '현지인의 시간·주차 비밀 잠금 해제.',
      freemiumHeadlineExperiences:
          '{cityName} 전역의 큐레이션 체험 잠금 해제.',
      freemiumHeadlineAttractions: '전체 명소 컬렉션 잠금 해제.',
      freemiumHeadlineHotelMatchmaker:
          '모든 숙소를 비교하려면 Hotel Intelligence 잠금 해제.',
      freemiumHeadlineFullItinerary: '전체 휴가 계획 잠금 해제.',
      freemiumLocalSecretsTitle: '로컬 시크릿',
      freemiumLocalSecretsSubtitle:
          '현지인이 지키는 시간, 주차, 전망 스팟.',
    );

Map<String, dynamic> _zh() => _shared(
      tampaRiverwalk:
          '使用 Whiting Street 车库 — 沿河南行，避开码头附近的活动封路。',
      tampaClearwater:
          '避开 Pier 60 栏杆人群 — 日落前 40 分钟走 Sand Key 北侧。',
      tampaDali:
          '预订下午最后时段 — 东花园观景台无露台拥挤即可捕捉桥光。',
      tampaPier:
          '工作日下午 4 点 pier 入场 — 无周末婴儿车拥堵的日落。',
      tampaYbor:
          '古巴三明治外带 — 晚上 8 点后在当地人使用的砖砌庭院用餐。',
      tampaSponge:
          '先在码头午餐，再看海绵船 — 工作日下午 1 点后 tour 团更少。',
      tampaMoodRoutes: '坦帕湾心情路线',
      stAugustineMoodRoutes: '圣奥古斯丁心情路线',
      naplesMoodRoutes: '那不勒斯心情路线',
      destinMoodRoutes: '德斯廷与 30A 心情路线',
      freemiumVacationTitle: '您的{cityName}假期',
      freemiumDay1Ready: '✓ 第 1 天已就绪',
      freemiumUnlockFullPlan: '解锁完整假期计划',
      freemiumLockedDayConcierge: '第 {day} 天 · 礼宾优化',
      freemiumLockedDayGems: '第 3 天 · 隐藏宝石路线',
      freemiumLockedDayWeather: '第 4 天 · 天气感知规划',
      freemiumLockedDayDeparture: '第 5 天 · 离境策略',
      freemiumConciergeRemaining:
          '{count, plural, =1{还剩 1 个免费问题} other{还剩 {count} 个免费问题}}',
      freemiumConciergeLimitReached:
          '已达免费礼宾上限 — 解锁无限规划。',
      freemiumLockedHotels: '🔒 还有 {count}+ 家酒店',
      freemiumLockedRestaurants: '🔒 还有 {count}+ 家餐厅',
      freemiumLockedGems: '🔒 还有 {count}+ 个隐藏宝石',
      freemiumLockedSecrets: '🔒 还有 {count}+ 个当地秘密',
      freemiumLockedExperiences: '🔒 还有 {count}+ 个体验',
      freemiumLockedAttractions: '🔒 更多景点可用',
      freemiumUnlockExplore: '解锁{cityName} Concierge以继续探索。',
      freemiumUnlockConcierge: '解锁{cityName} Concierge',
      freemiumHeadlineDayTwoPlus:
          '接下来的日程已就绪 — 解锁完整{cityName}计划。',
      freemiumHeadlineConciergeLimit: '无限礼宾访问，继续规划行程。',
      freemiumHeadlineHotels: '解锁{cityName} Concierge查看全部住宿推荐。',
      freemiumHeadlineRestaurants: '解锁{cityName}完整餐厅合集。',
      freemiumHeadlineGems: '当地精选与隐藏宝石等你发现。',
      freemiumHeadlineSecrets: '解锁居民才知的时段与停车秘诀。',
      freemiumHeadlineExperiences: '解锁{cityName}全区域精选体验。',
      freemiumHeadlineAttractions: '解锁完整景点合集。',
      freemiumHeadlineHotelMatchmaker: '解锁 Hotel Intelligence 比较所有住宿。',
      freemiumHeadlineFullItinerary: '解锁完整假期计划。',
      freemiumLocalSecretsTitle: '当地秘密',
      freemiumLocalSecretsSubtitle: '当地人私藏的时间、停车与观景点。',
    );
