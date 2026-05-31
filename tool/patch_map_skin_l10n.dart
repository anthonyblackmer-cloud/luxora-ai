// ignore_for_file: avoid_print
//
// Map basemap skin settings labels.
// Run: dart run tool/patch_map_skin_l10n.dart && flutter gen-l10n

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

  final section = _sectionLabels();
  final intro = _introLabels();
  final voyager = _voyagerLabels();
  final voyagerMood = _voyagerMoodLabels();
  final osm = _osmLabels();
  final osmMood = _osmMoodLabels();
  final light = _lightLabels();
  final lightMood = _lightMoodLabels();
  final dark = _darkLabels();
  final darkMood = _darkMoodLabels();
  final streets = _streetsLabels();
  final streetsMood = _streetsMoodLabels();
  final outdoors = _outdoorsLabels();
  final outdoorsMood = _outdoorsMoodLabels();

  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map['settingsMapSkinSection'] = section[locale]!;
    map['settingsMapSkinIntro'] = intro[locale]!;
    map['mapSkinVoyager'] = voyager[locale]!;
    map['mapSkinVoyagerMood'] = voyagerMood[locale]!;
    map['mapSkinOsm'] = osm[locale]!;
    map['mapSkinOsmMood'] = osmMood[locale]!;
    map['mapSkinCartoLight'] = light[locale]!;
    map['mapSkinCartoLightMood'] = lightMood[locale]!;
    map['mapSkinCartoDark'] = dark[locale]!;
    map['mapSkinCartoDarkMood'] = darkMood[locale]!;
    map['mapSkinMapboxStreets'] = streets[locale]!;
    map['mapSkinMapboxStreetsMood'] = streetsMood[locale]!;
    map['mapSkinMapboxOutdoors'] = outdoors[locale]!;
    map['mapSkinMapboxOutdoorsMood'] = outdoorsMood[locale]!;
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, String> _sectionLabels() => {
      'de': 'Karten-Basemap',
      'es': 'Mapa base',
      'fr': 'Fond de carte',
      'it': 'Mappa di base',
      'pt': 'Mapa base',
      'ru': 'Подложка карты',
      'hi': 'मानचित्र आधार',
      'tr': 'Harita tabanı',
      'ja': '地図ベース',
      'ko': '지도 베이스맵',
      'zh': '地图底图',
    };

Map<String, String> _introLabels() => {
      'de': 'Wählen Sie das Erscheinungsbild der Kartenkacheln auf der Karte.',
      'es': 'Elige el aspecto de los mosaicos del mapa en la pestaña Mapa.',
      'fr': 'Choisissez l\'apparence des tuiles sur l\'onglet Carte.',
      'it': 'Scegli l\'aspetto delle tessere mappa nella scheda Mappa.',
      'pt': 'Escolha o visual dos blocos do mapa na aba Mapa.',
      'ru': 'Выберите вид плиток карты на вкладке «Карта».',
      'hi': 'मानचित्र टैब पर टाइल्स का रूप चुनें।',
      'tr': 'Harita sekmesindeki harita döşemelerinin görünümünü seçin.',
      'ja': 'マップタブの地図タイルの見た目を選びます。',
      'ko': '지도 탭의 타일 모양을 선택하세요.',
      'zh': '选择地图标签页中地图图块的外观。',
    };

Map<String, String> _voyagerLabels() => {
      'de': 'Voyager',
      'es': 'Voyager',
      'fr': 'Voyager',
      'it': 'Voyager',
      'pt': 'Voyager',
      'ru': 'Voyager',
      'hi': 'Voyager',
      'tr': 'Voyager',
      'ja': 'Voyager',
      'ko': 'Voyager',
      'zh': 'Voyager',
    };

Map<String, String> _voyagerMoodLabels() => {
      'de': 'Sanfte Farben — Parks, Wasser, Straßen',
      'es': 'Color suave — parques, agua, carreteras',
      'fr': 'Couleurs douces — parcs, eau, routes',
      'it': 'Colori tenui — parchi, acqua, strade',
      'pt': 'Cores suaves — parques, água, estradas',
      'ru': 'Мягкие цвета — парки, вода, дороги',
      'hi': 'हल्के रंग — पार्क, पानी, सड़कें',
      'tr': 'Yumuşak renkler — parklar, su, yollar',
      'ja': 'やわらかな色 — 公園、水、道路',
      'ko': '부드러운 색 — 공원, 물, 도로',
      'zh': '柔和色彩 — 公园、水域、道路',
    };

Map<String, String> _osmLabels() => {
      'de': 'OpenStreetMap',
      'es': 'OpenStreetMap',
      'fr': 'OpenStreetMap',
      'it': 'OpenStreetMap',
      'pt': 'OpenStreetMap',
      'ru': 'OpenStreetMap',
      'hi': 'OpenStreetMap',
      'tr': 'OpenStreetMap',
      'ja': 'OpenStreetMap',
      'ko': 'OpenStreetMap',
      'zh': 'OpenStreetMap',
    };

