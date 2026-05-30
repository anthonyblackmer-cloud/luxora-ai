// ignore_for_file: avoid_print
//
// Updates Orlando theme-park paywall l10n keys in all locale ARBs.
// Run: dart run tool/patch_orlando_addon_l10n.dart

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
    map.remove('paywallAddonDisneyTitle');
    map.remove('paywallAddonDisneySubtitle');
    map.remove('paywallAddonUniversalTitle');
    map.remove('paywallAddonUniversalSubtitle');
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, Map<String, dynamic>> _translations() {
  Map<String, dynamic> pack({
    required String onboardCityUnlockNote,
    required String paywallOrlandoAddonsHeading,
    required String paywallOrlandoBaseIncludes,
    required String paywallAddonThemeParksTitle,
    required String paywallAddonThemeParksSubtitle,
    required String paywallUnlockAddon,
    required String paywallAddonUnlocked,
    required String paywallAddonRequiresOrlando,
    required String paywallUnlockAddonPack,
    required String paywallCtaUnlockAddon,
    required String cityPickerThemeParksSubtitle,
  }) =>
      {
        'onboardCityUnlockNote': onboardCityUnlockNote,
        'paywallOrlandoAddonsHeading': paywallOrlandoAddonsHeading,
        'paywallOrlandoBaseIncludes': paywallOrlandoBaseIncludes,
        'paywallAddonThemeParksTitle': paywallAddonThemeParksTitle,
        'paywallAddonThemeParksSubtitle': paywallAddonThemeParksSubtitle,
        'paywallUnlockAddon': paywallUnlockAddon,
        '@paywallUnlockAddon': {
          'placeholders': {
            'packName': {'type': 'String'},
            'price': {'type': 'String'},
          },
        },
        'paywallAddonUnlocked': paywallAddonUnlocked,
        'paywallAddonRequiresOrlando': paywallAddonRequiresOrlando,
        'paywallUnlockAddonPack': paywallUnlockAddonPack,
        '@paywallUnlockAddonPack': {
          'placeholders': {
            'packName': {'type': 'String'},
          },
        },
        'paywallCtaUnlockAddon': paywallCtaUnlockAddon,
        '@paywallCtaUnlockAddon': {
          'placeholders': {
            'packName': {'type': 'String'},
          },
        },
        'cityPickerThemeParksSubtitle': cityPickerThemeParksSubtitle,
      };

  return {
    'de': pack(
      onboardCityUnlockNote:
          'Jedes Reiseziel hat sein eigenes Concierge-Freischalten — einmaliger Kauf pro Stadt. Orlando-Themenparks sind ein Paket (Disney & Universal zusammen).',
      paywallOrlandoAddonsHeading: 'Themenpark-Paket',
      paywallOrlandoBaseIncludes:
          'Orlando umfasst Restaurants, Geheimtipps, Hotels und Erlebnisse außerhalb der Parks. Themenpark-Paket für Disney und Universal zusammen.',
      paywallAddonThemeParksTitle: 'Disney & Universal Paket',
      paywallAddonThemeParksSubtitle:
          'Walt Disney World und Universal Orlando — alle Parks, Deals, Routen und Crowd-Intel in einem Freischalten.',
      paywallUnlockAddon: '{packName} freischalten · {price}',
      paywallAddonUnlocked: 'Freigeschaltet',
      paywallAddonRequiresOrlando: 'Erfordert zuerst Orlando-Freischaltung',
      paywallUnlockAddonPack: '{packName} freischalten',
      paywallCtaUnlockAddon: '{packName} freischalten',
      cityPickerThemeParksSubtitle:
          'Orlando-Add-on · Disney & Universal zusammen',
    ),
    'es': pack(
      onboardCityUnlockNote:
          'Cada destino tiene su propio desbloqueo de concierge — compra única por ciudad. Los parques de Orlando son un pack (Disney y Universal juntos).',
      paywallOrlandoAddonsHeading: 'Pack de parques temáticos',
      paywallOrlandoBaseIncludes:
          'Orlando incluye gastronomía, joyas ocultas, hoteles y experiencias fuera de parques. Añade el pack de parques para Disney y Universal juntos.',
      paywallAddonThemeParksTitle: 'Pack Disney y Universal',
      paywallAddonThemeParksSubtitle:
          'Walt Disney World y Universal Orlando — todos los parques, ofertas, rutas e inteligencia de multitudes en un desbloqueo.',
      paywallUnlockAddon: 'Desbloquear {packName} · {price}',
      paywallAddonUnlocked: 'Desbloqueado',
      paywallAddonRequiresOrlando: 'Requiere desbloquear Orlando primero',
      paywallUnlockAddonPack: 'Desbloquear {packName}',
      paywallCtaUnlockAddon: 'Desbloquear {packName}',
      cityPickerThemeParksSubtitle:
          'Complemento Orlando · Disney y Universal juntos',
    ),
    'fr': pack(
      onboardCityUnlockNote:
          'Chaque destination a son propre déverrouillage concierge — achat unique par ville. Les parcs d\'Orlando sont un pack (Disney et Universal ensemble).',
      paywallOrlandoAddonsHeading: 'Pack parcs à thème',
      paywallOrlandoBaseIncludes:
          'Orlando inclut restaurants, pépites cachées, hôtels et expériences hors parcs. Ajoutez le pack parcs pour Disney et Universal ensemble.',
      paywallAddonThemeParksTitle: 'Pack Disney et Universal',
      paywallAddonThemeParksSubtitle:
          'Walt Disney World et Universal Orlando — tous les parcs, offres, itinéraires et intel foule en un déverrouillage.',
      paywallUnlockAddon: 'Débloquer {packName} · {price}',
      paywallAddonUnlocked: 'Débloqué',
      paywallAddonRequiresOrlando: 'Nécessite d\'abord le déverrouillage Orlando',
      paywallUnlockAddonPack: 'Débloquer {packName}',
      paywallCtaUnlockAddon: 'Débloquer {packName}',
      cityPickerThemeParksSubtitle:
          'Add-on Orlando · Disney et Universal ensemble',
    ),
    'it': pack(
      onboardCityUnlockNote:
          'Ogni destinazione ha il proprio sblocco concierge — acquisto una tantum per città. I parchi di Orlando sono un pack (Disney e Universal insieme).',
      paywallOrlandoAddonsHeading: 'Pack parchi a tema',
      paywallOrlandoBaseIncludes:
          'Orlando include ristoranti, gemme nascoste, hotel ed esperienze fuori parco. Aggiungi il pack parchi per Disney e Universal insieme.',
      paywallAddonThemeParksTitle: 'Pack Disney e Universal',
      paywallAddonThemeParksSubtitle:
          'Walt Disney World e Universal Orlando — tutti i parchi, offerte, percorsi e intel affollamento in uno sblocco.',
      paywallUnlockAddon: 'Sblocca {packName} · {price}',
      paywallAddonUnlocked: 'Sbloccato',
      paywallAddonRequiresOrlando: 'Richiede prima lo sblocco Orlando',
      paywallUnlockAddonPack: 'Sblocca {packName}',
      paywallCtaUnlockAddon: 'Sblocca {packName}',
      cityPickerThemeParksSubtitle:
          'Add-on Orlando · Disney e Universal insieme',
    ),
    'pt': pack(
      onboardCityUnlockNote:
          'Cada destino tem seu próprio desbloqueio de concierge — compra única por cidade. Os parques de Orlando são um pack (Disney e Universal juntos).',
      paywallOrlandoAddonsHeading: 'Pack de parques temáticos',
      paywallOrlandoBaseIncludes:
          'Orlando inclui restaurantes, joias escondidas, hotéis e experiências fora dos parques. Adicione o pack de parques para Disney e Universal juntos.',
      paywallAddonThemeParksTitle: 'Pack Disney e Universal',
      paywallAddonThemeParksSubtitle:
          'Walt Disney World e Universal Orlando — todos os parques, ofertas, rotas e intel de multidões em um desbloqueio.',
      paywallUnlockAddon: 'Desbloquear {packName} · {price}',
      paywallAddonUnlocked: 'Desbloqueado',
      paywallAddonRequiresOrlando: 'Requer desbloqueio de Orlando primeiro',
      paywallUnlockAddonPack: 'Desbloquear {packName}',
      paywallCtaUnlockAddon: 'Desbloquear {packName}',
      cityPickerThemeParksSubtitle:
          'Add-on Orlando · Disney e Universal juntos',
    ),
    'ru': pack(
      onboardCityUnlockNote:
          'У каждого направления свой разблокировщик консьержа — разовая покупка на город. Парки Орlando — один пакет (Disney и Universal вместе).',
      paywallOrlandoAddonsHeading: 'Пакет тематических парков',
      paywallOrlandoBaseIncludes:
          'Orlando включает рестораны, скрытые жемчужины, отели и впечатления вне парков. Добавьте пакет парков для Disney и Universal вместе.',
      paywallAddonThemeParksTitle: 'Пакет Disney и Universal',
      paywallAddonThemeParksSubtitle:
          'Walt Disney World и Universal Orlando — все парки, предложения, маршруты и intel толпы в одной покупке.',
      paywallUnlockAddon: 'Разблокировать {packName} · {price}',
      paywallAddonUnlocked: 'Разблокировано',
      paywallAddonRequiresOrlando: 'Сначала нужен разблокировщик Orlando',
      paywallUnlockAddonPack: 'Разблокировать {packName}',
      paywallCtaUnlockAddon: 'Разблокировать {packName}',
      cityPickerThemeParksSubtitle:
          'Дополнение Orlando · Disney и Universal вместе',
    ),
    'hi': pack(
      onboardCityUnlockNote:
          'हर गंतव्य का अपना कॉन्सierge अनलॉक होता है — प्रति शहर एक बार की खरीद। ऑरलैंडो थीम पार्क एक पैक हैं (Disney और Universal एक साथ)।',
      paywallOrlandoAddonsHeading: 'थीम पार्क पैक',
      paywallOrlandoBaseIncludes:
          'ऑरलैंडो में भोजन, छिपे रत्न, होटल और पार्क-रहित अनुभव शामिल हैं। Disney और Universal एक साथ के लिए थीम पार्क पैक जोड़ें।',
      paywallAddonThemeParksTitle: 'Disney और Universal पैक',
      paywallAddonThemeParksSubtitle:
          'Walt Disney World और Universal Orlando — सभी पार्क, डील, रूट और भीड़ intel एक अनलॉक में।',
      paywallUnlockAddon: '{packName} अनलॉक करें · {price}',
      paywallAddonUnlocked: 'अनलॉक',
      paywallAddonRequiresOrlando: 'पहले ऑरलैंडो अनलॉक आवश्यक',
      paywallUnlockAddonPack: '{packName} अनलॉक करें',
      paywallCtaUnlockAddon: '{packName} अनलॉक करें',
      cityPickerThemeParksSubtitle:
          'Orlando ऐड-ऑन · Disney और Universal एक साथ',
    ),
    'tr': pack(
      onboardCityUnlockNote:
          'Her destinasyonun kendi concierge kilidi vardır — şehir başına tek seferlik satın alma. Orlando tema parkları tek pakettir (Disney ve Universal birlikte).',
      paywallOrlandoAddonsHeading: 'Tema park paketi',
      paywallOrlandoBaseIncludes:
          'Orlando yemek, gizli hazineler, oteller ve park dışı deneyimler içerir. Disney ve Universal birlikte için tema park paketi ekleyin.',
      paywallAddonThemeParksTitle: 'Disney ve Universal Paketi',
      paywallAddonThemeParksSubtitle:
          'Walt Disney World ve Universal Orlando — tüm parklar, fırsatlar, rotalar ve kalabalık intel tek kilitle.',
      paywallUnlockAddon: '{packName} kilidini aç · {price}',
      paywallAddonUnlocked: 'Kilidi açıldı',
      paywallAddonRequiresOrlando: 'Önce Orlando kilidini açmanız gerekir',
      paywallUnlockAddonPack: '{packName} kilidini aç',
      paywallCtaUnlockAddon: '{packName} kilidini aç',
      cityPickerThemeParksSubtitle:
          'Orlando eklentisi · Disney ve Universal birlikte',
    ),
    'ja': pack(
      onboardCityUnlockNote:
          '各目的地には専用のコンシェルジュ解除があります — 都市ごとに一度だけ購入。オーランドのテーマパークは1つのパック（DisneyとUniversalをまとめて）です。',
      paywallOrlandoAddonsHeading: 'テーマパークパック',
      paywallOrlandoBaseIncludes:
          'オーランド解除にはダイニング、隠れた名所、ホテル、パーク外の体験が含まれます。DisneyとUniversalをまとめたテーマパークパックを追加。',
      paywallAddonThemeParksTitle: 'Disney & Universalパック',
      paywallAddonThemeParksSubtitle:
          'Walt Disney WorldとUniversal Orlando — 全パーク、ディール、ルート、混雑インテリを1回の解除で。',
      paywallUnlockAddon: '{packName}を解除 · {price}',
      paywallAddonUnlocked: '解除済み',
      paywallAddonRequiresOrlando: '先にオーランド解除が必要です',
      paywallUnlockAddonPack: '{packName}を解除',
      paywallCtaUnlockAddon: '{packName}を解除',
      cityPickerThemeParksSubtitle:
          'オーランドアドオン · DisneyとUniversalをまとめて',
    ),
    'ko': pack(
      onboardCityUnlockNote:
          '각 목적지마다 전용 컨시어지 잠금 해제 — 도시당 일회성 구매. 올랜도 테마파크는 하나의 팩(Disney와 Universal 함께)입니다.',
      paywallOrlandoAddonsHeading: '테마파크 팩',
      paywallOrlandoBaseIncludes:
          '올랜도 잠금 해제에는 다이닝, 숨은 보석, 호텔, 파크 외 경험이 포함됩니다. Disney와 Universal을 함께 위한 테마파크 팩 추가.',
      paywallAddonThemeParksTitle: 'Disney & Universal 팩',
      paywallAddonThemeParksSubtitle:
          'Walt Disney World와 Universal Orlando — 모든 파크, 딜, 루트, 혼잡 intel을 한 번에.',
      paywallUnlockAddon: '{packName} 잠금 해제 · {price}',
      paywallAddonUnlocked: '잠금 해제됨',
      paywallAddonRequiresOrlando: '먼저 올랜도 잠금 해제 필요',
      paywallUnlockAddonPack: '{packName} 잠금 해제',
      paywallCtaUnlockAddon: '{packName} 잠금 해제',
      cityPickerThemeParksSubtitle:
          '올랜도 애드온 · Disney와 Universal 함께',
    ),
    'zh': pack(
      onboardCityUnlockNote:
          '每个目的地都有独立的礼宾解锁 — 按城市一次性购买。奥兰多主题公园为一个套餐（迪士尼和环球影城一起）。',
      paywallOrlandoAddonsHeading: '主题公园套餐',
      paywallOrlandoBaseIncludes:
          '奥兰多解锁包括餐饮、隐藏宝石、酒店和园外体验。添加主题公园套餐，迪士尼和环球影城一起解锁。',
      paywallAddonThemeParksTitle: '迪士尼和环球影城套餐',
      paywallAddonThemeParksSubtitle:
          '华特迪士尼世界和奥兰多环球影城 — 所有园区、优惠、路线和人流情报一次解锁。',
      paywallUnlockAddon: '解锁{packName} · {price}',
      paywallAddonUnlocked: '已解锁',
      paywallAddonRequiresOrlando: '需先解锁奥兰多',
      paywallUnlockAddonPack: '解锁{packName}',
      paywallCtaUnlockAddon: '解锁{packName}',
      cityPickerThemeParksSubtitle: '奥兰多附加包 · 迪士尼和环球影城一起',
    ),
  };
}
