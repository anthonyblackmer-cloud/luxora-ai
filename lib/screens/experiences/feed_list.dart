import 'package:flutter/material.dart';
import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/unsplash_download_tracker.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/affiliate_hint.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Dynamic discovery — trending, social, seasonal, live (not insider curation).
class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: discoveryFeed.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bolt_rounded,
                          color: LuxColors.feedHot.withValues(alpha: 0.95),
                          size: 22),
                      const SizedBox(width: 8),
                      Text(
                        'LIVE DISCOVERY',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2.5,
                          color: LuxColors.feedAccent.withValues(alpha: 0.95),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Experience Feed',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'What’s moving right now — trending spots, new openings, '
                    'creator picks, seasonal routes, and live updates.',
                    style: TextStyle(color: LuxColors.stone400, height: 1.45),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: const [
                      _FeedPill('Trending', LuxColors.feedAccent),
                      _FeedPill('New openings', Color(0xFFA78BFA)),
                      _FeedPill('Creator picks', LuxColors.feedHot),
                      _FeedPill('Live updates', LuxColors.feedLive),
                    ],
                  ),
                ],
              ),
            );
          }

          final item = discoveryFeed[i - 1];
          final placeId = kFeedItemPlaceIds[item.id];
          final place = PlacesRepository.instance.byId(placeId);
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
                child: DecoratedBox(
                decoration: item.isLive
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: LuxColors.feedLive.withValues(alpha: 0.15),
                            blurRadius: 24,
                            spreadRadius: -4,
                          ),
                        ],
                      )
                    : const BoxDecoration(),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LuxPlaceImage(
                    place: place,
                    presentation: LuxImagePresentation.feedHero,
                    fallbackGradient: item.gradient,
                    overlayChild: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: _FeedBadge(
                          label: item.kindLabel,
                          live: item.isLive,
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
                          item.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${item.subtitle} · ${item.location}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: LuxColors.stone500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.headline,
                          style: const TextStyle(
                            color: LuxColors.stone300,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.trending_up_rounded,
                              size: 14,
                              color: LuxColors.feedAccent.withValues(alpha: 0.95),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                item.socialProof,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: LuxColors.feedAccent.withValues(alpha: 0.95),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        AffiliateHint(
                          category: _affiliateForKind(item.kind),
                        ),
                      ],
                    ),
                  ),
                ],
                ),
              ),
            ),
            ),
          );
        },
      ),
    );
  }

  String _affiliateForKind(FeedItemKind kind) {
    return switch (kind) {
      FeedItemKind.newOpening => 'restaurant reservations',
      FeedItemKind.seasonal => 'experiences & tours',
      FeedItemKind.viralSpot => 'restaurant reservations',
      FeedItemKind.trending => 'theme park tickets',
      FeedItemKind.creatorPick => 'experiences & tours',
      FeedItemKind.liveUpdate => 'day passes',
    };
  }
}

class _FeedPill extends StatelessWidget {
  const _FeedPill(this.label, this.color);
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: color.withValues(alpha: 0.35)),
        borderRadius: BorderRadius.circular(20),
        color: color.withValues(alpha: 0.1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color.withValues(alpha: 0.95),
        ),
      ),
    );
  }
}

class _FeedBadge extends StatelessWidget {
  const _FeedBadge({required this.label, this.live = false});

  final String label;
  final bool live;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(6),
        border: live
            ? Border.all(color: const Color(0xFF22C55E).withValues(alpha: 0.8))
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (live) ...[
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0xFF22C55E),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 5),
          ],
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
              color: LuxColors.cream,
            ),
          ),
        ],
      ),
    );
  }
}
