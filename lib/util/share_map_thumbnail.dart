import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Static OpenStreetMap preview for share cards (not live radar tiles).
String shareStaticMapUrl({
  required double latitude,
  required double longitude,
  int width = 720,
  int height = 280,
  int zoom = 13,
}) {
  final w = width.clamp(200, 900);
  final h = height.clamp(120, 500);
  final z = zoom.clamp(8, 16);
  return 'https://staticmap.openstreetmap.de/staticmap.php'
      '?center=$latitude,$longitude'
      '&zoom=$z'
      '&size=${w}x$h'
      '&markers=$latitude,$longitude,red-pushpin';
}

class ShareStaticMapThumbnail extends StatelessWidget {
  const ShareStaticMapThumbnail({
    super.key,
    required this.latitude,
    required this.longitude,
    this.height = 140,
  });

  final double latitude;
  final double longitude;
  final double height;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final url = shareStaticMapUrl(
      latitude: latitude,
      longitude: longitude,
      height: height.round(),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            url,
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: height,
              alignment: Alignment.center,
              color: LuxColors.gemSurface.withValues(alpha: 0.85),
              child: Icon(
                Icons.map_outlined,
                color: LuxColors.stone500.withValues(alpha: 0.8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          l.shareMapPreviewCaption,
          style: TextStyle(
            fontSize: 10,
            color: LuxColors.stone500.withValues(alpha: 0.95),
          ),
        ),
      ],
    );
  }
}
