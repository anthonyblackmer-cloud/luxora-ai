// ignore_for_file: avoid_print
//
// Share card + day agenda title strings for all locale ARBs.
// Run: dart run tool/patch_share_cards_l10n.dart && flutter gen-l10n

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

Map<String, Map<String, dynamic>> _keys() => {
      'de': {
        'mapPlanDayTitle': 'Die Agenda für heute',
        'shareDayLegDrive': '{time} Fahrt · {miles} vom vorherigen Stopp',
        'conciergeVoiceSend': 'An Luxora senden',
        'conciergeVoiceProcessing': 'Wird an Luxora gesendet…',
      },
      'es': {
        'mapPlanDayTitle': 'La agenda de hoy',
        'shareDayLegDrive': '{time} en coche · {miles} desde la parada anterior',
        'conciergeVoiceSend': 'Enviar a Luxora',
        'conciergeVoiceProcessing': 'Enviando a Luxora…',
      },
      'fr': {
        'mapPlanDayTitle': "L'agenda du jour",
        'shareDayLegDrive': '{time} de route · {miles} depuis l’arrêt précédent',
        'conciergeVoiceSend': 'Envoyer à Luxora',
        'conciergeVoiceProcessing': 'Envoi à Luxora…',
      },
      'it': {
        'mapPlanDayTitle': "L'agenda di oggi",
        'shareDayLegDrive': '{time} di guida · {miles} dalla tappa precedente',
        'conciergeVoiceSend': 'Invia a Luxora',
        'conciergeVoiceProcessing': 'Invio a Luxora…',
      },
      'pt': {
        'mapPlanDayTitle': 'A agenda de hoje',
        'shareDayLegDrive': '{time} de viagem · {miles} da parada anterior',
        'conciergeVoiceSend': 'Enviar para Luxora',
        'conciergeVoiceProcessing': 'Enviando para Luxora…',
      },
      'ru': {
        'mapPlanDayTitle': 'План на сегодня',
        'shareDayLegDrive': '{time} в пути · {miles} от предыдущей остановки',
        'conciergeVoiceSend': 'Отправить Luxora',
        'conciergeVoiceProcessing': 'Отправка Luxora…',
      },
      'hi': {
        'mapPlanDayTitle': 'आज का एजेंडा',
        'shareDayLegDrive': 'पिछले स्टॉप से {miles} · {time} की ड्राइव',
        'conciergeVoiceSend': 'Luxora को भेजें',
        'conciergeVoiceProcessing': 'Luxora को भेजा जा रहा है…',
      },
      'tr': {
        'mapPlanDayTitle': 'Bugünün ajandası',
        'shareDayLegDrive': 'Önceki duraktan {miles} · {time} sürüş',
        'conciergeVoiceSend': 'Luxora\'ya gönder',
        'conciergeVoiceProcessing': 'Luxora\'ya gönderiliyor…',
      },
      'ja': {
        'mapPlanDayTitle': '今日の予定',
        'shareDayLegDrive': '前の停留所から {miles} · 車で {time}',
        'conciergeVoiceSend': 'Luxoraに送信',
        'conciergeVoiceProcessing': 'Luxoraに送信中…',
      },
      'ko': {
        'mapPlanDayTitle': '오늘의 일정',
        'shareDayLegDrive': '이전 정거장에서 {miles} · {time} 운전',
        'conciergeVoiceSend': 'Luxora에 보내기',
        'conciergeVoiceProcessing': 'Luxora에 보내는 중…',
      },
      'zh': {
        'mapPlanDayTitle': '今日行程',
        'shareDayLegDrive': '距上一站 {miles} · 驾车 {time}',
        'conciergeVoiceSend': '发送给 Luxora',
        'conciergeVoiceProcessing': '正在发送给 Luxora…',
      },
    };
