// ignore_for_file: avoid_print
//
// Voice concierge + voice settings strings for all locale ARBs.
// Run: dart run tool/patch_concierge_voice_l10n.dart

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
  final extraKeys = _voiceFixKeys();
  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map.addAll(translations[locale]!);
    map.addAll(extraKeys[locale]!);
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, Map<String, dynamic>> _translations() {
  return {
    'de': _de(),
    'es': _es(),
    'fr': _fr(),
    'it': _it(),
    'pt': _pt(),
    'ru': _ru(),
    'hi': _hi(),
    'tr': _tr(),
    'ja': _ja(),
    'ko': _ko(),
    'zh': _zh(),
  };
}

Map<String, dynamic> _de() => {
      'conciergeVoiceSoon':
          'Mikrofon-Zugriff erlauben, damit Luxora zuhören kann.',
      'conciergeVoiceListening': 'Luxora hört zu…',
      'conciergeVoiceRelease': 'Loslassen zum Senden',
      'conciergeVoiceUnavailable':
          'Spracheingabe ist auf diesem Gerät nicht verfügbar.',
      'conciergeVoiceSettingsTitle': 'Luxora-Stimme',
      'conciergeVoiceSettingsSubtitle':
          'Wählen Sie Akzent, Ton und Tempo — nutzt die Systemstimmen Ihres Geräts.',
      'conciergeVoiceRateLabel': 'Sprechtempo',
      'conciergeVoiceRateSlow': 'Langsam',
      'conciergeVoiceRateNatural': 'Natürlich',
      'conciergeVoiceRateFast': 'Schnell',
      'conciergeVoicePreview': 'Stimme testen',
      'conciergeVoicePreviewSample':
          'Hallo — ich bin Luxora. Sag mir, wie sich diese Reise anfühlen soll.',
      'conciergeVoiceDeviceNote':
          'Verfügbare Stimmen hängen von den Sprachpaketen auf Ihrem Gerät ab.',
      'conciergeVoiceRegionRecommended': 'Empfohlen',
      'conciergeVoiceRegionEnglish': 'Englisch',
      'conciergeVoiceRegionRussian': 'Russisch',
      'conciergeVoiceRegionSpanish': 'Spanisch',
      'conciergeVoiceRegionFrench': 'Französisch',
      'conciergeVoiceRegionGerman': 'Deutsch',
      'conciergeVoiceRegionOther': 'Andere',
      'conciergeVoicePresetMatchApp': 'App-Sprache · Weiblich',
      'conciergeVoicePresetEnUsF': 'Amerikanisch · Weiblich',
      'conciergeVoicePresetEnUsM': 'Amerikanisch · Männlich',
      'conciergeVoicePresetEnGbF': 'Britisch · Weiblich',
      'conciergeVoicePresetEnGbM': 'Britisch · Männlich',
      'conciergeVoicePresetRuF': 'Russisch · Weiblich',
      'conciergeVoicePresetRuM': 'Russisch · Männlich',
      'conciergeVoicePresetEsF': 'Spanisch · Weiblich',
      'conciergeVoicePresetEsM': 'Spanisch · Männlich',
      'conciergeVoicePresetFrF': 'Französisch · Weiblich',
      'conciergeVoicePresetFrM': 'Französisch · Männlich',
      'conciergeVoicePresetDeF': 'Deutsch · Weiblich',
      'conciergeVoicePresetDeM': 'Deutsch · Männlich',
    };

