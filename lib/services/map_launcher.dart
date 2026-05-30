import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

/// Which maps app to target when launching a place or directions.
enum MapsProvider { google, apple }

/// Opens places and directions in the device's native maps app.
///
/// Uses Google Maps universal URLs (`?api=1`) and Apple Maps URLs, both of
/// which resolve to the installed app on device (and the web client otherwise)
/// — no API key needed.
class MapLauncher {
  const MapLauncher._();

  /// Ensures external links have a scheme browsers can open.
  static String normalizeUrl(String url) {
    final trimmed = url.trim();
    if (trimmed.isEmpty) return '';
    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return trimmed;
    }
    return 'https://$trimmed';
  }

  /// Opens a map centered on the destination (a marker / place view).
  static Future<bool> openPlace({
    required double latitude,
    required double longitude,
    String? label,
    MapsProvider provider = MapsProvider.google,
  }) {
    final trimmed = label?.trim();
    final uri = switch (provider) {
      MapsProvider.google => Uri.parse(
          'https://www.google.com/maps/search/?api=1&query='
          '${trimmed != null && trimmed.isNotEmpty ? Uri.encodeComponent('$trimmed ($latitude,$longitude)') : '$latitude,$longitude'}',
        ),
      MapsProvider.apple => Uri.parse(
          'https://maps.apple.com/?ll=$latitude,$longitude'
          '${trimmed != null && trimmed.isNotEmpty ? '&q=${Uri.encodeComponent(trimmed)}' : ''}',
        ),
    };
    return _launch(uri);
  }

  /// Opens turn-by-turn directions to the destination from the user's
  /// current location.
  static Future<bool> openDirections({
    required double latitude,
    required double longitude,
    MapsProvider provider = MapsProvider.google,
  }) {
    final uri = switch (provider) {
      MapsProvider.google => Uri.parse(
          'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude',
        ),
      MapsProvider.apple => Uri.parse(
          'https://maps.apple.com/?daddr=$latitude,$longitude&dirflg=d',
        ),
    };
    return _launch(uri);
  }

  /// Opens an arbitrary external URL (hotel site, rates, partner link).
  static Future<bool> openUrl(String url) {
    final normalized = normalizeUrl(url);
    if (normalized.isEmpty) return Future.value(false);

    final uri = Uri.tryParse(normalized);
    if (uri == null || !uri.hasScheme) return Future.value(false);
    return _launch(uri);
  }

  static Future<bool> _launch(Uri uri) async {
    try {
      if (!await canLaunchUrl(uri)) {
        debugPrint('MapLauncher cannot launch $uri');
        return false;
      }

      final mode = kIsWeb
          ? LaunchMode.platformDefault
          : LaunchMode.externalApplication;

      return await launchUrl(
        uri,
        mode: mode,
        webOnlyWindowName: kIsWeb ? '_blank' : null,
      );
    } catch (error) {
      debugPrint('MapLauncher failed to open $uri: $error');
      return false;
    }
  }
}
