import 'package:flutter/foundation.dart';
import 'package:luxora_ai/services/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Single entry point for Supabase client initialization.
abstract final class SupabaseBootstrap {
  static bool _initialized = false;

  static bool get isInitialized => _initialized;

  static Future<void> initialize() async {
    if (!SupabaseConfig.isConfigured || _initialized) {
      return;
    }
    try {
      await Supabase.initialize(
        url: SupabaseConfig.url,
        anonKey: SupabaseConfig.anonKey,
      );
      _initialized = true;
      if (kDebugMode) {
        debugPrint('Supabase: connected (${SupabaseConfig.url})');
      }
    } catch (e, st) {
      debugPrint('SupabaseBootstrap: $e\n$st');
    }
  }
}