Map<String, dynamic> _es() => {
      'conciergeVoiceSoon':
          'Permite el micrófono para que Luxora pueda escucharte.',
      'conciergeVoiceListening': 'Luxora está escuchando…',
      'conciergeVoiceRelease': 'Suelta para enviar',
      'conciergeVoiceUnavailable':
          'La voz no está disponible en este dispositivo.',
      'conciergeVoiceSettingsTitle': 'Voz de Luxora',
      'conciergeVoiceSettingsSubtitle':
          'Elige acento, tono y ritmo — usa las voces integradas de tu dispositivo.',
      'conciergeVoiceRateLabel': 'Ritmo al hablar',
      'conciergeVoiceRateSlow': 'Lento',
      'conciergeVoiceRateNatural': 'Natural',
      'conciergeVoiceRateFast': 'Rápido',
      'conciergeVoicePreview': 'Probar voz',
      'conciergeVoicePreviewSample':
          'Hola — soy Luxora. Dime cómo quieres sentir este viaje.',
      'conciergeVoiceDeviceNote':
          'Las voces disponibles dependen de los paquetes de idioma de tu dispositivo.',
      'conciergeVoiceRegionRecommended': 'Recomendado',
      'conciergeVoiceRegionEnglish': 'Inglés',
      'conciergeVoiceRegionRussian': 'Ruso',
      'conciergeVoiceRegionSpanish': 'Español',
      'conciergeVoiceRegionFrench': 'Francés',
      'conciergeVoiceRegionGerman': 'Alemán',
      'conciergeVoiceRegionOther': 'Otros',
      'conciergeVoicePresetMatchApp': 'Idioma de la app · Femenina',
      'conciergeVoicePresetEnUsF': 'Estadounidense · Femenina',
      'conciergeVoicePresetEnUsM': 'Estadounidense · Masculina',
      'conciergeVoicePresetEnGbF': 'Británica · Femenina',
      'conciergeVoicePresetEnGbM': 'Británica · Masculina',
      'conciergeVoicePresetRuF': 'Rusa · Femenina',
      'conciergeVoicePresetRuM': 'Ruso · Masculino',
      'conciergeVoicePresetEsF': 'Española · Femenina',
      'conciergeVoicePresetEsM': 'Española · Masculina',
      'conciergeVoicePresetFrF': 'Francesa · Femenina',
      'conciergeVoicePresetFrM': 'Francés · Masculino',
      'conciergeVoicePresetDeF': 'Alemana · Femenina',
      'conciergeVoicePresetDeM': 'Alemán · Masculino',
    };

Map<String, dynamic> _fr() => {
      'conciergeVoiceSoon':
          'Autorisez le micro pour que Luxora puisse vous écouter.',
      'conciergeVoiceListening': 'Luxora écoute…',
      'conciergeVoiceRelease': 'Relâchez pour envoyer',
      'conciergeVoiceUnavailable':
          'La voix n\'est pas disponible sur cet appareil.',
      'conciergeVoiceSettingsTitle': 'Voix de Luxora',
      'conciergeVoiceSettingsSubtitle':
          'Choisissez accent, ton et rythme — utilise les voix système de votre appareil.',
      'conciergeVoiceRateLabel': 'Rythme de parole',
      'conciergeVoiceRateSlow': 'Lent',
      'conciergeVoiceRateNatural': 'Naturel',
      'conciergeVoiceRateFast': 'Rapide',
      'conciergeVoicePreview': 'Tester la voix',
      'conciergeVoicePreviewSample':
          'Bonjour — je suis Luxora. Dis-moi ce que tu veux ressentir pendant ce voyage.',
      'conciergeVoiceDeviceNote':
          'Les voix disponibles dépendent des packs linguistiques de votre appareil.',
      'conciergeVoiceRegionRecommended': 'Recommandé',
      'conciergeVoiceRegionEnglish': 'Anglais',
      'conciergeVoiceRegionRussian': 'Russe',
      'conciergeVoiceRegionSpanish': 'Espagnol',
      'conciergeVoiceRegionFrench': 'Français',
      'conciergeVoiceRegionGerman': 'Allemand',
      'conciergeVoiceRegionOther': 'Autres',
      'conciergeVoicePresetMatchApp': 'Langue de l\'app · Féminine',
      'conciergeVoicePresetEnUsF': 'Américaine · Féminine',
      'conciergeVoicePresetEnUsM': 'Américaine · Masculine',
      'conciergeVoicePresetEnGbF': 'Britannique · Féminine',
      'conciergeVoicePresetEnGbM': 'Britannique · Masculine',
      'conciergeVoicePresetRuF': 'Russe · Féminine',
      'conciergeVoicePresetRuM': 'Russe · Masculin',
      'conciergeVoicePresetEsF': 'Espagnole · Féminine',
      'conciergeVoicePresetEsM': 'Espagnole · Masculine',
      'conciergeVoicePresetFrF': 'Française · Féminine',
      'conciergeVoicePresetFrM': 'Français · Masculin',
      'conciergeVoicePresetDeF': 'Allemande · Féminine',
      'conciergeVoicePresetDeM': 'Allemand · Masculin',
    };

