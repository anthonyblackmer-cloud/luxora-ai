import 'package:flutter/foundation.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _prefsKey = 'luxora_discover_radius';

/// Persisted “how far from Orlando” filter for Feed, Map, and Gems.
class DiscoverRadiusController extends ChangeNotifier {
  DiscoverRadiusController._();
  static final DiscoverRadiusController instance = DiscoverRadiusController._();

  DiscoverRadius _radius = DiscoverRadius.miles50;

  DiscoverRadius get radius => _radius;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _radius = DiscoverRadius.fromStored(prefs.getString(_prefsKey));
    notifyListeners();
  }

  Future<void> setRadius(DiscoverRadius value) async {
    if (_radius == value) {
      return;
    }
    _radius = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, value.name);
  }
}
