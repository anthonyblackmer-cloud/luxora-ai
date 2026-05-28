import 'package:flutter/material.dart';
import 'package:luxora_ai/settings/luxora_language_catalog.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _localeKey = 'luxora_locale';
const _darkModeKey = 'luxora_dark_mode';

class LuxoraAppState extends ChangeNotifier {
  LuxoraAppState() {
    _locale = _initialLocaleFromDevice();
  }

  String _locale = 'en';
  bool _isDarkMode = true;
  bool _loaded = false;

  String get locale => _locale;
  bool get isDarkMode => _isDarkMode;
  bool get isLoaded => _loaded;

  ThemeData get theme => _isDarkMode ? buildLuxTheme() : buildLuxLightTheme();

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
    _isDarkMode = prefs.getBool(_darkModeKey) ?? true;
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

  Future<void> setDarkMode(bool value) async {
    _isDarkMode = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, value);
  }

  void toggleTheme() => setDarkMode(!_isDarkMode);
}
