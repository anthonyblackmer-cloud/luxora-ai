/// Remote ticket-deals feed — optional CDN or Supabase public bucket.
abstract final class TicketDealsRemoteConfig {
  /// e.g. https://cdn.example.com/luxora/deals → fetches deals_orlando.json
  static const cdnBase = String.fromEnvironment(
    'TICKET_DEALS_CDN_BASE',
    defaultValue: '',
  );

  /// Supabase public bucket name when using project storage (default: deals).
  static const storageBucket = String.fromEnvironment(
    'TICKET_DEALS_STORAGE_BUCKET',
    defaultValue: 'deals',
  );

  static const _supportedCities = ['orlando', 'miami'];

  static List<String> get supportedCityIds => _supportedCities;

  static String assetPathForCity(String cityId) =>
      'assets/deals/deals_$cityId.json';

  static bool hasBundledCatalog(String cityId) =>
      _supportedCities.contains(cityId);
}
