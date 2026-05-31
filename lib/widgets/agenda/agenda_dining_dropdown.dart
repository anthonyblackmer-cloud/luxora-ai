import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/agenda_recommendation_service.dart';
import 'package:luxora_ai/services/freemium_service.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/stay_dining_catalog_service.dart';
import 'package:luxora_ai/services/trip_budget_mapper.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/agenda/agenda_compact_dropdown.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/destination_search_sheet.dart';

/// Per-day dining picker — compact dropdown on Agenda.
class AgendaDiningDropdown extends StatefulWidget {
  const AgendaDiningDropdown({super.key, required this.day});

  final TripDay day;

  static const searchToken = '__search_restaurants__';

  @override
  State<AgendaDiningDropdown> createState() => _AgendaDiningDropdownState();
}

class _AgendaDiningDropdownState extends State<AgendaDiningDropdown> {
  String? _selectedPlaceId;

  @override
  void didUpdateWidget(covariant AgendaDiningDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.day.dayNumber != widget.day.dayNumber) {
      _selectedPlaceId = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    return ListenableBuilder(
      listenable: Listenable.merge([
        PlacesRepository.instance,
        CityPackRegistry.instance,
        DiscoverRadiusController.instance,
      ]),
      builder: (context, _) {
        return ValueListenableBuilder<TripProfile?>(
          valueListenable: TripProfileStore.instance.profile,
          builder: (context, profile, _) {
            final p = profile ?? const TripProfile();
            final onAgenda = {
              for (final item in widget.day.items)
                if (item.placeId != null) item.placeId!,
            };
            var places = AgendaRecommendationService.suggestRestaurantsForDay(
              day: widget.day,
              profile: p,
              excludePlaceIds: onAgenda,
            ).map((s) => s.place).toList();
            if (places.isEmpty) {
              places = StayDiningCatalogService.restaurantsForCategory(
                category: RestaurantBrowseCategory.recommended,
                profile: p,
                day: widget.day,
                excludePlaceIds: onAgenda,
              );
            }

            var selectedId = _selectedPlaceId;
            if (selectedId != null && !places.any((p) => p.id == selectedId)) {
              selectedId = places.isEmpty ? null : places.first.id;
            } else if (selectedId == null && places.isNotEmpty) {
              selectedId = places.first.id;
            }

            String tierLabel(DiningPriceTier tier) => switch (tier) {
                  DiningPriceTier.budget => l.hotelPriceBudget,
                  DiningPriceTier.moderate => l.hotelPriceModerate,
                  DiningPriceTier.upscale => l.hotelPriceUpscale,
                  DiningPriceTier.luxury => l.hotelPriceLuxury,
                };

            final items = <DropdownMenuItem<String>>[
              for (final place in places)
                DropdownMenuItem(
                  value: place.id,
                  child: Text(
                    '${place.title} · ${tierLabel(TripBudgetMapper.tierForPlace(place))}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              DropdownMenuItem(
                value: AgendaDiningDropdown.searchToken,
                child: Text(
                  l.browseSearchAllRestaurants,
                  style: TextStyle(
                    color: tokens.accent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ];

            return AgendaCompactDropdown(
              label: l.agendaDayDiningTitle,
              icon: Icons.restaurant_rounded,
              value: selectedId,
              hint: places.isEmpty
                  ? l.browseCategoryEmpty
                  : l.agendaDiningDropdownHint,
              items: items,
              onChanged: (value) async {
                if (value == null) return;
                if (value == AgendaDiningDropdown.searchToken) {
                  await FreemiumService.openSearchOrPaywall(
                    context,
                    initialFilter: PlaceSearchFilter.restaurants,
                  );
                  return;
                }
                setState(() => _selectedPlaceId = value);
                final place = PlacesRepository.instance.byId(value);
                if (place == null || !context.mounted) return;
                showAttractionDetailSheet(context, place: place);
              },
            );
          },
        );
      },
    );
  }
}
