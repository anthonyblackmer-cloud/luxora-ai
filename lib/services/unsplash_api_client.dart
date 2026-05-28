import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:luxora_ai/models/unsplash_photo.dart';
import 'package:luxora_ai/services/unsplash_config.dart';

/// Fetches photo metadata from the Unsplash API (not image bytes).
class UnsplashApiClient {
  UnsplashApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Map<String, String> get _headers => {
        'Authorization': 'Client-ID ${UnsplashConfig.accessKey}',
        'Accept-Version': 'v1',
      };

  Future<UnsplashPhoto> getPhoto(String photoId) async {
    if (!UnsplashConfig.hasAccessKey) {
      throw StateError('UNSPLASH_ACCESS_KEY is not configured');
    }
    final uri = Uri.parse('${UnsplashConfig.apiBase}/photos/$photoId');
    final response = await _client.get(uri, headers: _headers);
    if (response.statusCode != 200) {
      throw Exception(
        'Unsplash GET /photos/$photoId failed: ${response.statusCode}',
      );
    }
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return UnsplashPhoto.fromApiJson(json);
  }

  Future<List<UnsplashPhoto>> getPhotos(Iterable<String> photoIds) async {
    final results = <UnsplashPhoto>[];
    for (final id in photoIds) {
      results.add(await getPhoto(id));
    }
    return results;
  }
}