Map<String, dynamic> _it() => {
      'conciergeVoiceSoon':
          'Consenti il microfono così Luxora può ascoltarti.',
      'conciergeVoiceListening': 'Luxora sta ascoltando…',
      'conciergeVoiceRelease': 'Rilascia per inviare',
      'conciergeVoiceUnavailable':
          'La voce non è disponibile su questo dispositivo.',
      'conciergeVoiceSettingsTitle': 'Voce di Luxora',
      'conciergeVoiceSettingsSubtitle':
          'Scegli accento, tono e ritmo — usa le voci di sistema del dispositivo.',
      'conciergeVoiceRateLabel': 'Ritmo di voce',
      'conciergeVoiceRateSlow': 'Lento',
      'conciergeVoiceRateNatural': 'Naturale',
      'conciergeVoiceRateFast': 'Veloce',
      'conciergeVoicePreview': 'Anteprima voce',
      'conciergeVoicePreviewSample':
          'Ciao — sono Luxora. Dimmi come vuoi sentirti in questo viaggio.',
      'conciergeVoiceDeviceNote':
          'Le voci disponibili dipendono dai pacchetti lingua del dispositivo.',
      'conciergeVoiceRegionRecommended': 'Consigliato',
      'conciergeVoiceRegionEnglish': 'Inglese',
      'conciergeVoiceRegionRussian': 'Russo',
      'conciergeVoiceRegionSpanish': 'Spagnolo',
      'conciergeVoiceRegionFrench': 'Francese',
      'conciergeVoiceRegionGerman': 'Tedesco',
      'conciergeVoiceRegionOther': 'Altro',
      'conciergeVoicePresetMatchApp': 'Lingua app · Femminile',
      'conciergeVoicePresetEnUsF': 'Americana · Femminile',
      'conciergeVoicePresetEnUsM': 'Americana · Maschile',
      'conciergeVoicePresetEnGbF': 'Britannica · Femminile',
      'conciergeVoicePresetEnGbM': 'Britannica · Maschile',
      'conciergeVoicePresetRuF': 'Russa · Femminile',
      'conciergeVoicePresetRuM': 'Russo · Maschile',
      'conciergeVoicePresetEsF': 'Spagnola · Femminile',
      'conciergeVoicePresetEsM': 'Spagnola · Maschile',
      'conciergeVoicePresetFrF': 'Francese · Femminile',
      'conciergeVoicePresetFrM': 'Francese · Maschile',
      'conciergeVoicePresetDeF': 'Tedesca · Femminile',
      'conciergeVoicePresetDeM': 'Tedesco · Maschile',
    };

