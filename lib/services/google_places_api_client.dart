import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:luxora_ai/services/google_places_config.dart';

/// Lightweight client for [Places API (New)](https://developers.google.com/maps/documentation/places/web-service/op-overview).
class GooglePlacesApiClient {
  GooglePlacesApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Map<String, String> _headers({required String fieldMask}) => {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': GooglePlacesConfig.apiKey,
        'X-Goog-FieldMask': fieldMask,
      };

  void _ensureConfigured() {
    if (!GooglePlacesConfig.isConfigured) {
      throw StateError('GOOGLE_PLACES_API_KEY is not configured');
    }
  }

  /// Text search — e.g. "Luma on Park Winter Park FL".
  Future<List<GooglePlaceSummary>> searchText(
    String textQuery, {
    int maxResults = 5,
    double? latitude,
    double? longitude,
    double radiusMeters = 5000,
  }) async {
    _ensureConfigured();
    final uri = Uri.parse('${GooglePlacesConfig.apiBase}/places:searchText');
    final body = <String, dynamic>{
      'textQuery': textQuery,
      'maxResultCount': maxResults,
    };
    if (latitude != null && longitude != null) {
      body['locationBias'] = {
        'circle': {
          'center': {'latitude': latitude, 'longitude': longitude},
          'radius': radiusMeters,
        },
      };
    }
    final response = await _client.post(
      uri,
      headers: _headers(
        fieldMask: 'places.id,places.displayName,places.formattedAddress,'
            'places.location,places.googleMapsUri,places.websiteUri,'
            'places.photos,places.photos.authorAttributions',
      ),
      body: jsonEncode(body),
    );
    if (response.statusCode != 200) {
      throw Exception(
        'Places searchText failed: ${response.statusCode} ${response.body}',
      );
    }
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final places = json['places'] as List<dynamic>? ?? const [];
    return [
      for (final raw in places)
        GooglePlaceSummary.fromJson(raw as Map<String, dynamic>),
    ];
  }

  /// Fetch one place by resource id — e.g. `places/ChIJ...`.
  Future<GooglePlaceSummary> getPlace(String placeId) async {
    _ensureConfigured();
    final resourceId = placeId.startsWith('places/') ? placeId : 'places/$placeId';
    final uri = Uri.parse('${GooglePlacesConfig.apiBase}/$resourceId');
    final response = await _client.get(
      uri,
      headers: _headers(
        fieldMask: 'id,displayName,formattedAddress,location,googleMapsUri,'
            'websiteUri,photos,photos.authorAttributions',
      ),
    );
    if (response.statusCode != 200) {
      throw Exception(
        'Places getPlace failed: ${response.statusCode} ${response.body}',
      );
    }
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return GooglePlaceSummary.fromJson(json);
  }

  /// Photo media URL for a [GooglePlacePhoto.name] resource.
  ///
  /// Returns the redirect target (suitable for hero images). Pass [maxWidthPx]
  /// or [maxHeightPx] to control size.
  Future<Uri> photoUri(
    String photoResourceName, {
    int maxWidthPx = 1200,
  }) async {
    _ensureConfigured();
    final uri = Uri.parse(
      '${GooglePlacesConfig.apiBase}/$photoResourceName/media?maxWidthPx=$maxWidthPx',
    );
    final response = await _client.get(
      uri,
      headers: {'X-Goog-Api-Key': GooglePlacesConfig.apiKey},
    );
    if (response.statusCode != 302 && response.statusCode != 200) {
      throw Exception(
        'Places photo media failed: ${response.statusCode} ${response.body}',
      );
    }
    final resolved = response.headers['location'];
    if (resolved != null && resolved.isNotEmpty) {
      return Uri.parse(resolved);
    }
    return uri;
  }
}

class GooglePlaceSummary {
  const GooglePlaceSummary({
    required this.id,
    required this.displayName,
    this.formattedAddress,
    this.latitude,
    this.longitude,
    this.googleMapsUri,
    this.websiteUri,
    this.photos = const [],
  });

  factory GooglePlaceSummary.fromJson(Map<String, dynamic> json) {
    final location = json['location'] as Map<String, dynamic>?;
    final displayName = json['displayName'] as Map<String, dynamic>?;
    final photoList = json['photos'] as List<dynamic>? ?? const [];
    return GooglePlaceSummary(
      id: json['id'] as String? ?? '',
      displayName: displayName?['text'] as String? ?? '',
      formattedAddress: json['formattedAddress'] as String?,
      latitude: (location?['latitude'] as num?)?.toDouble(),
      longitude: (location?['longitude'] as num?)?.toDouble(),
      googleMapsUri: json['googleMapsUri'] as String?,
      websiteUri: json['websiteUri'] as String?,
      photos: [
        for (final raw in photoList)
          GooglePlacePhoto.fromJson(raw as Map<String, dynamic>),
      ],
    );
  }

  final String id;
  final String displayName;
  final String? formattedAddress;
  final double? latitude;
  final double? longitude;
  final String? googleMapsUri;
  final String? websiteUri;
  final List<GooglePlacePhoto> photos;
}

class GooglePlacePhoto {
  const GooglePlacePhoto({
    required this.name,
    this.widthPx,
    this.heightPx,
    this.authorAttributions = const [],
  });

  factory GooglePlacePhoto.fromJson(Map<String, dynamic> json) {
    final attributions = json['authorAttributions'] as List<dynamic>? ?? const [];
    return GooglePlacePhoto(
      name: json['name'] as String? ?? '',
      widthPx: json['widthPx'] as int?,
      heightPx: json['heightPx'] as int?,
      authorAttributions: [
        for (final raw in attributions)
          GooglePhotoAttribution.fromJson(raw as Map<String, dynamic>),
      ],
    );
  }

  final String name;
  final int? widthPx;
  final int? heightPx;
  final List<GooglePhotoAttribution> authorAttributions;

  String? get primaryAttribution {
    for (final attr in authorAttributions) {
      final label = attr.displayName?.trim();
      if (label != null && label.isNotEmpty) {
        return label;
      }
    }
    return null;
  }
}

class GooglePhotoAttribution {
  const GooglePhotoAttribution({this.displayName, this.uri});

  factory GooglePhotoAttribution.fromJson(Map<String, dynamic> json) {
    return GooglePhotoAttribution(
      displayName: json['displayName'] as String?,
      uri: json['uri'] as String?,
    );
  }

  final String? displayName;
  final String? uri;
}
