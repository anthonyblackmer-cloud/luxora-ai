// ignore_for_file: avoid_print
//
// Returning-traveler onboarding strings.
// Run: dart run tool/patch_returning_onboarding_l10n.dart && flutter gen-l10n

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
  required String eyebrow,
  required String title,
  required String titleGeneric,
  required String subtitle,
}) =>
    {
      'onboardReturningEyebrow': eyebrow,
      'onboardReturningTitle': title,
      '@onboardReturningTitle': {
        'placeholders': {
          'name': {'type': 'String'},
        },
      },
      'onboardReturningTitleGeneric': titleGeneric,
      'onboardReturningSubtitle': subtitle,
    };

Map<String, dynamic> _de() => _shared(
      eyebrow: 'WILLKOMMEN ZURÜCK',
      title: 'Willkommen zurück, {name}.',
      titleGeneric: 'Willkommen zurück.',
      subtitle:
          'Welche Reise soll ich heute für dich planen? Wähle ein Reiseziel.',
    );

Map<String, dynamic> _es() => _shared(
      eyebrow: 'BIENVENIDO DE NUEVO',
      title: 'Bienvenido de nuevo, {name}.',
      titleGeneric: 'Bienvenido de nuevo.',
      subtitle:
          '¿Qué viaje quieres que planee hoy? Elige un destino para empezar.',
    );

Map<String, dynamic> _fr() => _shared(
      eyebrow: 'BON RETOUR',
      title: 'Bon retour, {name}.',
      titleGeneric: 'Bon retour.',
      subtitle:
          'Quel voyage souhaitez-vous que je prépare aujourd\'hui ? Choisissez une destination.',
    );

Map<String, dynamic> _it() => _shared(
      eyebrow: 'BENTORNATO',
      title: 'Bentornato, {name}.',
      titleGeneric: 'Bentornato.',
      subtitle:
          'Quale viaggio vuoi che prepari oggi? Scegli una destinazione per iniziare.',
    );

Map<String, dynamic> _pt() => _shared(
      eyebrow: 'BEM-VINDO DE VOLTA',
      title: 'Bem-vindo de volta, {name}.',
      titleGeneric: 'Bem-vindo de volta.',
      subtitle:
          'Que viagem devo planear hoje? Escolha um destino para começar.',
    );

Map<String, dynamic> _ru() => _shared(
      eyebrow: 'С ВОЗВРАЩЕНИЕМ',
      title: 'С возвращением, {name}.',
      titleGeneric: 'С возвращением.',
      subtitle:
          'Какую поездку спланировать сегодня? Выберите направление, чтобы начать.',
    );

Map<String, dynamic> _hi() => _shared(
      eyebrow: 'वापसी पर स्वागत',
      title: 'वापसी पर स्वागत है, {name}।',
      titleGeneric: 'वापसी पर स्वागत है।',
      subtitle:
          'आज मैं आपके लिए कौन सी यात्रा बनाऊँ? शुरू करने के लिए गंतव्य चुनें।',
    );

Map<String, dynamic> _tr() => _shared(
      eyebrow: 'TEKRAR HOŞ GELDİN',
      title: 'Tekrar hoş geldin, {name}.',
      titleGeneric: 'Tekrar hoş geldin.',
      subtitle:
          'Bugün senin için hangi geziyi planlayayım? Başlamak için bir destinasyon seç.',
    );

Map<String, dynamic> _ja() => _shared(
      eyebrow: 'おかえりなさい',
      title: 'おかえりなさい、{name}さん。',
      titleGeneric: 'おかえりなさい。',
      subtitle: '今日はどんな旅を組み立てましょうか？目的地を選んで始めてください。',
    );

Map<String, dynamic> _ko() => _shared(
      eyebrow: '다시 오신 것을 환영합니다',
      title: '다시 오신 것을 환영합니다, {name}님.',
      titleGeneric: '다시 오신 것을 환영합니다.',
      subtitle: '오늘 어떤 여행을 만들어 드릴까요? 목적지를 선택해 시작하세요.',
    );

Map<String, dynamic> _zh() => _shared(
      eyebrow: '欢迎回来',
      title: '欢迎回来，{name}。',
      titleGeneric: '欢迎回来。',
      subtitle: '今天想让我为你规划哪趟旅行？选择一个目的地开始。',
    );