Map<String, String> _osmMoodLabels() => {
      'de': 'Klassisch, natürliche Töne',
      'es': 'Clásico, tonos naturales',
      'fr': 'Classique, tons naturels',
      'it': 'Classico, toni naturali',
      'pt': 'Clássico, tons naturais',
      'ru': 'Классика, естественные тона',
      'hi': 'क्लासिक, प्राकृतिक रंग',
      'tr': 'Klasik, doğal tonlar',
      'ja': 'クラシック、自然な色調',
      'ko': '클래식, 자연스러운 톤',
      'zh': '经典，自然色调',
    };

Map<String, String> _lightLabels() => {
      'de': 'Carto Light',
      'es': 'Carto Light',
      'fr': 'Carto Light',
      'it': 'Carto Light',
      'pt': 'Carto Light',
      'ru': 'Carto Light',
      'hi': 'Carto Light',
      'tr': 'Carto Light',
      'ja': 'Carto Light',
      'ko': 'Carto Light',
      'zh': 'Carto Light',
    };

Map<String, String> _lightMoodLabels() => {
      'de': 'Minimal und hell',
      'es': 'Minimalista y claro',
      'fr': 'Minimal et lumineux',
      'it': 'Minimal e luminoso',
      'pt': 'Minimalista e claro',
      'ru': 'Минимализм и яркость',
      'hi': 'न्यूनतम और उज्ज्वल',
      'tr': 'Minimal ve aydınlık',
      'ja': 'ミニマルで明るい',
      'ko': '미니멀하고 밝음',
      'zh': '简约明亮',
    };

Map<String, String> _darkLabels() => {
      'de': 'Carto Dark',
      'es': 'Carto Dark',
      'fr': 'Carto Dark',
      'it': 'Carto Dark',
      'pt': 'Carto Dark',
      'ru': 'Carto Dark',
      'hi': 'Carto Dark',
      'tr': 'Carto Dark',
      'ja': 'Carto Dark',
      'ko': 'Carto Dark',
      'zh': 'Carto Dark',
    };

Map<String, String> _darkMoodLabels() => {
      'de': 'Nachtfreundliche Basemap',
      'es': 'Mapa base nocturno',
      'fr': 'Fond de carte nocturne',
      'it': 'Mappa base notturna',
      'pt': 'Mapa base noturno',
      'ru': 'Ночная подложка',
      'hi': 'रात के अनुकूल आधार',
      'tr': 'Gece dostu taban',
      'ja': '夜向けベースマップ',
      'ko': '야간 친화 베이스맵',
      'zh': '夜间友好底图',
    };

Map<String, String> _streetsLabels() => {
      'de': 'Mapbox Streets',
      'es': 'Mapbox Streets',
      'fr': 'Mapbox Streets',
      'it': 'Mapbox Streets',
      'pt': 'Mapbox Streets',
      'ru': 'Mapbox Streets',
      'hi': 'Mapbox Streets',
      'tr': 'Mapbox Streets',
      'ja': 'Mapbox Streets',
      'ko': 'Mapbox Streets',
      'zh': 'Mapbox Streets',
    };

Map<String, String> _streetsMoodLabels() => {
      'de': 'Reich an Details, Reise-App-Look',
      'es': 'Rico en detalle, estilo app de viajes',
      'fr': 'Riche en détails, fini app voyage',
      'it': 'Ricco di dettagli, stile app di viaggio',
      'pt': 'Rico em detalhes, visual de app de viagem',
      'ru': 'Детализированный, как в travel-приложениях',
      'hi': 'समृद्ध विवरण, यात्रा ऐप जैसा',
      'tr': 'Zengin detay, seyahat uygulaması görünümü',
      'ja': '詳細で旅行アプリ風',
      'ko': '풍부한 디테일, 여행 앱 느낌',
      'zh': '细节丰富，旅行应用风格',
    };

Map<String, String> _outdoorsLabels() => {
      'de': 'Mapbox Outdoors',
      'es': 'Mapbox Outdoors',
      'fr': 'Mapbox Outdoors',
      'it': 'Mapbox Outdoors',
      'pt': 'Mapbox Outdoors',
      'ru': 'Mapbox Outdoors',
      'hi': 'Mapbox Outdoors',
      'tr': 'Mapbox Outdoors',
      'ja': 'Mapbox Outdoors',
      'ko': 'Mapbox Outdoors',
      'zh': 'Mapbox Outdoors',
    };

Map<String, String> _outdoorsMoodLabels() => {
      'de': 'Grün und Gelände betont',
      'es': 'Énfasis en verdes y terreno',
      'fr': 'Verts et relief mis en avant',
      'it': 'Verdi e rilievo in evidenza',
      'pt': 'Verdes e terreno em destaque',
      'ru': 'Акцент на зелень и рельеф',
      'hi': 'हरियाली और भू-आकृति पर जोर',
      'tr': 'Yeşillik ve arazi vurgusu',
      'ja': '緑と地形を強調',
      'ko': '녹색과 지형 강조',
      'zh': '强调绿色与地形',
    };