Map<String, dynamic> _pt() => {
      'conciergeVoiceSoon':
          'Permita o microfone para a Luxora ouvir você.',
      'conciergeVoiceListening': 'Luxora está ouvindo…',
      'conciergeVoiceRelease': 'Solte para enviar',
      'conciergeVoiceUnavailable':
          'A voz não está disponível neste dispositivo.',
      'conciergeVoiceSettingsTitle': 'Voz da Luxora',
      'conciergeVoiceSettingsSubtitle':
          'Escolha sotaque, tom e ritmo — usa as vozes do sistema do dispositivo.',
      'conciergeVoiceRateLabel': 'Ritmo da fala',
      'conciergeVoiceRateSlow': 'Lento',
      'conciergeVoiceRateNatural': 'Natural',
      'conciergeVoiceRateFast': 'Rápido',
      'conciergeVoicePreview': 'Testar voz',
      'conciergeVoicePreviewSample':
          'Olá — sou a Luxora. Diga como quer se sentir nesta viagem.',
      'conciergeVoiceDeviceNote':
          'As vozes disponíveis dependem dos pacotes de idioma do dispositivo.',
      'conciergeVoiceRegionRecommended': 'Recomendado',
      'conciergeVoiceRegionEnglish': 'Inglês',
      'conciergeVoiceRegionRussian': 'Russo',
      'conciergeVoiceRegionSpanish': 'Espanhol',
      'conciergeVoiceRegionFrench': 'Francês',
      'conciergeVoiceRegionGerman': 'Alemão',
      'conciergeVoiceRegionOther': 'Outros',
      'conciergeVoicePresetMatchApp': 'Idioma do app · Feminina',
      'conciergeVoicePresetEnUsF': 'Americana · Feminina',
      'conciergeVoicePresetEnUsM': 'Americana · Masculina',
      'conciergeVoicePresetEnGbF': 'Britânica · Feminina',
      'conciergeVoicePresetEnGbM': 'Britânica · Masculina',
      'conciergeVoicePresetRuF': 'Russa · Feminina',
      'conciergeVoicePresetRuM': 'Russo · Masculino',
      'conciergeVoicePresetEsF': 'Espanhola · Feminina',
      'conciergeVoicePresetEsM': 'Espanhola · Masculina',
      'conciergeVoicePresetFrF': 'Francesa · Feminina',
      'conciergeVoicePresetFrM': 'Francês · Masculino',
      'conciergeVoicePresetDeF': 'Alemã · Feminina',
      'conciergeVoicePresetDeM': 'Alemão · Masculino',
    };

Map<String, dynamic> _ru() => {
      'conciergeVoiceSoon':
          'Разрешите микрофон, чтобы Luxora могла слушать.',
      'conciergeVoiceListening': 'Luxora слушает…',
      'conciergeVoiceRelease': 'Отпустите, чтобы отправить',
      'conciergeVoiceUnavailable':
          'Голос недоступен на этом устройстве.',
      'conciergeVoiceSettingsTitle': 'Голос Luxora',
      'conciergeVoiceSettingsSubtitle':
          'Выберите акцент, тон и темп — используются системные голоса устройства.',
      'conciergeVoiceRateLabel': 'Темп речи',
      'conciergeVoiceRateSlow': 'Медленно',
      'conciergeVoiceRateNatural': 'Естественно',
      'conciergeVoiceRateFast': 'Быстро',
      'conciergeVoicePreview': 'Прослушать голос',
      'conciergeVoicePreviewSample':
          'Привет — я Luxora. Расскажи, каким ты хочешь чувствовать это путешествие.',
      'conciergeVoiceDeviceNote':
          'Доступные голоса зависят от языковых пакетов на вашем устройстве.',
      'conciergeVoiceRegionRecommended': 'Рекомендуется',
      'conciergeVoiceRegionEnglish': 'Английский',
      'conciergeVoiceRegionRussian': 'Русский',
      'conciergeVoiceRegionSpanish': 'Испанский',
      'conciergeVoiceRegionFrench': 'Французский',
      'conciergeVoiceRegionGerman': 'Немецкий',
      'conciergeVoiceRegionOther': 'Другие',
      'conciergeVoicePresetMatchApp': 'Язык приложения · Женский',
      'conciergeVoicePresetEnUsF': 'Американский · Женский',
      'conciergeVoicePresetEnUsM': 'Американский · Мужской',
      'conciergeVoicePresetEnGbF': 'Британский · Женский',
      'conciergeVoicePresetEnGbM': 'Британский · Мужской',
      'conciergeVoicePresetRuF': 'Русский · Женский',
      'conciergeVoicePresetRuM': 'Русский · Мужской',
      'conciergeVoicePresetEsF': 'Испанский · Женский',
      'conciergeVoicePresetEsM': 'Испанский · Мужской',
      'conciergeVoicePresetFrF': 'Французский · Женский',
      'conciergeVoicePresetFrM': 'Французский · Мужской',
      'conciergeVoicePresetDeF': 'Немецкий · Женский',
      'conciergeVoicePresetDeM': 'Немецкий · Мужской',
    };

