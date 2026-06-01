/// Google Places API (New) — from `--dart-define-from-file=config/unsplash.local.json`
/// (see `config/unsplash.local.json.example`).
abstract final class GooglePlacesConfig {
  static const apiKey = String.fromEnvironment(
    'GOOGLE_PLACES_API_KEY',
    defaultValue: '',
  );

  static bool get isConfigured => apiKey.isNotEmpty;

  static const apiBase = 'https://places.googleapis.com/v1';
}
