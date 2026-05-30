import 'package:flutter/material.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/util/share_map_thumbnail.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';

/// Hero photo + static map preview for destination/stay share cards.
class ShareHeroMedia extends StatelessWidget {
  const ShareHeroMedia({
    super.key,
    required this.place,
    this.overridePhotoId,
  });

  final LuxPlace place;
  final String? overridePhotoId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: LuxPlaceImage(
            place: place,
            overridePhotoId: overridePhotoId,
            presentation: LuxImagePresentation.detailHero,
            borderRadius: BorderRadius.zero,
          ),
        ),
        const SizedBox(height: 10),
        ShareStaticMapThumbnail(
          latitude: place.latitude,
          longitude: place.longitude,
        ),
      ],
    );
  }
}
