import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/map_launcher.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/models/sponsorship_extensions.dart';
import 'package:luxora_ai/widgets/partner_sponsor_badge.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

Future<void> showHotelDetailSheet(
  BuildContext context, {
  required LuxHotel hotel,
  required LuxPlace place,
  DayFlow? flow,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => FractionallySizedBox(
      heightFactor: 0.94,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 920),
          child: HotelDetailSheet(hotel: hotel, place: place, flow: flow),
        ),
      ),
    ),
  );
}

class HotelDetailSheet extends StatelessWidget {
  const HotelDetailSheet({
    super.key,
    required this.hotel,
    required this.place,
    this.flow,
  });

  final LuxHotel hotel;
  final LuxPlace place;
  final DayFlow? flow;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF0C0A09),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 8, 2),
            child: Row(
              children: [
                const SizedBox(width: 76),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 42,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                LuxSheetCloseButton(
                  color: LuxColors.cream,
                  background: Colors.white.withValues(alpha: 0.06),
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: HomeBaseStore.instance.placeId,
              builder: (context, homeBaseId, _) {
                return ValueListenableBuilder(
                  valueListenable: SavedPlacesStorage.instance.savedIds,
                  builder: (context, savedIds, _) {
                    return ValueListenableBuilder(
                      valueListenable: TripProfileStore.instance.profile,
                      builder: (context, profile, _) {
                        final isHomeBase = homeBaseId == place.id;
                        final isSaved = savedIds.contains(place.id);
                        final reasons =
                            HotelIntelligenceService.recommendationReasons(
                          hotel: hotel,
                          profile: profile,
                          flow: flow,
                        );
                        final friction =
                            HotelIntelligenceService.travelFrictionScore(hotel);

                        return ListView(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: LuxPlaceImage(
                                place: place,
                                presentation: LuxImagePresentation.detailHero,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              hotel.name,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: LuxColors.cream,
                              ),
                            ),
                            Text(
                              hotel.neighborhood,
                              style: const TextStyle(
                                fontSize: 13,
                                color: LuxColors.stone400,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              hotel.emotionalDescription,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                color: LuxColors.stone400,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _ScoreGrid(hotel: hotel),
                            const SizedBox(height: 16),
                            _AttractionDistances(hotel: hotel),
                            const SizedBox(height: 18),
                            GlassCard(
                              glow: true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l.hotelWhyRecommendTitle,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: LuxColors.cream,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  for (final reason in reasons)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.auto_awesome_rounded,
                                            size: 14,
                                            color: LuxColors.gold,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              HotelIntelligenceService
                                                  .reasonText(
                                                l,
                                                reason,
                                                hotel,
                                              ),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                height: 1.45,
                                                color: LuxColors.stone400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 14),
                            GlassCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l.hotelItineraryImpactTitle,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    l.hotelItineraryImpactBody(
                                      HotelIntelligenceService
                                          .driveTimeImpactLabel(hotel),
                                      friction,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      height: 1.45,
                                      color: LuxColors.stone400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (final tag in hotel.bestForTags)
                                  Chip(
                                    label: Text(
                                      HotelIntelligenceService.bestForTagLabel(
                                        l,
                                        tag,
                                      ),
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    backgroundColor:
                                        LuxColors.gold.withValues(alpha: 0.1),
                                    side: BorderSide(
                                      color:
                                          LuxColors.gold.withValues(alpha: 0.25),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            LuxButton(
                              label: isHomeBase
                                  ? l.hotelHomeBaseActive
                                  : l.hotelAddHomeBase,
                              icon: Icons.home_rounded,
                              onPressed: () async {
                                final set = await HomeBaseStore.instance
                                    .toggle(place.id);
                                if (!context.mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      set
                                          ? l.detailHomeBaseSetSnack
                                          : l.detailHomeBaseClearedSnack,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: LuxButton(
                                    label: l.hotelViewOnMap,
                                    outline: true,
                                    icon: Icons.map_rounded,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      context.go('/map');
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: LuxButton(
                                    label: l.hotelGetDirections,
                                    outline: true,
                                    icon: Icons.directions_rounded,
                                    onPressed: () => MapLauncher.openDirections(
                                      latitude: place.latitude,
                                      longitude: place.longitude,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: LuxButton(
                                    label: l.hotelCheckRates,
                                    outline: true,
                                    icon: Icons.open_in_new_rounded,
                                    onPressed: () {
                                      final url =
                                          HotelIntelligenceService
                                              .checkRatesUrlFor(hotel);
                                      if (url.isNotEmpty) {
                                        MapLauncher.openUrl(url);
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: LuxButton(
                                    label: l.hotelVisitWebsite,
                                    outline: true,
                                    icon: Icons.language_rounded,
                                    onPressed: () {
                                      final url =
                                          HotelIntelligenceService
                                              .websiteUrlFor(hotel);
                                      if (url.isNotEmpty) {
                                        MapLauncher.openUrl(url);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            if (hotel.activeSponsorship != null) ...[
                              PartnerSponsorCtaButton(
                                sponsorship: hotel.activeSponsorship!,
                              ),
                              const SizedBox(height: 10),
                            ],
                            LuxButton(
                              label: isSaved ? l.hotelSaved : l.hotelSave,
                              outline: true,
                              icon: isSaved
                                  ? Icons.bookmark_rounded
                                  : Icons.bookmark_outline_rounded,
                              onPressed: () async {
                                await SavedPlacesStorage.instance
                                    .toggle(place.id);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreGrid extends StatelessWidget {
  const _ScoreGrid({required this.hotel});

  final LuxHotel hotel;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Row(
      children: [
        _ScoreTile(label: l.hotelScoreLuxury, value: hotel.luxuryScore),
        _ScoreTile(label: l.hotelScoreFamily, value: hotel.familyScore),
        _ScoreTile(label: l.hotelScoreRomance, value: hotel.romanceScore),
        _ScoreTile(
          label: l.hotelScoreWalkability,
          value: hotel.walkabilityScore,
        ),
      ],
    );
  }
}

class _ScoreTile extends StatelessWidget {
  const _ScoreTile({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withValues(alpha: 0.04),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Column(
          children: [
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: LuxColors.gold,
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 9, color: LuxColors.stone400),
            ),
          ],
        ),
      ),
    );
  }
}

class _AttractionDistances extends StatelessWidget {
  const _AttractionDistances({required this.hotel});

  final LuxHotel hotel;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.hotelDistanceTitle,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
            color: LuxColors.gold.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final e in hotel.attractionDistances.entries)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withValues(alpha: 0.3),
                ),
                child: Text(
                  '${e.key} · ${e.value}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: LuxColors.stone400,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
