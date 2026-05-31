import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/partner_sponsorship_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/destination_search_sheet.dart';
import 'package:luxora_ai/widgets/hotel_card.dart';
import 'package:luxora_ai/widgets/hotel_compare_sheet.dart';
import 'package:luxora_ai/widgets/hotel_detail_sheet.dart';
import 'package:luxora_ai/widgets/lux_responsive_frame.dart';
import 'package:luxora_ai/widgets/lux_secondary_app_bar.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/services/freemium_limits.dart';
import 'package:luxora_ai/services/freemium_service.dart';
import 'package:luxora_ai/widgets/freemium/freemium_unlock_cta.dart';
import 'package:luxora_ai/widgets/partner_sponsor_badge.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  final Set<String> _compareIds = {};

  void _toggleCompare(LuxHotel hotel) {
    setState(() {
      if (_compareIds.contains(hotel.id)) {
        _compareIds.remove(hotel.id);
      } else if (_compareIds.length < 3) {
        _compareIds.add(hotel.id);
      }
    });
  }

  void _openCompare() {
    final hotels = _compareIds
        .map(HotelIntelligenceService.hotelById)
        .whereType<LuxHotel>()
        .toList();
    if (hotels.length < 2) return;
    showHotelCompareSheet(context, hotels: hotels);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final allHotels = HotelIntelligenceService.allHotels();
    final hotels = FreemiumService.previewSlice(
      allHotels,
      FreemiumUnlockTrigger.hotelsPreview,
    );
    final lockedHotels = FreemiumService.lockedCount(
      allHotels.length,
      FreemiumUnlockTrigger.hotelsPreview,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: LuxSecondaryAppBar(title: l.navStays),
      body: SafeArea(
        top: false,
        child: LuxResponsiveFrame(
          child: ValueListenableBuilder(
        valueListenable: HomeBaseStore.instance.placeId,
        builder: (context, homeBaseId, _) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Text(
                      l.hotelIntelBadge,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.5,
                        color: LuxColors.gold.withValues(alpha: 0.8),
                      ),
                    ),
                    Text(
                      l.hotelIntelTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l.hotelIntelSubtitle,
                      style: const TextStyle(
                        color: LuxColors.stone400,
                        height: 1.45,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 16),
                    DestinationSearchBar(
                      hint: l.browseSearchAllHotels,
                      initialFilter: PlaceSearchFilter.hotels,
                    ),
                    const SizedBox(height: 16),
                    GlassCard(
                      glow: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.auto_awesome_rounded,
                                color: LuxColors.gold,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  l.hotelMatchmakerTeaser,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    height: 1.45,
                                    color: LuxColors.cream,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          LuxButton(
                            label: l.hotelMatchmakerCta,
                            icon: Icons.travel_explore_rounded,
                            onPressed: () async {
                              if (!FreemiumService.hasFullAccess()) {
                                await FreemiumService.promptUnlock(
                                  context,
                                  trigger: FreemiumUnlockTrigger.hotelMatchmaker,
                                );
                                return;
                              }
                              if (!context.mounted) return;
                              context.push('/stays/matchmaker');
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FeaturedPartnerSection(
                      title: l.featuredStaysTitle,
                      subtitle: l.featuredStaysSubtitle,
                      items: PartnerSponsorshipService.featuredStays(),
                      onItemTap: (item) {
                        if (item.hotel == null || item.place == null) return;
                        showHotelDetailSheet(
                          context,
                          hotel: item.hotel!,
                          place: item.place!,
                        );
                      },
                      onCtaTap: (item) =>
                          PartnerSponsorshipService.openSponsorCta(
                        item.sponsorship,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      l.hotelDiscoveryTitle,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                        color: LuxColors.gold.withValues(alpha: 0.85),
                      ),
                    ),
                    const SizedBox(height: 12),
                    for (final hotel in hotels)
                      Builder(
                        builder: (context) {
                          final place =
                              HotelIntelligenceService.placeFor(hotel);
                          if (place == null) return const SizedBox.shrink();
                          return HotelCard(
                            hotel: hotel,
                            place: place,
                            isHomeBase: homeBaseId == place.id,
                            compareSelected: _compareIds.contains(hotel.id),
                            onCompareToggle: () => _toggleCompare(hotel),
                            onTap: () => showHotelDetailSheet(
                              context,
                              hotel: hotel,
                              place: place,
                            ),
                          );
                        },
                      ),
                    FreemiumUnlockCta(
                      trigger: FreemiumUnlockTrigger.hotelsPreview,
                      lockedCount: lockedHotels,
                    ),
                  ],
                ),
              ),
              if (_compareIds.isNotEmpty)
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C0A09).withValues(alpha: 0.95),
                    border: Border(
                      top: BorderSide(
                        color: LuxColors.gold.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          l.hotelCompareSelected(_compareIds.length),
                          style: const TextStyle(
                            fontSize: 12,
                            color: LuxColors.stone400,
                          ),
                        ),
                      ),
                      LuxButton(
                        label: l.hotelCompareTitle,
                        onPressed:
                            _compareIds.length >= 2 ? _openCompare : null,
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
        ),
      ),
    );
  }
}
