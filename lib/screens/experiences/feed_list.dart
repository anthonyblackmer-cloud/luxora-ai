import 'package:flutter/material.dart';

import 'package:luxora_ai/l10n/app_localizations.dart';

import 'package:luxora_ai/l10n/catalog_localizer.dart';

import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';

import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/models/trip_profile.dart';

import 'package:luxora_ai/services/city_pack_registry.dart';

import 'package:luxora_ai/services/discover_radius_controller.dart';

import 'package:luxora_ai/models/sponsorship_extensions.dart';

import 'package:luxora_ai/services/partner_sponsorship_service.dart';

import 'package:luxora_ai/services/places_repository.dart';

import 'package:luxora_ai/services/trip_profile_store.dart';

import 'package:luxora_ai/services/unsplash_download_tracker.dart';

import 'package:luxora_ai/theme/lux_theme.dart';

import 'package:luxora_ai/util/feed_mood_catalog.dart';

import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';

import 'package:luxora_ai/widgets/destination_search_sheet.dart';

import 'package:luxora_ai/widgets/discover_radius_selector.dart';

import 'package:luxora_ai/widgets/discover_scope_banner.dart';

import 'package:luxora_ai/widgets/lux_place_image.dart';

import 'package:luxora_ai/widgets/affiliate_hint.dart';

import 'package:luxora_ai/widgets/partner_sponsor_badge.dart';

import 'package:luxora_ai/services/freemium_limits.dart';
import 'package:luxora_ai/services/freemium_service.dart';

import 'package:luxora_ai/widgets/freemium/freemium_unlock_cta.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/util/place_vibe_resolver.dart';
import 'package:luxora_ai/widgets/place_vibe_chip.dart';



/// Dynamic discovery — trending, social, seasonal, live (not insider curation).

class FeedList extends StatefulWidget {

  const FeedList({super.key});



  @override

  State<FeedList> createState() => _FeedListState();

}



class _FeedListState extends State<FeedList> {

  FeedMood _mood = FeedMood.all;



  @override

  void initState() {

    super.initState();

    TripProfileStore.instance.profile.addListener(_onProfileChanged);

    _onProfileChanged();

  }



  @override

  void dispose() {

    TripProfileStore.instance.profile.removeListener(_onProfileChanged);

    super.dispose();

  }



  void _onProfileChanged() {

    final next = normalizeFeedMood(_mood, TripProfileStore.instance.profile.value);

    if (next != _mood && mounted) {

      setState(() => _mood = next);

    }

  }



  @override

