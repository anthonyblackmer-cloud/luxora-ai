/// Cached Google Places match for a [LuxPlace] id.
class GooglePlaceEnrichment {
  const GooglePlaceEnrichment({
    required this.luxPlaceId,
    required this.googlePlaceId,
    this.websiteUri,
    this.heroPhotoUrl,
    this.photoAttribution,
    this.googleMapsUri,
  });

  final String luxPlaceId;
  final String googlePlaceId;
  final String? websiteUri;
  final String? heroPhotoUrl;
  final String? photoAttribution;
  final String? googleMapsUri;

  Map<String, dynamic> toJson() => {
        'luxPlaceId': luxPlaceId,
        'googlePlaceId': googlePlaceId,
        'websiteUri': websiteUri,
        'heroPhotoUrl': heroPhotoUrl,
        'photoAttribution': photoAttribution,
        'googleMapsUri': googleMapsUri,
      };

  factory GooglePlaceEnrichment.fromJson(Map<String, dynamic> json) {
    return GooglePlaceEnrichment(
      luxPlaceId: json['luxPlaceId'] as String? ?? '',
      googlePlaceId: json['googlePlaceId'] as String? ?? '',
      websiteUri: json['websiteUri'] as String?,
      heroPhotoUrl: json['heroPhotoUrl'] as String?,
      photoAttribution: json['photoAttribution'] as String?,
      googleMapsUri: json['googleMapsUri'] as String?,
    );
  }
}
