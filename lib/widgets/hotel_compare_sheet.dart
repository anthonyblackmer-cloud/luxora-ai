import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

Future<void> showHotelCompareSheet(
  BuildContext context, {
  required List<LuxHotel> hotels,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => FractionallySizedBox(
      heightFactor: 0.88,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 920),
          child: HotelCompareSheet(hotels: hotels),
        ),
      ),
    ),
  );
}

class HotelCompareSheet extends StatelessWidget {
  const HotelCompareSheet({super.key, required this.hotels});

  final List<LuxHotel> hotels;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return LuxoraPremiumSheetShell(
      title: l.hotelCompareTitle,
      heightFraction: 0.88,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        children: [
          Text(
            l.hotelCompareSubtitle,
            style: const TextStyle(
              fontSize: 12,
              color: LuxColors.stone400,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 52),
                      _CompareLabel(l.hotelComparePrice),
                      _CompareLabel(l.hotelScoreLuxury),
                      _CompareLabel(l.hotelScoreFamily),
                      _CompareLabel(l.hotelScoreRomance),
                      _CompareLabel(l.hotelScoreWalkability),
                      _CompareLabel(l.hotelCompareDriveImpact),
                      _CompareLabel(l.hotelCompareNearby),
                      _CompareLabel(l.hotelLuxoraScore),
                    ],
                  ),
                ),
                for (final hotel in hotels)
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      width: 140,
                      child: GlassCard(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: LuxColors.cream,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _CompareValue(
                              HotelIntelligenceService.priceRangeLabel(
                                l,
                                hotel.priceRange,
                              ),
                            ),
                            _CompareValue('${hotel.luxuryScore}'),
                            _CompareValue('${hotel.familyScore}'),
                            _CompareValue('${hotel.romanceScore}'),
                            _CompareValue('${hotel.walkabilityScore}'),
                            _CompareValue(
                              HotelIntelligenceService.driveTimeImpactLabel(
                                hotel,
                              ),
                            ),
                            _CompareValue(
                              _nearbySummary(hotel),
                              maxLines: 3,
                            ),
                            _CompareValue(
                              '${hotel.luxoraScore}',
                              highlight: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          LuxButton(
            label: l.commonClose,
            outline: true,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  static String _nearbySummary(LuxHotel hotel) {
    final parts = <String>[];
    for (final id in hotel.nearbyDiningPlaceIds.take(1)) {
      final p = PlacesRepository.instance.byId(id);
      if (p != null) parts.add(p.title);
    }
    if (parts.isEmpty && hotel.attractionDistances.isNotEmpty) {
      parts.add(hotel.attractionDistances.keys.first);
    }
    return parts.isEmpty ? hotel.neighborhood : parts.join(', ');
  }
}

class _CompareLabel extends StatelessWidget {
  const _CompareLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: LuxColors.stone400,
        ),
      ),
    );
  }
}

class _CompareValue extends StatelessWidget {
  const _CompareValue(this.text, {this.highlight = false, this.maxLines = 1});

  final String text;
  final bool highlight;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: highlight ? 16 : 12,
          fontWeight: highlight ? FontWeight.w800 : FontWeight.w600,
          color: highlight ? LuxColors.gold : LuxColors.cream,
        ),
      ),
    );
  }
}
