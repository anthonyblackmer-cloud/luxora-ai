// ignore_for_file: avoid_print
//
// Radar timeline + share map caption strings for all locale ARBs.
// Run: dart run tool/patch_radar_share_l10n.dart && flutter gen-l10n

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
  const radar = {
    'weatherRadarNow': 'Now',
    'weatherRadarMinutesAgo': '{minutes} min ago',
    'weatherRadarMinutesAhead': '+{minutes} min',
    'weatherRadarStepBack': 'Earlier frame',
    'weatherRadarStepForward': 'Later frame',
    'weatherRadarJumpNow': 'Now',
    'weatherRadarJump1h': '−1 hr',
    'weatherRadarJump2h': '−2 hr',
    'weatherRadarJump30m': '+30 min',
    'weatherRadarSpeedSlow': 'Slow',
    'weatherRadarSpeedNormal': 'Normal',
    'weatherRadarSpeedFast': 'Fast',
    'weatherRadarLoopNote':
        'Radar loop: past ~2 hours in 10‑minute steps, plus short-range nowcast when available — not a 4‑hour forecast.',
    'shareMapPreviewCaption':
        'Map preview · open in Luxora for live directions',
  };

  return {
    'de': {
      ...radar,
      'weatherRadarNow': 'Jetzt',
      'weatherRadarMinutesAgo': 'vor {minutes} Min.',
      'weatherRadarMinutesAhead': '+{minutes} Min.',
      'weatherRadarStepBack': 'Früher',
      'weatherRadarStepForward': 'Später',
      'weatherRadarJumpNow': 'Jetzt',
      'weatherRadarJump1h': '−1 Std.',
      'weatherRadarJump2h': '−2 Std.',
      'weatherRadarJump30m': '+30 Min.',
      'weatherRadarSpeedSlow': 'Langsam',
      'weatherRadarSpeedNormal': 'Normal',
      'weatherRadarSpeedFast': 'Schnell',
      'shareMapPreviewCaption':
          'Kartenvorschau · in Luxora für Live-Navigation öffnen',
    },
    'es': {
      ...radar,
      'weatherRadarNow': 'Ahora',
      'weatherRadarMinutesAgo': 'hace {minutes} min',
      'weatherRadarMinutesAhead': '+{minutes} min',
      'weatherRadarStepBack': 'Anterior',
      'weatherRadarStepForward': 'Siguiente',
      'shareMapPreviewCaption':
          'Vista del mapa · abrir en Luxora para direcciones en vivo',
    },
    'fr': {
      ...radar,
      'weatherRadarNow': 'Maintenant',
      'weatherRadarMinutesAgo': 'il y a {minutes} min',
      'weatherRadarMinutesAhead': '+{minutes} min',
      'weatherRadarStepBack': 'Plus tôt',
      'weatherRadarStepForward': 'Plus tard',
      'shareMapPreviewCaption':
          'Aperçu carte · ouvrir dans Luxora pour l’itinéraire en direct',
    },
    'it': {
      ...radar,
      'weatherRadarNow': 'Adesso',
      'weatherRadarMinutesAgo': '{minutes} min fa',
      'weatherRadarMinutesAhead': '+{minutes} min',
      'shareMapPreviewCaption':
          'Anteprima mappa · apri in Luxora per indicazioni live',
    },
    'pt': {
      ...radar,
      'weatherRadarNow': 'Agora',
      'weatherRadarMinutesAgo': 'há {minutes} min',
      'weatherRadarMinutesAhead': '+{minutes} min',
      'shareMapPreviewCaption':
          'Prévia do mapa · abrir no Luxora para rotas ao vivo',
    },
    'ru': {
      ...radar,
      'weatherRadarNow': 'Сейчас',
      'weatherRadarMinutesAgo': '{minutes} мин назад',
      'weatherRadarMinutesAhead': '+{minutes} мин',
      'shareMapPreviewCaption':
          'Превью карты · откройте в Luxora для маршрута',
    },
    'hi': {
      ...radar,
      'weatherRadarNow': 'अभी',
      'weatherRadarMinutesAgo': '{minutes} मिनट पहले',
      'weatherRadarMinutesAhead': '+{minutes} मिनट',
      'shareMapPreviewCaption':
          'मानचित्र पूर्वावलोकन · लाइव दिशाओं के लिए Luxora में खोलें',
    },
    'tr': {
      ...radar,
      'weatherRadarNow': 'Şimdi',
      'weatherRadarMinutesAgo': '{minutes} dk önce',
      'weatherRadarMinutesAhead': '+{minutes} dk',
      'shareMapPreviewCaption':
          'Harita önizlemesi · canlı yol tarifi için Luxora’da aç',
    },
    'ja': {
      ...radar,
      'weatherRadarNow': '現在',
      'weatherRadarMinutesAgo': '{minutes}分前',
      'weatherRadarMinutesAhead': '+{minutes}分',
      'shareMapPreviewCaption':
          '地図プレビュー · ライブ案内はLuxoraで開く',
    },
    'ko': {
      ...radar,
      'weatherRadarNow': '지금',
      'weatherRadarMinutesAgo': '{minutes}분 전',
      'weatherRadarMinutesAhead': '+{minutes}분',
      'shareMapPreviewCaption':
          '지도 미리보기 · Luxora에서 실시간 길 안내',
    },
    'zh': {
      ...radar,
      'weatherRadarNow': '现在',
      'weatherRadarMinutesAgo': '{minutes} 分钟前',
      'weatherRadarMinutesAhead': '+{minutes} 分钟',
      'shareMapPreviewCaption':
          '地图预览 · 在 Luxora 中打开以获取实时路线',
    },
  };
}
