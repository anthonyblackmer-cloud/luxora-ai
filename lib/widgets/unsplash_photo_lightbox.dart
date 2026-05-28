import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/unsplash_photo.dart';
import 'package:luxora_ai/services/unsplash_download_tracker.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/unsplash_attribution.dart';

/// Fullscreen Unsplash viewer — pinch/zoom, required attribution, optional action.
Future<void> showUnsplashPhotoLightbox(
  BuildContext context, {
  required UnsplashPhoto photo,
  String? caption,
  String? heroTag,
  VoidCallback? onViewDetails,
  String? viewDetailsLabel,
}) {
  final l = context.l10n;
  UnsplashDownloadTracker().trackUsage(photo, force: true);

  return showGeneralDialog<void>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: true,
    barrierLabel: l.photoClose,
    barrierColor: Colors.black.withValues(alpha: 0.92),
    transitionDuration: const Duration(milliseconds: 260),
    pageBuilder: (ctx, animation, secondaryAnimation) {
      return _UnsplashPhotoLightbox(
        photo: photo,
        caption: caption,
        heroTag: heroTag,
        onViewDetails: onViewDetails,
        viewDetailsLabel: viewDetailsLabel ?? l.photoViewDestination,
      );
    },
    transitionBuilder: (ctx, animation, _, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: child,
      );
    },
  );
}

class _UnsplashPhotoLightbox extends StatelessWidget {
  const _UnsplashPhotoLightbox({
    required this.photo,
    this.caption,
    this.heroTag,
    this.onViewDetails,
    required this.viewDetailsLabel,
  });

  final UnsplashPhoto photo;
  final String? caption;
  final String? heroTag;
  final VoidCallback? onViewDetails;
  final String viewDetailsLabel;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      photo.hotlinkUrlExpanded,
      fit: BoxFit.contain,
      gaplessPlayback: true,
      loadingBuilder: (context, child, progress) {
        if (progress == null) {
          return child;
        }
        return Center(
          child: SizedBox(
            width: 36,
            height: 36,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: LuxColors.gold.withValues(alpha: 0.85),
              value: progress.expectedTotalBytes != null
                  ? progress.cumulativeBytesLoaded /
                      progress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (_, _, _) => Icon(
        Icons.broken_image_outlined,
        size: 48,
        color: LuxColors.stone500.withValues(alpha: 0.8),
      ),
    );

    final heroChild = heroTag != null
        ? Hero(tag: heroTag!, child: image)
        : image;

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                panEnabled: true,
                scaleEnabled: true,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 56, 12, 120),
                    child: heroChild,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                tooltip: context.l10n.photoClose,
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded, color: LuxColors.cream),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withValues(alpha: 0.45),
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (caption != null && caption!.isNotEmpty) ...[
                    Text(
                      caption!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.35,
                        color: LuxColors.cream,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: UnsplashAttribution(photo: photo),
                    ),
                  ),
                  if (onViewDetails != null) ...[
                    const SizedBox(height: 12),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onViewDetails!();
                      },
                      icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                      label: Text(viewDetailsLabel),
                      style: TextButton.styleFrom(
                        foregroundColor: LuxColors.gold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
