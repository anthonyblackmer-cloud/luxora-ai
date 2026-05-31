// ignore_for_file: avoid_print
//
// New York City pack UI strings.
// Run: dart run tool/patch_nyc_l10n.dart && flutter gen-l10n

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
  required String moodRoutes,
  required String timesSquare,
  required String observationDeck,
  required String centralPark,
  required String broadwayTickets,
  required String brooklynBridge,
  required String ferryGoldenHour,
}) =>
    {
      'nycMoodRoutesTitle': moodRoutes,
      'localSecretNycTimesSquareStrategy': timesSquare,
      'localSecretNycObservationDeck': observationDeck,
      'localSecretNycCentralParkEntrance': centralPark,
      'localSecretNycBroadwayTickets': broadwayTickets,
      'localSecretNycBrooklynBridgePhoto': brooklynBridge,
      'localSecretNycFerryGoldenHour': ferryGoldenHour,
    };

Map<String, dynamic> _de() => _shared(
      moodRoutes: 'New-York-Stimmungsrouten',
      timesSquare:
          'Über Seitenstraßen der 7th Ave — Kreuzungsandrang meiden, Broadway-Sicht behalten.',
      observationDeck:
          'Letzten Slot vor Sonnenuntergang buchen — goldenes Licht ohne Mittagswarteschlange.',
      centralPark:
          '72nd-Street-Querweg — schneller zu Bethesda ohne Columbus-Circle-Menschenmassen.',
      broadwayTickets:
          'TKTS-Matinee-Sch Schlange öffnet früh — Rush-Plätze schlagen Touristenpreise.',
      brooklynBridge:
          'Washington Street DUMBO um 8 Uhr — leerer Kopfsteinrahmen vor Tourgruppen.',
      ferryGoldenHour:
          'Hinfahrt der Staten-Island-Fähre bei Sonnenuntergang — kostenlose Hafenrunde.',
    );

Map<String, dynamic> _es() => _shared(
      moodRoutes: 'Rutas de ambiente Nueva York',
      timesSquare:
          'Entra por calles laterales de la 7ª Ave — evita el cruce abarrotado y mantén vistas a Broadway.',
      observationDeck:
          'Reserva el último turno antes del atardecer — luz dorada sin colas del mediodía.',
      centralPark:
          'Usa el cruce de la calle 72 — camino más rápido a Bethesda sin multitudes de Columbus Circle.',
      broadwayTickets:
          'La fila matinal TKTS abre temprano — asientos rush vencen precios turísticos.',
      brooklynBridge:
          'Washington Street DUMBO a las 8 AM — encuadre vacío antes de los grupos turísticos.',
      ferryGoldenHour:
          'Ferry a Staten Island al atardecer — vuelta por el puerto gratis sin barco turístico.',
    );

Map<String, dynamic> _fr() => _shared(
      moodRoutes: 'Parcours d\'ambiance New York',
      timesSquare:
          'Entrez par les rues latérales de la 7e Ave — évitez la foule du carrefour, gardez Broadway en vue.',
      observationDeck:
          'Réservez le dernier créneau avant le coucher du soleil — lumière dorée sans file de midi.',
      centralPark:
          'Traverse de la 72e rue — accès plus rapide à Bethesda sans foule de Columbus Circle.',
      broadwayTickets:
          'La file matinale TKTS ouvre tôt — places rush meilleures que les tarifs touristiques.',
      brooklynBridge:
          'Washington Street DUMBO à 8 h — cadre pavé vide avant les groupes touristiques.',
      ferryGoldenHour:
          'Ferry Staten Island au coucher du soleil — boucle du port gratuite sans bateau touristique.',
    );

Map<String, dynamic> _it() => _shared(
      moodRoutes: 'Percorsi mood New York',
      timesSquare:
          'Entra dalle traverse della 7th Ave — evita la calca del incrocio e mantieni Broadway in vista.',
      observationDeck:
          'Prenota l\'ultimo slot prima del tramonto — luce dorata senza code di mezzogiorno.',
      centralPark:
          'Usa il travers di 72nd Street — percorso più rapido verso Bethesda senza folla a Columbus Circle.',
      broadwayTickets:
          'La fila matinale TKTS apre presto — posti rush battono i prezzi turistici.',
      brooklynBridge:
          'Washington Street DUMBO alle 8 — cornice di ciottoli vuota prima dei gruppi turistici.',
      ferryGoldenHour:
          'Traghetto Staten Island al tramonto — giro del porto gratis senza barca turistica.',
    );

Map<String, dynamic> _pt() => _shared(
      moodRoutes: 'Rotas de ambiente Nova York',
      timesSquare:
          'Entre pelas ruas laterais da 7ª Ave — evite o cruzamento lotado e mantenha Broadway à vista.',
      observationDeck:
          'Reserve o último horário antes do pôr do sol — luz dourada sem fila do meio-dia.',
      centralPark:
          'Use a travessia da 72nd Street — caminho mais rápido até Bethesda sem multidão na Columbus Circle.',
      broadwayTickets:
          'Fila matinal TKTS abre cedo — lugares rush vencem preços turísticos.',
      brooklynBridge:
          'Washington Street DUMBO às 8h — enquadramento vazio antes dos grupos turísticos.',
      ferryGoldenHour:
          'Balsa para Staten Island ao pôr do sol — volta pelo porto grátis sem barco turístico.',
    );

