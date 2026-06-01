import 'package:flutter/material.dart';
import 'package:luxora_ai/models/google_place_enrichment.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/unsplash_photo.dart';
import 'package:luxora_ai/services/google_places_config.dart';
import 'package:luxora_ai/services/google_places_enrichment_service.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/unsplash_image.dart';

/// Tab-specific presentation for [LuxPlace] heroes — Google Places photo when
/// configured, otherwise Unsplash via [UnsplashImage].
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
    this.overridePhotoId,
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
        overridePhotoId = null,
        trackUsageOnDisplay = false,
        onUserSelect = null;

  final LuxPlace? place;
  final String? overridePhotoId;
  final LuxImagePresentation presentation;
  final List<Color>? fallbackGradient;
  final BorderRadius? borderRadius;
  final Widget? overlayChild;
  final String? bottomCaption;
  final bool trackUsageOnDisplay;
  final VoidCallback? onUserSelect;

  @override
  Widget build(BuildContext context) {
    final targetPlace = place;
    if (targetPlace != null &&
        overridePhotoId == null &&
        GooglePlacesConfig.isConfigured &&
        !targetPlace.moodTags.contains('trip-cover')) {
      GooglePlacesEnrichmentService.instance.scheduleEnrich(targetPlace);
      return ListenableBuilder(
        listenable: GooglePlacesEnrichmentService.instance,
        builder: (context, _) => _buildImage(context, targetPlace),
      );
    }
    return _buildImage(context, targetPlace);
  }

  Widget _buildImage(BuildContext context, LuxPlace? targetPlace) {
    final photo = (overridePhotoId != null
            ? UnsplashPhotoRegistry.instance.byId(overridePhotoId)
            : null) ??
        targetPlace?.unsplashPhoto;

    if (overridePhotoId == null && targetPlace != null) {
      final enrichment =
          GooglePlacesEnrichmentService.instance.cached(targetPlace.id);
      final googleUrl = enrichment?.heroPhotoUrl;
      if (GooglePlaceEnrichment.isUsableHeroPhotoUrl(googleUrl)) {
        return _GoogleHeroWithUnsplashFallback(
          googleUrl: googleUrl!,
          attribution: enrichment?.photoAttribution,
          unsplashPhoto: photo,
          presentation: presentation,
          height: _height(),
          width: _width(),
          borderRadius: borderRadius ?? _defaultRadius(),
          presentationFilter: _presentationFilter,
          scrimGradient: _scrimGradient(),
          overlayChild: overlayChild,
          bottomCaption: bottomCaption,
          fallbackGradient: fallbackGradient,
          trackUsageOnDisplay: trackUsageOnDisplay,
          onUserSelect: onUserSelect,
        );
      }
    }

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

class _GoogleHeroWithUnsplashFallback extends StatefulWidget {
  const _GoogleHeroWithUnsplashFallback({
    required this.googleUrl,
    required this.unsplashPhoto,
    required this.presentation,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.presentationFilter,
    required this.scrimGradient,
    this.attribution,
    this.overlayChild,
    this.bottomCaption,
    this.fallbackGradient,
    this.trackUsageOnDisplay = false,
    this.onUserSelect,
  });

  final String googleUrl;
  final String? attribution;
  final UnsplashPhoto? unsplashPhoto;
  final LuxImagePresentation presentation;
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final Widget Function(Widget child)? presentationFilter;
  final Gradient? scrimGradient;
  final Widget? overlayChild;
  final String? bottomCaption;
  final List<Color>? fallbackGradient;
  final bool trackUsageOnDisplay;
  final VoidCallback? onUserSelect;

  @override
  State<_GoogleHeroWithUnsplashFallback> createState() =>
      _GoogleHeroWithUnsplashFallbackState();
}

class _GoogleHeroWithUnsplashFallbackState
    extends State<_GoogleHeroWithUnsplashFallback> {
  bool _googleFailed = false;

  @override
  Widget build(BuildContext context) {
    if (!_googleFailed) {
      return _googlePhotoHero(
        onError: () {
          if (mounted) {
            setState(() => _googleFailed = true);
          }
        },
      );
    }

    final photo = widget.unsplashPhoto;
    if (photo != null) {
      return UnsplashImage(
        photo: photo,
        height: widget.height,
        width: widget.width,
        borderRadius: widget.borderRadius,
        presentationFilter: widget.presentationFilter,
        scrim: widget.scrimGradient,
        overlayChild: widget.overlayChild,
        bottomCaption: widget.bottomCaption,
        compactAttribution:
            widget.presentation == LuxImagePresentation.timelineThumb,
        showAttributionOverlay:
            widget.presentation != LuxImagePresentation.timelineThumb,
        expandOnTap: widget.presentation != LuxImagePresentation.timelineThumb,
        trackUsageOnDisplay: widget.trackUsageOnDisplay,
        onUserSelect: widget.onUserSelect,
      );
    }

    return _gradientOnly();
  }

  Widget _googlePhotoHero({required VoidCallback onError}) {
    Widget image = Image.network(
      widget.googleUrl,
      height: widget.height,
      width: widget.width,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) => onError());
        return _gradientOnly(showOverlay: false);
      },
    );
    final filter = widget.presentationFilter;
    if (filter != null) {
      image = filter(image);
    }

    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            image,
            if (widget.scrimGradient case final gradient?)
              DecoratedBox(decoration: BoxDecoration(gradient: gradient)),
            if (widget.overlayChild != null) widget.overlayChild!,
            if (widget.bottomCaption != null)
              Positioned(
                left: 12,
                right: 12,
                bottom: 10,
                child: Text(
                  widget.bottomCaption!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            if (widget.attribution != null &&
                widget.presentation != LuxImagePresentation.timelineThumb)
              Positioned(
                left: 10,
                bottom: widget.bottomCaption == null ? 8 : 34,
                child: Text(
                  widget.attribution!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.78),
                    fontSize: 10,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _gradientOnly({bool showOverlay = true}) {
    final colors = widget.fallbackGradient ??
        [
          LuxColors.gold.withValues(alpha: 0.35),
          const Color(0xFF1C1917),
        ];
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: showOverlay ? widget.overlayChild : null,
      ),
    );
  }
}

/// Ensures callers never render Unsplash without attribution.
UnsplashPhoto? luxPlaceUnsplashOrNull(LuxPlace? place) => place?.unsplashPhoto;
