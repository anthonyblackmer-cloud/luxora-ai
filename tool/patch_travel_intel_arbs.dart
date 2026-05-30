// ignore_for_file: avoid_print
//
// One-shot: sync travel-intel l10n keys into all locale ARBs from app_en.arb.
// Run: dart run tool/patch_travel_intel_arbs.dart

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

  final en = _readArb('lib/l10n/app_en.arb');
  const keys = [
    'mapParkingLevelEasy',
    'mapParkingLevelModerate',
    'mapParkingLevelDifficult',
    'mapParkingLevelLimited',
    'mapParkingAtStop',
    '@mapParkingAtStop',
    'mapDriveFrictionAtStop',
    '@mapDriveFrictionAtStop',
    'mapFutureCrowdTitle',
    'mapFutureCrowdDesc',
    'mapFutureParkingTitle',
    'mapFutureParkingDesc',
    'mapFutureTrafficTitle',
    'mapFutureTrafficDesc',
    'mapNavLayerTitle',
    'mapNavLayerSubtitle',
    'detailTravelIntelTitle',
    'detailTravelIntelSubtitle',
    'detailCrowdOutlook',
    '@detailCrowdOutlook',
    'detailParkingOutlook',
    '@detailParkingOutlook',
    'detailDriveFrictionOutlook',
    '@detailDriveFrictionOutlook',
  ];

  final translations = _localeOverrides();

  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map = _readArb(path);
    for (final key in keys) {
      map[key] = translations[locale]?[key] ?? en[key];
    }
    _writeArb(path, map);
    print('Patched $path');
  }
}

Map<String, dynamic> _readArb(String path) {
  final raw = File(path).readAsStringSync();
  return jsonDecode(raw) as Map<String, dynamic>;
}

void _writeArb(String path, Map<String, dynamic> map) {
  const encoder = JsonEncoder.withIndent('  ');
  File(path).writeAsStringSync('${encoder.convert(map)}\n');
}

