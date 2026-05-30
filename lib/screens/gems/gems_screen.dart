import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/data/city_content_catalog.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/partner_sponsorship_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/services/unsplash_download_tracker.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/destination_search_sheet.dart';
import 'package:luxora_ai/widgets/discover_radius_selector.dart';
import 'package:luxora_ai/widgets/discover_scope_banner.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/affiliate_hint.dart';
import 'package:luxora_ai/widgets/partner_sponsor_badge.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Curated secret discoveries — insider knowledge, not trending social content.
class GemsScreen extends StatelessWidget {
  const GemsScreen({super.key});

  List<HiddenGem> _gemsForRadius() {
    final radius = DiscoverRadiusController.instance.radius;
    final repo = PlacesRepository.instance;
    final gemMap = CityPackRegistry.instance.gemPlaceIds;
    return CityContentCatalog.hiddenGemsForActive().where((gem) {
      final placeId = gemMap[gem.id];
      if (placeId == null) {
        return true;
      }
      final place = repo.byId(placeId);
      return place != null && repo.isDiscoverable(place, radius);
    }).toList();
  }

  /// Tag set derived from the saved trip profile — moods plus interest dials
  /// that are leaned into (>= 60). Drives which gems are "matched to your
  /// style" and floated to the top.
  static Set<String> _profileTags(TripProfile? p) {
    if (p == null) return const {};
    final tags = <String>{};
    for (final m in p.moods) {
      tags.addAll(_moodTags(m));
    }
    if (p.foodieInterest >= 60) tags.addAll(const ['foodie', 'dining']);
    if (p.nightlifeInterest >= 60) {
      tags.addAll(const ['nightlife', 'trending', 'social']);
    }
    if (p.poolsideInterest >= 60) {
      tags.addAll(const ['relaxing', 'wellness', 'springs', 'beach']);
    }
    if (p.adventureInterest >= 60) {
      tags.addAll(const ['adventure', 'nature', 'water']);
    }
    if (p.cultureInterest >= 60) {
      tags.addAll(const ['iconic', 'culture', 'historic', 'arts']);
    }
    return tags;
  }

  static List<String> _moodTags(TripMood mood) => switch (mood) {
        TripMood.romantic => const ['romantic'],
        TripMood.relaxing => const ['relaxing', 'wellness', 'beach', 'springs'],
        TripMood.adventurous => const ['adventure'],
        TripMood.luxurious => const ['luxury'],
        TripMood.familyBonding => const ['family'],
        TripMood.social => const ['nightlife', 'trending'],
        TripMood.nature => const ['nature', 'springs'],
        TripMood.wellness => const ['wellness'],
        TripMood.foodie => const ['foodie'],
      };

  /// Stable-partitions gems so those matching the profile come first, each
  /// tagged so the card can show a "matched" badge.
  List<({HiddenGem gem, bool matched})> _rankGems(
    List<HiddenGem> gems,
    Set<String> tags,
  ) {
    if (tags.isEmpty) {
      return [for (final g in gems) (gem: g, matched: false)];
    }
    final repo = PlacesRepository.instance;
    final gemMap = CityPackRegistry.instance.gemPlaceIds;
    bool isMatch(HiddenGem g) {
      final place = repo.byId(gemMap[g.id]);
      if (place == null) return false;
      return place.moodTags.any((t) => tags.contains(t.toLowerCase()));
    }

    final matched = <({HiddenGem gem, bool matched})>[];
    final rest = <({HiddenGem gem, bool matched})>[];
    for (final g in gems) {
      if (isMatch(g)) {
        matched.add((gem: g, matched: true));
      } else {
        rest.add((gem: g, matched: false));
      }
    }
    return [...matched, ...rest];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListenableBuilder(
        listenable: DiscoverRadiusController.instance,
        builder: (context, _) {
          return ValueListenableBuilder<TripProfile?>(
            valueListenable: TripProfileStore.instance.profile,
            builder: (context, profile, _) {
          final tags = _profileTags(profile);
          final rankedGems = _rankGems(_gemsForRadius(), tags);
          final matchedCount = rankedGems.where((g) => g.matched).length;

          return ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: rankedGems.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            final l = context.l10n;
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
                        l.gemsBadge,
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
                    l.gemsTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l.gemsSubtitle,
                    style: const TextStyle(color: LuxColors.stone400, height: 1.45),
                  ),
                  if (matchedCount > 0) ...[
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.auto_awesome_rounded,
                          size: 14,
                          color: LuxColors.gemAccent.withValues(alpha: 0.95),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            l.gemsMatchedNote(matchedCount),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: LuxColors.gemAccent.withValues(alpha: 0.95),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      _Pill(l.gemsPillHidden),
                      _Pill(l.gemsPillLocal),
                      _Pill(l.gemsPillInsider),
                      _Pill(l.gemsPillCrowd),
                    ],
                  ),
                  const SizedBox(height: 16),
                  DestinationSearchBar(hint: l.gemsSearchHint),
                  const SizedBox(height: 14),
                  const DiscoverRadiusSelector(),
                  const SizedBox(height: 12),
                  const DiscoverScopeBanner(),
                  FeaturedPartnerSection(
                    title: l.featuredDiningTitle,
                    subtitle: l.featuredDiningSubtitle,
                    items: PartnerSponsorshipService.featuredDining(),
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
                  if (rankedGems.isEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      l.gemsEmptyHint,
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

          final entry = rankedGems[i - 1];
          final gem = entry.gem;
          final gl = context.l10n;
          final gemMap = CityPackRegistry.instance.gemPlaceIds;
          final place =
              PlacesRepository.instance.byId(gemMap[gem.id]);
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
                            gl.gemLocalSecret,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                catalogText(context, gem.title),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            if (entry.matched) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: LuxColors.gemAccent
                                      .withValues(alpha: 0.16),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: LuxColors.gemAccent
                                        .withValues(alpha: 0.45),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.auto_awesome_rounded,
                                      size: 11,
                                      color: LuxColors.gemAccent
                                          .withValues(alpha: 0.95),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      gl.gemsMatchedBadge,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                        color: LuxColors.gemAccent
                                            .withValues(alpha: 0.95),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                        Text(
                          catalogText(context, gem.location),
                          style: const TextStyle(
                            fontSize: 12,
                            color: LuxColors.stone500,
                          ),
                        ),
                        const SizedBox(height: 14),
                        _GemDetail(
                          icon: Icons.auto_awesome_rounded,
                          label: gl.gemWhySpecial,
                          value: catalogText(context, gem.whySpecial),
                        ),
                        _GemDetail(
                          icon: Icons.schedule_rounded,
                          label: gl.gemBestTime,
                          value: catalogText(context, gem.bestTime),
                        ),
                        _GemDetail(
                          icon: Icons.people_outline_rounded,
                          label: gl.gemCrowdLevel,
                          value: catalogText(context, gem.crowdLevel),
                        ),
                        _GemDetail(
                          icon: Icons.tips_and_updates_outlined,
                          label: gl.gemInsiderTip,
                          value: catalogText(context, gem.insiderTip),
                        ),
                        _GemDetail(
                          icon: Icons.visibility_off_outlined,
                          label: gl.gemLocalNote,
                          value: catalogText(context, gem.localOnlyNote),
                        ),
                        const SizedBox(height: 12),
                        AffiliateHint(category: gl.affiliateExperiences),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ),
          );
        },
      );
            },
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
