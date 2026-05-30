import 'dart:convert';

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/ticket_deal_catalog.dart';
import 'package:luxora_ai/services/supabase_config.dart';
import 'package:luxora_ai/services/ticket_deals_remote_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Loads ticket deals from bundled JSON, cached remote feeds, and live refresh.
class TicketDealsRepository extends ChangeNotifier {
  TicketDealsRepository._();

  static final TicketDealsRepository instance = TicketDealsRepository._();

  static const _cachePrefix = 'luxora_ticket_deals_cache_v1_';
  static const _refreshTtl = Duration(hours: 6);

  final Map<String, List<TicketDeal>> _dealsByCity = {};
  final Map<String, DateTime> _updatedAtByCity = {};
  final Map<String, String> _sourceByCity = {};

  bool _loaded = false;
  bool _refreshing = false;
  String? _lastRefreshError;

  bool get isRefreshing => _refreshing;
  String? get lastRefreshError => _lastRefreshError;

  DateTime? updatedAtFor(String cityId) => _updatedAtByCity[cityId];

  String sourceLabelFor(String cityId) => _sourceByCity[cityId] ?? 'bundled';

  List<TicketDeal> dealsForCity(String cityId) =>
      List.unmodifiable(_dealsByCity[cityId] ?? const []);

  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;

    for (final cityId in TicketDealsRemoteConfig.supportedCityIds) {
      await _hydrateCity(cityId);
    }
    notifyListeners();

    unawaited(refreshIfStale());
  }

  Future<void> refreshIfStale() async {
    if (!_hasRemoteSource) return;
    for (final cityId in TicketDealsRemoteConfig.supportedCityIds) {
      final updated = _updatedAtByCity[cityId];
      if (updated == null ||
          DateTime.now().difference(updated) > _refreshTtl) {
        await refresh(cityId: cityId);
      }
    }
  }

  Future<bool> refresh({String? cityId}) async {
    if (!_hasRemoteSource) return false;
    _refreshing = true;
    _lastRefreshError = null;
    notifyListeners();

    var anySuccess = false;
    final cities = cityId == null
        ? TicketDealsRemoteConfig.supportedCityIds
        : [cityId];

    try {
      for (final id in cities) {
        if (!TicketDealsRemoteConfig.hasBundledCatalog(id)) continue;
        final remote = await _fetchRemoteBundle(id);
        if (remote != null) {
          _applyBundle(remote, source: 'remote');
          await _persistCache(remote);
          anySuccess = true;
        }
      }
    } catch (e, st) {
      _lastRefreshError = e.toString();
      debugPrint('TicketDealsRepository.refresh: $e\n$st');
    } finally {
      _refreshing = false;
      notifyListeners();
    }
    return anySuccess;
  }

  Future<void> _hydrateCity(String cityId) async {
    TicketDealCatalogBundle? bundle;

    bundle = await _readCache(cityId);
    if (bundle != null) {
      _applyBundle(bundle, source: 'cache');
    }

    final bundled = await _loadBundled(cityId);
    if (bundled != null) {
      final cachedAt = _updatedAtByCity[cityId];
      if (cachedAt == null || bundled.updatedAt.isAfter(cachedAt)) {
        _applyBundle(bundled, source: 'bundled');
      }
    }
  }

  Future<TicketDealCatalogBundle?> _loadBundled(String cityId) async {
    try {
      final raw = await rootBundle.loadString(
        TicketDealsRemoteConfig.assetPathForCity(cityId),
      );
      return TicketDealCatalogBundle.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (e) {
      debugPrint('TicketDealsRepository bundled $cityId: $e');
      return null;
    }
  }

  Future<TicketDealCatalogBundle?> _readCache(String cityId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString('$_cachePrefix$cityId');
      if (raw == null) return null;
      return TicketDealCatalogBundle.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> _persistCache(TicketDealCatalogBundle bundle) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        '$_cachePrefix${bundle.cityId}',
        jsonEncode(bundle.toJson()),
      );
    } catch (_) {
      // SharedPreferences unavailable in tests.
    }
  }

  Future<TicketDealCatalogBundle?> _fetchRemoteBundle(String cityId) async {
    final url = _remoteUrlForCity(cityId);
    if (url == null) return null;

    final response = await http.get(Uri.parse(url)).timeout(
          const Duration(seconds: 12),
        );
    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode} for $url');
    }
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final bundle = TicketDealCatalogBundle.fromJson(decoded);
    if (bundle.cityId != cityId) {
      throw Exception('cityId mismatch: expected $cityId got ${bundle.cityId}');
    }
    return bundle;
  }

  String? _remoteUrlForCity(String cityId) {
    if (TicketDealsRemoteConfig.cdnBase.isNotEmpty) {
      final base = TicketDealsRemoteConfig.cdnBase.replaceAll(RegExp(r'/+$'), '');
      return '$base/deals_$cityId.json';
    }
    if (SupabaseConfig.isConfigured) {
      final base = SupabaseConfig.url.replaceAll(RegExp(r'/+$'), '');
      final bucket = TicketDealsRemoteConfig.storageBucket;
      return '$base/storage/v1/object/public/$bucket/deals_$cityId.json';
    }
    return null;
  }

  bool get _hasRemoteSource =>
      TicketDealsRemoteConfig.cdnBase.isNotEmpty ||
      SupabaseConfig.isConfigured;

  void _applyBundle(TicketDealCatalogBundle bundle, {required String source}) {
    final now = DateTime.now();
    final active = bundle.deals
        .where((d) => d.expiresAt.isAfter(now))
        .toList()
      ..sort((a, b) => b.savingsUsd.compareTo(a.savingsUsd));

    _dealsByCity[bundle.cityId] = active;
    _updatedAtByCity[bundle.cityId] = bundle.updatedAt.toLocal();
    _sourceByCity[bundle.cityId] = source;
  }
}