Map<String, dynamic> _hi() => {
      'conciergeVoiceSoon':
          'माइक्रोफ़ोन की अनुमति दें ताकि Luxora सुन सके।',
      'conciergeVoiceListening': 'Luxora सुन रही है…',
      'conciergeVoiceRelease': 'भेजने के लिए छोड़ें',
      'conciergeVoiceUnavailable':
          'इस डिवाइस पर आवाज़ उपलब्ध नहीं है।',
      'conciergeVoiceSettingsTitle': 'Luxora की आवाज़',
      'conciergeVoiceSettingsSubtitle':
          'लहजा, स्वर और गति चुनें — आपके डिवाइस की सिस्टम आवाज़ें।',
      'conciergeVoiceRateLabel': 'बोलने की गति',
      'conciergeVoiceRateSlow': 'धीमी',
      'conciergeVoiceRateNatural': 'सामान्य',
      'conciergeVoiceRateFast': 'तेज़',
      'conciergeVoicePreview': 'आवाज़ सुनें',
      'conciergeVoicePreviewSample':
          'नमस्ते — मैं Luxora हूँ। बताइए यह यात्रा कैसी महसूस होनी चाहिए।',
      'conciergeVoiceDeviceNote':
          'उपलब्ध आवाज़ें आपके डिवाइस के भाषा पैक पर निर्भर करती हैं।',
      'conciergeVoiceRegionRecommended': 'अनुशंसित',
      'conciergeVoiceRegionEnglish': 'अंग्रेज़ी',
      'conciergeVoiceRegionRussian': 'रूसी',
      'conciergeVoiceRegionSpanish': 'स्पेनिश',
      'conciergeVoiceRegionFrench': 'फ़्रेंच',
      'conciergeVoiceRegionGerman': 'जर्मन',
      'conciergeVoiceRegionOther': 'अन्य',
      'conciergeVoicePresetMatchApp': 'ऐप भाषा · महिला',
      'conciergeVoicePresetEnUsF': 'अमेरिकी · महिला',
      'conciergeVoicePresetEnUsM': 'अमेरिकी · पुरुष',
      'conciergeVoicePresetEnGbF': 'ब्रिटिश · महिला',
      'conciergeVoicePresetEnGbM': 'ब्रिटिश · पुरुष',
      'conciergeVoicePresetRuF': 'रूसी · महिला',
      'conciergeVoicePresetRuM': 'रूसी · पुरुष',
      'conciergeVoicePresetEsF': 'स्पेनिश · महिला',
      'conciergeVoicePresetEsM': 'स्पेनिश · पुरुष',
      'conciergeVoicePresetFrF': 'फ़्रेंच · महिला',
      'conciergeVoicePresetFrM': 'फ़्रेंच · पुरुष',
      'conciergeVoicePresetDeF': 'जर्मन · महिला',
      'conciergeVoicePresetDeM': 'जर्मन · पुरुष',
    };

