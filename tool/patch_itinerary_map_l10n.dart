// ignore_for_file: avoid_print
//
// Map tab itinerary chip label.
// Run: dart run tool/patch_itinerary_map_l10n.dart && flutter gen-l10n

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

  const removeKeys = [
    'itineraryDayMapTitle',
    'itineraryDayMapHint',
    'itineraryDayMapOpenMap',
  ];

  final itinerary = _itineraryLabels();
  final expand = _expandLabels();
  final fullscreen = _fullscreenLabels();
  final close = _closeLabels();
  final dayLabel = _dayLabelStrings();
  final currentDay = _currentDayLabels();
  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    for (final key in removeKeys) {
      map.remove(key);
    }
    map['mapLayerItinerary'] = itinerary[locale]!;
    map['mapExpandMap'] = expand[locale]!;
    map['mapFullscreenTitle'] = fullscreen[locale]!;
    map['mapCloseFullscreen'] = close[locale]!;
    map['mapItineraryDayLabel'] = dayLabel[locale]!;
    map['mapItineraryCurrentDay'] = currentDay[locale]!;
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, String> _itineraryLabels() => {
      'de': 'Reiseplan',
      'es': 'Itinerario',
      'fr': 'Itinéraire',
      'it': 'Itinerario',
      'pt': 'Roteiro',
      'ru': 'Маршрут',
      'hi': 'यात्रा कार्यक्रम',
      'tr': 'Program',
      'ja': '旅程',
      'ko': '일정',
      'zh': '行程',
    };

Map<String, String> _expandLabels() => {
      'de': 'Karte vergrößern',
      'es': 'Ampliar mapa',
      'fr': 'Agrandir la carte',
      'it': 'Espandi mappa',
      'pt': 'Expandir mapa',
      'ru': 'Развернуть карту',
      'hi': 'मानचित्र बड़ा करें',
      'tr': 'Haritayı genişlet',
      'ja': '地図を拡大',
      'ko': '지도 확대',
      'zh': '展开地图',
    };

Map<String, String> _fullscreenLabels() => {
      'de': 'Karte',
      'es': 'Mapa',
      'fr': 'Carte',
      'it': 'Mappa',
      'pt': 'Mapa',
      'ru': 'Карта',
      'hi': 'मानचित्र',
      'tr': 'Harita',
      'ja': '地図',
      'ko': '지도',
      'zh': '地图',
    };

Map<String, String> _closeLabels() => {
      'de': 'Karte schließen',
      'es': 'Cerrar mapa',
      'fr': 'Fermer la carte',
      'it': 'Chiudi mappa',
      'pt': 'Fechar mapa',
      'ru': 'Закрыть карту',
      'hi': 'मानचित्र बंद करें',
      'tr': 'Haritayı kapat',
      'ja': '地図を閉じる',
      'ko': '지도 닫기',
      'zh': '关闭地图',
    };

Map<String, String> _dayLabelStrings() => {
      'de': 'Reiseplan anzeigen für',
      'es': 'Mostrar itinerario para',
      'fr': 'Afficher l\'itinéraire pour',
      'it': 'Mostra itinerario per',
      'pt': 'Mostrar roteiro para',
      'ru': 'Показать маршрут для',
      'hi': 'इस दिन का कार्यक्रम दिखाएँ',
      'tr': 'Programı göster',
      'ja': '旅程を表示',
      'ko': '일정 표시',
      'zh': '显示行程',
    };

Map<String, String> _currentDayLabels() => {
      'de': 'Aktueller Tag',
      'es': 'Día actual',
      'fr': 'Jour actuel',
      'it': 'Giorno attuale',
      'pt': 'Dia atual',
      'ru': 'Текущий день',
      'hi': 'वर्तमान दिन',
      'tr': 'Bugün',
      'ja': '今日',
      'ko': '오늘',
      'zh': '当前日',
    };