Map<String, dynamic> _ru() => _shared(
      moodRoutes: 'Маршруты настроения Нью-Йорк',
      timesSquare:
          'Заходите с боковых улиц 7-й авеню — меньше толпы на перекрёстке, вид на Broadway сохраняется.',
      observationDeck:
          'Бронируйте последний слот перед закатом — золотой свет без очереди в полдень.',
      centralPark:
          'Переход на 72-й улице — быстрее к Bethesda без толпы у Columbus Circle.',
      broadwayTickets:
          'Утренняя очередь TKTS открывается рано — rush-места выгоднее туристических цен.',
      brooklynBridge:
          'Washington Street DUMBO в 8 утра — пустой кадр до туристических групп.',
      ferryGoldenHour:
          'Паром на Staten Island на закате — бесплатный круг по гавани без экскурсионного катера.',
    );

Map<String, dynamic> _hi() => _shared(
      moodRoutes: 'न्यू यॉर्क मूड रूट',
      timesSquare:
          '7वीं एवेन्यू की गलियों से प्रवेश — चौराहे की भीड़ से बचें, Broadway दृश्य बनाए रखें।',
      observationDeck:
          'सूर्यास्त से पहले अंतिम स्लॉट बुक करें — दोपहर की कतार के बिना सुनहरी रोशनी।',
      centralPark:
          '72nd Street ट्रांसवर्स — Columbus Circle भीड़ के बिना Bethesda तक तेज़ रास्ता।',
      broadwayTickets:
          'TKTS सुबह की लाइन जल्दी खुलती है — rush सीटें पर्यटक दरों से बेहतर।',
      brooklynBridge:
          'Washington Street DUMBO सुबह 8 बजे — टूर समूहों से पहले खाली cobblestone फ्रेम।',
      ferryGoldenHour:
          'सूर्यास्त पर Staten Island फेरी — टूर बोट शुल्क के बिना मुफ्त बंदरगाह लूप।',
    );

Map<String, dynamic> _tr() => _shared(
      moodRoutes: 'New York ruh hali rotaları',
      timesSquare:
          '7th Ave yan sokaklarından girin — kavşak kalabalığından kaçının, Broadway görüşünü koruyun.',
      observationDeck:
          'Gün batımından önce son slotu ayırtın — öğle kuyruğu olmadan altın ışık.',
      centralPark:
          '72nd Street geçidini kullanın — Columbus Circle kalabalığı olmadan Bethesda\'ya daha hızlı yol.',
      broadwayTickets:
          'TKTS sabah kuyruğu erken açılır — rush koltuklar turist fiyatlarını yener.',
      brooklynBridge:
          'Washington Street DUMBO saat 8 — tur gruplarından önce boş arnavut kaldırımı kadrajı.',
      ferryGoldenHour:
          'Gün batımında Staten Island feribotu — tur teknesi ücreti olmadan ücretsiz liman turu.',
    );

Map<String, dynamic> _ja() => _shared(
      moodRoutes: 'ニューヨーク・ムードルート',
      timesSquare: '7th Aveの横丁から入る — 交差点の混雑を避けBroadwayの視界を確保。',
      observationDeck: '日没前の最終枠を予約 — 正午の行列なしでゴールデンアワー。',
      centralPark: '72nd Street横断路 — Columbus Circleの混雑を避けBethesdaへ最短。',
      broadwayTickets: 'TKTS午前の列は早めに — ラッシュ席は観光客料金よりお得。',
      brooklynBridge: 'Washington Street DUMBO 朝8時 — ツアー前の空いた石畳フレーム。',
      ferryGoldenHour: '日没時のスタテン島フェリー — 観光船なしで無料の港ループ。',
    );

Map<String, dynamic> _ko() => _shared(
      moodRoutes: '뉴욕 무드 루트',
      timesSquare: '7th Ave 골목으로 진입 — 교차로 혼잡을 피하고 브로드웨이 시야 유지.',
      observationDeck: '일몰 전 마지막 시간 예약 — 정오 대기열 없이 골든아워.',
      centralPark: '72nd Street 횡단로 — Columbus Circle 혼잡 없이 Bethesda까지 빠른 경로.',
      broadwayTickets: 'TKTS 오전 줄은 일찍 — 러시 좌석이 관광객 가격보다 유리.',
      brooklynBridge: 'Washington Street DUMBO 오전 8시 — 투어 그룹 전 빈 돌길 프레임.',
      ferryGoldenHour: '일몰 시 Staten Island 페리 — 투어 보트 없이 무료 항만 루프.',
    );

Map<String, dynamic> _zh() => _shared(
      moodRoutes: '纽约心情路线',
      timesSquare: '从第七大道侧街进入——避开十字路口人潮，保留百老汇视野。',
      observationDeck: '预订日落前最后时段——黄金光线，避开正午排队。',
      centralPark: '走72街横穿通道——更快到Bethesda，避开哥伦布圆环 crowd。',
      broadwayTickets: 'TKTS当日午场队一早开放——抢票比游客价更划算。',
      brooklynBridge: 'DUMBO华盛顿街早8点——旅游团到来前的空 cobblestone 画面。',
      ferryGoldenHour: '日落时出发的史泰登岛渡轮——免费港湾环线，无需观光船。',
    );
