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
        'shareCardCta': 'Planen Sie mit Luxora',
        'shareCardDownloadHint': 'Kostenlos für iOS & Android · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\nGeplant mit Luxora AI — emotional intelligente Florida-Reise.\nApp holen: {url}',
        'conciergeVoiceSend': 'An Luxora senden',
        'conciergeVoiceProcessing': 'Wird an Luxora gesendet…',
      },
      'es': {
        'mapPlanDayTitle': 'La agenda de hoy',
        'shareDayLegDrive': '{time} en coche · {miles} desde la parada anterior',
        'shareCardCta': 'Planifica el tuyo en Luxora',
        'shareCardDownloadHint': 'Gratis en iOS y Android · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\nPlanificado con Luxora AI — viajes emocionalmente inteligentes en Florida.\nDescarga la app: {url}',
        'conciergeVoiceSend': 'Enviar a Luxora',
        'conciergeVoiceProcessing': 'Enviando a Luxora…',
      },
      'fr': {
        'mapPlanDayTitle': "L'agenda du jour",
        'shareDayLegDrive': '{time} de route · {miles} depuis l’arrêt précédent',
        'shareCardCta': 'Planifiez le vôtre avec Luxora',
        'shareCardDownloadHint': 'Gratuit sur iOS et Android · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\nPlanifié avec Luxora AI — voyage en Floride émotionnellement intelligent.\nTélécharger l’app : {url}',
        'conciergeVoiceSend': 'Envoyer à Luxora',
        'conciergeVoiceProcessing': 'Envoi à Luxora…',
      },
      'it': {
        'mapPlanDayTitle': "L'agenda di oggi",
        'shareDayLegDrive': '{time} di guida · {miles} dalla tappa precedente',
        'shareCardCta': 'Pianifica il tuo con Luxora',
        'shareCardDownloadHint': 'Gratis su iOS e Android · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\nPianificato con Luxora AI — viaggio in Florida emotivamente intelligente.\nScarica l’app: {url}',
        'conciergeVoiceSend': 'Invia a Luxora',
        'conciergeVoiceProcessing': 'Invio a Luxora…',
      },
      'pt': {
        'mapPlanDayTitle': 'A agenda de hoje',
        'shareDayLegDrive': '{time} de viagem · {miles} da parada anterior',
        'shareCardCta': 'Planeje o seu no Luxora',
        'shareCardDownloadHint': 'Grátis no iOS e Android · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\nPlanejado com Luxora AI — viagem emocionalmente inteligente na Flórida.\nBaixe o app: {url}',
        'conciergeVoiceSend': 'Enviar para Luxora',
        'conciergeVoiceProcessing': 'Enviando para Luxora…',
      },
      'ru': {
        'mapPlanDayTitle': 'План на сегодня',
        'shareDayLegDrive': '{time} в пути · {miles} от предыдущей остановки',
        'shareCardCta': 'Спланируйте с Luxora',
        'shareCardDownloadHint': 'Бесплатно на iOS и Android · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\nСпланировано с Luxora AI — эмоционально умное путешествие по Флориде.\nСкачать приложение: {url}',
        'conciergeVoiceSend': 'Отправить Luxora',
        'conciergeVoiceProcessing': 'Отправка Luxora…',
      },
      'hi': {
        'mapPlanDayTitle': 'आज का एजेंडा',
        'shareDayLegDrive': 'पिछले स्टॉप से {miles} · {time} की ड्राइव',
        'shareCardCta': 'Luxora में अपनी योजना बनाएं',
        'shareCardDownloadHint': 'iOS और Android पर मुफ़्त · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\nLuxora AI के साथ योजना — भावनात्मक रूप से बुद्धिमान Florida यात्रा।\nऐप प्राप्त करें: {url}',
        'conciergeVoiceSend': 'Luxora को भेजें',
        'conciergeVoiceProcessing': 'Luxora को भेजा जा रहा है…',
      },
      'tr': {
        'mapPlanDayTitle': 'Bugünün ajandası',
        'shareDayLegDrive': 'Önceki duraktan {miles} · {time} sürüş',
        'shareCardCta': 'Luxora ile planlayın',
        'shareCardDownloadHint': 'iOS ve Android’de ücretsiz · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\nLuxora AI ile planlandı — duygusal açıdan zeki Florida seyahati.\nUygulamayı edinin: {url}',
        'conciergeVoiceSend': 'Luxora\'ya gönder',
        'conciergeVoiceProcessing': 'Luxora\'ya gönderiliyor…',
      },
      'ja': {
        'mapPlanDayTitle': '今日の予定',
        'shareDayLegDrive': '前の停留所から {miles} · 車で {time}',
        'shareCardCta': 'Luxoraで計画する',
        'shareCardDownloadHint': 'iOSとAndroidで無料 · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\nLuxora AIで計画 — 感情知能フロリダ旅行。\nアプリを入手: {url}',
        'conciergeVoiceSend': 'Luxoraに送信',
        'conciergeVoiceProcessing': 'Luxoraに送信中…',
      },
      'ko': {
        'mapPlanDayTitle': '오늘의 일정',
        'shareDayLegDrive': '이전 정거장에서 {miles} · {time} 운전',
        'shareCardCta': 'Luxora에서 계획하기',
        'shareCardDownloadHint': 'iOS 및 Android 무료 · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\nLuxora AI로 계획 — 감성 지능 Florida 여행.\n앱 받기: {url}',
        'conciergeVoiceSend': 'Luxora에 보내기',
        'conciergeVoiceProcessing': 'Luxora에 보내는 중…',
      },
      'zh': {
        'mapPlanDayTitle': '今日行程',
        'shareDayLegDrive': '距上一站 {miles} · 驾车 {time}',
        'shareCardCta': '在 Luxora 规划您的行程',
        'shareCardDownloadHint': 'iOS 和 Android 免费 · luxora.ai/download',
        'shareCardShareMessage':
            '{title}\n\n由 Luxora AI 规划 — 情感智能佛罗里达之旅。\n获取应用: {url}',
        'conciergeVoiceSend': '发送给 Luxora',
        'conciergeVoiceProcessing': '正在发送给 Luxora…',
      },
    };
