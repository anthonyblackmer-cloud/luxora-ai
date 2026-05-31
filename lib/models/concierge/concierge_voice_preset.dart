import 'package:luxora_ai/l10n/app_localizations.dart';

enum ConciergeVoiceGender { female, male }

/// Curated Luxora voice personas mapped to on-device TTS voices.
class ConciergeVoicePreset {
  const ConciergeVoicePreset({
    required this.id,
    required this.ttsLocale,
    required this.gender,
    this.nameHints = const [],
  });

  /// Stable storage id.
  final String id;

  /// BCP-47 tag for [FlutterTts.setLanguage] fallback, e.g. `en-GB`.
  final String ttsLocale;

  final ConciergeVoiceGender gender;

  /// Substrings that often appear in iOS/Android voice names for this persona.
  final List<String> nameHints;

  bool get matchesAppLanguage => id == 'match_app';

  String label(AppLocalizations l) => switch (id) {
        'match_app' => l.conciergeVoicePresetMatchApp,
        'en_us_f' => l.conciergeVoicePresetEnUsF,
        'en_us_m' => l.conciergeVoicePresetEnUsM,
        'en_gb_f' => l.conciergeVoicePresetEnGbF,
        'en_gb_m' => l.conciergeVoicePresetEnGbM,
        'ru_f' => l.conciergeVoicePresetRuF,
        'ru_m' => l.conciergeVoicePresetRuM,
        'es_f' => l.conciergeVoicePresetEsF,
        'es_m' => l.conciergeVoicePresetEsM,
        'fr_f' => l.conciergeVoicePresetFrF,
        'fr_m' => l.conciergeVoicePresetFrM,
        'de_f' => l.conciergeVoicePresetDeF,
        'de_m' => l.conciergeVoicePresetDeM,
        _ => id,
      };

  String regionLabel(AppLocalizations l) => switch (id.split('_').first) {
        'match' => l.conciergeVoiceRegionRecommended,
        'en' => l.conciergeVoiceRegionEnglish,
        'ru' => l.conciergeVoiceRegionRussian,
        'es' => l.conciergeVoiceRegionSpanish,
        'fr' => l.conciergeVoiceRegionFrench,
        'de' => l.conciergeVoiceRegionGerman,
        _ => l.conciergeVoiceRegionOther,
      };
}

abstract final class ConciergeVoicePresets {
  static const defaultId = 'match_app';

  static const all = <ConciergeVoicePreset>[
    ConciergeVoicePreset(
      id: 'match_app',
      ttsLocale: '',
      gender: ConciergeVoiceGender.female,
      nameHints: ['kate', 'samantha', 'nicky'],
    ),
    ConciergeVoicePreset(
      id: 'en_us_f',
      ttsLocale: 'en-US',
      gender: ConciergeVoiceGender.female,
      nameHints: ['samantha', 'nicky', 'allison', 'ava', 'female'],
    ),
    ConciergeVoicePreset(
      id: 'en_us_m',
      ttsLocale: 'en-US',
      gender: ConciergeVoiceGender.male,
      nameHints: ['aaron', 'fred', 'male', 'alex'],
    ),
    ConciergeVoicePreset(
      id: 'en_gb_f',
      ttsLocale: 'en-GB',
      gender: ConciergeVoiceGender.female,
      nameHints: ['martha', 'kate', 'serena', 'female'],
    ),
    ConciergeVoicePreset(
      id: 'en_gb_m',
      ttsLocale: 'en-GB',
      gender: ConciergeVoiceGender.male,
      nameHints: ['daniel', 'arthur', 'male', 'tom'],
    ),
    ConciergeVoicePreset(
      id: 'ru_f',
      ttsLocale: 'ru-RU',
      gender: ConciergeVoiceGender.female,
      nameHints: ['milena', 'katya', 'female'],
    ),
    ConciergeVoicePreset(
      id: 'ru_m',
      ttsLocale: 'ru-RU',
      gender: ConciergeVoiceGender.male,
      nameHints: ['yuri', 'male'],
    ),
    ConciergeVoicePreset(
      id: 'es_f',
      ttsLocale: 'es-ES',
      gender: ConciergeVoiceGender.female,
      nameHints: ['monica', 'paulina', 'female'],
    ),
    ConciergeVoicePreset(
      id: 'es_m',
      ttsLocale: 'es-ES',
      gender: ConciergeVoiceGender.male,
      nameHints: ['jorge', 'male', 'diego'],
    ),
    ConciergeVoicePreset(
      id: 'fr_f',
      ttsLocale: 'fr-FR',
      gender: ConciergeVoiceGender.female,
      nameHints: ['amelie', 'audrey', 'female'],
    ),
    ConciergeVoicePreset(
      id: 'fr_m',
      ttsLocale: 'fr-FR',
      gender: ConciergeVoiceGender.male,
      nameHints: ['thomas', 'male', 'jacques'],
    ),
    ConciergeVoicePreset(
      id: 'de_f',
      ttsLocale: 'de-DE',
      gender: ConciergeVoiceGender.female,
      nameHints: ['anna', 'helena', 'female'],
    ),
    ConciergeVoicePreset(
      id: 'de_m',
      ttsLocale: 'de-DE',
      gender: ConciergeVoiceGender.male,
      nameHints: ['markus', 'male', 'martin'],
    ),
  ];

  static ConciergeVoicePreset byId(String id) =>
      all.firstWhere((p) => p.id == id, orElse: () => all.first);

  static String localeForAppLanguage(String code) => switch (code) {
        'en' => 'en-US',
        'es' => 'es-ES',
        'fr' => 'fr-FR',
        'de' => 'de-DE',
        'it' => 'it-IT',
        'pt' => 'pt-BR',
        'ru' => 'ru-RU',
        'ja' => 'ja-JP',
        'ko' => 'ko-KR',
        'zh' => 'zh-CN',
        'hi' => 'hi-IN',
        'tr' => 'tr-TR',
        _ => 'en-US',
      };
}
