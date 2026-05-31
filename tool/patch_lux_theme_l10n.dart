// ignore_for_file: avoid_print
//
// Theme preset dropdown labels.
// Run: dart run tool/patch_lux_theme_l10n.dart && flutter gen-l10n

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

  final intro = _introLabels();
  final label = _themeLabel();
  final golden = _goldenLabels();
  final goldenMood = _goldenMoodLabels();
  final amethyst = _amethystLabels();
  final amethystMood = _amethystMoodLabels();
  final emerald = _emeraldLabels();
  final emeraldMood = _emeraldMoodLabels();
  final riviera = _rivieraLabels();
  final rivieraMood = _rivieraMoodLabels();
  final coastal = _coastalLabels();
  final coastalMood = _coastalMoodLabels();
  final champagne = _champagneLabels();
  final champagneMood = _champagneMoodLabels();
  final blackCard = _blackCardLabels();
  final blackCardMood = _blackCardMoodLabels();

  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map['settingsThemeIntro'] = intro[locale]!;
    map['settingsThemeLabel'] = label[locale]!;
    map['themeGoldenEmber'] = golden[locale]!;
    map['themeGoldenEmberMood'] = goldenMood[locale]!;
    map['themeMidnightAmethyst'] = amethyst[locale]!;
    map['themeMidnightAmethystMood'] = amethystMood[locale]!;
    map['themeEmeraldHaven'] = emerald[locale]!;
    map['themeEmeraldHavenMood'] = emeraldMood[locale]!;
    map['themeRivieraWhite'] = riviera[locale]!;
    map['themeRivieraWhiteMood'] = rivieraMood[locale]!;
    map['themeCoastalGlass'] = coastal[locale]!;
    map['themeCoastalGlassMood'] = coastalMood[locale]!;
    map['themeChampagneLuxe'] = champagne[locale]!;
    map['themeChampagneLuxeMood'] = champagneMood[locale]!;
    map['themeBlackCard'] = blackCard[locale]!;
    map['themeBlackCardMood'] = blackCardMood[locale]!;
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, String> _introLabels() => {
      'de':
          'Dunkles Kino oder helles Resort — wählen Sie die Stimmung für Ihre Reise.',
      'es':
          'Oscuro cinematográfico o resort claro — elige el ambiente de tu viaje.',
      'fr':
          'Sombre cinématique ou resort clair — choisissez l\'ambiance de votre voyage.',
      'it':
          'Scuro cinematografico o resort chiaro — scegli l\'atmosfera del tuo viaggio.',
      'pt':
          'Escuro cinematográfico ou resort claro — escolha o clima da sua viagem.',
      'ru':
          'Кинематографичная тьма или светлый курорт — выберите настроение поездки.',
      'hi':
          'सिनेमाई डार्क या रिसॉर्ट लाइट — अपनी यात्रा का मूड चुनें।',
      'tr':
          'Sinematik karanlık veya resort açık — geziniz için ruh hâlini seçin.',
      'ja': 'シネマティックなダークかリゾートのライト — 旅のムードを選びます。',
      'ko': '시네마틱 다크 또는 리조트 라이트 — 여행 분위기를 선택하세요.',
      'zh': '电影感深色或度假村浅色 — 选择您的旅行氛围。',
    };

Map<String, String> _themeLabel() => {
      'de': 'Design',
      'es': 'Tema',
      'fr': 'Thème',
      'it': 'Tema',
      'pt': 'Tema',
      'ru': 'Тема',
      'hi': 'थीम',
      'tr': 'Tema',
      'ja': 'テーマ',
      'ko': '테마',
      'zh': '主题',
    };

Map<String, String> _goldenLabels() => {
      'de': 'Golden Ember',
      'es': 'Golden Ember',
      'fr': 'Golden Ember',
      'it': 'Golden Ember',
      'pt': 'Golden Ember',
      'ru': 'Golden Ember',
      'hi': 'Golden Ember',
      'tr': 'Golden Ember',
      'ja': 'Golden Ember',
      'ko': 'Golden Ember',
      'zh': 'Golden Ember',
    };

Map<String, String> _goldenMoodLabels() => {
      'de': 'Warme Ultra-Luxus',
      'es': 'Ultra lujo cálido',
      'fr': 'Ultra-luxe chaleureux',
      'it': 'Ultra lusso caldo',
      'pt': 'Ultra luxo quente',
      'ru': 'Тёпкая ультра-роскошь',
      'hi': 'गर्म अल्ट्रा-लक्ज़री',
      'tr': 'Sıcak ultra lüks',
      'ja': '温かみのある超ラグジュアリー',
      'ko': '따뜻한 울트라 럭셔리',
      'zh': '温暖超奢华',
    };

Map<String, String> _amethystLabels() => {
      'de': 'Midnight Amethyst',
      'es': 'Midnight Amethyst',
      'fr': 'Midnight Amethyst',
      'it': 'Midnight Amethyst',
      'pt': 'Midnight Amethyst',
      'ru': 'Midnight Amethyst',
      'hi': 'Midnight Amethyst',
      'tr': 'Midnight Amethyst',
      'ja': 'Midnight Amethyst',
      'ko': 'Midnight Amethyst',
      'zh': 'Midnight Amethyst',
    };

Map<String, String> _amethystMoodLabels() => {
      'de': 'Geheimnisvoll und exklusiv',
      'es': 'Misterioso y exclusivo',
      'fr': 'Mystérieux et exclusif',
      'it': 'Misterioso ed esclusivo',
      'pt': 'Misterioso e exclusivo',
      'ru': 'Загадочный и эксклюзивный',
      'hi': 'रहस्यमय और विशेष',
      'tr': 'Gizemli ve ayrıcalıklı',
      'ja': '神秘的でエクスクルーシブ',
      'ko': '신비롭고 독점적인',
      'zh': '神秘而专属',
    };

