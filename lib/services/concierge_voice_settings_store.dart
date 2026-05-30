import 'package:flutter/foundation.dart';
import 'package:luxora_ai/models/concierge/concierge_voice_preset.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _presetKey = 'luxora_concierge_voice_preset_v1';
const _rateKey = 'luxora_concierge_voice_rate_v1';

/// Persisted Luxora voice persona + speaking pace.
class ConciergeVoiceSettingsStore extends ChangeNotifier {
  ConciergeVoiceSettingsStore._();

  static final ConciergeVoiceSettingsStore instance =
      ConciergeVoiceSettingsStore._();

  String _presetId = ConciergeVoicePresets.defaultId;
  double _speechRate = 0.46;
  bool _loaded = false;

  String get presetId => _presetId;
  double get speechRate => _speechRate;

  ConciergeVoicePreset get preset => ConciergeVoicePresets.byId(_presetId);

  Future<void> load() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    _presetId = prefs.getString(_presetKey) ?? ConciergeVoicePresets.defaultId;
    _speechRate = prefs.getDouble(_rateKey) ?? 0.46;
    if (!ConciergeVoicePresets.all.any((p) => p.id == _presetId)) {
      _presetId = ConciergeVoicePresets.defaultId;
    }
    _loaded = true;
  }

  Future<void> setPreset(String id) async {
    await load();
    if (_presetId == id) return;
    _presetId = id;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_presetKey, id);
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
