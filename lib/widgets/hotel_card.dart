import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/models/sponsorship_extensions.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';
import 'package:luxora_ai/widgets/partner_sponsor_badge.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.hotel,
    required this.place,
    this.onTap,
    this.compareSelected = false,
    this.onCompareToggle,
    this.isHomeBase = false,
  });

  final LuxHotel hotel;
  final LuxPlace place;
  final VoidCallback? onTap;
  final bool compareSelected;
  final VoidCallback? onCompareToggle;
  final bool isHomeBase;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: GlassCard(
            padding: EdgeInsets.zero,
            glow: isHomeBase,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: LuxPlaceImage(
                        place: place,
                        overridePhotoId: hotel.unsplashPhotoId,
                        presentation: LuxImagePresentation.feedHero,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: _ScorePill(
                        label: l.hotelLuxoraScore,
                        value: '${hotel.luxoraScore}',
                      ),
                    ),
                    if (hotel.activeSponsorship != null)
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: PartnerSponsorBadge(
                          sponsorship: hotel.activeSponsorship!,
                          compact: true,
                        ),
                      ),
                    if (isHomeBase)
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: LuxColors.gold.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            l.hotelHomeBaseBadge,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0C0A09),
                            ),
                          ),
                        ),
                      ),
                    if (onCompareToggle != null)
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: compareSelected
                                ? LuxColors.gold
                                : Colors.black.withValues(alpha: 0.55),
                            foregroundColor: compareSelected
                                ? const Color(0xFF0C0A09)
                                : LuxColors.cream,
                          ),
                          onPressed: onCompareToggle,
                          icon: Icon(
                            compareSelected
                                ? Icons.check_rounded
                                : Icons.compare_arrows_rounded,
                            size: 18,
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: LuxColors.cream,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        hotel.neighborhood,
                        style: const TextStyle(
                          fontSize: 12,
                          color: LuxColors.stone400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        hotel.emotionalDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.45,
                          color: LuxColors.stone400,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          _MiniChip(
                            label: HotelIntelligenceService.priceRangeLabel(
                              l,
                              hotel.priceRange,
                            ),
                          ),
                          for (final tag in hotel.bestForTags.take(3))
                            _MiniChip(
                              label: HotelIntelligenceService.bestForTagLabel(
                                l,
                                tag,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _ScoreBar(
                            label: l.hotelScoreLuxury,
                            value: hotel.luxuryScore,
                          ),
                          const SizedBox(width: 10),
                          _ScoreBar(
                            label: l.hotelScoreFamily,
                            value: hotel.familyScore,
                          ),
                          const SizedBox(width: 10),
                          _ScoreBar(
                            label: l.hotelScoreRomance,
                            value: hotel.romanceScore,
                          ),
                        ],
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
  }
}

class _ScorePill extends StatelessWidget {
  const _ScorePill({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.35)),
      ),
      child: Text(
        '$label $value',
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: LuxColors.gold,
        ),
      ),
    );
  }
}

class _MiniChip extends StatelessWidget {
  const _MiniChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: LuxColors.gold.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: LuxColors.gold.withValues(alpha: 0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: LuxColors.cream,
        ),
      ),
    );
  }
}

class _ScoreBar extends StatelessWidget {
  const _ScoreBar({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 9, color: LuxColors.stone400),
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value / 100,
              minHeight: 4,
              backgroundColor: Colors.white.withValues(alpha: 0.08),
              color: LuxColors.gold,
            ),
          ),
        ],
      ),
    );
  }
}
