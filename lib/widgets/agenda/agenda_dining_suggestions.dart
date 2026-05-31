import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/agenda_recommendation_service.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/stay_dining_catalog_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/destination_search_sheet.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_place_image.dart';

/// Onboarding-informed dining suggestions — replaces the dining dropdown.
class AgendaDiningSuggestions extends StatefulWidget {
  const AgendaDiningSuggestions({super.key, required this.day});

  final TripDay day;

  @override
  State<AgendaDiningSuggestions> createState() => _AgendaDiningSuggestionsState();
}

class _AgendaDiningSuggestionsState extends State<AgendaDiningSuggestions> {
  String? _selectedPlaceId;

  @override
  void didUpdateWidget(covariant AgendaDiningSuggestions oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.day.dayNumber != widget.day.dayNumber) {
      _selectedPlaceId = null;
    }
  }

  String _reasonLabel(AppLocalizations l, AgendaRestaurantReason reason) =>
      switch (reason) {
        AgendaRestaurantReason.nearTodaysStops => l.agendaDiningNearStops,
        AgendaRestaurantReason.fitsBudget => l.agendaDiningFitsBudget,
        AgendaRestaurantReason.matchesDayVibe => l.agendaDiningMatchesDay,
        AgendaRestaurantReason.foodiePick => l.agendaDiningFoodiePick,
      };

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    return ListenableBuilder(
      listenable: Listenable.merge([
        TripProfileStore.instance.profile,
        PlacesRepository.instance,
        CityPackRegistry.instance,
        DiscoverRadiusController.instance,
      ]),
      builder: (context, _) {
        final profile =
            TripProfileStore.instance.profile.value ?? const TripProfile();
        final onAgendaIds = {
          for (final item in widget.day.items)
            if (item.placeId != null) item.placeId!,
        };

        var suggestions = AgendaRecommendationService.suggestRestaurantsForDay(
          day: widget.day,
          profile: profile,
          excludePlaceIds: onAgendaIds,
        );

        if (suggestions.isEmpty) {
          final fallback = StayDiningCatalogService.restaurantsForCategory(
            category: RestaurantBrowseCategory.recommended,
            profile: profile,
            day: widget.day,
          );
          suggestions = fallback
              .map(
                (p) => AgendaRestaurantSuggestion(
                  place: p,
                  score: 50,
                  primaryReason: AgendaRestaurantReason.fitsBudget,
                ),
              )
              .toList();
        }

        if (suggestions.isEmpty) {
          return const SizedBox.shrink();
        }

        var selectedId = _selectedPlaceId;
        if (selectedId != null &&
            !suggestions.any((s) => s.place.id == selectedId)) {
          selectedId = null;
        }
        selectedId ??= suggestions.first.place.id;

        final top = suggestions.first;
        final alternates = suggestions.skip(1).take(2).toList();

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
              l.agendaDayDiningTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 10),
            _DiningCard(
              place: top.place,
              reason: _reasonLabel(l, top.primaryReason),
              selected: selectedId == top.place.id,
              onTap: () => _select(context, top.place),
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
              for (final alt in alternates)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _DiningCard(
                    place: alt.place,
                    reason: _reasonLabel(l, alt.primaryReason),
                    selected: selectedId == alt.place.id,
                    onTap: () => _select(context, alt.place),
                  ),
                ),
            ],
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => showDestinationSearchSheet(
                  context,
                  initialFilter: PlaceSearchFilter.restaurants,
                ),
                child: Text(l.agendaSuggestionsBrowseAll),
              ),
            ),
          ],
        );
      },
    );
  }

  void _select(BuildContext context, LuxPlace place) {
    setState(() => _selectedPlaceId = place.id);
    showAttractionDetailSheet(context, place: place);
  }
}

class _DiningCard extends StatelessWidget {
  const _DiningCard({
    required this.place,
    required this.reason,
    required this.selected,
    required this.onTap,
  });

  final LuxPlace place;
  final String reason;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
                child: LuxPlaceImage(
                  place: place,
                  presentation: LuxImagePresentation.timelineThumb,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reason,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: tokens.accent,
                      ),
                    ),
                    Text(
                      place.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      place.location,
                      style: TextStyle(
                        fontSize: 12,
                        color: tokens.textMuted,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
