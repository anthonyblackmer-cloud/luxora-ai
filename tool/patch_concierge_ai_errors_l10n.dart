// ignore_for_file: avoid_print
//
// Concierge AI user-facing error strings for all locale ARBs.
// Run: dart run tool/patch_concierge_ai_errors_l10n.dart && flutter gen-l10n

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
    'conciergeAiErrorVoice':
        "Sorry — I couldn't connect to Luxora's concierge just now.",
    'conciergeAiNotConfigured':
        "Luxora's live concierge isn't wired up on this build yet — Supabase URL and anon key need to be baked into the app, and the edge function deployed. Map and itinerary still work; see docs/CONCIERGE_AI.md for setup.",
    'conciergeAiOpenAiNotReady':
        "Luxora heard you, but the concierge brain isn't online yet. Set OPENAI_API_KEY in Supabase secrets for the edge function (bright-processor), then try again.",
    'conciergeAiFunctionNotFound':
        'Luxora couldn\'t find the concierge edge function "{function}". Deploy it in Supabase or fix SUPABASE_CONCIERGE_FUNCTION on this build.',
    'conciergeAiAuthFailed':
        "Luxora couldn't authenticate with Supabase — double-check SUPABASE_ANON_KEY matches your project.",
  };

  return {
    'de': {
      ...en,
      'conciergeAiErrorVoice':
          'Entschuldigung — ich konnte gerade nicht mit Luxoras Concierge verbinden.',
    },
    'es': {
      ...en,
      'conciergeAiErrorVoice':
          'Lo siento — no pude conectar con el concierge de Luxora ahora.',
    },
    'fr': {
      ...en,
      'conciergeAiErrorVoice':
          'Désolé — je n\'ai pas pu joindre le concierge Luxora pour le moment.',
    },
    'it': {...en},
    'pt': {...en},
    'ru': {...en},
    'hi': {...en},
    'tr': {...en},
    'ja': {...en},
    'ko': {...en},
    'zh': {...en},
  };
}
