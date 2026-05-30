import 'package:luxora_ai/models/city_pack/district_pack.dart';
import 'package:luxora_ai/models/city_pack/pack_experience.dart';

/// Complete destination bundle — the unit Luxora scales by adding JSON packs.
class CityPack {
  const CityPack({
    required this.cityId,
    required this.cityName,
    required this.stateId,
    required this.description,
    this.heroImageUrl,
    required this.mapCenterLat,
    required this.mapCenterLng,
    this.hubLabel,
    this.supportedCategories = const [],
    this.featuredExperienceIds = const [],
    this.featuredHotelIds = const [],
    this.featuredRestaurantIds = const [],
    this.featuredTicketDealIds = const [],
    this.featuredHotelIntelIds = const [],
    this.districts = const [],
    this.experiences = const [],
    this.feedItemPlaceIds = const {},
    this.gemPlaceIds = const {},
    this.itineraryMomentPlaceIds = const {},
    this.osmAssetPath,
    this.defaultRadiusMiles = 50,
    this.maxRadiusMiles = 100,
  });

  final String cityId;
  final String cityName;
  final String stateId;
  final String description;
  final String? heroImageUrl;
  final double mapCenterLat;
  final double mapCenterLng;

  /// Map / weather label, e.g. "Orlando, FL".
  final String? hubLabel;
  final List<String> supportedCategories;
  final List<String> featuredExperienceIds;
  final List<String> featuredHotelIds;
  final List<String> featuredRestaurantIds;
  final List<String> featuredTicketDealIds;
  final List<String> featuredHotelIntelIds;
  final List<DistrictPack> districts;
  final List<PackExperience> experiences;
  final Map<String, String> feedItemPlaceIds;
  final Map<String, String> gemPlaceIds;
  final Map<String, String> itineraryMomentPlaceIds;
  final String? osmAssetPath;
  final int defaultRadiusMiles;
  final int maxRadiusMiles;

  String get hubName => hubLabel ?? cityName;

  Set<String> get allPlaceIds => {
        ...experiences.map((e) => e.experienceId),
        ...feedItemPlaceIds.values,
        ...gemPlaceIds.values,
        ...itineraryMomentPlaceIds.values,
      };

  factory CityPack.fromJson(Map<String, dynamic> json) {
    return CityPack(
      cityId: json['cityId'] as String,
      cityName: json['cityName'] as String,
      stateId: json['stateId'] as String,
      description: json['description'] as String? ?? '',
      heroImageUrl: json['heroImageUrl'] as String?,
      mapCenterLat: (json['mapCenterLat'] as num).toDouble(),
      mapCenterLng: (json['mapCenterLng'] as num).toDouble(),
      hubLabel: json['hubLabel'] as String?,
      supportedCategories: (json['supportedCategories'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      featuredExperienceIds: _stringList(json['featuredExperiences']),
      featuredHotelIds: _stringList(json['featuredHotels']),
      featuredRestaurantIds: _stringList(json['featuredRestaurants']),
      featuredTicketDealIds: _stringList(json['featuredTicketDeals']),
      featuredHotelIntelIds: _stringList(json['featuredHotelIntel']),
      districts: (json['districts'] as List<dynamic>?)
              ?.map((e) => DistrictPack.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      experiences: (json['experiences'] as List<dynamic>?)
              ?.map((e) => PackExperience.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      feedItemPlaceIds: _stringMap(json['feedItemPlaceIds']),
      gemPlaceIds: _stringMap(json['gemPlaceIds']),
      itineraryMomentPlaceIds: _stringMap(json['itineraryMomentPlaceIds']),
      osmAssetPath: json['osmAssetPath'] as String?,
      defaultRadiusMiles: (json['defaultRadiusMiles'] as num?)?.toInt() ?? 50,
      maxRadiusMiles: (json['maxRadiusMiles'] as num?)?.toInt() ?? 100,
    );
  }

  Map<String, dynamic> toJson() => {
        'cityId': cityId,
        'cityName': cityName,
        'stateId': stateId,
        'description': description,
        if (heroImageUrl != null) 'heroImageUrl': heroImageUrl,
        'mapCenterLat': mapCenterLat,
        'mapCenterLng': mapCenterLng,
        if (hubLabel != null) 'hubLabel': hubLabel,
        'supportedCategories': supportedCategories,
        'featuredExperiences': featuredExperienceIds,
        'featuredHotels': featuredHotelIds,
        'featuredRestaurants': featuredRestaurantIds,
        'featuredTicketDeals': featuredTicketDealIds,
        'featuredHotelIntel': featuredHotelIntelIds,
        'districts': districts.map((d) => d.toJson()).toList(),
        'experiences': experiences.map((e) => e.toJson()).toList(),
        'feedItemPlaceIds': feedItemPlaceIds,
        'gemPlaceIds': gemPlaceIds,
        'itineraryMomentPlaceIds': itineraryMomentPlaceIds,
        if (osmAssetPath != null) 'osmAssetPath': osmAssetPath,
        'defaultRadiusMiles': defaultRadiusMiles,
        'maxRadiusMiles': maxRadiusMiles,
      };

  static List<String> _stringList(dynamic raw) {
    if (raw is! List) return const [];
    return raw.map((e) => e.toString()).toList();
  }

  static Map<String, String> _stringMap(dynamic raw) {
    if (raw is! Map) return const {};
    return raw.map((k, v) => MapEntry(k.toString(), v.toString()));
  }
}