Map<String, String> _emeraldLabels() => {
      'de': 'Emerald Haven',
      'es': 'Emerald Haven',
      'fr': 'Emerald Haven',
      'it': 'Emerald Haven',
      'pt': 'Emerald Haven',
      'ru': 'Emerald Haven',
      'hi': 'Emerald Haven',
      'tr': 'Emerald Haven',
      'ja': 'Emerald Haven',
      'ko': 'Emerald Haven',
      'zh': 'Emerald Haven',
    };

Map<String, String> _emeraldMoodLabels() => {
      'de': 'Serene tropische Luxus',
      'es': 'Lujo tropical sereno',
      'fr': 'Luxe tropical serein',
      'it': 'Lusso tropicale sereno',
      'pt': 'Luxo tropical sereno',
      'ru': 'Спокойная тропическая роскошь',
      'hi': 'शांत उष्णकटिबंधीय विलासिता',
      'tr': 'Huzurlu tropik lüks',
      'ja': '穏やかなトロピカルラグジュアリー',
      'ko': '고요한 열대 럭셔리',
      'zh': '宁静热带奢华',
    };

Map<String, String> _rivieraLabels() => {
      'de': 'Riviera White',
      'es': 'Riviera White',
      'fr': 'Riviera White',
      'it': 'Riviera White',
      'pt': 'Riviera White',
      'ru': 'Riviera White',
      'hi': 'Riviera White',
      'tr': 'Riviera White',
      'ja': 'Riviera White',
      'ko': 'Riviera White',
      'zh': 'Riviera White',
    };

Map<String, String> _rivieraMoodLabels() => {
      'de': 'Elegantes Luxus-Reisemagazin',
      'es': 'Elegante revista de viajes de lujo',
      'fr': 'Magazine de voyage de luxe élégant',
      'it': 'Elegante magazine di viaggi di lusso',
      'pt': 'Revista de viagens de luxo elegante',
      'ru': 'Элегантный люксовый travel-журнал',
      'hi': 'शानदार लक्ज़री ट्रैवल मैगज़ीन',
      'tr': 'Zarif lüks seyahat dergisi',
      'ja': 'エレガントなラグジュアリー旅行誌',
      'ko': '우아한 럭셔리 여행 매거진',
      'zh': '优雅奢华旅行杂志风',
    };

Map<String, String> _coastalLabels() => {
      'de': 'Coastal Glass',
      'es': 'Coastal Glass',
      'fr': 'Coastal Glass',
      'it': 'Coastal Glass',
      'pt': 'Coastal Glass',
      'ru': 'Coastal Glass',
      'hi': 'Coastal Glass',
      'tr': 'Coastal Glass',
      'ja': 'Coastal Glass',
      'ko': 'Coastal Glass',
      'zh': 'Coastal Glass',
    };

Map<String, String> _coastalMoodLabels() => {
      'de': 'Saubere Premium-Urlaubsenergie',
      'es': 'Energía vacacional premium y limpia',
      'fr': 'Énergie vacances premium et épurée',
      'it': 'Energia vacanza premium e pulita',
      'pt': 'Energia de férias premium e limpa',
      'ru': 'Чистая премиальная отпускная энергия',
      'hi': 'साफ प्रीमियम छुट्टी ऊर्जा',
      'tr': 'Temiz premium tatil enerjisi',
      'ja': 'クリーンでプレミアムなバケーション感',
      'ko': '깔끔한 프리미엄 휴양 에너지',
      'zh': '干净高级度假感',
    };

Map<String, String> _champagneLabels() => {
      'de': 'Champagne Luxe',
      'es': 'Champagne Luxe',
      'fr': 'Champagne Luxe',
      'it': 'Champagne Luxe',
      'pt': 'Champagne Luxe',
      'ru': 'Champagne Luxe',
      'hi': 'Champagne Luxe',
      'tr': 'Champagne Luxe',
      'ja': 'Champagne Luxe',
      'ko': 'Champagne Luxe',
      'zh': 'Champagne Luxe',
    };

Map<String, String> _champagneMoodLabels() => {
      'de': 'Private Concierge-Eleganz',
      'es': 'Elegancia de concierge privado',
      'fr': 'Élégance de concierge privé',
      'it': 'Eleganza concierge privato',
      'pt': 'Elegância de concierge privado',
      'ru': 'Элегантность частного консьержа',
      'hi': 'निजी कॉन्सierge की शान',
      'tr': 'Özel concierge zarafeti',
      'ja': 'プライベートコンシェルジュの優雅さ',
      'ko': '프라이빗 컨시어지 우아함',
      'zh': '私人礼宾优雅风',
    };

Map<String, String> _blackCardLabels() => {
      'de': 'Black Card',
      'es': 'Black Card',
      'fr': 'Black Card',
      'it': 'Black Card',
      'pt': 'Black Card',
      'ru': 'Black Card',
      'hi': 'Black Card',
      'tr': 'Black Card',
      'ja': 'Black Card',
      'ko': 'Black Card',
      'zh': 'Black Card',
    };

Map<String, String> _blackCardMoodLabels() => {
      'de': 'Prestige der Privatluftfahrt',
      'es': 'Prestigio de aviación privada',
      'fr': 'Prestige de l\'aviation privée',
      'it': 'Prestigio dell\'aviazione privata',
      'pt': 'Prestígio da aviação privada',
      'ru': 'Престиж частной авиации',
      'hi': 'प्राइवेट एविएशन प्रतिष्ठा',
      'tr': 'Özel havacılık prestiji',
      'ja': 'プライベート航空の威信',
      'ko': '프라이빗 항공의 위엄',
      'zh': '私人航空尊贵感',
    };