Map<String, Map<String, dynamic>> _localeOverrides() {
  const parkingAtStop = {
    'de': 'Parken: {level}',
    'es': 'Aparcamiento: {level}',
    'fr': 'Stationnement : {level}',
    'it': 'Parcheggio: {level}',
    'pt': 'Estacionamento: {level}',
    'ru': 'Парковка: {level}',
    'hi': 'पार्किंग: {level}',
    'tr': 'Park: {level}',
    'ja': '駐車: {level}',
    'ko': '주차: {level}',
    'zh': '停车：{level}',
  };

  const driveFriction = {
    'de': 'Fahrstress: {score}/90',
    'es': 'Fricción de conducción: {score}/90',
    'fr': 'Stress de conduite : {score}/90',
    'it': 'Stress di guida: {score}/90',
    'pt': 'Atrito de condução: {score}/90',
    'ru': 'Стресс в пути: {score}/90',
    'hi': 'ड्राइव घर्षण: {score}/90',
    'tr': 'Sürüş sürtünmesi: {score}/90',
    'ja': 'ドライブ負担: {score}/90',
    'ko': '운전 부담: {score}/90',
    'zh': '驾驶负担：{score}/90',
  };

  Map<String, dynamic> pack(
    String locale, {
    required String easy,
    required String moderate,
    required String difficult,
    required String limited,
    required String crowdTitle,
    required String crowdDesc,
    required String parkingTitle,
    required String parkingDesc,
    required String trafficDesc,
    required String navTitle,
    required String navSubtitle,
    required String intelTitle,
    required String intelSubtitle,
    required String crowdOutlook,
    required String parkingOutlook,
  }) =>
      {
        'mapParkingLevelEasy': easy,
        'mapParkingLevelModerate': moderate,
        'mapParkingLevelDifficult': difficult,
        'mapParkingLevelLimited': limited,
        'mapParkingAtStop': parkingAtStop[locale],
        '@mapParkingAtStop': {
          'placeholders': {'level': {'type': 'String'}},
        },
        'mapDriveFrictionAtStop': driveFriction[locale],
        '@mapDriveFrictionAtStop': {
          'placeholders': {'score': {'type': 'int'}},
        },
        'mapFutureCrowdTitle': crowdTitle,
        'mapFutureCrowdDesc': crowdDesc,
        'mapFutureParkingTitle': parkingTitle,
        'mapFutureParkingDesc': parkingDesc,
        'mapFutureTrafficDesc': trafficDesc,
        'mapNavLayerTitle': navTitle,
        'mapNavLayerSubtitle': navSubtitle,
        'detailTravelIntelTitle': intelTitle,
        'detailTravelIntelSubtitle': intelSubtitle,
        'detailCrowdOutlook': crowdOutlook,
        '@detailCrowdOutlook': {
          'placeholders': {'level': {'type': 'String'}},
        },
        'detailParkingOutlook': parkingOutlook,
        '@detailParkingOutlook': {
          'placeholders': {'level': {'type': 'String'}},
        },
        'detailDriveFrictionOutlook': driveFriction[locale],
        '@detailDriveFrictionOutlook': {
          'placeholders': {'score': {'type': 'int'}},
        },
      };

  return {
    'de': pack(
      'de',
      easy: 'Einfach',
      moderate: 'Mäßig',
      difficult: 'Schwierig',
      limited: 'Begrenzt · früh ankommen',
      crowdTitle: 'Andrang-Ausblick',
      crowdDesc:
          'Prognose von ruhig bis voll auf jedem Stopp in „Plan my day“.',
      parkingTitle: 'Park-Ausblick',
      parkingDesc:
          'Geschätzte Reibung bei Valet, Parkhaus und Ankunft — vor dem Losfahren.',
      trafficDesc:
          'Stressgewichtete Etappen-Scores im Tagesplan — nicht nur Fahrminuten.',
      navTitle: 'Reibungs-Intelligenz pro Stopp',
      navSubtitle:
          'Andrang, Parken und Fahrstress im Tagesplan — plus spontane Umleitung.',
      intelTitle: 'Reibungs-Ausblick',
      intelSubtitle:
          'Prognose aus Kategorie, Uhrzeit und Entfernung — keine Live-Sensoren.',
      crowdOutlook: 'Andrang: {level}',
      parkingOutlook: 'Parken: {level}',
    ),
    'es': pack(
      'es',
      easy: 'Fácil',
      moderate: 'Moderado',
      difficult: 'Difícil',
      limited: 'Limitado · llega temprano',
      crowdTitle: 'Perspectiva de multitudes',
      crowdDesc:
          'Ventanas previstas de tranquilo a lleno en cada parada de Plan my day.',
      parkingTitle: 'Perspectiva de aparcamiento',
      parkingDesc:
          'Fricción estimada de valet, garaje y llegada antes de salir.',
      trafficDesc:
          'Puntuación de estrés por tramo en tu plan del día — no solo minutos.',
      navTitle: 'Inteligencia de fricción por parada',
      navSubtitle:
          'Multitudes, aparcamiento y estrés de conducción en tu plan — más reruta espontánea.',
      intelTitle: 'Perspectiva de fricción del viaje',
      intelSubtitle:
          'Predicción por categoría, hora y distancia — sin sensores en vivo.',
      crowdOutlook: 'Multitud: {level}',
      parkingOutlook: 'Aparcamiento: {level}',
    ),
    'fr': pack(
      'fr',
      easy: 'Facile',
      moderate: 'Modéré',
      difficult: 'Difficile',
      limited: 'Limité · arrivez tôt',
      crowdTitle: 'Perspective d’affluence',
      crowdDesc:
          'Fenêtres prévues calme à bondé sur chaque étape de Plan my day.',
      parkingTitle: 'Perspective stationnement',
      parkingDesc:
          'Friction estimée voiturier, garage et arrivée avant de partir.',
      trafficDesc:
          'Scores de stress par étape sur votre journée — pas seulement les minutes.',
      navTitle: 'Intelligence friction par étape',
      navSubtitle:
          'Affluence, stationnement et stress de conduite sur votre plan — plus reroute spontanée.',
      intelTitle: 'Perspective friction du voyage',
      intelSubtitle:
          'Prévision selon catégorie, heure et distance — pas de capteurs live.',
      crowdOutlook: 'Affluence : {level}',
      parkingOutlook: 'Stationnement : {level}',
    ),
    'it': pack(
      'it',
      easy: 'Facile',
      moderate: 'Moderato',
      difficult: 'Difficile',
      limited: 'Limitato · arriva presto',
      crowdTitle: 'Prospettiva folla',
      crowdDesc:
          'Finestre previste da tranquillo a pieno su ogni tappa di Plan my day.',
      parkingTitle: 'Prospettiva parcheggio',
      parkingDesc:
          'Attrito stimato per valet, garage e arrivo prima di partire.',
      trafficDesc:
          'Punteggi di stress per tratta nel piano giornaliero — non solo minuti.',
      navTitle: 'Intelligenza attrito per tappa',
      navSubtitle:
          'Folla, parcheggio e stress di guida nel piano — più reroute spontanea.',
      intelTitle: 'Prospettiva attrito viaggio',
      intelSubtitle:
          'Previsione da categoria, ora e distanza — nessun sensore live.',
      crowdOutlook: 'Folla: {level}',
      parkingOutlook: 'Parcheggio: {level}',
    ),
    'pt': pack(
      'pt',
      easy: 'Fácil',
      moderate: 'Moderado',
      difficult: 'Difícil',
      limited: 'Limitado · chegue cedo',
      crowdTitle: 'Perspectiva de multidão',
      crowdDesc:
          'Janelas previstas de calmo a lotado em cada parada do Plan my day.',
      parkingTitle: 'Perspectiva de estacionamento',
      parkingDesc:
          'Atrito estimado de manobrista, garagem e chegada antes de sair.',
      trafficDesc:
          'Pontuação de stress por trecho no plano do dia — não só minutos.',
      navTitle: 'Inteligência de atrito por parada',
      navSubtitle:
          'Multidão, estacionamento e stress de condução no plano — mais rerota espontânea.',
      intelTitle: 'Perspectiva de atrito da viagem',
      intelSubtitle:
          'Previsão por categoria, hora e distância — sem sensores ao vivo.',
      crowdOutlook: 'Multidão: {level}',
      parkingOutlook: 'Estacionamento: {level}',
    ),
    'ru': pack(
      'ru',
      easy: 'Легко',
      moderate: 'Умеренно',
      difficult: 'Сложно',
      limited: 'Ограничено · приезжайте рано',
      crowdTitle: 'Прогноз толпы',
      crowdDesc:
          'Прогноз от спокойно до переполнено на каждой остановке Plan my day.',
      parkingTitle: 'Прогноз парковки',
      parkingDesc:
          'Оценка трения с valet, гаражом и приездом до выезда.',
      trafficDesc:
          'Оценка стресса по каждому плечу маршрута — не только минуты.',
      navTitle: 'Интеллект трения по остановкам',
      navSubtitle:
          'Толпа, парковка и стресс в пути в плане дня — плюс спontaneous reroute.',
      intelTitle: 'Прогноз трения поездки',
      intelSubtitle:
          'Прогноз по категории, времени и расстоянию — без live-сенсоров.',
      crowdOutlook: 'Толпа: {level}',
      parkingOutlook: 'Парковка: {level}',
    ),
    'hi': pack(
      'hi',
      easy: 'आसान',
      moderate: 'मध्यम',
      difficult: 'कठिन',
      limited: 'सीमित · जल्दी पहुँचें',
      crowdTitle: 'भीड़ का अनुमान',
      crowdDesc:
          'Plan my day में हर स्टॉप पर शांत से भरी हुई का अनुमानित समय।',
      parkingTitle: 'पार्किंग अनुमान',
      parkingDesc:
          'निकलने से पहले valet, गैरेज और आगमन की अनुमानित परेशानी।',
      trafficDesc:
          'दिन की योजना में प्रत्येक leg पर तनाव स्कोर — सिर्फ मिनट नहीं।',
      navTitle: 'स्टॉप घर्षण इंटेल',
      navSubtitle:
          'योजना में भीड़, पार्किंग और ड्राइव तनाव — और स्पontaneous reroute।',
      intelTitle: 'यात्रा घर्षण अनुमान',
      intelSubtitle:
          'श्रेणी, समय और दूरी से अनुमान — लाइव सेंसर नहीं।',
      crowdOutlook: 'भीड़: {level}',
      parkingOutlook: 'पार्किंग: {level}',
    ),
    'tr': pack(
      'tr',
      easy: 'Kolay',
      moderate: 'Ilıman',
      difficult: 'Zor',
      limited: 'Sınırlı · erken gelin',
      crowdTitle: 'Kalabalık görünümü',
      crowdDesc:
          'Plan my day\'deki her durak için sakin–doludan tahmin edilen pencereler.',
      parkingTitle: 'Park görünümü',
      parkingDesc:
          'Gitmeden önce vale, otopark ve varış sürtünmesi tahmini.',
      trafficDesc:
          'Gün planında bacak bazlı stres puanları — sadece dakika değil.',
      navTitle: 'Durak sürtünme zekâsı',
      navSubtitle:
          'Planda kalabalık, park ve sürüş stresi — artı spontane yeniden rota.',
      intelTitle: 'Yolculuk sürtünme görünümü',
      intelSubtitle:
          'Kategori, saat ve mesafeden tahmin — canlı sensör yok.',
      crowdOutlook: 'Kalabalık: {level}',
      parkingOutlook: 'Park: {level}',
    ),
    'ja': pack(
      'ja',
      easy: '簡単',
      moderate: '普通',
      difficult: '難しい',
      limited: '限られ · 早めに到着',
      crowdTitle: '混雑見通し',
      crowdDesc: 'Plan my dayの各停車地で静か〜混雑の予測ウィンドウ。',
      parkingTitle: '駐車見通し',
      parkingDesc: '出発前のバレー・ガレージ・到着の推定負担。',
      trafficDesc: '日次プラン各 leg のストレススコア — 分だけではありません。',
      navTitle: '停車地フリクション',
      navSubtitle: 'プラン内の混雑・駐車・運転ストレス — ワンタップ再ルート付き。',
      intelTitle: '旅の摩擦見通し',
      intelSubtitle: 'カテゴリ・時間・距離から予測 — ライブセンサーなし。',
      crowdOutlook: '混雑: {level}',
      parkingOutlook: '駐車: {level}',
    ),
    'ko': pack(
      'ko',
      easy: '쉬움',
      moderate: '보통',
      difficult: '어려움',
      limited: '제한적 · 일찍 도착',
      crowdTitle: '혼잡 전망',
      crowdDesc: 'Plan my day 각 정류장의 한산~만원 예측 구간.',
      parkingTitle: '주차 전망',
      parkingDesc: '출발 전 발렛·주차장·도착 마찰 추정.',
      trafficDesc: '일정 각 구간의 스트레스 점수 — 시간만이 아님.',
      navTitle: '정류장 마찰 인텔',
      navSubtitle: '일정의 혼잡·주차·운전 스트ress — 원탭 재경로 포함.',
      intelTitle: '여행 마찰 전망',
      intelSubtitle: '카테고리·시간·거리 기반 예측 — 실시간 센서 없음.',
      crowdOutlook: '혼잡: {level}',
      parkingOutlook: '주차: {level}',
    ),
    'zh': pack(
      'zh',
      easy: '容易',
      moderate: '适中',
      difficult: '困难',
      limited: '有限 · 请早到',
      crowdTitle: '人流展望',
      crowdDesc: 'Plan my day 每站从安静到拥挤的预测窗口。',
      parkingTitle: '停车展望',
      parkingDesc: '出发前对代客泊车、车库与到达摩擦的估算。',
      trafficDesc: '日程每段路程的压力分 — 不只是分钟数。',
      navTitle: '站点摩擦智能',
      navSubtitle: '日程中的人流、停车与驾驶压力 — 加一键改线。',
      intelTitle: '行程摩擦展望',
      intelSubtitle: '按类别、时间与距离预测 — 非实时传感器。',
      crowdOutlook: '人流：{level}',
      parkingOutlook: '停车：{level}',
    ),
  };
}
