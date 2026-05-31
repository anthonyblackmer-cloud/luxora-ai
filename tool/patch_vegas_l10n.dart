// ignore_for_file: avoid_print
//
// Las Vegas pack UI strings.
// Run: dart run tool/patch_vegas_l10n.dart && flutter gen-l10n

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
  required String bellagio,
  required String fremont,
  required String caesars,
  required String venetian,
}) =>
    {
      'vegasMoodRoutesTitle': moodRoutes,
      'localSecretVegasBellagioFountains': bellagio,
      'localSecretVegasFremontTiming': fremont,
      'localSecretVegasCaesarsEntrance': caesars,
      'localSecretVegasVenetianWalk': venetian,
    };

Map<String, dynamic> _de() => _shared(
      moodRoutes: 'Las-Vegas-Stimmungsrouten',
      bellagio:
          '15 Min. vor der Show mittig auf der Wiese stehen — vordere Geländer blockieren die Choreografie.',
      fremont:
          'Wochentags 21 Uhr unter der LED-Krone — volle Viva-Vision-Schleife ohne Samstagsandrang.',
      caesars:
          'Parkhaus-Verbindung nutzen — Strip-Gehwegsstau zur Hauptdinnerzeit vermeiden.',
      venetian:
          'Mittags im überdachten Kanalgang — klimatisierter Strip-Übergang ohne Hitze.',
    );

Map<String, dynamic> _es() => _shared(
      moodRoutes: 'Rutas de ambiente Las Vegas',
      bellagio:
          'Quédate en el césped central 15 min antes — la baranda delantera tapa la coreografía.',
      fremont:
          'Martes a jueves 21:00 bajo la cúpula — show Viva Vision completo sin multitudes del sábado.',
      caesars:
          'Usa el pasaje del garaje — evita el cuello de botella del Strip a la hora de cena.',
      venetian:
          'Paseo canal cubierto al mediodía — cruce del Strip con aire sin alerta de calor.',
    );

Map<String, dynamic> _fr() => _shared(
      moodRoutes: 'Parcours d\'ambiance Las Vegas',
      bellagio:
          'Placez-vous au centre de la pelouse 15 min avant — la rambarde bloque la chorégraphie.',
      fremont:
          'En semaine 21 h sous la canopée — boucle Viva Vision complète sans foule du samedi.',
      caesars:
          'Passerelle du parking — évitez l\'embouteillage du Strip à l\'heure du dîner.',
      venetian:
          'Promenade canal couverte à midi — traversez le Strip climatisé sans chaleur extrême.',
    );

Map<String, dynamic> _it() => _shared(
      moodRoutes: 'Percorsi mood Las Vegas',
      bellagio:
          'Centro del prato 15 min prima dello spettacolo — la ringhiera davanti blocca la coreografia.',
      fremont:
          'Feriale ore 21 sotto la canopy — loop Viva Vision completo senza folla del sabato.',
      caesars:
          'Usa il passaggio del parcheggio — evita il collo di bottiglia dello Strip a cena.',
      venetian:
          'Passeggiata sul canal coperto a mezzogiorno — attraversa lo Strip al fresco.',
    );

Map<String, dynamic> _pt() => _shared(
      moodRoutes: 'Rotas de ambiente Las Vegas',
      bellagio:
          'Fique no centro do relvado 15 min antes — a grade da frente bloqueia a coreografia.',
      fremont:
          'Noite de semana 21h sob a cúpula — loop Viva Vision completo sem multidão de sábado.',
      caesars:
          'Use a ligação da garagem — evite o congestionamento da Strip na hora do jantar.',
      venetian:
          'Passeio no canal coberto ao meio-dia — atravesse a Strip com ar condicionado.',
    );

Map<String, dynamic> _ru() => _shared(
      moodRoutes: 'Маршруты настроения Las Vegas',
      bellagio:
          'Встаньте в центре лужайки за 15 мин — переднее ограждение закрывает хореографию.',
      fremont:
          'Будний 21:00 под крышей — полный Viva Vision без субботней толпы.',
      caesars:
          'Переход из паркинга — обходите пробку Strip в час ужина.',
      venetian:
          'Крытый канал в полдень — кондиционированный переход без жары.',
    );

Map<String, dynamic> _hi() => _shared(
      moodRoutes: 'लास वेगास मूड रूट',
      bellagio:
          'शो से 15 मिनट पहले बीच वाली घास पर खड़े रहें — सामने की रेल नृत्य दृश्य रोकती है।',
      fremont:
          'कार्यदिवस रात 9 बजे canopy के नीचे — शनिवार भीड़ के बिना पूरा Viva Vision।',
      caesars:
          'पार्किंग गैरेज कनेक्टर — डिनर समय Strip भीड़ से बचें।',
      venetian: 'दोपहर में छत वाले नहर वॉक — AC के साथ Strip पार без गर्मी चेतावनी।',
    );

Map<String, dynamic> _tr() => _shared(
      moodRoutes: 'Las Vegas ruh hali rotaları',
      bellagio:
          'Gösteriden 15 dk önce çimenin ortasında durun — ön korkuluk koreografiyi keser.',
      fremont:
          'Hafta içi 21:00 tavan altında — cumartesi kalabalığı olmadan tam Viva Vision.',
      caesars:
          'Otopark bağlantısını kullanın — akşam yemeği saatinde Strip tıkanıklığından kaçının.',
      venetian:
          'Öğlen kapalı kanal yürüyüşü — klimalı Strip geçişi, sıcak uyarısı yok.',
    );

Map<String, dynamic> _ja() => _shared(
      moodRoutes: 'ラスベガス・ムードルート',
      bellagio: 'ショー15分前に芝生中央へ — 前の手すりは演出全体を遮ります。',
      fremont: '平日21時キャノピー下 — 土曜の混雑なしでViva Vision全編。',
      caesars: '駐車場連絡通路を利用 — ディナータイムのStrip混雑を回避。',
      venetian: '正午の屋内運河散策 — 冷房のStrip横断で猛暑回避。',
    );

Map<String, dynamic> _ko() => _shared(
      moodRoutes: '라스베이거스 무드 루트',
      bellagio: '쇼 15분 전 잔디 중앙 — 앞 난간은 안무 전체를 가립니다.',
      fremont: '평일 밤 9시 캐노피 아래 — 토요 혼잡 없이 Viva Vision 전체.',
      caesars: '주차장 연결 통로 — 저녁 시간 Strip 병목 회피.',
      venetian: '정오 실내 운하 산책 — 냉방 Strip 횡단으로 폭염 회피.',
    );

Map<String, dynamic> _zh() => _shared(
      moodRoutes: '拉斯维加斯心情路线',
      bellagio: '表演前15分钟站在草坪中央——前排栏杆会挡住完整水舞。',
      fremont: '工作日晚9点天幕下——完整Viva Vision无周六人潮。',
      caesars: '走停车场连廊——晚餐高峰避开Strip人行道拥堵。',
      venetian: '中午室内运河漫步——空调通道穿越Strip避开高温。',
    );
