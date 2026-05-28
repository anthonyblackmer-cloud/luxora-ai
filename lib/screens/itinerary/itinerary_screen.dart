import 'package:flutter/material.dart';
import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/data/florida_experiences.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/unsplash_attribution.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'YOUR TIMELINE',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.5,
              color: LuxColors.gold.withValues(alpha: 0.8),
            ),
          ),
          Text(
            'A day designed to feel',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'Every moment connected — anticipation built in, stress left out.',
            style: TextStyle(color: LuxColors.stone400, height: 1.4),
          ),
          const SizedBox(height: 24),
          ...sampleOrlandoItinerary.asMap().entries.map((e) {
            final i = e.key;
            final m = e.value;
            final thumbPlace = PlacesRepository.instance
                .byId(kItineraryMomentPlaceIds[m.id]);
            return Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      if (thumbPlace != null)
                        LuxPlaceImage(
                          place: thumbPlace,
                          presentation: LuxImagePresentation.timelineThumb,
                          borderRadius: BorderRadius.circular(10),
                          trackUsageOnDisplay: true,
                        )
                      else
                        CircleAvatar(
                          radius: 12,
                          backgroundColor:
                              LuxColors.gold.withValues(alpha: 0.2),
                          child: Text(
                            '${i + 1}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: LuxColors.gold,
                            ),
                          ),
                        ),
                      if (i < sampleOrlandoItinerary.length - 1)
                        Container(
                          width: 2,
                          height: thumbPlace != null ? 64 : 72,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          color: LuxColors.gold.withValues(alpha: 0.25),
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GlassCard(
                      glow: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(m.time,
                              style: TextStyle(
                                fontSize: 12,
                                color: LuxColors.gold.withValues(alpha: 0.9),
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(height: 4),
                          Text(m.title,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              )),
                          const SizedBox(height: 8),
                          Text(m.emotionalLine,
                              style: const TextStyle(
                                color: LuxColors.stone300,
                                height: 1.4,
                              )),
                          const SizedBox(height: 8),
                          Text(
                            '${m.location} · ${m.category}',
                            style: const TextStyle(
                              fontSize: 11,
                              color: LuxColors.stone500,
                            ),
                          ),
                          if (thumbPlace?.unsplashPhoto case final photo?) ...[
                            const SizedBox(height: 10),
                            UnsplashAttribution(
                              photo: photo,
                              compact: true,
                              onDark: false,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