Map<String, dynamic> _tr() => {
      'conciergeVoiceSoon':
          'Luxora\'nın dinlemesi için mikrofona izin verin.',
      'conciergeVoiceListening': 'Luxora dinliyor…',
      'conciergeVoiceRelease': 'Göndermek için bırakın',
      'conciergeVoiceUnavailable':
          'Ses bu cihazda kullanılamıyor.',
      'conciergeVoiceSettingsTitle': 'Luxora sesi',
      'conciergeVoiceSettingsSubtitle':
          'Aksan, ton ve hız seçin — cihazınızın sistem seslerini kullanır.',
      'conciergeVoiceRateLabel': 'Konuşma hızı',
      'conciergeVoiceRateSlow': 'Yavaş',
      'conciergeVoiceRateNatural': 'Doğal',
      'conciergeVoiceRateFast': 'Hızlı',
      'conciergeVoicePreview': 'Sesi dene',
      'conciergeVoicePreviewSample':
          'Merhaba — ben Luxora. Bu yolculuğun nasıl hissettirmesini istediğini söyle.',
      'conciergeVoiceDeviceNote':
          'Mevcut sesler cihazınızdaki dil paketlerine bağlıdır.',
      'conciergeVoiceRegionRecommended': 'Önerilen',
      'conciergeVoiceRegionEnglish': 'İngilizce',
      'conciergeVoiceRegionRussian': 'Rusça',
      'conciergeVoiceRegionSpanish': 'İspanyolca',
      'conciergeVoiceRegionFrench': 'Fransızca',
      'conciergeVoiceRegionGerman': 'Almanca',
      'conciergeVoiceRegionOther': 'Diğer',
      'conciergeVoicePresetMatchApp': 'Uygulama dili · Kadın',
      'conciergeVoicePresetEnUsF': 'Amerikan · Kadın',
      'conciergeVoicePresetEnUsM': 'Amerikan · Erkek',
      'conciergeVoicePresetEnGbF': 'İngiliz · Kadın',
      'conciergeVoicePresetEnGbM': 'İngiliz · Erkek',
      'conciergeVoicePresetRuF': 'Rus · Kadın',
      'conciergeVoicePresetRuM': 'Rus · Erkek',
      'conciergeVoicePresetEsF': 'İspanyol · Kadın',
      'conciergeVoicePresetEsM': 'İspanyol · Erkek',
      'conciergeVoicePresetFrF': 'Fransız · Kadın',
      'conciergeVoicePresetFrM': 'Fransız · Erkek',
      'conciergeVoicePresetDeF': 'Alman · Kadın',
      'conciergeVoicePresetDeM': 'Alman · Erkek',
    };

Map<String, dynamic> _ja() => {
      'conciergeVoiceSoon': 'Luxoraが聞けるようにマイクを許可してください。',
      'conciergeVoiceListening': 'Luxoraが聞いています…',
      'conciergeVoiceRelease': '離して送信',
      'conciergeVoiceUnavailable': 'このデバイスでは音声を利用できません。',
      'conciergeVoiceSettingsTitle': 'Luxoraの声',
      'conciergeVoiceSettingsSubtitle':
          'アクセント、トーン、速度を選べます — 端末のシステム音声を使用します。',
      'conciergeVoiceRateLabel': '話す速度',
      'conciergeVoiceRateSlow': 'ゆっくり',
      'conciergeVoiceRateNatural': '自然',
      'conciergeVoiceRateFast': '速い',
      'conciergeVoicePreview': '声を試聴',
      'conciergeVoicePreviewSample':
          'こんにちは — Luxoraです。この旅をどう感じたいか教えてください。',
      'conciergeVoiceDeviceNote':
          '利用できる声は端末の言語パックによって異なります。',
      'conciergeVoiceRegionRecommended': 'おすすめ',
      'conciergeVoiceRegionEnglish': '英語',
      'conciergeVoiceRegionRussian': 'ロシア語',
      'conciergeVoiceRegionSpanish': 'スペイン語',
      'conciergeVoiceRegionFrench': 'フランス語',
      'conciergeVoiceRegionGerman': 'ドイツ語',
      'conciergeVoiceRegionOther': 'その他',
      'conciergeVoicePresetMatchApp': 'アプリ言語 · 女性',
      'conciergeVoicePresetEnUsF': 'アメリカ · 女性',
      'conciergeVoicePresetEnUsM': 'アメリカ · 男性',
      'conciergeVoicePresetEnGbF': 'イギリス · 女性',
      'conciergeVoicePresetEnGbM': 'イギリス · 男性',
      'conciergeVoicePresetRuF': 'ロシア · 女性',
      'conciergeVoicePresetRuM': 'ロシア · 男性',
      'conciergeVoicePresetEsF': 'スペイン · 女性',
      'conciergeVoicePresetEsM': 'スペイン · 男性',
      'conciergeVoicePresetFrF': 'フランス · 女性',
      'conciergeVoicePresetFrM': 'フランス · 男性',
      'conciergeVoicePresetDeF': 'ドイツ · 女性',
      'conciergeVoicePresetDeM': 'ドイツ · 男性',
    };

