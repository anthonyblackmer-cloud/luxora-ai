import 'package:flutter/material.dart';
import 'package:luxora_ai/data/map_ai_capabilities.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_florida_map.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static void _showPlace(BuildContext context, LuxPlace place) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${place.title} · ${place.location}'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'AI MAP',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.5,
              color: LuxColors.gold.withValues(alpha: 0.8),
            ),
          ),
          Text(
            'Your intelligent route',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'Pins for your curated day — gold diamonds are Gems, cyan markers '
            'are today’s timeline, gold line is the mood route.',
            style: TextStyle(color: LuxColors.stone400, height: 1.45),
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 16 / 10,
            child: GlassCard(
              padding: EdgeInsets.zero,
              glow: true,
              child: LuxFloridaMap(
                places: PlacesRepository.instance.mappablePlaces,
                routePlaceIds: defaultItineraryRouteIds(),
                gemPlaceIds: defaultGemPlaceIds(),
                onPlaceTap: (place) => _showPlace(context, place),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'AI map powers',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          ...mapAiCapabilities.map(
            (cap) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GlassCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: LuxColors.gold.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(cap.icon, color: LuxColors.gold, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  cap.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              if (cap.comingSoon)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.08),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'Soon',
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: LuxColors.stone500,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cap.description,
                            style: const TextStyle(
                              fontSize: 13,
                              height: 1.35,
                              color: LuxColors.stone400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'AI navigation layer (next)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'Beyond discovery — live intelligence on whether a stop is worth it right now.',
            style: TextStyle(color: LuxColors.stone500, fontSize: 13, height: 1.35),
          ),
          const SizedBox(height: 10),
          ...mapAiCapabilitiesFuture.map(
            (cap) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GlassCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: LuxColors.feedAccent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(cap.icon, color: LuxColors.feedAccent, size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  cap.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const Text(
                                'Roadmap',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: LuxColors.feedLive,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cap.description,
                            style: const TextStyle(
                              fontSize: 13,
                              height: 1.35,
                              color: LuxColors.stone400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Seamless booking (partners)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: affiliateCategories
                .map(
                  (c) => Chip(
                    label: Text(c, style: const TextStyle(fontSize: 12)),
                    backgroundColor: Colors.white.withValues(alpha: 0.06),
                    side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