  Widget build(BuildContext context) {

    return SafeArea(
      top: false,
      child: ListenableBuilder(

        listenable: CityPackRegistry.instance,

        builder: (context, _) {

          return ListenableBuilder(

        listenable: DiscoverRadiusController.instance,

        builder: (context, _) {

          return ValueListenableBuilder<TripProfile?>(

            valueListenable: TripProfileStore.instance.profile,

            builder: (context, profile, _) {

          final radius = DiscoverRadiusController.instance.radius;

          final allFeed = PlacesRepository.instance.feedWithinRadius(radius);

          final feedMap = CityPackRegistry.instance.feedItemPlaceIds;

          final visibleMoods = visibleFeedMoods(profile);

          final mood = normalizeFeedMood(_mood, profile);

          if (mood != _mood) {

            WidgetsBinding.instance.addPostFrameCallback((_) {

              if (mounted) setState(() => _mood = mood);

            });

          }

          final feed = mood == FeedMood.all

              ? allFeed

              : allFeed.where((item) {

                  final place = PlacesRepository.instance

                      .byId(feedMap[item.id]);

                  return place != null && mood.matches(place);

                }).toList();

          final lockedFeed = FreemiumService.lockedCount(
            feed.length,
            FreemiumUnlockTrigger.experiencesPreview,
          );
          final visibleFeed = FreemiumService.previewSlice(
            feed,
            FreemiumUnlockTrigger.experiencesPreview,
          );

          final l = context.l10n;

          final isFamily = feedTripIsFamily(profile);



          return ListView.builder(

        padding: const EdgeInsets.all(20),

        itemCount: visibleFeed.length + 1 + (lockedFeed > 0 ? 1 : 0),

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

                        l.feedBadge,

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

                    l.feedTitle,

                    style: Theme.of(context).textTheme.headlineMedium,

                  ),

                  const SizedBox(height: 8),

                  Text(

                    isFamily ? l.feedSubtitleFamily : l.feedSubtitle,

                    style: const TextStyle(color: LuxColors.stone400, height: 1.45),

                  ),

                  const SizedBox(height: 12),

                  Wrap(

                    spacing: 6,

                    runSpacing: 6,

                    children: [

                      _FeedPill(l.feedPillTrending, LuxColors.feedAccent),

                      _FeedPill(l.feedPillNewOpenings, const Color(0xFFA78BFA)),

                      _FeedPill(l.feedPillCreator, LuxColors.feedHot),

                      _FeedPill(l.feedPillLive, LuxColors.feedLive),

                    ],

                  ),

                  const SizedBox(height: 16),

                  Text(

                    feedMoodPromptForProfile(l, profile),

                    style: TextStyle(

                      fontSize: 11,

                      fontWeight: FontWeight.w700,

                      letterSpacing: 1.5,

                      color: LuxColors.feedAccent.withValues(alpha: 0.9),

                    ),

                  ),

                  const SizedBox(height: 8),

                  SizedBox(

                    height: 36,

                    child: ListView.separated(

                      scrollDirection: Axis.horizontal,

                      itemCount: visibleMoods.length,

                      separatorBuilder: (_, _) => const SizedBox(width: 8),

                      itemBuilder: (context, i) {

                        final chipMood = visibleMoods[i];

                        final selected = chipMood == mood;

                        return ChoiceChip(

                          selected: selected,

                          onSelected: (_) => setState(() => _mood = chipMood),

                          avatar: Icon(

                            chipMood.icon,

                            size: 15,

                            color: selected

                                ? LuxColors.feedAccent

                                : LuxColors.stone400,

                          ),

                          label: Text(chipMood.label(l)),

                          labelStyle: TextStyle(

                            fontSize: 12,

                            fontWeight: FontWeight.w600,

                            color:

                                selected ? LuxColors.cream : LuxColors.stone400,

                          ),

                          backgroundColor: Colors.white.withValues(alpha: 0.04),

                          selectedColor:

                              LuxColors.feedAccent.withValues(alpha: 0.18),

                          side: BorderSide(

                            color: selected

                                ? LuxColors.feedAccent.withValues(alpha: 0.5)

                                : Colors.white.withValues(alpha: 0.1),

                          ),

                          showCheckmark: false,

                        );

                      },

                    ),

                  ),

                  if (isFamily && mood == FeedMood.family) ...[

                    const SizedBox(height: 10),

                    Text(

                      l.feedFamilyMoodHint,

                      style: TextStyle(

                        fontSize: 12,

                        height: 1.35,

                        color: LuxColors.stone500.withValues(alpha: 0.95),

                      ),

                    ),

                  ],

                  const SizedBox(height: 16),

                  DestinationSearchBar(hint: l.discoverSearchHint),

                  const SizedBox(height: 14),

                  const DiscoverRadiusSelector(),

                  const SizedBox(height: 12),

                  const DiscoverScopeBanner(),

                  FeaturedPartnerSection(

                    title: l.featuredExperiencesTitle,

                    subtitle: l.featuredExperiencesSubtitle,

                    items: PartnerSponsorshipService.featuredExperiences(),

                    onItemTap: (item) {

                      if (item.place == null) return;

                      showAttractionDetailSheet(context, place: item.place!);

                    },

                    onCtaTap: (item) =>

                        PartnerSponsorshipService.openSponsorCta(

                      item.sponsorship,

                    ),

                  ),

                  const SizedBox(height: 16),

                  if (feed.isEmpty) ...[

                    const SizedBox(height: 16),

                    Text(

                      mood == FeedMood.family

                          ? l.feedEmptyHintFamily

                          : l.feedEmptyHint,

                      style: TextStyle(

                        color: LuxColors.stone500,

                        height: 1.45,

                        fontSize: 13,

                      ),

                    ),

                  ],

                ],

              ),

            );

          }



          if (i == visibleFeed.length + 1 && lockedFeed > 0) {
            return FreemiumUnlockCta(
              trigger: FreemiumUnlockTrigger.experiencesPreview,
              lockedCount: lockedFeed,
            );
          }

          final item = visibleFeed[i - 1];

          final placeId = feedMap[item.id];

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

                  if (place != null) {

                    showAttractionDetailSheet(context, place: place);

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

                    overlayChild: Stack(

                      children: [

                        Align(

                          alignment: Alignment.topLeft,

                          child: Padding(

                            padding: const EdgeInsets.all(10),

                            child: _FeedBadge(

                              label: catalogText(context, item.kindLabel),

                              live: item.isLive,

                            ),

                          ),

                        ),

                        if (item.activeSponsorship != null)

                          Align(

                            alignment: Alignment.topRight,

                            child: Padding(

                              padding: const EdgeInsets.all(10),

                              child: PartnerSponsorBadge(

                                sponsorship: item.activeSponsorship!,

                                compact: true,

                              ),

                            ),

                          ),

                      ],

                    ),

                  ),

                  Padding(

                    padding: const EdgeInsets.all(16),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(

                          catalogText(context, item.title),

                          style: const TextStyle(

                            fontSize: 18,

                            fontWeight: FontWeight.w700,

                          ),

                        ),

                        Text(

                          '${catalogText(context, item.subtitle)} · ${catalogText(context, item.location)}',

                          style: const TextStyle(

                            fontSize: 12,

                            color: LuxColors.stone500,

                          ),

                        ),

                        const SizedBox(height: 10),

                        PlaceVibeChipRow(
                          vibes: PlaceVibeResolver.forFeedItem(item, place),
                          compact: true,
                        ),

                        if (item.socialProof.trim().isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            catalogText(context, item.socialProof),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: LuxColors.feedAccent.withValues(alpha: 0.9),
                            ),
                          ),
                        ],

                        const SizedBox(height: 12),

                        AffiliateHint(

                          category: _affiliateForKind(l, item.kind),

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

      );

            },

          );

        },

      );

        },

      ),

    );

  }



  String _affiliateForKind(AppLocalizations l, FeedItemKind kind) {

    return switch (kind) {

      FeedItemKind.newOpening => l.affiliateRestaurants,

      FeedItemKind.seasonal => l.affiliateExperiences,

      FeedItemKind.viralSpot => l.affiliateRestaurants,

      FeedItemKind.trending => l.affiliateThemeParks,

      FeedItemKind.creatorPick => l.affiliateExperiences,

      FeedItemKind.liveUpdate => l.affiliateDayPasses,

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