Map<String, dynamic> _ko() => {
      'conciergeVoiceSoon': 'Luxora가 들을 수 있도록 마이크를 허용하세요.',
      'conciergeVoiceListening': 'Luxora가 듣고 있습니다…',
      'conciergeVoiceRelease': '놓으면 전송',
      'conciergeVoiceUnavailable': '이 기기에서는 음성을 사용할 수 없습니다.',
      'conciergeVoiceSettingsTitle': 'Luxora 음성',
      'conciergeVoiceSettingsSubtitle':
          '억양, 톤, 속도를 선택하세요 — 기기의 시스템 음성을 사용합니다.',
      'conciergeVoiceRateLabel': '말하기 속도',
      'conciergeVoiceRateSlow': '느리게',
      'conciergeVoiceRateNatural': '자연스럽게',
      'conciergeVoiceRateFast': '빠르게',
      'conciergeVoicePreview': '음성 미리듣기',
      'conciergeVoicePreviewSample':
          '안녕하세요 — Luxora입니다. 이 여행을 어떻게 느끼고 싶은지 알려주세요.',
      'conciergeVoiceDeviceNote':
          '사용 가능한 음성은 기기의 언어 팩에 따라 다릅니다.',
      'conciergeVoiceRegionRecommended': '추천',
      'conciergeVoiceRegionEnglish': '영어',
      'conciergeVoiceRegionRussian': '러시아어',
      'conciergeVoiceRegionSpanish': '스페인어',
      'conciergeVoiceRegionFrench': '프랑스어',
      'conciergeVoiceRegionGerman': '독일어',
      'conciergeVoiceRegionOther': '기타',
      'conciergeVoicePresetMatchApp': '앱 언어 · 여성',
      'conciergeVoicePresetEnUsF': '미국 · 여성',
      'conciergeVoicePresetEnUsM': '미국 · 남성',
      'conciergeVoicePresetEnGbF': '영국 · 여성',
      'conciergeVoicePresetEnGbM': '영국 · 남성',
      'conciergeVoicePresetRuF': '러시아 · 여성',
      'conciergeVoicePresetRuM': '러시아 · 남성',
      'conciergeVoicePresetEsF': '스페인 · 여성',
      'conciergeVoicePresetEsM': '스페인 · 남성',
      'conciergeVoicePresetFrF': '프랑스 · 여성',
      'conciergeVoicePresetFrM': '프랑스 · 남성',
      'conciergeVoicePresetDeF': '독일 · 여성',
      'conciergeVoicePresetDeM': '독일 · 남성',
    };

Map<String, dynamic> _zh() => {
      'conciergeVoiceSoon': '请允许麦克风，以便 Luxora 能听你说。',
      'conciergeVoiceListening': 'Luxora 正在聆听…',
      'conciergeVoiceRelease': '松开发送',
      'conciergeVoiceUnavailable': '此设备不支持语音。',
      'conciergeVoiceSettingsTitle': 'Luxora 语音',
      'conciergeVoiceSettingsSubtitle':
          '选择口音、音色和语速 — 使用您设备的系统语音。',
      'conciergeVoiceRateLabel': '语速',
      'conciergeVoiceRateSlow': '慢',
      'conciergeVoiceRateNatural': '自然',
      'conciergeVoiceRateFast': '快',
      'conciergeVoicePreview': '试听语音',
      'conciergeVoicePreviewSample':
          '你好 — 我是 Luxora。告诉我你希望这次旅行是什么感觉。',
      'conciergeVoiceDeviceNote':
          '可用语音取决于设备上的语言包。',
      'conciergeVoiceRegionRecommended': '推荐',
      'conciergeVoiceRegionEnglish': '英语',
      'conciergeVoiceRegionRussian': '俄语',
      'conciergeVoiceRegionSpanish': '西班牙语',
      'conciergeVoiceRegionFrench': '法语',
      'conciergeVoiceRegionGerman': '德语',
      'conciergeVoiceRegionOther': '其他',
      'conciergeVoicePresetMatchApp': '匹配应用语言 · 女声',
      'conciergeVoicePresetEnUsF': '美式 · 女声',
      'conciergeVoicePresetEnUsM': '美式 · 男声',
      'conciergeVoicePresetEnGbF': '英式 · 女声',
      'conciergeVoicePresetEnGbM': '英式 · 男声',
      'conciergeVoicePresetRuF': '俄语 · 女声',
      'conciergeVoicePresetRuM': '俄语 · 男声',
      'conciergeVoicePresetEsF': '西语 · 女声',
      'conciergeVoicePresetEsM': '西语 · 男声',
      'conciergeVoicePresetFrF': '法语 · 女声',
      'conciergeVoicePresetFrM': '法语 · 男声',
      'conciergeVoicePresetDeF': '德语 · 女声',
      'conciergeVoicePresetDeM': '德语 · 男声',
    };

