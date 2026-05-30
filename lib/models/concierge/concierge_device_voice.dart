/// One on-device TTS voice reported by iOS/Android (including downloaded packs).
class ConciergeDeviceVoice {
  const ConciergeDeviceVoice({
    required this.name,
    required this.locale,
    this.identifier,
  });

  final String name;
  final String locale;
  final String? identifier;

  /// Stable key for persistence — identifier when the OS provides one.
  String get storageKey =>
      (identifier != null && identifier!.trim().isNotEmpty)
          ? identifier!.trim()
          : '$locale|$name';

  String displayLabel({String? qualityHint}) {
    if (qualityHint == null || qualityHint.isEmpty) return name;
    return '$name · $qualityHint';
  }

  bool matchesLanguage(String languageCode) {
    final lang = languageCode.toLowerCase().split('-').first;
    final voiceLang = locale.toLowerCase().split('-').first;
    return voiceLang == lang;
  }

  String? get qualityHint {
    final lower = name.toLowerCase();
    if (lower.contains('premium') || lower.contains('enhanced')) {
      return 'Premium';
    }
    if (lower.contains('compact')) return 'Compact';
    return null;
  }
}
