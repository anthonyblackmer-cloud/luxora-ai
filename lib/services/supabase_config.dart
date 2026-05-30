/// Supabase project — from `--dart-define` or `config/supabase.local.json` (gitignored).
abstract final class SupabaseConfig {
  static const url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );

  static const anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );

  /// Edge function slug — default `concierge-chat`; override if dashboard auto-named it.
  static const conciergeFunction = String.fromEnvironment(
    'SUPABASE_CONCIERGE_FUNCTION',
    defaultValue: 'concierge-chat',
  );

  static bool get isConfigured => url.isNotEmpty && anonKey.isNotEmpty;

  static bool get usesPublishableKey => anonKey.startsWith('sb_publishable_');
}
