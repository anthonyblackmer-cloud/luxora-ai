// ignore_for_file: avoid_print
//
// Family-aware Experience Feed strings for all locale ARBs.
// Run: dart run tool/patch_feed_family_l10n.dart && flutter gen-l10n

import 'dart:convert';
import 'dart:io';

void main() {
  const locales = ['de', 'es', 'fr', 'it', 'pt', 'ru', 'hi', 'tr', 'ja', 'ko', 'zh'];
  final keys = _keys();
  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map.addAll(keys[locale]!);
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, Map<String, dynamic>> _keys() {
  const en = {
    'feedSubtitleFamily':
        'Family-friendly picks for your crew — parks, easy wins, and moments that land with kids (and parents).',
    'feedMoodPromptFamily': 'HOW SHOULD TODAY FEEL FOR YOUR CREW?',
    'feedMoodFamily': 'Family magic',
    'feedFamilyMoodHint':
        'Theme parks, character meals, and easy parent wins — filtered for family tags.',
    'feedEmptyHintFamily':
        'No family-tagged cards in this radius — try Adventurous or Everything, or widen the radius.',
  };

  return {
    'de': {
      ...en,
      'feedSubtitleFamily':
          'Familienfreundliche Tipps — Parks, einfache Highlights und Momente für Kinder (und Eltern).',
      'feedMoodPromptFamily': 'WIE SOLL DER TAG FÜR EUCH SEIN?',
      'feedMoodFamily': 'Familienmagie',
      'feedFamilyMoodHint':
          'Freizeitparks, Character-Dining und entspannte Eltern-Momente.',
    },
    'es': {
      ...en,
      'feedSubtitleFamily':
          'Opciones para la familia — parques, planes fáciles y momentos que encantan a los niños.',
      'feedMoodPromptFamily': '¿CÓMO DEBERÍA SENTIRSE HOY PARA TU FAMILIA?',
      'feedMoodFamily': 'Magia familiar',
    },
    'fr': {
      ...en,
      'feedSubtitleFamily':
          'Idées famille — parcs, moments faciles et joie pour les enfants (et les parents).',
      'feedMoodPromptFamily': 'COMMENT LA JOURNÉE DOIT-ELLE SE SENTIR POUR VOTRE ÉQUIPE ?',
      'feedMoodFamily': 'Magie familiale',
    },
    'it': {
      ...en,
      'feedSubtitleFamily':
          'Scelte per famiglie — parchi, idee facili e momenti che piacciono ai bambini.',
      'feedMoodPromptFamily': 'COME DOVREBBE SENTIRSI OGGI PER LA VOSTRA CREW?',
      'feedMoodFamily': 'Magia in famiglia',
    },
    'pt': {
      ...en,
      'feedSubtitleFamily':
          'Dicas para famílias — parques, planos fáceis e momentos que encantam as crianças.',
      'feedMoodPromptFamily': 'COMO HOJE DEVE SER PARA A SUA FAMÍLIA?',
      'feedMoodFamily': 'Magia em família',
    },
    'ru': {
      ...en,
      'feedSubtitleFamily':
          'Семейные идеи — парки, простые планы и моменты для детей и родителей.',
      'feedMoodPromptFamily': 'КАК ДОЛЖЕН ПРОЙТИ ДЕНЬ ДЛЯ ВАШЕЙ СЕМЬИ?',
      'feedMoodFamily': 'Семейная магия',
    },
    'hi': {
      ...en,
      'feedMoodFamily': 'पारिवारिक जादू',
      'feedMoodPromptFamily': 'आज आपके परिवार के लिए दिन कैसा महसूस हो?',
    },
    'tr': {
      ...en,
      'feedMoodFamily': 'Aile sihri',
      'feedMoodPromptFamily': 'BUGÜN AİLENİZ İÇİN NASIL HİSSETMELİ?',
    },
    'ja': {
      ...en,
      'feedMoodFamily': 'ファミリーマジック',
      'feedMoodPromptFamily': '今日は家族みんなでどんな一日に？',
    },
    'ko': {
      ...en,
      'feedMoodFamily': '가족 매직',
      'feedMoodPromptFamily': '오늘 가족에게 어떤 하루가 어울릴까요?',
    },
    'zh': {
      ...en,
      'feedMoodFamily': '亲子魔法',
      'feedMoodPromptFamily': '今天家人想怎么过？',
    },
  };
}
