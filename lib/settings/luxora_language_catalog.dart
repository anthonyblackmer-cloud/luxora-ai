/// Supported app locales — same set as Discipline AI.
abstract final class LuxoraLanguageCatalog {
  static const supportedCodes = [
    'en',
    'es',
    'fr',
    'de',
    'zh',
    'ko',
    'ja',
    'ru',
    'it',
    'hi',
    'pt',
    'tr',
  ];

  static const nativeNames = <String, String>{
    'en': 'English',
    'es': 'Español',
    'fr': 'Français',
    'de': 'Deutsch',
    'zh': '简体中文',
    'ko': '한국어',
    'ja': '日本語',
    'ru': 'Русский',
    'it': 'Italiano',
    'hi': 'हिन्दी',
    'pt': 'Português',
    'tr': 'Türkçe',
  };

  static const englishNames = <String, String>{
    'en': 'English',
    'es': 'Spanish',
    'fr': 'French',
    'de': 'German',
    'zh': 'Chinese (Simplified)',
    'ko': 'Korean',
    'ja': 'Japanese',
    'ru': 'Russian',
    'it': 'Italian',
    'hi': 'Hindi',
    'pt': 'Portuguese',
    'tr': 'Turkish',
  };

  static const flagEmojis = <String, String>{
    'en': '🇺🇸',
    'es': '🇪🇸',
    'fr': '🇫🇷',
    'de': '🇩🇪',
    'zh': '🇨🇳',
    'ko': '🇰🇷',
    'ja': '🇯🇵',
    'ru': '🇷🇺',
    'it': '🇮🇹',
    'hi': '🇮🇳',
    'pt': '🇵🇹',
    'tr': '🇹🇷',
  };

  static String flagEmoji(String code) => flagEmojis[code] ?? '🌐';

  static String displayName(String code) => nativeNames[code] ?? code;

  static String primaryLabel(String code, String uiLocale) =>
      uiLocale == 'en' ? (englishNames[code] ?? displayName(code)) : displayName(code);

  static String? secondaryLabel(String code, String uiLocale) {
    final primary = primaryLabel(code, uiLocale);
    final native = displayName(code);
    return primary == native ? null : native;
  }
}
