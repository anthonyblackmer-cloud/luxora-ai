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
