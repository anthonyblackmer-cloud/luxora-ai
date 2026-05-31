import 'package:flutter/foundation.dart';
import 'package:luxora_ai/models/concierge/concierge_voice_preset.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _presetKey = 'luxora_concierge_voice_preset_v1';
const _rateKey = 'luxora_concierge_voice_rate_v1';
const _deviceVoiceKey = 'luxora_concierge_device_voice_v1';

/// Persisted Luxora voice persona + speaking pace.
class ConciergeVoiceSettingsStore extends ChangeNotifier {
  ConciergeVoiceSettingsStore._();

  static final ConciergeVoiceSettingsStore instance =
      ConciergeVoiceSettingsStore._();

  String _presetId = ConciergeVoicePresets.defaultId;
  String? _deviceVoiceKeyValue;
  double _speechRate = 0.43;
  bool _loaded = false;

  String get presetId => _presetId;
  String? get deviceVoiceKey => _deviceVoiceKeyValue;
  double get speechRate => _speechRate;

  ConciergeVoicePreset get preset => ConciergeVoicePresets.byId(_presetId);
  bool get usesCustomDeviceVoice =>
      _deviceVoiceKeyValue != null && _deviceVoiceKeyValue!.isNotEmpty;

  Future<void> load() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    _presetId = prefs.getString(_presetKey) ?? ConciergeVoicePresets.defaultId;
    _deviceVoiceKeyValue = prefs.getString(_deviceVoiceKey);
    _speechRate = prefs.getDouble(_rateKey) ?? 0.43;
    if (!ConciergeVoicePresets.all.any((p) => p.id == _presetId)) {
      _presetId = ConciergeVoicePresets.defaultId;
    }
    _loaded = true;
  }

  Future<void> setPreset(String id) async {
    await load();
    final changedPreset = _presetId != id;
    final hadDevice = usesCustomDeviceVoice;
    if (!changedPreset && !hadDevice) return;
    _presetId = id;
    _deviceVoiceKeyValue = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_presetKey, id);
    await prefs.remove(_deviceVoiceKey);
  }

  Future<void> setDeviceVoice(String? storageKey) async {
    await load();
    final trimmed = storageKey?.trim();
    if (trimmed == _deviceVoiceKeyValue) return;
    _deviceVoiceKeyValue =
        (trimmed == null || trimmed.isEmpty) ? null : trimmed;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    if (_deviceVoiceKeyValue == null) {
      await prefs.remove(_deviceVoiceKey);
    } else {
      await prefs.setString(_deviceVoiceKey, _deviceVoiceKeyValue!);
    }
  }

  Future<void> setSpeechRate(double rate) async {
    await load();
    final clamped = rate.clamp(0.32, 0.62);
    if ((_speechRate - clamped).abs() < 0.001) return;
    _speechRate = clamped;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_rateKey, clamped);
  }
}
