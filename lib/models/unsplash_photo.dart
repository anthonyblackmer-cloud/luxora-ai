import 'dart:convert';

/// Unsplash photo metadata per API response — hotlink [hotlinkUrl] only.
class UnsplashPhoto {
  const UnsplashPhoto({
    required this.id,
    required this.hotlinkUrl,
    required this.photographerName,
    required this.photographerProfileUrl,
    required this.unsplashPhotoPageUrl,
    required this.downloadLocation,
  });

  final String id;
  final String hotlinkUrl;
  final String photographerName;
  final String photographerProfileUrl;
  final String unsplashPhotoPageUrl;
  final String downloadLocation;

  static const unsplashHomeUrl = 'https://unsplash.com';

  factory UnsplashPhoto.fromApiJson(Map<String, dynamic> json) {
    final urls = json['urls'] as Map<String, dynamic>? ?? {};
    final links = json['links'] as Map<String, dynamic>? ?? {};
    final user = json['user'] as Map<String, dynamic>? ?? {};
    final userLinks = user['links'] as Map<String, dynamic>? ?? {};

    final hotlink = (urls['regular'] ?? urls['full'] ?? urls['small']) as String?;
    if (hotlink == null || hotlink.isEmpty) {
      throw FormatException('Unsplash photo ${json['id']} missing urls.regular');
    }

    final downloadLocation = links['download_location'] as String?;
    if (downloadLocation == null || downloadLocation.isEmpty) {
      throw FormatException('Unsplash photo ${json['id']} missing download_location');
    }

    final photographerName = user['name'] as String? ?? 'Photographer';
    final photographerProfile =
        userLinks['html'] as String? ?? unsplashHomeUrl;
    final photoPage = links['html'] as String? ?? '$unsplashHomeUrl/photos/${json['id']}';

    return UnsplashPhoto(
      id: json['id'] as String,
      hotlinkUrl: hotlink,
      photographerName: photographerName,
      photographerProfileUrl: photographerProfile,
      unsplashPhotoPageUrl: photoPage,
      downloadLocation: downloadLocation,
    );
  }

  factory UnsplashPhoto.fromJson(Map<String, dynamic> json) => UnsplashPhoto(
        id: json['id'] as String,
        hotlinkUrl: json['hotlinkUrl'] as String,
        photographerName: json['photographerName'] as String,
        photographerProfileUrl: json['photographerProfileUrl'] as String,
        unsplashPhotoPageUrl: json['unsplashPhotoPageUrl'] as String,
        downloadLocation: json['downloadLocation'] as String,
      );

  /// Large hotlink for fullscreen / lightbox viewing (Unsplash CDN resize).
  String get hotlinkUrlExpanded {
    final uri = Uri.parse(hotlinkUrl);
    return uri.replace(
      queryParameters: {
        ...uri.queryParameters,
        'w': '2400',
        'q': '85',
        'auto': 'format',
      },
    ).toString();
  }

  /// Sized hotlink for small thumbnails (Unsplash CDN crop).
  String hotlinkUrlSized({int width = 160, int height = 160}) {
    final uri = Uri.parse(hotlinkUrl);
    return uri.replace(
      queryParameters: {
        ...uri.queryParameters,
        'w': '$width',
        'h': '$height',
        'fit': 'crop',
        'crop': 'entropy',
      },
    ).toString();
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'hotlinkUrl': hotlinkUrl,
        'photographerName': photographerName,
        'photographerProfileUrl': photographerProfileUrl,
        'unsplashPhotoPageUrl': unsplashPhotoPageUrl,
        'downloadLocation': downloadLocation,
      };

  static List<UnsplashPhoto> listFromJsonString(String raw) {
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((e) => UnsplashPhoto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
