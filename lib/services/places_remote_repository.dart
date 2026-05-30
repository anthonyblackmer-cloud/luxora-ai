import 'package:flutter/foundation.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/supabase_bootstrap.dart';
import 'package:luxora_ai/services/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Fetches `places` rows from Supabase when configured (Phase 2).
class PlacesRemoteRepository {
  static Future<void> ensureInitialized() async {
    await SupabaseBootstrap.initialize();
  }

  static Future<List<LuxPlace>?> tryFetchPlaces() async {
    if (!SupabaseConfig.isConfigured) {
      return null;
    }
    try {
      await ensureInitialized();
      final rows = await Supabase.instance.client
          .from('places')
          .select()
          .eq('is_active', true)
          .order('sort_order');

      return rows
          .map((row) => LuxPlace.fromSupabaseRow(row))
          .whereType<LuxPlace>()
          .toList();
    } catch (e, st) {
      debugPrint('PlacesRemoteRepository: $e\n$st');
      return null;
    }
  }
}
