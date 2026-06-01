import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:luxora_ai/models/concierge/concierge_device_voice.dart';
import 'package:luxora_ai/models/concierge/concierge_voice_preset.dart';
import 'package:luxora_ai/services/concierge_voice_settings_store.dart';
import 'package:speech_to_text/speech_to_text.dart';

class _DeviceVoice {
  const _DeviceVoice({
    required this.name,
    required this.locale,
    this.identifier,
  });

  final String name;
  final String locale;
  final String? identifier;

  ConciergeDeviceVoice toPublic() => ConciergeDeviceVoice(
        name: name,
        locale: locale,
        identifier: identifier,
      );
}

/// Picks the best transcript from partial/final STT callbacks and UI fallback.
String mergeVoiceTranscripts({
  String finalText = '',
  String partialText = '',
  String latestText = '',
  String fallback = '',
}) {
  for (final candidate in [finalText, latestText, partialText, fallback]) {
    final trimmed = candidate.trim();
    if (trimmed.isNotEmpty) return trimmed;
  }
  return '';
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
  bool _speaking = false;
  int _speakGeneration = 0;
  int _listenGeneration = 0;
  String _lastHeard = '';
  String _lastPartial = '';
  String _lastFinal = '';
  Completer<void>? _speakCompleter;
  List<_DeviceVoice> _deviceVoices = const [];

  VoidCallback? _onSessionEnded;
  VoidCallback? _onSpeakComplete;

  bool get isListening => _listening;
  bool get isSpeaking => _speaking;
  bool get isAvailable => _sttAvailable && !kIsWeb;

  /// Reloads voices from the OS — call when opening voice settings or after
  /// downloading new iPhone voice packs.
  Future<List<ConciergeDeviceVoice>> refreshDeviceVoices({
    String? languageCode,
    bool includeAllLanguages = false,
  }) async {
    if (kIsWeb) return const [];
    await initialize();
    _deviceVoices = await _loadDeviceVoices();
    return listDeviceVoices(
      languageCode: languageCode,
      includeAllLanguages: includeAllLanguages,
    );
  }

  List<ConciergeDeviceVoice> listDeviceVoices({
    String? languageCode,
    bool includeAllLanguages = false,
  }) {
    final voices = _deviceVoices.map((v) => v.toPublic()).toList()
      ..sort((a, b) {
        final locale = a.locale.compareTo(b.locale);
        if (locale != 0) return locale;
        return a.name.compareTo(b.name);
      });

    if (includeAllLanguages || languageCode == null) return voices;

    final lang = languageCode.toLowerCase().split('-').first;
    return voices.where((v) => v.matchesLanguage(lang)).toList();
  }

  Future<void> initialize() async {
    if (_initialized) return;
    await _settings.load();

    if (!kIsWeb) {
      await _tts.setSharedInstance(true);
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        await _tts.setIosAudioCategory(
          IosTextToSpeechAudioCategory.playback,
          [
            IosTextToSpeechAudioCategoryOptions.defaultToSpeaker,
            IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          ],
        );
        // iOS can hang forever when awaiting completion on some voices.
        await _tts.awaitSpeakCompletion(false);
      } else {
        await _tts.awaitSpeakCompletion(true);
      }
      await _tts.setPitch(1.02);
      await _tts.setVolume(1.0);
      _tts.setCompletionHandler(() async {
        _speaking = false;
        if (defaultTargetPlatform == TargetPlatform.iOS) {
          // Let the last syllables finish before chaining another utterance.
          await Future<void>.delayed(const Duration(milliseconds: 220));
        }
        final done = _onSpeakComplete;
        _onSpeakComplete = null;
        done?.call();
        _finishSpeakWait();
        if (defaultTargetPlatform == TargetPlatform.iOS) {
          unawaited(_prepareIosAudioAfterSpeech());
        }
      });
      _deviceVoices = await _loadDeviceVoices();
    }

    _sttAvailable = await _stt.initialize(
      onError: (error) {
        if (kDebugMode) {
          debugPrint('ConciergeVoice STT error: $error');
        }
      },
      onStatus: (status) {
        if (kDebugMode) {
          debugPrint('ConciergeVoice STT status: $status');
        }
        if (status == 'done' || status == 'notListening') {
          _listening = false;
          _onSessionEnded?.call();
        }
      },
    );
    _initialized = true;
  }

  static String scriptFromLines(Iterable<String> lines) {
    final parts = <String>[];
    for (final raw in lines) {
      final line = _normalizeForSpeech(raw);
      if (line.isNotEmpty) parts.add(line);
    }
    return parts.join(' ');
  }

  static String _normalizeForSpeech(String text) {
    return text
        .replaceAll('\n', ' ')
        .replaceAll('…', '.')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  /// Speaks [text] with the selected Luxora voice preset. Returns false on failure.
  Future<bool> speak(
    String text, {
    required String languageCode,
    VoidCallback? onComplete,
  }) async {
    final trimmed = _normalizeForSpeech(text);
    if (trimmed.isEmpty || kIsWeb) return false;
    try {
      await initialize();
      await _endSttSession();
      await stopSpeaking();
      final generation = _speakGeneration;
      await _configureIosAudioForSpeaking();
      await _applyVoice(languageCode: languageCode);
      _speakCompleter = Completer<void>();
      _onSpeakComplete = () {
        if (generation != _speakGeneration) return;
        onComplete?.call();
      };
      _speaking = true;
      final result = await _tts.speak(trimmed);
      if (generation != _speakGeneration) return false;
      if (result != 1) {
        _speaking = false;
        _onSpeakComplete = null;
        _finishSpeakWait();
        return false;
      }
      await _waitForSpeechEnd(trimmed, generation);
      return generation == _speakGeneration;
    } catch (_) {
      _speaking = false;
      _onSpeakComplete = null;
      _finishSpeakWait();
      return false;
    }
  }

  Future<void> _waitForSpeechEnd(String text, int generation) async {
    final completer = _speakCompleter;
    if (completer == null) return;
    final seconds = (text.length / 10).ceil().clamp(12, 180);
    try {
      await completer.future.timeout(Duration(seconds: seconds));
    } catch (_) {
      if (generation == _speakGeneration) {
        _speaking = false;
      }
    }
  }

  void _finishSpeakWait() {
    final completer = _speakCompleter;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
    _speakCompleter = null;
  }

  Future<bool> previewVoice({
    required String sample,
    required String languageCode,
  }) =>
      previewSample(sample: sample, languageCode: languageCode);

  /// Plays [sample] with a specific device voice or persona without saving it.
  Future<bool> previewSample({
    required String sample,
    required String languageCode,
    ConciergeDeviceVoice? deviceVoice,
    String? presetId,
  }) async {
    if (kIsWeb || sample.trim().isEmpty) return false;
    await initialize();
    await _endSttSession();
    await stopSpeaking();
    await _configureIosAudioForSpeaking();
    await _tts.setSpeechRate(_settings.speechRate);
    if (_deviceVoices.isEmpty) {
      _deviceVoices = await _loadDeviceVoices();
    }
    await _applyVoiceSelection(
      languageCode: languageCode,
      deviceVoice: deviceVoice,
      preset: presetId == null ? null : ConciergeVoicePresets.byId(presetId),
    );
    return speak(sample, languageCode: languageCode);
  }

  Future<void> stopSpeaking() async {
    _speakGeneration++;
    _speaking = false;
    _onSpeakComplete = null;
    _finishSpeakWait();
    await _tts.stop();
  }

  Future<void> _prepareIosAudioAfterSpeech() async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    await _configureIosAudioForListening();
  }

  /// Clears any in-flight STT session so mic can be used again after TTS.
  Future<void> _endSttSession() async {
    _listenGeneration++;
    _onSessionEnded = null;
    if (_stt.isListening || _listening) {
      try {
        await _stt.stop().timeout(const Duration(seconds: 2));
      } catch (_) {
        try {
          await _stt.cancel();
        } catch (_) {}
      }
    }
    _listening = false;
    _resetTranscript();
    await Future<void>.delayed(const Duration(milliseconds: 120));
  }

  Future<void> _configureIosAudioForListening() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) return;
    await _tts.setIosAudioCategory(
      IosTextToSpeechAudioCategory.playAndRecord,
      [
        IosTextToSpeechAudioCategoryOptions.defaultToSpeaker,
        IosTextToSpeechAudioCategoryOptions.allowBluetooth,
        IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
      ],
    );
  }

  Future<void> _configureIosAudioForSpeaking() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) return;
    await _tts.setIosAudioCategory(
      IosTextToSpeechAudioCategory.playback,
      [
        IosTextToSpeechAudioCategoryOptions.defaultToSpeaker,
        IosTextToSpeechAudioCategoryOptions.allowBluetooth,
      ],
    );
  }

  Future<bool> startListening({
    required String languageCode,
    required void Function(String text) onPartial,
    VoidCallback? onSessionEnded,
  }) async {
    if (kIsWeb) return false;
    await initialize();
    if (!_sttAvailable) return false;

    await stopSpeaking();
    await _endSttSession();
    await _configureIosAudioForListening();
    await Future<void>.delayed(const Duration(milliseconds: 80));

    final generation = _listenGeneration;
    _onSessionEnded = () {
      if (generation != _listenGeneration) return;
      onSessionEnded?.call();
    };
    final locale = await _resolveSttLocale(languageCode);
    _resetTranscript();
    _listening = true;

    final started = await _stt.listen(
      onResult: (result) {
        final words = result.recognizedWords.trim();
        if (words.isEmpty) return;

        _lastHeard = words;
        if (result.finalResult) {
          _lastFinal = words;
        } else {
          _lastPartial = words;
        }
        onPartial(words);
      },
      listenOptions: SpeechListenOptions(
        localeId: locale,
        listenMode: ListenMode.dictation,
        partialResults: true,
        cancelOnError: false,
        listenFor: const Duration(seconds: 60),
        pauseFor: const Duration(seconds: 4),
      ),
    );

    if (!started) {
      _listening = false;
      _resetTranscript();
      _onSessionEnded = null;
    }
    return started;
  }

  Future<String?> stopListeningAndTakeResult({String fallback = ''}) async {
    final backup = fallback.trim();

    if (_stt.isListening) {
      try {
        await _stt.stop().timeout(const Duration(seconds: 2));
      } catch (_) {
        try {
          await _stt.cancel();
        } catch (_) {}
      }
    } else if (_listening &&
        _lastFinal.isEmpty &&
        _lastHeard.isEmpty &&
        backup.isEmpty) {
      try {
        await _stt.cancel();
      } catch (_) {}
    }

    for (var i = 0; i < 8; i++) {
      if (_lastFinal.trim().isNotEmpty) break;
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }

    _listening = false;
    final words = mergeVoiceTranscripts(
      finalText: _lastFinal,
      partialText: _lastPartial,
      latestText: _lastHeard,
      fallback: backup,
    );
    _resetTranscript();
    _listenGeneration++;
    _onSessionEnded = null;
    return words.isEmpty ? null : words;
  }

  Future<void> cancelListening() async {
    await _endSttSession();
  }

  void dispose() {
    _tts.stop();
    _stt.stop();
  }

  void _resetTranscript() {
    _lastHeard = '';
    _lastPartial = '';
    _lastFinal = '';
  }

  Future<void> _applyVoice({required String languageCode}) async {
    await _settings.load();
    await _tts.setSpeechRate(_settings.speechRate);

    if (_deviceVoices.isEmpty) {
      _deviceVoices = await _loadDeviceVoices();
    }

    final customKey = _settings.deviceVoiceKey;
    if (customKey != null && customKey.isNotEmpty) {
      final custom = _voiceForStorageKey(customKey);
      if (custom != null && await _setDeviceVoice(custom)) return;
    }

    await _applyVoiceSelection(languageCode: languageCode);
  }

  Future<void> _applyVoiceSelection({
    required String languageCode,
    ConciergeDeviceVoice? deviceVoice,
    ConciergeVoicePreset? preset,
  }) async {
    if (deviceVoice != null) {
      if (await _setDeviceVoice(deviceVoice)) return;
      await _tts.setLanguage(deviceVoice.locale);
      return;
    }

    final active = preset ?? _settings.preset;
    final locale = active.matchesAppLanguage
        ? ConciergeVoicePresets.localeForAppLanguage(languageCode)
        : active.ttsLocale;

    if (active.matchesAppLanguage) {
      final luxora = _pickLuxoraDefaultVoice(locale);
      if (luxora != null && await _setDeviceVoiceInternal(luxora)) return;
    }

    final picked = _pickDeviceVoice(active, locale);
    if (picked != null && await _setDeviceVoiceInternal(picked)) return;
    await _tts.setLanguage(locale);
  }

  _DeviceVoice? _pickLuxoraDefaultVoice(String locale) {
    if (_deviceVoices.isEmpty) return null;

    bool isPremiumOrEnhanced(String name) {
      final n = name.toLowerCase();
      return n.contains('premium') || n.contains('enhanced');
    }

    bool isKate(String name) => name.toLowerCase().contains('kate');

    bool isPremiumFemale(_DeviceVoice voice) =>
        _matchesGender(voice.name, ConciergeVoiceGender.female) &&
        isPremiumOrEnhanced(voice.name) &&
        !_isCompactVoice(voice.name);

    _DeviceVoice? bestKate(Iterable<_DeviceVoice> voices) {
      _DeviceVoice? katePremium;
      _DeviceVoice? kateAny;
      for (final voice in voices) {
        if (!isKate(voice.name) || _isCompactVoice(voice.name)) continue;
        if (!_matchesGender(voice.name, ConciergeVoiceGender.female)) continue;
        kateAny ??= voice;
        if (isPremiumOrEnhanced(voice.name)) {
          katePremium = voice;
          break;
        }
      }
      return katePremium ?? kateAny;
    }

    final englishPool = _deviceVoices
        .where((v) => v.locale.toLowerCase().startsWith('en'))
        .where((v) => !_isCompactVoice(v.name))
        .toList();
    final kate = bestKate(englishPool);
    if (kate != null) return kate;

    final target = locale.toLowerCase();
    final lang = target.split('-').first;
    final localePool = _deviceVoices.where((v) {
      final l = v.locale.toLowerCase();
      if (l == target) return true;
      if (target.contains('-gb')) {
        return l.contains('gb') || l.contains('uk');
      }
      if (target.contains('-us')) {
        return l.contains('us') || (lang == 'en' && !l.contains('gb'));
      }
      return l.startsWith(lang);
    }).where((v) => !_isCompactVoice(v.name)).toList();

    final localeKate = bestKate(localePool);
    if (localeKate != null) return localeKate;

    for (final voice in localePool) {
      if (isPremiumFemale(voice)) return voice;
    }
    for (final voice in englishPool) {
      if (isPremiumFemale(voice)) return voice;
    }

    if (localePool.isEmpty) return null;
    return _bestVoiceFromPool(
      localePool,
      ConciergeVoicePresets.byId('match_app'),
    );
  }

  ConciergeDeviceVoice? _voiceForStorageKey(String key) {
    for (final voice in _deviceVoices) {
      if (voice.toPublic().storageKey == key) {
        return voice.toPublic();
      }
    }
    return null;
  }

  Future<bool> _setDeviceVoice(ConciergeDeviceVoice voice) async {
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS &&
          voice.identifier != null &&
          voice.identifier!.isNotEmpty) {
        final byId = await _tts.setVoice({'identifier': voice.identifier!});
        if (byId == 1) return true;
      }

      final byName = await _tts.setVoice({
        'name': voice.name,
        'locale': voice.locale,
      });
      if (byName == 1) return true;

      if (voice.identifier != null && voice.identifier!.isNotEmpty) {
        final byId = await _tts.setVoice({'identifier': voice.identifier!});
        if (byId == 1) return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  Future<bool> _setDeviceVoiceInternal(_DeviceVoice voice) =>
      _setDeviceVoice(voice.toPublic());

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

    final pool = _deviceVoices
        .where(localeMatches)
        .where((voice) => !_isCompactVoice(voice.name))
        .toList();
    if (pool.isEmpty) {
      final fallback = _deviceVoices.where(localeMatches).toList();
      if (fallback.isEmpty) return null;
      return _bestVoiceFromPool(fallback, preset);
    }

    return _bestVoiceFromPool(pool, preset);
  }

  bool _isCompactVoice(String name) {
    final n = name.toLowerCase();
    return n.contains('compact') || n.contains('low quality');
  }

  _DeviceVoice? _bestVoiceFromPool(
    List<_DeviceVoice> pool,
    ConciergeVoicePreset preset,
  ) {
    final sorted = List<_DeviceVoice>.from(pool)
      ..sort((a, b) {
        int rank(String name) {
          final n = name.toLowerCase();
          if (n.contains('premium') || n.contains('enhanced')) return 0;
          if (n.contains('compact')) return 2;
          return 1;
        }

        final byQuality = rank(a.name).compareTo(rank(b.name));
        if (byQuality != 0) return byQuality;
        return a.name.compareTo(b.name);
      });

    for (final hint in preset.nameHints) {
      final h = hint.toLowerCase();
      for (final voice in sorted) {
        if (voice.name.toLowerCase().contains(h)) return voice;
      }
    }

    for (final voice in sorted) {
      if (_matchesGender(voice.name, preset.gender)) return voice;
    }

    return sorted.first;
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
      'zoe',
      'karen',
      'moira',
      'tessa',
    ];
    const maleHints = [
      'male',
      'man',
      'aaron',
      'daniel',
      'yuri',
      'jorge',
      'thomas',
      'evan',
      'nathan',
      'gordon',
    ];
    final hints =
        gender == ConciergeVoiceGender.female ? femaleHints : maleHints;
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
        final identifier = item['identifier']?.toString();
        if (name.isEmpty || locale.isEmpty) continue;
        out.add(
          _DeviceVoice(
            name: name,
            locale: locale,
            identifier: identifier,
          ),
        );
      }
      return out;
    } catch (_) {
      return const [];
    }
  }

  Future<String?> _resolveSttLocale(String code) async {
    final locales = await _stt.locales();
    final preferred = _sttLocale(code);
    if (preferred == null) return null;
    if (locales.isEmpty) return preferred;

    for (final locale in locales) {
      if (locale.localeId == preferred) return preferred;
    }

    final lang = code.toLowerCase();
    for (final locale in locales) {
      if (locale.localeId.toLowerCase().startsWith(lang)) {
        return locale.localeId;
      }
    }
    return preferred;
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
