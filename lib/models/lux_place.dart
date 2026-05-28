import 'package:luxora_ai/models/unsplash_photo.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';

/// Curated place media — maps to Supabase `places` + Unsplash photo id.
enum LuxPlaceCategory {
  beach,
  dining,
  nature,
  nightlife,
  wellness,
  family,
  springs,
  romantic,
  adventure,
}

enum LuxImageRole { hero, card, thumb }

class LuxPlace {
  const LuxPlace({
    required this.id,
    required this.slug,
    required this.title,
    required this.category,
    required this.unsplashPhotoId,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.description,
    this.storagePath,
    this.moodTags = const [],
    this.aspectRole = LuxImageRole.hero,
    this.sortOrder = 0,
    this.isActive = true,
  });

  final String id;
  final String slug;
  final String title;
  final LuxPlaceCategory category;
  final String unsplashPhotoId;
  final String? storagePath;
  final String location;
  final double latitude;
  final double longitude;
  final String description;
  final List<String> moodTags;
  final LuxImageRole aspectRole;
  final int sortOrder;
  final bool isActive;

  UnsplashPhoto? get unsplashPhoto =>
      UnsplashPhotoRegistry.instance.byId(unsplashPhotoId);

  /// Supabase `places` row (see `supabase/migrations/002_places_geo.sql`).
  static LuxPlace? fromSupabaseRow(Map<String, dynamic> row) {
    final externalId = row['external_id'] as String?;
    final slug = row['slug'] as String?;
    final title = row['title'] as String?;
    final lat = (row['latitude'] as num?)?.toDouble();
    final lng = (row['longitude'] as num?)?.toDouble();
    final unsplashId = row['unsplash_photo_id'] as String?;
    if (externalId == null ||
        slug == null ||
        title == null ||
        lat == null ||
        lng == null ||
        unsplashId == null) {
      return null;
    }
    final categoryRaw = row['category'] as String? ?? 'nature';
    final category = LuxPlaceCategory.values.firstWhere(
      (c) => c.name == categoryRaw,
      orElse: () => LuxPlaceCategory.nature,
    );
    final moodTags = (row['mood_tags'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        const <String>[];

    return LuxPlace(
      id: externalId,
      slug: slug,
      title: title,
      category: category,
      unsplashPhotoId: unsplashId,
      location: row['location'] as String? ?? '',
      latitude: lat,
      longitude: lng,
      description: row['description'] as String? ?? '',
      moodTags: moodTags,
      storagePath: row['storage_path'] as String?,
      aspectRole: _aspectRoleFromString(row['aspect_role'] as String?),
      sortOrder: row['sort_order'] as int? ?? 0,
      isActive: row['is_active'] as bool? ?? true,
    );
  }

  static LuxImageRole _aspectRoleFromString(String? raw) => switch (raw) {
        'card' => LuxImageRole.card,
        'thumb' => LuxImageRole.thumb,
        _ => LuxImageRole.hero,
      };

  String get categoryLabel => switch (category) {
        LuxPlaceCategory.beach => 'Beach',
        LuxPlaceCategory.dining => 'Dining',
        LuxPlaceCategory.nature => 'Nature',
        LuxPlaceCategory.nightlife => 'Nightlife',
        LuxPlaceCategory.wellness => 'Wellness',
        LuxPlaceCategory.family => 'Family',
        LuxPlaceCategory.springs => 'Springs',
        LuxPlaceCategory.romantic => 'Romantic',
        LuxPlaceCategory.adventure => 'Adventure',
      };
}
