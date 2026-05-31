import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/agenda_recommendation_service.dart';
import 'package:luxora_ai/services/freemium_service.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/agenda/agenda_compact_dropdown.dart';
import 'package:luxora_ai/widgets/destination_search_sheet.dart';
import 'package:luxora_ai/widgets/hotel_detail_sheet.dart';

/// Trip-level hotel picker — compact dropdown on Agenda.
class AgendaStayDropdown extends StatelessWidget {
  const AgendaStayDropdown({super.key, required this.plan});

  final TripPlan plan;

  static const _searchToken = '__search_hotels__';

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
            String? selectedId = homeBaseId;
            if (selectedId != null &&
                !hotels.any((h) => h.placeId == selectedId)) {
              selectedId = hotels.isEmpty ? null : hotels.first.placeId;
            } else if (selectedId == null && hotels.isNotEmpty) {
              selectedId = hotels.first.placeId;
            }

            final items = <DropdownMenuItem<String>>[
              for (final hotel in hotels)
                DropdownMenuItem(
                  value: hotel.placeId,
                  child: Text(
                    '${hotel.name} · ${HotelIntelligenceService.priceRangeLabel(l, hotel.priceRange)}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              DropdownMenuItem(
                value: _searchToken,
                child: Text(
                  l.browseSearchAllHotels,
                  style: TextStyle(
                    color: tokens.accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ];

            return AgendaCompactDropdown(
              label: l.agendaHotelSuggestionsTitle,
              icon: Icons.hotel_rounded,
              value: selectedId,
              hint: hotels.isEmpty ? l.browseCategoryEmpty : l.agendaStayDropdownHint,
              items: items,
              onChanged: (value) async {
                if (value == null) return;
                if (value == _searchToken) {
                  await FreemiumService.openSearchOrPaywall(
                    context,
                    initialFilter: PlaceSearchFilter.hotels,
                  );
                  return;
                }
                await HomeBaseStore.instance.select(value);
                LuxHotel? hotelMatch;
                for (final h in hotels) {
                  if (h.placeId == value) {
                    hotelMatch = h;
                    break;
                  }
                }
                if (hotelMatch == null) return;
                final place = HotelIntelligenceService.placeFor(hotelMatch);
                if (place == null || !context.mounted) return;
                showHotelDetailSheet(context, hotel: hotelMatch, place: place);
              },
            );
          },
        );
      },
    );
  }
}
