// ignore_for_file: avoid_print
//
// Adds live concierge AI strings to all locale ARBs.
// Run: dart run tool/patch_concierge_ai_l10n.dart

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

Map<String, Map<String, dynamic>> _translations() {
  return {
    'de': {
      'conciergeThinking': 'Luxora denkt nach…',
      'conciergeAiError':
          'Luxora ist gerade nicht erreichbar. Verbindung prüfen und erneut versuchen.',
      'conciergeAiNotConfigured':
          'Live-Concierge benötigt Supabase + OpenAI. SUPABASE_URL und SUPABASE_ANON_KEY in die lokale Config eintragen und die Edge Function concierge-chat deployen — siehe docs/CONCIERGE_AI.md.',
    },
    'es': {
      'conciergeThinking': 'Luxora está pensando…',
      'conciergeAiError':
          'No pude contactar a Luxora. Comprueba tu conexión e inténtalo de nuevo.',
      'conciergeAiNotConfigured':
          'El concierge en vivo requiere Supabase + OpenAI. Añade SUPABASE_URL y SUPABASE_ANON_KEY a tu config local y despliega la función concierge-chat — ver docs/CONCIERGE_AI.md.',
    },
    'fr': {
      'conciergeThinking': 'Luxora réfléchit…',
      'conciergeAiError':
          'Impossible de joindre Luxora. Vérifiez votre connexion et réessayez.',
      'conciergeAiNotConfigured':
          'Le concierge en direct nécessite Supabase + OpenAI. Ajoutez SUPABASE_URL et SUPABASE_ANON_KEY à votre config locale et déployez la fonction concierge-chat — voir docs/CONCIERGE_AI.md.',
    },
    'it': {
      'conciergeThinking': 'Luxora sta pensando…',
      'conciergeAiError':
          'Non riesco a raggiungere Luxora. Controlla la connessione e riprova.',
      'conciergeAiNotConfigured':
          'Il concierge live richiede Supabase + OpenAI. Aggiungi SUPABASE_URL e SUPABASE_ANON_KEY alla config locale e distribuisci la edge function concierge-chat — vedi docs/CONCIERGE_AI.md.',
    },
    'pt': {
      'conciergeThinking': 'Luxora está pensando…',
      'conciergeAiError':
          'Não consegui contactar a Luxora. Verifique a ligação e tente novamente.',
      'conciergeAiNotConfigured':
          'O concierge ao vivo requer Supabase + OpenAI. Adicione SUPABASE_URL e SUPABASE_ANON_KEY à config local e implemente a função concierge-chat — ver docs/CONCIERGE_AI.md.',
    },
    'ru': {
      'conciergeThinking': 'Luxora думает…',
      'conciergeAiError':
          'Не удалось связаться с Luxora. Проверьте подключение и попробуйте снова.',
      'conciergeAiNotConfigured':
          'Живой консьерж требует Supabase + OpenAI. Добавьте SUPABASE_URL и SUPABASE_ANON_KEY в локальную конфигурацию и разверните edge function concierge-chat — см. docs/CONCIERGE_AI.md.',
    },
    'hi': {
      'conciergeThinking': 'Luxora सोच रहा है…',
      'conciergeAiError':
          'Luxora तक नहीं पहुँच सका। कनेक्शन जाँचें और फिर कोशिश करें।',
      'conciergeAiNotConfigured':
          'लाइव concierge के लिए Supabase + OpenAI चाहिए। SUPABASE_URL और SUPABASE_ANON_KEY स्थानीय config में जोड़ें और concierge-chat edge function deploy करें — docs/CONCIERGE_AI.md देखें।',
    },
    'tr': {
      'conciergeThinking': 'Luxora düşünüyor…',
      'conciergeAiError':
          'Luxora\'ya ulaşılamadı. Bağlantınızı kontrol edip tekrar deneyin.',
      'conciergeAiNotConfigured':
          'Canlı concierge için Supabase + OpenAI gerekir. SUPABASE_URL ve SUPABASE_ANON_KEY\'i yerel config\'e ekleyin ve concierge-chat edge function\'ını deploy edin — docs/CONCIERGE_AI.md.',
    },
    'ja': {
      'conciergeThinking': 'Luxoraが考えています…',
      'conciergeAiError':
          'Luxoraに接続できませんでした。接続を確認してもう一度お試しください。',
      'conciergeAiNotConfigured':
          'ライブコンシェルジュにはSupabase + OpenAIが必要です。SUPABASE_URLとSUPABASE_ANON_KEYをローカルconfigに追加し、concierge-chat edge functionをデプロイしてください — docs/CONCIERGE_AI.md。',
    },
    'ko': {
      'conciergeThinking': 'Luxora가 생각 중…',
      'conciergeAiError':
          'Luxora에 연결할 수 없습니다. 연결을 확인하고 다시 시도하세요.',
      'conciergeAiNotConfigured':
          '라이브 컨시어지는 Supabase + OpenAI가 필요합니다. SUPABASE_URL과 SUPABASE_ANON_KEY를 로컬 config에 추가하고 concierge-chat edge function을 배포하세요 — docs/CONCIERGE_AI.md.',
    },
    'zh': {
      'conciergeThinking': 'Luxora 正在思考…',
      'conciergeAiError': '无法连接 Luxora。请检查网络后重试。',
      'conciergeAiNotConfigured':
          '实时礼宾需要 Supabase + OpenAI。请在本地 config 中添加 SUPABASE_URL 和 SUPABASE_ANON_KEY，并部署 concierge-chat edge function — 见 docs/CONCIERGE_AI.md。',
    },
  };
}
