import 'package:flutter/material.dart';
import 'package:luxora_ai/models/unsplash_photo.dart';
import 'package:luxora_ai/services/unsplash_download_tracker.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/unsplash_attribution.dart';

/// Renders Unsplash photos via API hotlink only — with required attribution.
///
/// Do not use [CachedNetworkImage] or local image files for Unsplash content.
class UnsplashImage extends StatefulWidget {
  const UnsplashImage({
    super.key,
    required this.photo,
    required this.height,
    this.width = double.infinity,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.presentationFilter,
    this.scrim,
    this.overlayChild,
    this.compactAttribution = false,
    this.showAttributionOverlay = true,
    this.trackUsageOnDisplay = false,
    this.onUserSelect,
  });

  final UnsplashPhoto photo;
  final double height;
  final double width;
  final BorderRadius? borderRadius;
  final BoxFit fit;
  final Widget Function(Widget child)? presentationFilter;
  final Gradient? scrim;
  final Widget? overlayChild;
  final bool compactAttribution;
  /// When false, attribution must appear elsewhere on screen (e.g. timeline card).
  final bool showAttributionOverlay;
  final bool trackUsageOnDisplay;
  final VoidCallback? onUserSelect;

  @override
  State<UnsplashImage> createState() => _UnsplashImageState();
}

class _UnsplashImageState extends State<UnsplashImage> {
  static final _downloadTracker = UnsplashDownloadTracker();

  @override
  void initState() {
    super.initState();
    if (widget.trackUsageOnDisplay) {
      _downloadTracker.trackUsage(widget.photo);
    }
  }

  void _handleTap() {
    _downloadTracker.trackUsage(widget.photo, force: true);
    widget.onUserSelect?.call();
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? BorderRadius.zero;

    final imageUrl = widget.height <= 72
        ? widget.photo.hotlinkUrlSized(
            width: (widget.width * 2).round().clamp(80, 240),
            height: (widget.height * 2).round().clamp(80, 240),
          )
        : widget.photo.hotlinkUrl;

    Widget image = Image.network(
      imageUrl,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      alignment: Alignment.center,
      gaplessPlayback: true,
      loadingBuilder: (context, child, progress) {
        if (progress == null) {
          return child;
        }
        return _placeholder(radius);
      },
      errorBuilder: (_, _, _) => _placeholder(radius),
    );

    if (widget.presentationFilter != null) {
      image = widget.presentationFilter!(image);
    }

    return ClipRRect(
      borderRadius: radius,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleTap,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                image,
                if (widget.scrim != null)
                  DecoratedBox(decoration: BoxDecoration(gradient: widget.scrim)),
                if (widget.overlayChild != null)
                  Positioned.fill(child: widget.overlayChild!),
                if (widget.showAttributionOverlay)
                  Positioned(
                    left: 8,
                    right: 8,
                    bottom: 6,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.42),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: UnsplashAttribution(
                          photo: widget.photo,
                          compact: widget.compactAttribution,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _placeholder(BorderRadius radius) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        gradient: LinearGradient(
          colors: [
            LuxColors.gold.withValues(alpha: 0.25),
            const Color(0xFF1C1917),
          ],
        ),
      ),
    );
  }
}
