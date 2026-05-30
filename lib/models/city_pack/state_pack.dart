/// Top-level tourism region (e.g. Florida, Nevada, Île-de-France).
class StatePack {
  const StatePack({
    required this.stateId,
    required this.stateName,
    this.heroImageUrl,
    this.destinationCount = 0,
    this.cityIds = const [],
  });

  final String stateId;
  final String stateName;
  final String? heroImageUrl;
  final int destinationCount;
  final List<String> cityIds;

  factory StatePack.fromJson(Map<String, dynamic> json) {
    return StatePack(
      stateId: json['stateId'] as String,
      stateName: json['stateName'] as String,
      heroImageUrl: json['heroImageUrl'] as String?,
      destinationCount: (json['destinationCount'] as num?)?.toInt() ?? 0,
      cityIds: (json['cityIds'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() => {
        'stateId': stateId,
        'stateName': stateName,
        if (heroImageUrl != null) 'heroImageUrl': heroImageUrl,
        'destinationCount': destinationCount,
        'cityIds': cityIds,
      };
}
