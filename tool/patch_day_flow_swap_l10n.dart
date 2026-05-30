// ignore_for_file: avoid_print
//
// Day timeline swap sheet strings for all locale ARBs.
// Run: dart run tool/patch_day_flow_swap_l10n.dart && flutter gen-l10n

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
    'dayFlowSwapTitle': 'Change this stop',
    'dayFlowSwapSubtitle': "Tell Luxora what you'd rather do instead of {current}.",
    'dayFlowSwapTemplate': 'I was thinking something more like…',
    'dayFlowSwapHint': 'e.g. a quiet park this morning, or seafood for dinner',
    'dayFlowSwapApply': 'Update my day',
    'dayFlowSwapViewPlace': 'View current stop',
    'dayFlowSwapSuccess': 'Updated — {newStop} is now your {phase} stop.',
    'dayFlowSwapNoMatch':
        "Couldn't find a match nearby — try being more specific.",
    'dayFlowSwapTapToChange': 'Change this stop',
    'dayFlowSwapHoldSpeak': 'Hold to speak',
    'dayFlowSwapListening': 'Listening…',
  };

  return {
    'de': {
      ...en,
      'dayFlowSwapTitle': 'Stopp ändern',
      'dayFlowSwapSubtitle':
          'Sagen Sie Luxora, was Sie statt {current} lieber machen würden.',
      'dayFlowSwapTemplate': 'Ich dachte eher an etwas wie…',
      'dayFlowSwapApply': 'Tag aktualisieren',
      'dayFlowSwapViewPlace': 'Aktuellen Stopp ansehen',
      'dayFlowSwapHoldSpeak': 'Gedrückt halten zum Sprechen',
      'dayFlowSwapListening': 'Hört zu…',
    },
    'es': {
      ...en,
      'dayFlowSwapTitle': 'Cambiar esta parada',
      'dayFlowSwapSubtitle':
          'Dile a Luxora qué preferirías en lugar de {current}.',
      'dayFlowSwapTemplate': 'Estaba pensando en algo como…',
      'dayFlowSwapApply': 'Actualizar mi día',
      'dayFlowSwapViewPlace': 'Ver parada actual',
      'dayFlowSwapHoldSpeak': 'Mantén para hablar',
      'dayFlowSwapListening': 'Escuchando…',
    },
    'fr': {
      ...en,
      'dayFlowSwapTitle': 'Modifier cette étape',
      'dayFlowSwapSubtitle':
          'Dites à Luxora ce que vous préféreriez à la place de {current}.',
      'dayFlowSwapTemplate': "Je pensais plutôt à quelque chose comme…",
      'dayFlowSwapApply': 'Mettre à jour ma journée',
      'dayFlowSwapViewPlace': 'Voir l’étape actuelle',
      'dayFlowSwapHoldSpeak': 'Maintenir pour parler',
      'dayFlowSwapListening': 'Écoute…',
    },
    'it': {
      ...en,
      'dayFlowSwapTitle': 'Cambia questa tappa',
      'dayFlowSwapSubtitle':
          'Dì a Luxora cosa preferiresti al posto di {current}.',
      'dayFlowSwapTemplate': 'Stavo pensando a qualcosa tipo…',
      'dayFlowSwapApply': 'Aggiorna la mia giornata',
      'dayFlowSwapViewPlace': 'Vedi tappa attuale',
      'dayFlowSwapHoldSpeak': 'Tieni premuto per parlare',
      'dayFlowSwapListening': 'In ascolto…',
    },
    'pt': {
      ...en,
      'dayFlowSwapTitle': 'Mudar esta parada',
      'dayFlowSwapSubtitle':
          'Diga ao Luxora o que prefere em vez de {current}.',
      'dayFlowSwapTemplate': 'Estava pensando em algo como…',
      'dayFlowSwapApply': 'Atualizar meu dia',
      'dayFlowSwapViewPlace': 'Ver parada atual',
      'dayFlowSwapHoldSpeak': 'Segure para falar',
      'dayFlowSwapListening': 'Ouvindo…',
    },
    'ru': {
      ...en,
      'dayFlowSwapTitle': 'Изменить остановку',
      'dayFlowSwapSubtitle':
          'Скажите Luxora, что вы хотели бы вместо {current}.',
      'dayFlowSwapTemplate': 'Я думал скорее о чём-то вроде…',
      'dayFlowSwapApply': 'Обновить день',
      'dayFlowSwapViewPlace': 'Текущая остановка',
      'dayFlowSwapHoldSpeak': 'Удерживайте для речи',
      'dayFlowSwapListening': 'Слушаю…',
    },
    'hi': {
      ...en,
      'dayFlowSwapTitle': 'यह स्टॉप बदलें',
      'dayFlowSwapTemplate': 'मैं कुछ ऐसा सोच रहा था…',
      'dayFlowSwapApply': 'मेरा दिन अपडेट करें',
      'dayFlowSwapHoldSpeak': 'बोलने के लिए दबाए रखें',
      'dayFlowSwapListening': 'सुन रहा हूँ…',
    },
    'tr': {
      ...en,
      'dayFlowSwapTitle': 'Bu durağı değiştir',
      'dayFlowSwapTemplate': 'Daha çok şöyle bir şey düşünmüştüm…',
      'dayFlowSwapApply': 'Günümü güncelle',
      'dayFlowSwapHoldSpeak': 'Konuşmak için basılı tut',
      'dayFlowSwapListening': 'Dinliyor…',
    },
    'ja': {
      ...en,
      'dayFlowSwapTitle': 'この停留所を変更',
      'dayFlowSwapTemplate': 'もっとこんな感じを考えていました…',
      'dayFlowSwapApply': '今日の予定を更新',
      'dayFlowSwapHoldSpeak': '長押しで話す',
      'dayFlowSwapListening': '聞いています…',
    },
    'ko': {
      ...en,
      'dayFlowSwapTitle': '이 정거장 변경',
      'dayFlowSwapTemplate': '저는 이런 느낌을 생각했어요…',
      'dayFlowSwapApply': '오늘 일정 업데이트',
      'dayFlowSwapHoldSpeak': '길게 눌러 말하기',
      'dayFlowSwapListening': '듣는 중…',
    },
    'zh': {
      ...en,
      'dayFlowSwapTitle': '更改此站',
      'dayFlowSwapTemplate': '我在想更像这样的…',
      'dayFlowSwapApply': '更新我的行程',
      'dayFlowSwapHoldSpeak': '按住说话',
      'dayFlowSwapListening': '正在聆听…',
    },
  };
}
