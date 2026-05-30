import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:luxora_ai/models/concierge/concierge_voice_preset.dart';
import 'package:luxora_ai/services/concierge_voice_settings_store.dart';
import 'package:speech_to_text/speech_to_text.dart';

class _DeviceVoice {
  const _DeviceVoice({required this.name, required this.locale});

  final String name;
  final String locale;
}

/// On-device voice in/out for the Concierge tab (TTS replies + hold-to-speak).
class ConciergeVoiceService {
  ConciergeVoiceService._();

  static final ConciergeVoiceService instance = ConciergeVoiceService._();

  final FlutterTts _tts = FlutterTts();
  final SpeechToText _stt = SpeechToText();
  final ConciergeVoiceSettingsStore _settings =
      ConciergeVoiceSettingsStore.instance;

  bool _initialized = false;
  bool _sttAvailable = false;
  bool _listening = false;
  String _lastHeard = '';
  List<_DeviceVoice> _deviceVoices = const [];

  bool get isListening => _listening;
  bool get isAvailable => _sttAvailable || !kIsWeb;

  Future<void> initialize() async {
    if (_initialized) return;
    await _settings.load();
    await _tts.awaitSpeakCompletion(true);
    await _tts.setPitch(1.02);
    await _tts.setVolume(1.0);
    _deviceVoices = await _loadDeviceVoices();
    _sttAvailable = await _stt.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          _listening = false;
        }
      },
      onError: (_) => _listening = false,
    );
    _initialized = true;
  }

  Future<void> speak(String text, {required String languageCode}) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || kIsWeb) return;
    await initialize();
    await stopSpeaking();
    await _applyVoice(languageCode: languageCode);
    await _tts.speak(trimmed);
  }

  Future<void> previewVoice({required String sample, required String languageCode}) async {
    if (kIsWeb || sample.trim().isEmpty) return;
    await speak(sample, languageCode: languageCode);
  }

  Future<void> stopSpeaking() async {
    await _tts.stop();
  }

  Future<bool> startListening({
    required String languageCode,
    required void Function(String text) onPartial,
  }) async {
    if (kIsWeb) return false;
    await initialize();
    if (!_sttAvailable) return false;
    await stopSpeaking();
    final locale = _sttLocale(languageCode);
    _listening = true;
    _lastHeard = '';
    await _stt.listen(
      onResult: (result) {
        _lastHeard = result.recognizedWords;
        onPartial(_lastHeard);
      },
      listenOptions: SpeechListenOptions(
        localeId: locale,
        listenMode: ListenMode.dictation,
        partialResults: true,
        cancelOnError: true,
      ),
    );
    return _stt.isListening;
  }

  Future<String?> stopListeningAndTakeResult() async {
    if (!_listening) return null;
    await _stt.stop();
    _listening = false;
    final words = _lastHeard.trim();
    _lastHeard = '';
    return words.isEmpty ? null : words;
  }

  Future<void> cancelListening() async {
    if (_listening) {
      await _stt.cancel();
      _listening = false;
      _lastHeard = '';
    }
  }

  void dispose() {
    _tts.stop();
    _stt.stop();
  }

  Future<void> _applyVoice({required String languageCode}) async {
    await _settings.load();
    final preset = _settings.preset;
    final locale = preset.matchesAppLanguage
        ? ConciergeVoicePresets.localeForAppLanguage(languageCode)
        : preset.ttsLocale;

    await _tts.setSpeechRate(_settings.speechRate);

    final picked = _pickDeviceVoice(preset, locale);
    if (picked != null) {
      await _tts.setVoice({'name': picked.name, 'locale': picked.locale});
      return;
    }
    await _tts.setLanguage(locale);
  }

  _DeviceVoice? _pickDeviceVoice(ConciergeVoicePreset preset, String locale) {
    if (_deviceVoices.isEmpty) return null;

    final target = locale.toLowerCase();
    final lang = target.split('-').first;

    bool localeMatches(_DeviceVoice v) {
      final l = v.locale.toLowerCase();
      if (l == target) return true;
      if (preset.ttsLocale.isEmpty) return l.startsWith(lang);
      if (target.contains('-gb')) {
        return l.contains('gb') || l.contains('uk');
      }
      if (target.contains('-us')) {
        return l.contains('us') || (lang == 'en' && !l.contains('gb'));
      }
      return l.startsWith(lang);
    }

    final pool = _deviceVoices.where(localeMatches).toList();
    if (pool.isEmpty) return null;

    for (final hint in preset.nameHints) {
      final h = hint.toLowerCase();
      for (final voice in pool) {
        if (voice.name.toLowerCase().contains(h)) return voice;
      }
    }

    for (final voice in pool) {
      if (_matchesGender(voice.name, preset.gender)) return voice;
    }

    return pool.first;
  }

  bool _matchesGender(String name, ConciergeVoiceGender gender) {
    final n = name.toLowerCase();
    const femaleHints = [
      'female',
      'woman',
      'samantha',
      'nicky',
      'martha',
      'kate',
      'milena',
      'monica',
      'amelie',
      'anna',
    ];
    const maleHints = ['male', 'man', 'aaron', 'daniel', 'yuri', 'jorge', 'thomas'];
    final hints = gender == ConciergeVoiceGender.female ? femaleHints : maleHints;
    return hints.any(n.contains);
  }

  Future<List<_DeviceVoice>> _loadDeviceVoices() async {
    if (kIsWeb) return const [];
    try {
      final raw = await _tts.getVoices;
      if (raw is! List) return const [];
      final out = <_DeviceVoice>[];
      for (final item in raw) {
        if (item is! Map) continue;
        final name = item['name']?.toString() ?? '';
        final locale = (item['locale'] ?? item['language'])?.toString() ?? '';
        if (name.isEmpty || locale.isEmpty) continue;
        out.add(_DeviceVoice(name: name, locale: locale));
      }
      return out;
    } catch (_) {
      return const [];
    }
  }

  String? _sttLocale(String code) => switch (code) {
        'en' => 'en_US',
        'es' => 'es_ES',
        'fr' => 'fr_FR',
        'de' => 'de_DE',
        'it' => 'it_IT',
        'pt' => 'pt_BR',
        'ru' => 'ru_RU',
        'ja' => 'ja_JP',
        'ko' => 'ko_KR',
        'zh' => 'zh_CN',
        'hi' => 'hi_IN',
        'tr' => 'tr_TR',
        _ => 'en_US',
      };
}
