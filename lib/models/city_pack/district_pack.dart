/// Neighborhood / zone within a city (Disney Area, Wynwood, etc.).
enum DistrictType {
  themePark,
  downtown,
  beach,
  resort,
  arts,
  nightlife,
  suburban,
  airport,
  other,
}

class DistrictBounds {
  const DistrictBounds({
    required this.north,
    required this.south,
    required this.east,
    required this.west,
  });

  final double north;
  final double south;
  final double east;
  final double west;

  factory DistrictBounds.fromJson(Map<String, dynamic> json) {
    return DistrictBounds(
      north: (json['north'] as num).toDouble(),
      south: (json['south'] as num).toDouble(),
      east: (json['east'] as num).toDouble(),
      west: (json['west'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'north': north,
        'south': south,
        'east': east,
        'west': west,
      };

  bool contains(double lat, double lng) =>
      lat <= north && lat >= south && lng <= east && lng >= west;
}

class DistrictPack {
  const DistrictPack({
    required this.districtId,
    required this.cityId,
    required this.districtName,
    required this.districtType,
    required this.description,
    this.mapBounds,
    this.vibeTags = const [],
    this.bestFor = const [],
  });

  final String districtId;
  final String cityId;
  final String districtName;
  final DistrictType districtType;
  final String description;
  final DistrictBounds? mapBounds;

  /// Mood / style tags for concierge filtering (e.g. `nightlife`, `luxury`).
  final List<String> vibeTags;

  /// Traveler types this district suits best.
  final List<String> bestFor;

  factory DistrictPack.fromJson(Map<String, dynamic> json) {
    final bounds = json['mapBounds'] as Map<String, dynamic>?;
    return DistrictPack(
      districtId: json['districtId'] as String,
      cityId: json['cityId'] as String,
      districtName: json['districtName'] as String,
      districtType: _districtTypeFromString(json['districtType'] as String?),
      description: json['description'] as String? ?? '',
      mapBounds: bounds == null ? null : DistrictBounds.fromJson(bounds),
      vibeTags: _stringList(json['vibeTags']),
      bestFor: _stringList(json['bestFor']),
    );
  }

  Map<String, dynamic> toJson() => {
        'districtId': districtId,
        'cityId': cityId,
        'districtName': districtName,
        'districtType': districtType.name,
        'description': description,
        if (mapBounds != null) 'mapBounds': mapBounds!.toJson(),
        if (vibeTags.isNotEmpty) 'vibeTags': vibeTags,
        if (bestFor.isNotEmpty) 'bestFor': bestFor,
      };

  static List<String> _stringList(dynamic raw) {
    if (raw is! List) return const [];
    return raw.map((e) => e.toString()).toList();
  }

  static DistrictType _districtTypeFromString(String? raw) =>
      DistrictType.values.firstWhere(
        (t) => t.name == raw,
        orElse: () => DistrictType.other,
      );
}
