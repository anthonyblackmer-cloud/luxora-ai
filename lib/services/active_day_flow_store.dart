import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/day_flow_codec.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _key = 'luxora_active_day_flows_v1';

/// Concierge-built day agenda — same [DayFlow] the Map share card uses.
class ActiveDayFlowStore extends ChangeNotifier {
  ActiveDayFlowStore._();

  static final ActiveDayFlowStore instance = ActiveDayFlowStore._();

  final Map<String, Map<String, dynamic>> _snapshots = {};
  bool _loaded = false;
  int _revision = 0;

  /// Bumps whenever [save] replaces a city's flow — Map uses this to refresh.
  int get revision => _revision;

  DayFlow? flowFor(String cityId) {
    final raw = _snapshots[cityId];
    if (raw == null) return null;
    return DayFlowCodec.decode(raw);
  }

  DayFlow? flowForActiveCity() =>
      flowFor(CityPackRegistry.instance.active.cityId);

  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      if (raw == null) return;
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      _snapshots
        ..clear()
        ..addAll(decoded.map((k, v) => MapEntry(k, v as Map<String, dynamic>)));
    } catch (_) {}
  }

  Future<void> save(DayFlow flow, {required String cityId}) async {
    if (flow.isEmpty) return;
    await load();
    _snapshots[cityId] = DayFlowCodec.encode(flow);
    _revision++;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, jsonEncode(_snapshots));
    } catch (_) {}
  }
}
