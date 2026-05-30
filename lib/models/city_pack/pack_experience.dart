import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/partner_sponsorship.dart';

/// Destination-scoped experience — maps to [LuxPlace] in the engine.
class PackExperience {
  const PackExperience({
    required this.experienceId,
    required this.cityId,
    this.districtId,
    required this.category,
    this.moodTags = const [],
    this.unsplashPhotoId = '',
    this.location = '',
    this.latitude = 0,
    this.longitude = 0,
    this.title = '',
    this.description = '',
    this.slug,
    this.website,
    this.sponsorship,
  });

  final String experienceId;
  final String cityId;
  final String? districtId;
  final String category;
  final List<String> moodTags;
  final String unsplashPhotoId;
  final String location;
  final double latitude;
  final double longitude;
  final String title;
  final String description;
  final String? slug;
  final String? website;
  final PartnerSponsorship? sponsorship;

  factory PackExperience.fromJson(Map<String, dynamic> json) {
    return PackExperience(
      experienceId: json['experienceId'] as String,
      cityId: json['cityId'] as String,
      districtId: json['districtId'] as String?,
      category: json['category'] as String? ?? 'nature',
      moodTags: (json['moodTags'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      unsplashPhotoId: json['unsplashPhotoId'] as String? ?? '',
      location: json['location'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      slug: json['slug'] as String?,
      website: json['website'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'experienceId': experienceId,
        'cityId': cityId,
        if (districtId != null) 'districtId': districtId,
        'category': category,
        'moodTags': moodTags,
        'unsplashPhotoId': unsplashPhotoId,
        'location': location,
        'latitude': latitude,
        'longitude': longitude,
        'title': title,
        'description': description,
        if (slug != null) 'slug': slug,
        if (website != null) 'website': website,
      };

  LuxPlace toLuxPlace({LuxPlaceSource source = LuxPlaceSource.curated}) {
    return LuxPlace(
      id: experienceId,
      slug: slug ?? experienceId,
      title: title,
      category: _categoryFromString(category),
      unsplashPhotoId: unsplashPhotoId,
      location: location,
      latitude: latitude,
      longitude: longitude,
      description: description,
      moodTags: moodTags,
      website: website,
      source: source,
      cityPackId: cityId,
    );
  }

  static LuxPlaceCategory _categoryFromString(String raw) =>
      LuxPlaceCategory.values.firstWhere(
        (c) => c.name == raw,
        orElse: () => LuxPlaceCategory.nature,
      );
}
