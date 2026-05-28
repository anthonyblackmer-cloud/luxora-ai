import 'package:flutter/material.dart';
import 'package:luxora_ai/settings/luxora_language_catalog.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _localeKey = 'luxora_locale';
const _themePresetKey = 'luxora_theme_preset';

class LuxoraAppState extends ChangeNotifier {
  LuxoraAppState() {
    _locale = _initialLocaleFromDevice();
  }

  String _locale = 'en';
  LuxThemePreset _themePreset = LuxThemePreset.goldenEmber;
  bool _loaded = false;

  String get locale => _locale;
  LuxThemePreset get themePreset => _themePreset;
  LuxThemePalette get themePalette => paletteFor(_themePreset);
  bool get isLoaded => _loaded;

  ThemeData get theme => buildLuxTheme(_themePreset);

  static String _initialLocaleFromDevice() {
    final lang =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    if (LuxoraLanguageCatalog.supportedCodes.contains(lang)) {
      return lang;
    }
    return 'en';
  }

  static LuxoraAppState of(BuildContext context, {bool listen = true}) {
    return Provider.of<LuxoraAppState>(context, listen: listen);
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final storedLocale = prefs.getString(_localeKey);
    if (storedLocale != null &&
        LuxoraLanguageCatalog.supportedCodes.contains(storedLocale)) {
      _locale = storedLocale;
    }
    final rawPreset = prefs.getString(_themePresetKey);
    if (rawPreset != null) {
      _themePreset = LuxThemePreset.values.firstWhere(
        (v) => v.name == rawPreset,
        orElse: () => LuxThemePreset.goldenEmber,
      );
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> setLocale(String code) async {
    if (!LuxoraLanguageCatalog.supportedCodes.contains(code)) {
      return;
    }
    _locale = code;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, code);
  }

  Future<void> setThemePreset(LuxThemePreset preset) async {
    if (_themePreset == preset) return;
    _themePreset = preset;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themePresetKey, preset.name);
  }
}
