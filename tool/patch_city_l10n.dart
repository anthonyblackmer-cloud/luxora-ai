// ignore_for_file: avoid_print
//
// Adds missing city-picker l10n keys to all locale ARBs.
// Run: dart run tool/patch_city_l10n.dart

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
    final map = jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map.addAll(translations[locale]!);
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, Map<String, dynamic>> _translations() {
  Map<String, dynamic> pack({
    required String onboardCityLabel,
    required String onboardCityUnlockNote,
    required String landingCityLabel,
    required String paywallSwitchCity,
    required String cityPickerUnlocked,
    required String cityPickerUnlockPrice,
  }) =>
      {
        'onboardCityLabel': onboardCityLabel,
        'onboardCityUnlockNote': onboardCityUnlockNote,
        'landingCityLabel': landingCityLabel,
        'paywallSwitchCity': paywallSwitchCity,
        'cityPickerUnlocked': cityPickerUnlocked,
        'cityPickerUnlockPrice': cityPickerUnlockPrice,
        '@cityPickerUnlockPrice': {
          'placeholders': {
            'price': {'type': 'String'},
          },
        },
      };

  return {
    'de': pack(
      onboardCityLabel: 'Wähle deine Stadt',
      onboardCityUnlockNote:
          'Jedes Reiseziel hat sein eigenes Concierge-Freischalten — einmaliger Kauf pro Stadt.',
      landingCityLabel: 'Wohin geht es?',
      paywallSwitchCity: 'Reiseziel',
      cityPickerUnlocked: 'Freigeschaltet',
      cityPickerUnlockPrice: 'Freischalten {price}',
    ),
    'es': pack(
      onboardCityLabel: 'Elige tu ciudad',
      onboardCityUnlockNote:
          'Cada destino tiene su propio desbloqueo de concierge — compra única por ciudad.',
      landingCityLabel: '¿A dónde vas?',
      paywallSwitchCity: 'Destino',
      cityPickerUnlocked: 'Desbloqueado',
      cityPickerUnlockPrice: 'Desbloquear {price}',
    ),
    'fr': pack(
      onboardCityLabel: 'Choisissez votre ville',
      onboardCityUnlockNote:
          'Chaque destination a son propre déverrouillage concierge — achat unique par ville.',
      landingCityLabel: 'Où allez-vous ?',
      paywallSwitchCity: 'Destination',
      cityPickerUnlocked: 'Déverrouillé',
      cityPickerUnlockPrice: 'Déverrouiller {price}',
    ),
    'it': pack(
      onboardCityLabel: 'Scegli la tua città',
      onboardCityUnlockNote:
          'Ogni destinazione ha il proprio sblocco concierge — acquisto una tantum per città.',
      landingCityLabel: 'Dove stai andando?',
      paywallSwitchCity: 'Destinazione',
      cityPickerUnlocked: 'Sbloccato',
      cityPickerUnlockPrice: 'Sblocca {price}',
    ),
    'pt': pack(
      onboardCityLabel: 'Escolha sua cidade',
      onboardCityUnlockNote:
          'Cada destino tem seu próprio desbloqueio de concierge — compra única por cidade.',
      landingCityLabel: 'Para onde você vai?',
      paywallSwitchCity: 'Destino',
      cityPickerUnlocked: 'Desbloqueado',
      cityPickerUnlockPrice: 'Desbloquear {price}',
    ),
    'ru': pack(
      onboardCityLabel: 'Выберите город',
      onboardCityUnlockNote:
          'У каждого направления свой разблокировщик консьержа — разовая покупка на город.',
      landingCityLabel: 'Куда вы направляетесь?',
      paywallSwitchCity: 'Направление',
      cityPickerUnlocked: 'Разблокировано',
      cityPickerUnlockPrice: 'Разблокировать {price}',
    ),
    'hi': pack(
      onboardCityLabel: 'अपना शहर चुनें',
      onboardCityUnlockNote:
          'हर गंतव्य का अपना कॉन्सierge अनलॉक होता है — प्रति शहर एक बार की खरीद।',
      landingCityLabel: 'आप कहाँ जा रहे हैं?',
      paywallSwitchCity: 'गंतव्य',
      cityPickerUnlocked: 'अनलॉक',
      cityPickerUnlockPrice: '{price} अनलॉक करें',
    ),
    'tr': pack(
      onboardCityLabel: 'Şehrinizi seçin',
      onboardCityUnlockNote:
          'Her destinasyonun kendi concierge kilidi vardır — şehir başına tek seferlik satın alma.',
      landingCityLabel: 'Nereye gidiyorsunuz?',
      paywallSwitchCity: 'Destinasyon',
      cityPickerUnlocked: 'Açıldı',
      cityPickerUnlockPrice: '{price} kilidini aç',
    ),
    'ja': pack(
      onboardCityLabel: '都市を選ぶ',
      onboardCityUnlockNote:
          '各目的地には専用のコンシェルジュ解除があります — 都市ごとに一度だけ購入。',
      landingCityLabel: 'どこへ行きますか？',
      paywallSwitchCity: '目的地',
      cityPickerUnlocked: '解除済み',
      cityPickerUnlockPrice: '{price} を解除',
    ),
    'ko': pack(
      onboardCityLabel: '도시 선택',
      onboardCityUnlockNote:
          '각 목적지마다 전용 컨시어지 잠금 해제 — 도시당 일회성 구매.',
      landingCityLabel: '어디로 가시나요?',
      paywallSwitchCity: '목적지',
      cityPickerUnlocked: '잠금 해제됨',
      cityPickerUnlockPrice: '{price} 잠금 해제',
    ),
    'zh': pack(
      onboardCityLabel: '选择您的城市',
      onboardCityUnlockNote:
          '每个目的地都有独立的礼宾解锁 — 按城市一次性购买。',
      landingCityLabel: '您要去哪里？',
      paywallSwitchCity: '目的地',
      cityPickerUnlocked: '已解锁',
      cityPickerUnlockPrice: '解锁 {price}',
    ),
  };
}
