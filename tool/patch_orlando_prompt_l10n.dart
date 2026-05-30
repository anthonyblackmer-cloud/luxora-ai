// ignore_for_file: avoid_print
//
// Adds Orlando theme-park prompt strings to all locale ARBs.
// Run: dart run tool/patch_orlando_prompt_l10n.dart

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
  Map<String, dynamic> pack({
    required String title,
    required String body,
    required String unlock,
    required String notNow,
  }) =>
      {
        'orlandoThemeParksPromptTitle': title,
        'orlandoThemeParksPromptBody': body,
        'orlandoThemeParksPromptUnlock': unlock,
        '@orlandoThemeParksPromptUnlock': {
          'placeholders': {
            'price': {'type': 'String'},
          },
        },
        'orlandoThemeParksPromptNotNow': notNow,
      };

  return {
    'de': pack(
      title: 'Disney & Universal für Orlando freischalten?',
      body:
          'Füge das Themenpark-Paket für Walt Disney World und Universal Orlando hinzu — alle Parks, Ticket-Deals, Routen und Crowd-Intel in einem Freischalten.',
      unlock: 'Freischalten · {price}',
      notNow: 'Nicht jetzt',
    ),
    'es': pack(
      title: '¿Desbloquear Disney y Universal para Orlando?',
      body:
          'Añade el pack de parques para Walt Disney World y Universal Orlando — todos los parques, ofertas de entradas, rutas e inteligencia de multitudes en un desbloqueo.',
      unlock: 'Desbloquear · {price}',
      notNow: 'Ahora no',
    ),
    'fr': pack(
      title: 'Débloquer Disney et Universal pour Orlando ?',
      body:
          'Ajoutez le pack parcs pour Walt Disney World et Universal Orlando — tous les parcs, offres de billets, itinéraires et intel foule en un déverrouillage.',
      unlock: 'Débloquer · {price}',
      notNow: 'Pas maintenant',
    ),
    'it': pack(
      title: 'Sbloccare Disney e Universal per Orlando?',
      body:
          'Aggiungi il pack parchi per Walt Disney World e Universal Orlando — tutti i parchi, offerte biglietti, percorsi e intel affollamento in uno sblocco.',
      unlock: 'Sblocca · {price}',
      notNow: 'Non ora',
    ),
    'pt': pack(
      title: 'Desbloquear Disney e Universal para Orlando?',
      body:
          'Adicione o pack de parques para Walt Disney World e Universal Orlando — todos os parques, ofertas de ingressos, rotas e intel de multidões em um desbloqueio.',
      unlock: 'Desbloquear · {price}',
      notNow: 'Agora não',
    ),
    'ru': pack(
      title: 'Разблокировать Disney и Universal для Орlando?',
      body:
          'Добавьте пакет парков для Walt Disney World и Universal Orlando — все парки, билетные предложения, маршруты и intel по толпам в одной разблокировке.',
      unlock: 'Разблокировать · {price}',
      notNow: 'Не сейчас',
    ),
    'hi': pack(
      title: 'Orlando के लिए Disney और Universal अनलॉक करें?',
      body:
          'Walt Disney World और Universal Orlando के लिए थीम पार्क पैक जोड़ें — सभी पार्क, टिकट डील, रूट और भीड़ intel एक अनलॉक में।',
      unlock: 'अनलॉक · {price}',
      notNow: 'अभी नहीं',
    ),
    'tr': pack(
      title: 'Orlando için Disney ve Universal kilidini aç?',
      body:
          'Walt Disney World ve Universal Orlando için tema parkı paketini ekleyin — tüm parklar, bilet fırsatları, rotalar ve kalabalık intel tek kilitlemede.',
      unlock: 'Kilidi aç · {price}',
      notNow: 'Şimdi değil',
    ),
    'ja': pack(
      title: 'Orlando向けにDisney & Universalを解除しますか？',
      body:
          'Walt Disney WorldとUniversal Orlando向けのテーマパークパックを追加 — 全パーク、チケットディール、ルート、混雑intelを1回の解除で。',
      unlock: '解除 · {price}',
      notNow: '後で',
    ),
    'ko': pack(
      title: 'Orlando용 Disney & Universal을 잠금 해제할까요?',
      body:
          'Walt Disney World와 Universal Orlando를 위한 테마파크 팩 추가 — 모든 파크, 티켓 딜, 루트, 혼잡 intel을 한 번에.',
      unlock: '잠금 해제 · {price}',
      notNow: '나중에',
    ),
    'zh': pack(
      title: '为奥兰多解锁迪士尼和环球影城？',
      body:
          '添加 Walt Disney World 和 Universal Orlando 主题公园套餐 — 所有园区、门票优惠、路线和人流情报一次解锁。',
      unlock: '解锁 · {price}',
      notNow: '以后再说',
    ),
  };
}
