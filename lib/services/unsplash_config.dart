/// Unsplash API access — from `--dart-define-from-file=config/unsplash.local.json`
/// (see `config/unsplash.local.json.example`).
abstract final class UnsplashConfig {
  static const accessKey = String.fromEnvironment('UNSPLASH_ACCESS_KEY');

  static bool get hasAccessKey => accessKey.isNotEmpty;

  static const apiBase = 'https://api.unsplash.com';
}
