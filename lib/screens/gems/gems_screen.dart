import 'package:flutter/material.dart';
import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/unsplash_download_tracker.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/affiliate_hint.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Curated secret discoveries — insider knowledge, not trending social content.
class GemsScreen extends StatelessWidget {
  const GemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: hiddenGemsCatalog.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.diamond_outlined,
                          color: LuxColors.gemAccent.withValues(alpha: 0.95),
                          size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'INSIDER CURATION',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.5,
                          color: LuxColors.gemAccent.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Hidden Gems',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Secret discoveries locals guard — why it’s special, when to go, '
                    'how crowded it gets, and tips you won’t find on a postcard.',
                    style: TextStyle(color: LuxColors.stone400, height: 1.45),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: const [
                      _Pill('Hidden places'),
                      _Pill('Local-only'),
                      _Pill('Insider tips'),
                      _Pill('Crowd intel'),
                    ],
                  ),
                ],
              ),
            );
          }

          final gem = hiddenGemsCatalog[i - 1];
          final place =
              PlacesRepository.instance.byId(kGemPlaceIds[gem.id]);
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: GlassCard(
              padding: EdgeInsets.zero,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  final photo = place?.unsplashPhoto;
                  if (photo != null) {
                    UnsplashDownloadTracker().trackUsage(photo, force: true);
                  }
                },
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LuxPlaceImage(
                    place: place,
                    presentation: LuxImagePresentation.gemMood,
                    fallbackGradient: gem.gradient,
                    overlayChild: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.35),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'LOCAL SECRET',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                              color:
                                  LuxColors.gemAccent.withValues(alpha: 0.95),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gem.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          gem.location,
                          style: const TextStyle(
                            fontSize: 12,
                            color: LuxColors.stone500,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _GemDetail(
                          icon: Icons.auto_awesome_rounded,
                          label: 'Why it’s special',
                          value: gem.whySpecial,
                        ),
                        _GemDetail(
                          icon: Icons.schedule_rounded,
                          label: 'Best time to go',
                          value: gem.bestTime,
                        ),
                        _GemDetail(
                          icon: Icons.people_outline_rounded,
                          label: 'Crowd level',
                          value: gem.crowdLevel,
                        ),
                        _GemDetail(
                          icon: Icons.tips_and_updates_outlined,
                          label: 'Insider tip',
                          value: gem.insiderTip,
                        ),
                        _GemDetail(
                          icon: Icons.visibility_off_outlined,
                          label: 'Local-only note',
                          value: gem.localOnlyNote,
                        ),
                        const SizedBox(height: 12),
                        const AffiliateHint(category: 'this experience'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ),
          );
        },
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: LuxColors.gemAccent.withValues(alpha: 0.28)),
        borderRadius: BorderRadius.circular(20),
        color: LuxColors.gemSurface.withValues(alpha: 0.8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: LuxColors.gemAccent.withValues(alpha: 0.92),
        ),
      ),
    );
  }
}

class _GemDetail extends StatelessWidget {
  const _GemDetail({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: LuxColors.gemAccent.withValues(alpha: 0.8)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: LuxColors.stone500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.35,
                    color: LuxColors.stone300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
