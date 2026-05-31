// ignore_for_file: avoid_print
//
// Luxora journey messaging copy — welcome through paywall beats.
// Run: dart run tool/patch_luxora_journey_copy_l10n.dart && flutter gen-l10n

import 'dart:convert';
import 'dart:io';

void main() {
  const locales = ['de', 'es', 'fr', 'it', 'pt', 'ru', 'hi', 'tr', 'ja', 'ko', 'zh'];
  final translations = _translations();
  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map.addAll(translations[locale]!);
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, Map<String, dynamic>> _translations() => {
      for (final locale in [
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
      ])
        locale: _forLocale(locale),
    };

Map<String, dynamic> _forLocale(String locale) {
  final t = _copy[locale]!;
  return {
    'landingBegin': t.landingBegin,
    'onboardBuilding': t.onboardBuilding,
    'mapRerouteRainHint': t.mapRerouteRainHint,
    'paywallConciergePromise': t.paywallConciergePromise,
    'onboardV2StepSummaryEyebrow': 'LUXORA',
    'onboardV2StepSummaryTitle': t.summaryTitle,
    '@onboardV2StepSummaryTitle': {
      'placeholders': {'name': {'type': 'String'}},
    },
    'onboardV2StepSummarySubtitle': t.summarySubtitle,
    'onboardWelcomeEyebrow': 'LUXORA',
    'onboardWelcomeTitle': t.welcomeTitle,
    'onboardWelcomeTagline': t.welcomeTagline,
    'onboardWelcomeBody': t.welcomeBody,
    'onboardWelcomeCta': t.welcomeCta,
    'onboardLuxoraGuideBody': t.guideBody,
    'onboardLuxoraReplyClosing': t.replyClosing,
    'onboardBuildingTitle': t.buildingTitle,
    '@onboardBuildingTitle': {
      'placeholders': {'name': {'type': 'String'}},
    },
    'onboardBuildingBody': t.buildingBody,
    'onboardBuildingTagline': t.buildingTagline,
    'onboardItineraryReadyTitle': t.itineraryReadyTitle,
    'onboardItineraryReadyBody': t.itineraryReadyBody,
    'weatherRerouteLuxoraIntro': t.weatherIntro,
    '@weatherRerouteLuxoraIntro': {
      'placeholders': {'name': {'type': 'String'}},
    },
    'weatherRerouteLuxoraClosing': t.weatherClosing,
    'rightNowLuxoraIntro': t.rightNowIntro,
    '@rightNowLuxoraIntro': {
      'placeholders': {'name': {'type': 'String'}},
    },
    'rightNowLuxoraClosing': t.rightNowClosing,
    'paywallPersonalPitch': t.paywallPitch,
    '@paywallPersonalPitch': {
      'placeholders': {
        'name': {'type': 'String'},
        'cityName': {'type': 'String'},
      },
    },
    'onboardLuxoraGuideNamed': t.guideBody,
    '@onboardLuxoraGuideNamed': {
      'placeholders': {'name': {'type': 'String'}},
    },
    'onboardLuxoraItineraryPromise': t.replyClosing,
    'onboardReturningSubtitle': t.returningSubtitle,
    'todayRainRerouteTitle': t.rainRerouteTitle,
  };
}

class _JourneyCopy {
  const _JourneyCopy({
    required this.landingBegin,
    required this.onboardBuilding,
    required this.mapRerouteRainHint,
    required this.paywallConciergePromise,
    required this.summaryTitle,
    required this.summarySubtitle,
    required this.welcomeTitle,
    required this.welcomeTagline,
    required this.welcomeBody,
    required this.welcomeCta,
    required this.guideBody,
    required this.replyClosing,
    required this.buildingTitle,
    required this.buildingBody,
    required this.buildingTagline,
    required this.itineraryReadyTitle,
    required this.itineraryReadyBody,
    required this.weatherIntro,
    required this.weatherClosing,
    required this.rightNowIntro,
    required this.rightNowClosing,
    required this.paywallPitch,
    required this.returningSubtitle,
    required this.rainRerouteTitle,
  });

  final String landingBegin;
  final String onboardBuilding;
  final String mapRerouteRainHint;
  final String paywallConciergePromise;
  final String summaryTitle;
  final String summarySubtitle;
  final String welcomeTitle;
  final String welcomeTagline;
  final String welcomeBody;
  final String welcomeCta;
  final String guideBody;
  final String replyClosing;
  final String buildingTitle;
  final String buildingBody;
  final String buildingTagline;
  final String itineraryReadyTitle;
  final String itineraryReadyBody;
  final String weatherIntro;
  final String weatherClosing;
  final String rightNowIntro;
  final String rightNowClosing;
  final String paywallPitch;
  final String returningSubtitle;
  final String rainRerouteTitle;
}

const _copy = {
  'de': _JourneyCopy(
    landingBegin: 'Meine Reise beginnen',
    onboardBuilding: 'Dein Abenteuer wird erstellt…',
    mapRerouteRainHint:
        'Keine Sorge — ich habe bereits Alternativen in der Nähe gefunden, damit dein Tag entspannt bleibt.',
    paywallConciergePromise: 'Kein Abo · Lebenslanger Stadt-Zugang',
    summaryTitle: 'Perfekt, {name}.',
    summarySubtitle:
        'Ich habe ein wenig über deinen Reisestil gelernt.\n\nJetzt nutze ich deine Vorlieben, um Orte, Erlebnisse, Restaurants und Geheimtipps zu empfehlen, die zu dir passen.\n\nJede Empfehlung wird speziell für dich zugeschnitten.\n\nLass uns sehen, was wir entdecken können.',
    welcomeTitle: 'Hallo, ich bin Luxora.',
    welcomeTagline: 'Dein persönlicher Reise-Concierge.',
    welcomeBody:
        'Ich helfe dir, unglaubliche Orte zu entdecken, Touristenfallen zu vermeiden und einen Urlaub zu planen, den du jahrelang in Erinnerung behältst.\n\nLass uns etwas Unvergessliches planen.',
    welcomeCta: 'Meine Reise beginnen',
    guideBody:
        'Von diesem Moment an begleite ich dich auf jedem Schritt.\n\nOb versteckte Juwelen, großartiges Essen, unvergessliche Erlebnisse oder einfach ein stressfreier Urlaub — ich bin für dich da.',
    replyClosing: 'Lass uns gemeinsam dein perfektes Abenteuer gestalten.',
    buildingTitle: 'Wunderbare Wahl, {name}.',
    buildingBody:
        'Ich erstelle eine personalisierte Reiseroute basierend auf deinem Stil, deinen Interessen, deinem Tempo, deinen Essensvorlieben und deinen Urlaubszielen.\n\nDas kann einen Moment dauern.',
    buildingTagline:
        'Gute Urlaube passieren zufällig.\n\nGroßartige Urlaube entstehen mit einem Plan.',
    itineraryReadyTitle: 'Dein Abenteuer ist bereit.',
    itineraryReadyBody:
        'Ich habe sorgfältig Erlebnisse, Restaurants, Attraktionen und Geheimtipps ausgewählt, die zu deiner Reise passen.\n\nNatürlich können wir alles jederzeit anpassen.\n\nDie besten Urlaube entwickeln sich, während sie stattfinden.',
    weatherIntro:
        '{name}, das Wetter könnte einen Teil der heutigen Pläne beeinflussen.',
    weatherClosing: 'Manchmal entstehen die besten Erinnerungen aus dem Unerwarteten.',
    rightNowIntro:
        '{name}, basierend auf deinem Standort, dem aktuellen Wetter und deinen Vorlieben — das würde ich jetzt tun.',
    rightNowClosing: 'Vertrau mir.\n\nIch denke, du wirst es lieben.',
    paywallPitch:
        '{name}, dein personalisierter Urlaubsplan nimmt bereits Form an.\n\nTag 1 ist bereit.\n\nDer Rest deiner Reise wartet.\n\nSchalte {cityName} Concierge frei für die komplette Reiseroute, Geheimtipps, lokale Secrets, Wetter-Intelligenz und unbegrenzte Concierge-Begleitung.\n\nLass uns diesen Urlaub unvergesslich machen.',
    returningSubtitle:
        'Bereit, dein Abenteuer fortzusetzen?\n\nIch habe deine Vorlieben, Lieblingsorte und Reisepläne gespeichert, damit wir genau dort weitermachen können.\n\nLass uns sehen, was heute auf dich wartet.',
    rainRerouteTitle: 'Wetter-Umplanung',
  ),
  'es': _JourneyCopy(
    landingBegin: 'Comenzar mi viaje',
    onboardBuilding: 'Creando tu aventura…',
    mapRerouteRainHint:
        'No te preocupes — ya encontré alternativas cercanas para que tu día siga siendo agradable y sin estrés.',
    paywallConciergePromise: 'Sin suscripción · Acceso de por vida a la ciudad',
    summaryTitle: 'Perfecto, {name}.',
    summarySubtitle:
        'He aprendido un poco sobre el tipo de viajero que eres.\n\nAhora usaré tus preferencias para recomendar lugares, experiencias, restaurantes y joyas ocultas que encajen contigo.\n\nCada recomendación será específicamente para ti.\n\nVeamos qué podemos descubrir.',
    welcomeTitle: 'Hola, soy Luxora.',
    welcomeTagline: 'Tu concierge de viajes personal.',
    welcomeBody:
        'Estoy aquí para ayudarte a descubrir lugares increíbles, evitar trampas turísticas y crear unas vacaciones que recordarás durante años.\n\nEmpecemos a planear algo inolvidable.',
    welcomeCta: 'Comenzar mi viaje',
    guideBody:
        'A partir de ahora, te guiaré en cada paso del camino.\n\nYa sea joyas ocultas, comida increíble, experiencias inolvidables o simplemente unas vacaciones sin estrés, te tengo cubierto.',
    replyClosing: 'Creemos juntos tu aventura perfecta.',
    buildingTitle: 'Excelente elección, {name}.',
    buildingBody:
        'Estoy creando un itinerario personalizado según tu estilo de viaje, intereses, ritmo, preferencias gastronómicas y objetivos de vacaciones.\n\nEsto puede tomar un momento.',
    buildingTagline:
        'Las buenas vacaciones suceden por casualidad.\n\nLas grandes vacaciones suceden con un plan.',
    itineraryReadyTitle: 'Tu aventura está lista.',
    itineraryReadyBody:
        'He seleccionado cuidadosamente experiencias, restaurantes, atracciones y joyas ocultas que coinciden con el viaje que describiste.\n\nPor supuesto, podemos ajustar cualquier cosa en el camino.\n\nAl fin y al cabo, las mejores vacaciones evolucionan mientras ocurren.',
    weatherIntro:
        '{name}, parece que el clima podría afectar parte de los planes de hoy.',
    weatherClosing: 'A veces lo inesperado crea los mejores recuerdos.',
    rightNowIntro:
        '{name}, según tu ubicación, el clima actual y tus preferencias, esto es lo que haría ahora mismo.',
    rightNowClosing: 'Confía en mí.\n\nCreo que te va a encantar.',
    paywallPitch:
        '{name}, tu plan de vacaciones personalizado ya está tomando forma.\n\nEl Día 1 está listo.\n\nEl resto de tu viaje te espera.\n\nDesbloquea {cityName} Concierge para acceder a tu itinerario completo, joyas ocultas, secretos locales, inteligencia meteorológica y orientación concierge ilimitada.\n\nHagamos inolvidables estas vacaciones.',
    returningSubtitle:
        '¿Listo para continuar tu aventura?\n\nHe guardado tus preferencias, lugares favoritos y planes de viaje para retomar justo donde lo dejamos.\n\nVeamos qué te espera hoy.',
    rainRerouteTitle: 'Cambio por clima',
  ),
  'fr': _JourneyCopy(
    landingBegin: 'Commencer mon voyage',
    onboardBuilding: 'Création de votre aventure…',
    mapRerouteRainHint:
        'Ne vous inquiétez pas — j\'ai déjà trouvé des alternatives à proximité pour que votre journée reste agréable et sans stress.',
    paywallConciergePromise: 'Sans abonnement · Accès ville à vie',
    summaryTitle: 'Parfait, {name}.',
    summarySubtitle:
        'J\'ai appris un peu quel type de voyageur vous êtes.\n\nJ\'utiliserai vos préférences pour recommander des lieux, expériences, restaurants et trésors cachés adaptés à votre style.\n\nChaque recommandation sera taillée pour vous.\n\nVoyons ce que nous pouvons découvrir.',
    welcomeTitle: 'Bonjour, je suis Luxora.',
    welcomeTagline: 'Votre concierge de voyage personnel.',
    welcomeBody:
        'Je suis là pour vous aider à découvrir des lieux incroyables, éviter les pièges à touristes et créer des vacances dont vous vous souviendrez pendant des années.\n\nCommençons à planifier quelque chose d\'inoubliable.',
    welcomeCta: 'Commencer mon voyage',
    guideBody:
        'À partir de maintenant, je vous guide à chaque étape.\n\nQue vous cherchiez des trésors cachés, une cuisine incroyable, des expériences inoubliables ou simplement des vacances sans stress, je suis là pour vous.',
    replyClosing: 'Créons ensemble votre aventure parfaite.',
    buildingTitle: 'Excellent choix, {name}.',
    buildingBody:
        'Je construis un itinéraire personnalisé selon votre style, vos intérêts, votre rythme, vos préférences culinaires et vos objectifs de vacances.\n\nCela peut prendre un instant.',
    buildingTagline:
        'Les bonnes vacances arrivent par hasard.\n\nLes grandes vacances naissent d\'un plan.',
    itineraryReadyTitle: 'Votre aventure est prête.',
    itineraryReadyBody:
        'J\'ai soigneusement sélectionné expériences, restaurants, attractions et trésors cachés correspondant au voyage que vous avez décrit.\n\nBien sûr, nous pouvons ajuster quoi que ce soit en cours de route.\n\nLes meilleures vacances évoluent en se déroulant.',
    weatherIntro:
        '{name}, la météo pourrait impacter une partie des plans d\'aujourd\'hui.',
    weatherClosing: 'Parfois, l\'imprévu crée les plus beaux souvenirs.',
    rightNowIntro:
        '{name}, selon votre position, la météo actuelle et vos préférences, voici ce que je ferais maintenant.',
    rightNowClosing: 'Faites-moi confiance.\n\nJe pense que vous allez adorer.',
    paywallPitch:
        '{name}, votre plan de vacances personnalisé prend déjà forme.\n\nLe Jour 1 est prêt.\n\nLe reste de votre voyage vous attend.\n\nDébloquez {cityName} Concierge pour accéder à l\'itinéraire complet, trésors cachés, secrets locaux, météo intelligente et guidance concierge illimitée.\n\nRendons ces vacances inoubliables.',
    returningSubtitle:
        'Prêt à poursuivre votre aventure ?\n\nJ\'ai enregistré vos préférences, lieux favoris et plans pour reprendre exactement où nous nous sommes arrêtés.\n\nVoyons ce qui vous attend aujourd\'hui.',
    rainRerouteTitle: 'Réacheminement météo',
  ),
  'it': _JourneyCopy(
    landingBegin: 'Inizia il mio viaggio',
    onboardBuilding: 'Creazione della tua avventura…',
    mapRerouteRainHint:
        'Non preoccuparti — ho già trovato alternative nelle vicinanze così la giornata resta piacevole e senza stress.',
    paywallConciergePromise: 'Nessun abbonamento · Accesso città a vita',
    summaryTitle: 'Perfetto, {name}.',
    summarySubtitle:
        'Ho imparato un po\' che tipo di viaggiatore sei.\n\nUserò le tue preferenze per consigliare luoghi, esperienze, ristoranti e gemme nascoste adatte al tuo stile.\n\nOgni consiglio sarà su misura per te.\n\nVediamo cosa possiamo scoprire.',
    welcomeTitle: 'Ciao, sono Luxora.',
    welcomeTagline: 'Il tuo concierge di viaggio personale.',
    welcomeBody:
        'Sono qui per aiutarti a scoprire posti incredibili, evitare trappole turistiche e creare una vacanza che ricorderai per anni.\n\nIniziamo a pianificare qualcosa di indimenticabile.',
    welcomeCta: 'Inizia il mio viaggio',
    guideBody:
        'Da questo momento ti guiderò in ogni passo.\n\nChe tu cerchi gemme nascoste, cibo incredibile, esperienze indimenticabili o semplicemente una vacanza senza stress, ci penso io.',
    replyClosing: 'Creiamo insieme la tua avventura perfetta.',
    buildingTitle: 'Scelta meravigliosa, {name}.',
    buildingBody:
        'Sto creando un itinerario personalizzato in base al tuo stile, interessi, ritmo, preferenze gastronomiche e obiettivi di vacanza.\n\nPotrebbe volerci un momento.',
    buildingTagline:
        'Le buone vacanze capitano per caso.\n\nLe grandi vacanze nascono con un piano.',
    itineraryReadyTitle: 'La tua avventura è pronta.',
    itineraryReadyBody:
        'Ho selezionato con cura esperienze, ristoranti, attrazioni e gemme nascoste che corrispondono al viaggio che hai descritto.\n\nNaturalmente possiamo modificare tutto lungo il percorso.\n\nLe migliori vacanze evolvono mentre si svolgono.',
    weatherIntro:
        '{name}, il meteo potrebbe influenzare parte dei piani di oggi.',
    weatherClosing: 'A volte l\'imprevisto crea i ricordi migliori.',
    rightNowIntro:
        '{name}, in base alla tua posizione, al meteo attuale e alle tue preferenze, ecco cosa farei adesso.',
    rightNowClosing: 'Fidati di me.\n\nPenso che ti piacerà molto.',
    paywallPitch:
        '{name}, il tuo piano vacanze personalizzato sta già prendendo forma.\n\nIl Giorno 1 è pronto.\n\nIl resto del viaggio ti aspetta.\n\nSblocca {cityName} Concierge per l\'itinerario completo, gemme nascoste, segreti locali, meteo intelligente e guida concierge illimitata.\n\nRendiamo indimenticabile questa vacanza.',
    returningSubtitle:
        'Pronto a continuare la tua avventura?\n\nHo salvato preferenze, luoghi preferiti e piani di viaggio per riprendere da dove avevamo lasciato.\n\nVediamo cosa ti aspetta oggi.',
    rainRerouteTitle: 'Deviazione meteo',
  ),
  'pt': _JourneyCopy(
    landingBegin: 'Começar minha jornada',
    onboardBuilding: 'Criando sua aventura…',
    mapRerouteRainHint:
        'Não se preocupe — já encontrei alternativas por perto para seu dia continuar agradável e sem estresse.',
    paywallConciergePromise: 'Sem assinatura · Acesso vitalício à cidade',
    summaryTitle: 'Perfeito, {name}.',
    summarySubtitle:
        'Aprendi um pouco sobre o tipo de viajante que você é.\n\nAgora usarei suas preferências para recomendar lugares, experiências, restaurantes e joias escondidas que combinem com você.\n\nCada recomendação será feita sob medida.\n\nVamos ver o que podemos descobrir.',
    welcomeTitle: 'Olá, sou a Luxora.',
    welcomeTagline: 'Sua concierge de viagem pessoal.',
    welcomeBody:
        'Estou aqui para ajudá-lo a descobrir lugares incríveis, evitar armadilhas turísticas e criar férias que você lembrará por anos.\n\nVamos começar a planejar algo inesquecível.',
    welcomeCta: 'Começar minha jornada',
    guideBody:
        'A partir de agora, vou guiar sua viagem em cada passo.\n\nSeja joias escondidas, comida incrível, experiências inesquecíveis ou simplesmente férias sem estresse — estou com você.',
    replyClosing: 'Vamos criar juntos sua aventura perfeita.',
    buildingTitle: 'Escolha maravilhosa, {name}.',
    buildingBody:
        'Estou montando um roteiro personalizado com base no seu estilo, interesses, ritmo, preferências gastronômicas e objetivos de férias.\n\nIsso pode levar um momento.',
    buildingTagline:
        'Boas férias acontecem por acaso.\n\nGrandes férias acontem com um plano.',
    itineraryReadyTitle: 'Sua aventura está pronta.',
    itineraryReadyBody:
        'Selecionei cuidadosamente experiências, restaurantes, atrações e joias escondidas que combinam com a viagem que você descreveu.\n\nClaro, podemos ajustar qualquer coisa no caminho.\n\nAs melhores férias evoluem enquanto acontecem.',
    weatherIntro:
        '{name}, o clima pode impactar parte dos planos de hoje.',
    weatherClosing: 'Às vezes o inesperado cria as melhores memórias.',
    rightNowIntro:
        '{name}, com base na sua localização, clima atual e preferências, isto é o que eu faria agora.',
    rightNowClosing: 'Confie em mim.\n\nAcho que você vai adorar.',
    paywallPitch:
        '{name}, seu plano de férias personalizado já está tomando forma.\n\nO Dia 1 está pronto.\n\nO resto da jornada espera por você.\n\nDesbloqueie {cityName} Concierge para o roteiro completo, joias escondidas, segredos locais, inteligência meteorológica e orientação concierge ilimitada.\n\nVamos tornar estas férias inesquecíveis.',
    returningSubtitle:
        'Pronto para continuar sua aventura?\n\nSalvei suas preferências, lugares favoritos e planos para retomar de onde paramos.\n\nVamos ver o que te espera hoje.',
    rainRerouteTitle: 'Desvio por clima',
  ),
  'ru': _JourneyCopy(
    landingBegin: 'Начать мое путешествие',
    onboardBuilding: 'Создаём ваше приключение…',
    mapRerouteRainHint:
        'Не волнуйтесь — я уже нашла альтернативы рядом, чтобы день оставался приятным и без стресса.',
    paywallConciergePromise: 'Без подписки · Пожизненный доступ к городу',
    summaryTitle: 'Отлично, {name}.',
    summarySubtitle:
        'Я немного узнала, какой вы путешественник.\n\nТеперь буду использовать ваши предпочтения, чтобы рекомендовать места, впечатления, рестораны и скрытые жемчужины под ваш стиль.\n\nКаждая рекомендация будет создана специально для вас.\n\nПосмотрим, что мы откроем.',
    welcomeTitle: 'Привет, я Luxora.',
    welcomeTagline: 'Ваш личный travel-консьерж.',
    welcomeBody:
        'Я помогу вам открыть невероятные места, избежать туристических ловушек и создать отпуск, который вы будете помнить годами.\n\nДавайте спланируем что-то незабываемое.',
    welcomeCta: 'Начать мое путешествие',
    guideBody:
        'С этого момента я буду сопровождать вас на каждом шаге.\n\nСкрытые жемчужины, отличная еда, незабываемые впечатления или просто отдых без стресса — я рядом.',
    replyClosing: 'Давайте вместе создадим ваше идеальное приключение.',
    buildingTitle: 'Прекрасный выбор, {name}.',
    buildingBody:
        'Я составляю персональный маршрут на основе вашего стиля, интересов, темпа, предпочтений в еде и целей отпуска.\n\nЭто может занять минуту.',
    buildingTagline:
        'Хорошие отпуска случаются случайно.\n\nВеликие отпуска случаются по плану.',
    itineraryReadyTitle: 'Ваше приключение готово.',
    itineraryReadyBody:
        'Я тщательно подобрала впечатления, рестораны, достопримечательности и скрытые жемчужины под описанную вами поездку.\n\nКонечно, мы можем менять всё по ходу.\n\nЛучшие отпуска развиваются по мере того, как они идут.',
    weatherIntro:
        '{name}, похоже, погода может повлиять на часть сегодняшних планов.',
    weatherClosing: 'Иногда неожиданное создаёт лучшие воспоминания.',
    rightNowIntro:
        '{name}, исходя из вашего местоположения, текущей погоды и предпочтений — вот что я бы сделала сейчас.',
    rightNowClosing: 'Доверьтесь мне.\n\nДумаю, вам понравится.',
    paywallPitch:
        '{name}, ваш персональный план отпуска уже обретает форму.\n\nДень 1 готов.\n\nОстальная часть путешествия ждёт.\n\nРазблокируйте {cityName} Concierge для полного маршрута, скрытых жемчужин, местных секретов, погодной аналитики и безлимитного консьержа.\n\nСделаем этот отпуск незабываемым.',
    returningSubtitle:
        'Готовы продолжить приключение?\n\nЯ сохранила ваши предпочтения, любимые места и планы, чтобы продолжить с того места, где остановились.\n\nПосмотрим, что ждёт вас сегодня.',
    rainRerouteTitle: 'Погодный перенос',
  ),
  'hi': _JourneyCopy(
    landingBegin: 'मेरी यात्रा शुरू करें',
    onboardBuilding: 'आपका adventure बन रहा है…',
    mapRerouteRainHint:
        'चिंता न करें — मैंने पास में विकल्प ढूँढ लिए हैं ताकि आपका दिन सुखद और तनाव-मुक्त रहे।',
    paywallConciergePromise: 'कोई सब्सक्रिप्शन नहीं · आजीवन शहर एक्सेस',
    summaryTitle: 'बढ़िया, {name}.',
    summarySubtitle:
        'मैंने थोड़ा सीखा है कि आप किस तरह के यात्री हैं।\n\nअब मैं आपकी पसंद के अनुसार स्थान, अनुभव, रेस्तरां और hidden gems सुझाऊँगी।\n\nहर सिफारिश विशेष रूप से आपके लिए होगी।\n\nदेखते हैं क्या खोज सकते हैं।',
    welcomeTitle: 'नमस्ते, मैं Luxora हूँ।',
    welcomeTagline: 'आपकी personal travel concierge.',
    welcomeBody:
        'मैं अद्भुत जगहें खोजने, tourist traps से बचने और ऐसी छुट्टी बनाने में मदद करती हूँ जिसे आप सालों तक याद रखेंगे।\n\nचलिए कुछ अविस्मरणीय plan करें।',
    welcomeCta: 'मेरी यात्रा शुरू करें',
    guideBody:
        'अब से मैं हर कदम पर आपकी मदद करूँगी।\n\nHidden gems, शानदार खाना, अविस्मरणीय अनुभव, या बस stress-free vacation — मैं साथ हूँ।',
    replyClosing: 'चलिए मिलकर आपका perfect adventure बनाते हैं।',
    buildingTitle: 'शानदार choice, {name}.',
    buildingBody:
        'मैं आपकी travel style, रुचियों, pace, dining preferences और vacation goals के आधार पर personalized itinerary बना रही हूँ।\n\nइसमें थोड़ा समय लग सकता है।',
    buildingTagline:
        'अच्छी छुट्टियाँ संयोग से होती हैं।\n\nGreat vacations एक plan से होती हैं।',
    itineraryReadyTitle: 'आपका adventure तैयार है।',
    itineraryReadyBody:
        'मैंने सावधानी से experiences, restaurants, attractions और hidden gems चुने हैं जो आपकी trip से मेल खाते हैं।\n\nबेशक, हम रास्ते में कुछ भी adjust कर सकते हैं।\n\nBest vacations चलते-चलते evolve होती हैं।',
    weatherIntro:
        '{name}, लगता है मौसम आज के कुछ plans को प्रभावित कर सकता है।',
    weatherClosing: 'कभी-कभी अप्रत्याशित चीज़ें best memories बनाती हैं।',
    rightNowIntro:
        '{name}, आपके location, current weather और preferences के आधार पर — अभी मैं यह करूँगी।',
    rightNowClosing: 'मुझ पर भरोसा करें।\n\nमुझे लगता है आपको पसंद आएगा।',
    paywallPitch:
        '{name}, आपका personalized vacation plan पहले से shape ले रहा है।\n\nDay 1 ready है।\n\nबाकी journey इंतज़ार कर रही है।\n\n{cityName} Concierge unlock करें — full itinerary, hidden gems, local secrets, weather intelligence और unlimited concierge guidance के लिए।\n\nइस vacation को unforgettable बनाते हैं।',
    returningSubtitle:
        'अपना adventure जारी रखने के लिए तैयार?\n\nमैंने आपकी preferences, favorite places और trip plans save किए हैं ताकि हम वहीं से शुरू कर सकें।\n\nदेखते हैं आज क्या इंतज़ार कर रहा है।',
    rainRerouteTitle: 'मौसम reroute',
  ),
  'tr': _JourneyCopy(
    landingBegin: 'Yolculuğuma başla',
    onboardBuilding: 'Macera oluşturuluyor…',
    mapRerouteRainHint:
        'Endişelenme — günün keyifli ve stressiz kalması için yakında alternatifler buldum.',
    paywallConciergePromise: 'Abonelik yok · Ömür boyu şehir erişimi',
    summaryTitle: 'Harika, {name}.',
    summarySubtitle:
        'Ne tür bir gezgin olduğunu biraz öğrendim.\n\nArtık tercihlerine göre sana uygun yerler, deneyimler, restoranlar ve gizli mücevherler önereceğim.\n\nHer öneri özellikle sana göre olacak.\n\nBakalım neler keşfedebiliriz.',
    welcomeTitle: 'Merhaba, ben Luxora.',
    welcomeTagline: 'Kişisel seyahat concierge\'in.',
    welcomeBody:
        'İnanılmaz yerler keşfetmene, turist tuzaklarından kaçınmana ve yıllarca hatırlayacağın bir tatil oluşturmana yardım ediyorum.\n\nUnutulmaz bir şey planlamaya başlayalım.',
    welcomeCta: 'Yolculuğuma başla',
    guideBody:
        'Bu andan itibaren yolculuğunda her adımda yanındayım.\n\nGizli mücevherler, harika yemek, unutulmaz deneyimler veya sadece stressiz bir tatil — yanındayım.',
    replyClosing: 'Birlikte mükemmel maceranı oluşturalım.',
    buildingTitle: 'Harika seçim, {name}.',
    buildingBody:
        'Seyahat tarzın, ilgi alanların, tempon, yemek tercihlerin ve tatil hedeflerine göre kişiselleştirilmiş bir rota oluşturuyorum.\n\nBu biraz zaman alabilir.',
    buildingTagline:
        'İyi tatiller tesadüfen olur.\n\nHarika tatiller planla olur.',
    itineraryReadyTitle: 'Macera hazır.',
    itineraryReadyBody:
        'Anlattığın geziye uygun deneyimler, restoranlar, cazibe merkezleri ve gizli mücevherler seçtim.\n\nTabii ki yolda her şeyi değiştirebiliriz.\n\nEn iyi tatiller ilerledikçe evrilir.',
    weatherIntro:
        '{name}, hava koşulları bugünkü planların bir kısmını etkileyebilir.',
    weatherClosing: 'Bazen beklenmedik olan en güzel anıları yaratır.',
    rightNowIntro:
        '{name}, konumuna, hava durumuna ve tercihlerine göre — şimdi bunu yapardım.',
    rightNowClosing: 'Bana güven.\n\nBayılacağını düşünüyorum.',
    paywallPitch:
        '{name}, kişiselleştirilmiş tatil planın şekilleniyor.\n\n1. Gün hazır.\n\nYolculuğunun geri kalanı bekliyor.\n\nTam rota, gizli mücevherler, yerel sırlar, hava zekâsı ve sınırsız concierge için {cityName} Concierge\'i aç.\n\nBu tatili unutulmaz yapalım.',
    returningSubtitle:
        'Macerana devam etmeye hazır mısın?\n\nTercihlerini, favori yerlerini ve planlarını kaydettim; kaldığımız yerden devam edelim.\n\nBugün seni ne bekliyor bakalım.',
    rainRerouteTitle: 'Hava rotası değişimi',
  ),
  'ja': _JourneyCopy(
    landingBegin: '旅を始める',
    onboardBuilding: '冒険を作成中…',
    mapRerouteRainHint:
        'ご安心を — 近くの代替プランを見つけました。今日も快適でストレスのない一日に。',
    paywallConciergePromise: 'サブスクなし · 生涯シティアクセス',
    summaryTitle: '素晴らしいです、{name}さん。',
    summarySubtitle:
        'あなたがどんな旅行者か少しわかりました。\n\nこれからは好みに合わせて場所、体験、レストラン、隠れた名所をおすすめします。\n\nすべてあなた専用の提案です。\n\n一緒に何が見つかるか見てみましょう。',
    welcomeTitle: 'こんにちは、Luxoraです。',
    welcomeTagline: 'あなた専属のトラベルコンシェルジュ。',
    welcomeBody:
        '素晴らしい場所の発見、観光客の罠を避けること、何年も思い出に残る休暇づくりをお手伝いします。\n\n忘れられない旅の計画を始めましょう。',
    welcomeCta: '旅を始める',
    guideBody:
        'これからは旅のすべての段階でサポートします。\n\n隠れた名所、素晴らしい食、忘れられない体験、またはストレスのない休暇 — お任せください。',
    replyClosing: '一緒に完璧な冒険を作りましょう。',
    buildingTitle: '素敵な選択です、{name}さん。',
    buildingBody:
        '旅行スタイル、興味、ペース、食の好み、休暇の目標に基づいてパーソナライズした旅程を作成しています。\n\n少し時間がかかる場合があります。',
    buildingTagline:
        '良い休暇は偶然生まれる。\n\n最高の休暇は計画から生まれる。',
    itineraryReadyTitle: '冒険の準備ができました。',
    itineraryReadyBody:
        'あなたの旅に合う体験、レストラン、名所、隠れた名所を慎重に選びました。\n\nもちろん途中でいつでも調整できます。\n\n最高の休暇は進みながら形を変えていきます。',
    weatherIntro:
        '{name}さん、今日の予定の一部に天候の影響が出そうです。',
    weatherClosing: '予想外の出来事が最高の思い出になることもあります。',
    rightNowIntro:
        '{name}さん、現在地、天気、好みから — 今ならこれをおすすめします。',
    rightNowClosing: '信じてください。\n\nきっと気に入ると思います。',
    paywallPitch:
        '{name}さん、パーソナライズされた休暇プランが形になってきました。\n\n1日目は準備完了。\n\n残りの旅が待っています。\n\n{cityName} Conciergeを解除して、完全な旅程、隠れた名所、ローカルシークレット、天候インテリジェンス、無制限コンシェルジュを。\n\n忘れられない休暇にしましょう。',
    returningSubtitle:
        '冒険を続ける準備はできましたか？\n\n好み、お気に入りの場所、旅行プランを保存しました。前回の続きから始めましょう。\n\n今日何が待っているか見てみましょう。',
    rainRerouteTitle: '天候ルート変更',
  ),
  'ko': _JourneyCopy(
    landingBegin: '여행 시작하기',
    onboardBuilding: '모험을 만드는 중…',
    mapRerouteRainHint:
        '걱정 마세요 — 가까운 대안을 찾아 두었습니다. 오늘도 즐겁고 스트레스 없는 하루로.',
    paywallConciergePromise: '구독 없음 · 평생 도시 액세스',
    summaryTitle: '완벽해요, {name}님.',
    summarySubtitle:
        '어떤 여행자인지 조금 알게 되었어요.\n\n이제 선호에 맞는 장소, 경험, 레스토랑, 숨은 명소를 추천할게요.\n\n모든 추천은 당신만을 위한 것입니다.\n\n무엇을 발견할 수 있을지 봐요.',
    welcomeTitle: '안녕하세요, Luxora예요.',
    welcomeTagline: '당신만의 여행 컨시어지.',
    welcomeBody:
        '놀라운 장소 발견, 관광객 함정 피하기, 오래 기억할 휴가 만들기를 도와드려요.\n\n잊지 못할 여행을 계획해 봐요.',
    welcomeCta: '여행 시작하기',
    guideBody:
        '이제부터 여행의 모든 단계를 함께할게요.\n\n숨은 명소, 훌륭한 음식, 잊을 수 없는 경험, 또는 스트레스 없는 휴가 — 제가 함께합니다.',
    replyClosing: '함께 완벽한 모험을 만들어 봐요.',
    buildingTitle: '멋진 선택이에요, {name}님.',
    buildingBody:
        '여행 스타일, 관심사, 페이스, 식사 선호, 휴가 목표에 맞춰 맞춤 일정을 만들고 있어요.\n\n잠시 시간이 걸릴 수 있습니다.',
    buildingTagline:
        '좋은 휴가는 우연히 온다.\n\n위대한 휴가는 계획에서 온다.',
    itineraryReadyTitle: '모험이 준비됐어요.',
    itineraryReadyBody:
        '설명해 주신 여행에 맞는 경험, 레스토랑, 명소, 숨은 보석을 신중히 골랐어요.\n\n물론 언제든 조정할 수 있어요.\n\n최고의 휴가는 진행되며 변합니다.',
    weatherIntro:
        '{name}님, 오늘 일정 일부에 날씨 영향이 있을 수 있어요.',
    weatherClosing: '때로는 예상치 못한 일이 최고의 추억을 만듭니다.',
    rightNowIntro:
        '{name}님, 위치, 현재 날씨, 선호를 바탕으로 — 지금이라면 이걸 추천해요.',
    rightNowClosing: '믿어 보세요.\n\n정말 마음에 들 거예요.',
    paywallPitch:
        '{name}님, 맞춤 휴가 계획이 이미 형태를 갖추고 있어요.\n\n1일차 준비 완료.\n\n나머지 여정이 기다립니다.\n\n{cityName} Concierge를 잠금 해제해 전체 일정, 숨은 명소, 로컬 시크릿, 날씨 인텔리전스, 무제한 컨시어지를 이용하세요.\n\n잊지 못할 휴가로 만들어요.',
    returningSubtitle:
        '모험을 이어갈 준비가 되셨나요?\n\n선호, 즐겨찾는 장소, 여행 계획을 저장해 두었어요. 이어서 시작해요.\n\n오늘 무엇이 기다리는지 봐요.',
    rainRerouteTitle: '날씨 경로 변경',
  ),
  'zh': _JourneyCopy(
    landingBegin: '开始我的旅程',
    onboardBuilding: '正在打造你的冒险…',
    mapRerouteRainHint:
        '别担心——我已经在附近找到了替代方案，让你的一天依然轻松愉快。',
    paywallConciergePromise: '无订阅 · 终身城市访问',
    summaryTitle: '太好了，{name}。',
    summarySubtitle:
        '我了解了一些你的旅行风格。\n\n现在我会根据你的偏好推荐地点、体验、餐厅和隐藏宝藏。\n\n每条推荐都专为你定制。\n\n看看我们能发现什么。',
    welcomeTitle: '你好，我是 Luxora。',
    welcomeTagline: '你的私人旅行礼宾。',
    welcomeBody:
        '我帮你发现精彩地点、避开游客陷阱，打造值得铭记多年的假期。\n\n让我们开始规划难忘的旅程。',
    welcomeCta: '开始我的旅程',
    guideBody:
        '从此刻起，我会在每一步为你指引。\n\n无论是隐藏宝藏、美食、难忘体验，还是轻松无压力的假期——我都在。',
    replyClosing: '一起创造你的完美冒险。',
    buildingTitle: '太棒了，{name}。',
    buildingBody:
        '我正在根据你的旅行风格、兴趣、节奏、餐饮偏好和度假目标打造个性化行程。\n\n这可能需要一点时间。',
    buildingTagline:
        '好假期靠偶然。\n\n精彩假期靠计划。',
    itineraryReadyTitle: '你的冒险已就绪。',
    itineraryReadyBody:
        '我精心挑选了与你描述之旅匹配的体验、餐厅、景点和隐藏宝藏。\n\n当然，我们随时都可以调整。\n\n最好的假期会在进行中不断演变。',
    weatherIntro:
        '{name}，天气可能会影响今天部分计划。',
    weatherClosing: '有时意外会创造最好的回忆。',
    rightNowIntro:
        '{name}，根据你的位置、当前天气和偏好——我现在会推荐这个。',
    rightNowClosing: '相信我的判断。\n\n你会喜欢的。',
    paywallPitch:
        '{name}，你的个性化度假计划正在成形。\n\n第1天已就绪。\n\n其余旅程在等待。\n\n解锁 {cityName} Concierge，获取完整行程、隐藏宝藏、本地秘密、天气智能和无限礼宾指导。\n\n让这次度假难忘。',
    returningSubtitle:
        '准备好继续冒险了吗？\n\n我已保存你的偏好、喜爱地点和旅行计划，可以从上次继续。\n\n看看今天有什么在等你。',
    rainRerouteTitle: '天气改道',
  ),
};
