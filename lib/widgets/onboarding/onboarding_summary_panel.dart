import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/onboarding_summary_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';

class OnboardingSummaryPanel extends StatelessWidget {
  const OnboardingSummaryPanel({super.key, required this.profile});

  final TripProfile profile;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final preview = OnboardingSummaryService.build(profile: profile, l: l);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlassCard(
          glow: true,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final insight in preview.insights)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle_outline_rounded,
                        size: 18,
                        color: LuxColors.gold,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          insight.label,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.35,
                            color: LuxColors.cream,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (preview.hotels.isNotEmpty)
          _Section(
            title: l.onboardSummaryHotels,
            child: _PlaceRow(
              names: preview.hotels.map((h) => h.name).toList(),
              imagePlace: HotelIntelligenceService.placeFor(preview.hotels.first),
            ),
          ),
        if (preview.restaurants.isNotEmpty) ...[
          const SizedBox(height: 12),
          _Section(
            title: l.onboardSummaryRestaurants,
            child: _PlaceRow(
              names: preview.restaurants.map((p) => p.title).toList(),
              imagePlace: preview.restaurants.first,
            ),
          ),
        ],
        if (preview.hiddenGems.isNotEmpty) ...[
          const SizedBox(height: 12),
          _Section(
            title: l.onboardSummaryHiddenGems,
            child: _PlaceRow(
              names: preview.hiddenGems.map((p) => p.title).toList(),
              imagePlace: preview.hiddenGems.first,
            ),
          ),
        ],
        if (preview.experiences.isNotEmpty) ...[
          const SizedBox(height: 12),
          _Section(
            title: l.onboardSummaryExperiences,
            child: _PlaceRow(
              names: preview.experiences.map((p) => p.title).toList(),
              imagePlace: preview.experiences.first,
            ),
          ),
        ],
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 13,
            letterSpacing: 0.5,
            color: LuxColors.gold,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class _PlaceRow extends StatelessWidget {
  const _PlaceRow({required this.names, this.imagePlace});

  final List<String> names;
  final LuxPlace? imagePlace;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (imagePlace != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LuxPlaceImage(
              place: imagePlace,
              presentation: LuxImagePresentation.timelineThumb,
            ),
          )
        else
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: LuxColors.stone500,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.place_rounded, color: LuxColors.stone400),
          ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final name in names.take(3))
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 13,
                      color: LuxColors.stone300.withValues(alpha: 0.98),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
