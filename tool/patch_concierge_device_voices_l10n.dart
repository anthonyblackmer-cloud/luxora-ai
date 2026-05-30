// ignore_for_file: avoid_print
//
// Device voice picker strings for all locale ARBs.
// Run: dart run tool/patch_concierge_device_voices_l10n.dart && flutter gen-l10n

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
    'conciergeVoiceDeviceNote':
        'Download more voices in iPhone Settings → Accessibility → Spoken Content → Voices. Return here and tap Refresh.',
    'conciergeVoiceDeviceSection': 'Voices on this iPhone',
    'conciergeVoiceDeviceSectionHint':
        'Includes voices you downloaded — tap one to use it for Luxora.',
    'conciergeVoiceRefreshList': 'Refresh voice list',
    'conciergeVoiceShowAllLanguages': 'Show all languages',
    'conciergeVoiceOpenSettings': 'Open iPhone voice settings',
    'conciergeVoiceNoDeviceVoices':
        'No voices found — download packs in Settings, then refresh.',
    'conciergeVoicePresetSection': 'Quick personas',
  };

  return {
    'de': {
      ...en,
      'conciergeVoiceDeviceSection': 'Stimmen auf diesem iPhone',
      'conciergeVoiceRefreshList': 'Stimmenliste aktualisieren',
      'conciergeVoicePresetSection': 'Schnellauswahl',
    },
    'es': {
      ...en,
      'conciergeVoiceDeviceSection': 'Voces en este iPhone',
      'conciergeVoiceRefreshList': 'Actualizar lista de voces',
      'conciergeVoicePresetSection': 'Personas rápidas',
    },
    'fr': {
      ...en,
      'conciergeVoiceDeviceSection': 'Voix sur cet iPhone',
      'conciergeVoiceRefreshList': 'Actualiser la liste',
      'conciergeVoicePresetSection': 'Profils rapides',
    },
    'it': {
      ...en,
      'conciergeVoiceDeviceSection': 'Voci su questo iPhone',
      'conciergeVoiceRefreshList': 'Aggiorna elenco voci',
      'conciergeVoicePresetSection': 'Profili rapidi',
    },
    'pt': {
      ...en,
      'conciergeVoiceDeviceSection': 'Vozes neste iPhone',
      'conciergeVoiceRefreshList': 'Atualizar lista de vozes',
      'conciergeVoicePresetSection': 'Personas rápidas',
    },
    'ru': {
      ...en,
      'conciergeVoiceDeviceSection': 'Голоса на этом iPhone',
      'conciergeVoiceRefreshList': 'Обновить список',
      'conciergeVoicePresetSection': 'Быстрый выбор',
    },
    'hi': {...en, 'conciergeVoicePresetSection': 'Quick personas'},
    'tr': {...en, 'conciergeVoicePresetSection': 'Hızlı profiller'},
    'ja': {...en, 'conciergeVoicePresetSection': 'クイック選択'},
    'ko': {...en, 'conciergeVoicePresetSection': '빠른 선택'},
    'zh': {...en, 'conciergeVoicePresetSection': '快速人设'},
  };
}
