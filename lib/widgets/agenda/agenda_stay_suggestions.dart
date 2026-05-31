import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/agenda_recommendation_service.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/destination_search_sheet.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/hotel_detail_sheet.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';

/// Onboarding-informed hotel suggestions — replaces the stay dropdown.
class AgendaStaySuggestions extends StatelessWidget {
  const AgendaStaySuggestions({super.key, required this.plan});

  final TripPlan plan;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    return ValueListenableBuilder<TripProfile?>(
      valueListenable: TripProfileStore.instance.profile,
      builder: (context, profile, _) {
        final p = profile ?? const TripProfile();
        final hotels = AgendaRecommendationService.suggestHotels(
          profile: p,
          plan: plan,
          l: l,
        );

        return ValueListenableBuilder<String?>(
          valueListenable: HomeBaseStore.instance.placeId,
          builder: (context, homeBaseId, _) {
            var selectedId = homeBaseId;
            if (selectedId != null &&
                !hotels.any((h) => h.placeId == selectedId)) {
              selectedId = hotels.isEmpty ? null : hotels.first.placeId;
            } else if (selectedId == null && hotels.isNotEmpty) {
              selectedId = hotels.first.placeId;
            }

            if (hotels.isEmpty) {
              return GlassCard(
                child: Text(
                  l.browseCategoryEmpty,
                  style: TextStyle(color: tokens.textMuted),
                ),
              );
            }

            final top = hotels.first;
            final alternates = hotels.skip(1).take(2).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.agendaSuggestionsForYou,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.8,
                    color: tokens.accent.withValues(alpha: 0.85),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l.agendaHotelSuggestionsTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 10),
                _HotelSuggestionCard(
                  hotel: top,
                  selected: selectedId == top.placeId,
                  badge: l.agendaHotelTopPick(top.name),
                  onTap: () => _selectHotel(context, top, hotels),
                ),
                if (alternates.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    l.agendaSuggestionsAlternates,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: tokens.textMuted,
                    ),
                  ),
                  const SizedBox(height: 8),
                  for (final hotel in alternates)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: _HotelSuggestionCard(
                        hotel: hotel,
                        selected: selectedId == hotel.placeId,
                        onTap: () => _selectHotel(context, hotel, hotels),
                      ),
                    ),
                ],
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => showDestinationSearchSheet(
                      context,
                      initialFilter: PlaceSearchFilter.hotels,
                    ),
                    child: Text(l.agendaSuggestionsBrowseAll),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _selectHotel(
    BuildContext context,
    LuxHotel hotel,
    List<LuxHotel> hotels,
  ) async {
    await HomeBaseStore.instance.select(hotel.placeId);
    final place = HotelIntelligenceService.placeFor(hotel);
    if (place == null || !context.mounted) return;
    showHotelDetailSheet(context, hotel: hotel, place: place);
  }
}

Widget _thumbForHotel(LuxHotel hotel) {
  final place = HotelIntelligenceService.placeFor(hotel);
  if (place != null) {
    return LuxPlaceImage(
      place: place,
      presentation: LuxImagePresentation.timelineThumb,
    );
  }
  return Container(
    width: 56,
    height: 56,
    color: LuxColors.stone500,
    child: const Icon(Icons.hotel_rounded, color: LuxColors.stone400),
  );
}

class _HotelSuggestionCard extends StatelessWidget {
  const _HotelSuggestionCard({
    required this.hotel,
    required this.selected,
    required this.onTap,
    this.badge,
  });

  final LuxHotel hotel;
  final bool selected;
  final VoidCallback onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: GlassCard(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _thumbForHotel(hotel),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (badge != null)
                      Text(
                        badge!,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                          color: tokens.accent,
                        ),
                      ),
                    Text(
                      hotel.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${hotel.neighborhood} · ${HotelIntelligenceService.priceRangeLabel(l, hotel.priceRange)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: tokens.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              if (selected)
                Icon(Icons.check_circle_rounded, color: tokens.accent),
            ],
          ),
        ),
      ),
    );
  }
}
