import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:luxora_ai/models/unsplash_photo.dart';
import 'package:luxora_ai/services/unsplash_config.dart';

/// Triggers Unsplash download tracking per API guidelines.
class UnsplashDownloadTracker {
  UnsplashDownloadTracker({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  final Set<String> _triggeredThisSession = {};

  /// Call when user views/saves/selects/applies a photo in trip, itinerary, etc.
  Future<void> trackUsage(UnsplashPhoto photo, {bool force = false}) async {
    if (!UnsplashConfig.hasAccessKey) {
      return;
    }
    // Browser CORS blocks Client-ID pings to api.unsplash.com; mobile/desktop OK.
    if (kIsWeb) {
      return;
    }
    if (!force && _triggeredThisSession.contains(photo.id)) {
      return;
    }
    _triggeredThisSession.add(photo.id);

    final uri = Uri.parse(photo.downloadLocation);
    try {
      await _client.get(
        uri,
        headers: {
          'Authorization': 'Client-ID ${UnsplashConfig.accessKey}',
          'Accept-Version': 'v1',
        },
      );
    } catch (_) {
      // Non-blocking — attribution + hotlink still required if this fails.
    }
  }
}
