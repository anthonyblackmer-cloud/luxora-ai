import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/google_place_enrichment.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/google_places_api_client.dart';
import 'package:luxora_ai/services/google_places_config.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Resolves curated [LuxPlace] rows to Google Places photos, websites, and map links.
class GooglePlacesEnrichmentService extends ChangeNotifier {
  GooglePlacesEnrichmentService._();

  static final GooglePlacesEnrichmentService instance =
      GooglePlacesEnrichmentService._();

  static const _prefsKey = 'luxora_google_places_enrichment_v1';

  final GooglePlacesApiClient _client = GooglePlacesApiClient();
  final Map<String, GooglePlaceEnrichment> _cache = {};
  final Map<String, Future<GooglePlaceEnrichment?>> _inFlight = {};
  bool _loaded = false;

  bool get isAvailable => GooglePlacesConfig.isConfigured;

  GooglePlaceEnrichment? cached(String luxPlaceId) => _cache[luxPlaceId];

  String? websiteFor(LuxPlace place) {
    final direct = place.website?.trim();
    if (direct != null && direct.isNotEmpty) {
      return direct;
    }
    return _cache[place.id]?.websiteUri;
  }

  String? heroPhotoUrlFor(LuxPlace place) => _cache[place.id]?.heroPhotoUrl;

  Future<void> load() async {
    if (_loaded || !isAvailable) {
      _loaded = true;
      return;
    }
    _loaded = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_prefsKey);
      if (raw == null || raw.isEmpty) {
        return;
      }
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      for (final entry in decoded.entries) {
        final value = entry.value;
        if (value is! Map<String, dynamic>) {
          continue;
        }
        _cache[entry.key] = GooglePlaceEnrichment.fromJson(value);
      }
    } catch (e, st) {
      debugPrint('GooglePlacesEnrichmentService.load failed: $e\n$st');
    }
  }

  void scheduleEnrich(LuxPlace place) {
    if (!isAvailable || place.moodTags.contains('trip-cover')) {
      return;
    }
    if (_cache.containsKey(place.id) || _inFlight.containsKey(place.id)) {
      return;
    }
    final future = enrich(place);
    _inFlight[place.id] = future;
    future.whenComplete(() => _inFlight.remove(place.id));
  }

  Future<GooglePlaceEnrichment?> enrich(LuxPlace place) async {
    if (!isAvailable || place.moodTags.contains('trip-cover')) {
      return null;
    }
    final existing = _cache[place.id];
    if (existing != null) {
      return existing;
    }

    try {
      final query = _textQueryFor(place);
      final results = await _client.searchText(
        query,
        maxResults: 5,
        latitude: place.latitude,
        longitude: place.longitude,
      );
      final match = _pickBestMatch(results, place);
      if (match == null) {
        return null;
      }

      String? heroPhotoUrl;
      String? photoAttribution;
      if (match.photos.isNotEmpty) {
        final photo = match.photos.first;
        heroPhotoUrl = (await _client.photoUri(photo.name)).toString();
        photoAttribution = photo.primaryAttribution;
      }

      final enrichment = GooglePlaceEnrichment(
        luxPlaceId: place.id,
        googlePlaceId: match.id,
        websiteUri: match.websiteUri,
        heroPhotoUrl: heroPhotoUrl,
        photoAttribution: photoAttribution,
        googleMapsUri: match.googleMapsUri,
      );
      _cache[place.id] = enrichment;
      notifyListeners();
      await _persist();
      return enrichment;
    } catch (e, st) {
      debugPrint('GooglePlaces enrich ${place.id} failed: $e\n$st');
      return null;
    }
  }

  String _textQueryFor(LuxPlace place) {
    final title = place.title.trim();
    final location = place.location.trim();
    if (location.isEmpty) {
      return title;
    }
    if (location.toLowerCase().contains(title.toLowerCase())) {
      return location;
    }
    return '$title $location';
  }

  GooglePlaceSummary? _pickBestMatch(
    List<GooglePlaceSummary> results,
    LuxPlace place,
  ) {
    if (results.isEmpty) {
      return null;
    }
    GooglePlaceSummary? best;
    var bestMiles = double.infinity;
    for (final candidate in results) {
      final lat = candidate.latitude;
      final lng = candidate.longitude;
      if (lat == null || lng == null) {
        continue;
      }
      final miles = PlaceDistance.milesBetween(
        LatLng(place.latitude, place.longitude),
        LatLng(lat, lng),
      );
      if (miles < bestMiles) {
        bestMiles = miles;
        best = candidate;
      }
    }
    return best ?? results.first;
  }

  Future<void> _persist() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final payload = {
        for (final entry in _cache.entries) entry.key: entry.value.toJson(),
      };
      await prefs.setString(_prefsKey, jsonEncode(payload));
    } catch (e, st) {
      debugPrint('GooglePlacesEnrichmentService persist failed: $e\n$st');
    }
  }
}
