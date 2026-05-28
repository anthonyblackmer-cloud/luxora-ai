import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/models/lux_place.dart';

/// Resolves curated place media. Phase 2: fetch from Supabase + Storage URLs.
class PlacesRepository {
  PlacesRepository._();
  static final PlacesRepository instance = PlacesRepository._();

  final Map<String, LuxPlace> _byId = {
    for (final p in curatedPlacesCatalog) p.id: p,
  };

  final Map<String, LuxPlace> _bySlug = {
    for (final p in curatedPlacesCatalog) p.slug: p,
  };

  List<LuxPlace> get activePlaces =>
      curatedPlacesCatalog.where((p) => p.isActive).toList();

  LuxPlace? byId(String? id) {
    if (id == null || id.isEmpty) {
      return null;
    }
    return _byId[id];
  }

  LuxPlace? bySlug(String slug) => _bySlug[slug];

  /// Destinations with map pins (excludes mood-only trip cover assets).
  List<LuxPlace> get mappablePlaces => activePlaces
      .where((p) => !p.moodTags.contains('trip-cover'))
      .toList();

  List<LuxPlace> byMoodTag(String tag) {
    final lower = tag.toLowerCase();
    return activePlaces
        .where((p) => p.moodTags.any((t) => t.toLowerCase() == lower))
        .toList();
  }

  // Future<List<LuxPlace>> fetchFromSupabase(SupabaseClient client) async { ... }
}