Map<String, Map<String, dynamic>> _voiceFixKeys() => {
      'de': {
        'conciergeVoiceNoSpeech':
            'Das habe ich nicht verstanden — halten, sprechen, loslassen.',
        'conciergeVoicePreviewFailed':
            'Vorschau fehlgeschlagen. Lautstärke prüfen und erneut versuchen.',
      },
      'es': {
        'conciergeVoiceNoSpeech':
            'No te entendí — mantén pulsado, habla y suelta.',
        'conciergeVoicePreviewFailed':
            'No se pudo reproducir la vista previa. Revisa el volumen e inténtalo de nuevo.',
      },
      'fr': {
        'conciergeVoiceNoSpeech':
            'Je n\'ai pas compris — maintenez, parlez, puis relâchez.',
        'conciergeVoicePreviewFailed':
            'Impossible de lire l\'aperçu. Vérifiez le volume et réessayez.',
      },
      'it': {
        'conciergeVoiceNoSpeech':
            'Non ho capito — tieni premuto, parla e rilascia.',
        'conciergeVoicePreviewFailed':
            'Anteprima non riprodotta. Controlla il volume e riprova.',
      },
      'pt': {
        'conciergeVoiceNoSpeech':
            'Não entendi — segure, fale e solte.',
        'conciergeVoicePreviewFailed':
            'Não foi possível reproduzir a prévia. Verifique o volume e tente de novo.',
      },
      'ru': {
        'conciergeVoiceNoSpeech':
            'Не расслышала — удерживайте, говорите и отпустите.',
        'conciergeVoicePreviewFailed':
            'Не удалось воспроизвести. Проверьте громкость и попробуйте снова.',
      },
      'hi': {
        'conciergeVoiceNoSpeech':
            'सुनाई नहीं दिया — दबाकर रखें, बोलें, फिर छोड़ें।',
        'conciergeVoicePreviewFailed':
            'पूर्वावलोकन नहीं चला। वॉल्यूम जाँचें और फिर कोशिश करें।',
      },
      'tr': {
        'conciergeVoiceNoSpeech':
            'Duymadım — basılı tut, konuş, bırak.',
        'conciergeVoicePreviewFailed':
            'Önizleme oynatılamadı. Sesi kontrol edip tekrar deneyin.',
      },
      'ja': {
        'conciergeVoiceNoSpeech':
            '聞き取れませんでした。押したまま話してから離してください。',
        'conciergeVoicePreviewFailed':
            'プレビューを再生できませんでした。音量を確認して再度お試しください。',
      },
      'ko': {
        'conciergeVoiceNoSpeech':
            '잘 못 들었어요 — 누른 채로 말한 뒤 놓아 주세요.',
        'conciergeVoicePreviewFailed':
            '미리듣기를 재생하지 못했습니다. 볼륨을 확인하고 다시 시도해 주세요.',
      },
      'zh': {
        'conciergeVoiceNoSpeech':
            '没听清——按住说话，说完再松开。',
        'conciergeVoicePreviewFailed':
            '无法播放预览。请检查音量后重试。',
      },
    };
