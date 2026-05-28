import 'package:flutter/material.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/unsplash_photo.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/unsplash_image.dart';

/// Tab-specific presentation for [LuxPlace] heroes — Unsplash via [UnsplashImage] only.
enum LuxImagePresentation {
  feedHero,
  detailHero,
  gemMood,
  timelineThumb,
  tripCover,
}

class LuxPlaceImage extends StatelessWidget {
  const LuxPlaceImage({
    super.key,
    required this.place,
    required this.presentation,
    this.fallbackGradient,
    this.borderRadius,
    this.overlayChild,
    this.bottomCaption,
    this.trackUsageOnDisplay = false,
    this.onUserSelect,
  });

  const LuxPlaceImage.fallback({
    super.key,
    required this.presentation,
    required List<Color> this.fallbackGradient,
    this.borderRadius,
    this.overlayChild,
    this.bottomCaption,
  })  : place = null,
        trackUsageOnDisplay = false,
        onUserSelect = null;

  final LuxPlace? place;
  final LuxImagePresentation presentation;
  final List<Color>? fallbackGradient;
  final BorderRadius? borderRadius;
  final Widget? overlayChild;
  final String? bottomCaption;
  final bool trackUsageOnDisplay;
  final VoidCallback? onUserSelect;

  @override
  Widget build(BuildContext context) {
    final photo = place?.unsplashPhoto;
    if (photo == null) {
      return _gradientOnly();
    }

    return UnsplashImage(
      photo: photo,
      height: _height(),
      width: _width(),
      borderRadius: borderRadius ?? _defaultRadius(),
      presentationFilter: _presentationFilter,
      scrim: _scrimGradient(),
      overlayChild: overlayChild,
      bottomCaption: bottomCaption,
      compactAttribution: presentation == LuxImagePresentation.timelineThumb,
      showAttributionOverlay:
          presentation != LuxImagePresentation.timelineThumb,
      expandOnTap: presentation != LuxImagePresentation.timelineThumb,
      trackUsageOnDisplay: trackUsageOnDisplay,
      onUserSelect: onUserSelect,
    );
  }

  double _height() => switch (presentation) {
        LuxImagePresentation.feedHero => 140,
        LuxImagePresentation.detailHero => 220,
        LuxImagePresentation.gemMood => 112,
        LuxImagePresentation.timelineThumb => 56,
        LuxImagePresentation.tripCover => 108,
      };

  double _width() => presentation == LuxImagePresentation.timelineThumb
      ? 56
      : double.infinity;

  BorderRadius _defaultRadius() => switch (presentation) {
        LuxImagePresentation.timelineThumb => BorderRadius.circular(10),
        _ => const BorderRadius.vertical(top: Radius.circular(16)),
      };

  Widget Function(Widget child)? get _presentationFilter =>
      switch (presentation) {
        LuxImagePresentation.feedHero ||
        LuxImagePresentation.detailHero =>
          (child) => ColorFiltered(
              colorFilter: const ColorFilter.matrix([
                1.08, 0, 0, 0, 8,
                0, 1.05, 0, 0, 4,
                0, 0, 1.02, 0, 0,
                0, 0, 0, 1, 0,
              ]),
              child: child,
            ),
        LuxImagePresentation.gemMood => (child) => ColorFiltered(
              colorFilter: const ColorFilter.matrix([
                0.85, 0, 0, 0, 0,
                0, 0.82, 0, 0, 0,
                0, 0, 0.78, 0, -8,
                0, 0, 0, 1, 0,
              ]),
              child: child,
            ),
        _ => null,
      };

  /// Luxury scrims (~35–55% black) for badges, titles, and attribution.
  Gradient? _scrimGradient() => switch (presentation) {
        LuxImagePresentation.feedHero => const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x59000000), // ~35%
              Color(0x1F000000),
              Color(0x85000000), // ~52% bottom
            ],
            stops: [0.0, 0.42, 1.0],
          ),
        LuxImagePresentation.detailHero => const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x59000000),
              Color(0x1F000000),
              Color(0x8C000000),
            ],
            stops: [0.0, 0.35, 1.0],
          ),
        LuxImagePresentation.gemMood => const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x59000000),
              Color(0x14000000),
              Color(0x8C000000), // ~55%
            ],
            stops: [0.0, 0.38, 1.0],
          ),
        LuxImagePresentation.tripCover => const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0x8C000000),
              Color(0x26000000),
              Color(0x59000000),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        LuxImagePresentation.timelineThumb => null,
      };

  Widget _gradientOnly() {
    final colors = fallbackGradient ??
        [
          LuxColors.gold.withValues(alpha: 0.35),
          const Color(0xFF1C1917),
        ];
    return ClipRRect(
      borderRadius: borderRadius ?? _defaultRadius(),
      child: Container(
        width: _width(),
        height: _height(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: overlayChild,
      ),
    );
  }
}

/// Ensures callers never render Unsplash without attribution.
UnsplashPhoto? luxPlaceUnsplashOrNull(LuxPlace? place) => place?.unsplashPhoto;
