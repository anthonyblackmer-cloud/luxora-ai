import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/home_base_store.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/stay_dining_catalog_service.dart';
import 'package:luxora_ai/services/trip_budget_mapper.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/destination_search_sheet.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/hotel_detail_sheet.dart';

/// Scrollable category tabs with 4–5 hotel picks and full-catalog search.
class CategorizedHotelSection extends StatefulWidget {
  const CategorizedHotelSection({
    super.key,
    required this.profile,
    required this.plan,
    this.compact = false,
  });

  final TripProfile profile;
  final TripPlan plan;
  final bool compact;

  @override
  State<CategorizedHotelSection> createState() =>
      _CategorizedHotelSectionState();
}

class _CategorizedHotelSectionState extends State<CategorizedHotelSection>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  static const _categories = HotelBrowseCategory.values;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  String _categoryLabel(HotelBrowseCategory cat) {
    final l = context.l10n;
    return switch (cat) {
      HotelBrowseCategory.recommended => l.browseCatRecommended,
      HotelBrowseCategory.disneyArea => l.browseCatDisneyHotels,
      HotelBrowseCategory.budgetFriendly => l.browseCatBudgetFriendly,
      HotelBrowseCategory.upscaleLuxury => l.browseCatUpscaleLuxury,
      HotelBrowseCategory.universalArea => l.browseCatUniversalHotels,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.hotel_rounded, color: tokens.accent, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l.agendaHotelSuggestionsTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: tokens.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            l.agendaHotelSuggestionsSubtitle(widget.profile.budgetUsd),
            style: TextStyle(fontSize: 12, height: 1.35, color: tokens.textMuted),
          ),
          const SizedBox(height: 12),
          _SearchAffordance(
            hint: l.browseSearchAllHotels,
            onTap: () => showDestinationSearchSheet(
              context,
              initialFilter: PlaceSearchFilter.hotels,
            ),
          ),
          const SizedBox(height: 12),
          DecoratedBox(
            decoration: BoxDecoration(
              color: tokens.panelFill,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: tokens.borderSubtle),
            ),
            child: TabBar(
              controller: _tabs,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: tokens.accent,
              dividerColor: Colors.transparent,
              labelColor: tokens.textPrimary,
              unselectedLabelColor: tokens.textMuted,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
              tabs: [
                for (final cat in _categories) Tab(text: _categoryLabel(cat)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: widget.compact ? 220 : 260,
            child: TabBarView(
              controller: _tabs,
              children: [
                for (final cat in _categories)
                  _HotelCategoryList(
                    hotels: StayDiningCatalogService.hotelsForCategory(
                      category: cat,
                      profile: widget.profile,
                      plan: widget.plan,
                      l: l,
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

class _HotelCategoryList extends StatelessWidget {
  const _HotelCategoryList({required this.hotels});

  final List<LuxHotel> hotels;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    if (hotels.isEmpty) {
      return Center(
        child: Text(
          l.browseCategoryEmpty,
          textAlign: TextAlign.center,
          style: TextStyle(color: tokens.textMuted, fontSize: 13),
        ),
      );
    }

    return ValueListenableBuilder<String?>(
      valueListenable: HomeBaseStore.instance.placeId,
      builder: (context, homeBaseId, _) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: hotels.length,
          itemBuilder: (context, i) {
            final hotel = hotels[i];
            return _HotelPickRow(
              hotel: hotel,
              isHomeBase: hotel.placeId == homeBaseId,
              onTap: () {
                final place = HotelIntelligenceService.placeFor(hotel);
                if (place == null) return;
                showHotelDetailSheet(context, hotel: hotel, place: place);
              },
            );
          },
        );
      },
    );
  }
}

class _HotelPickRow extends StatelessWidget {
  const _HotelPickRow({
    required this.hotel,
    required this.isHomeBase,
    required this.onTap,
  });

  final LuxHotel hotel;
  final bool isHomeBase;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              isHomeBase ? Icons.check_circle_rounded : Icons.hotel_outlined,
              size: 18,
              color: isHomeBase ? tokens.accent : tokens.textMuted,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: tokens.textPrimary,
                    ),
                  ),
                  Text(
                    '${HotelIntelligenceService.priceRangeLabel(l, hotel.priceRange)} · ${hotel.neighborhood}',
                    style: TextStyle(fontSize: 11, color: tokens.textMuted),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: tokens.textMuted, size: 18),
          ],
        ),
      ),
    );
  }
}

/// Scrollable category tabs with 4–5 restaurant picks and full-catalog search.
class CategorizedRestaurantSection extends StatefulWidget {
  const CategorizedRestaurantSection({
    super.key,
    required this.profile,
    this.day,
    this.excludePlaceIds = const {},
    this.compact = false,
  });

  final TripProfile profile;
  final TripDay? day;
  final Set<String> excludePlaceIds;
  final bool compact;

  @override
  State<CategorizedRestaurantSection> createState() =>
      _CategorizedRestaurantSectionState();
}

class _CategorizedRestaurantSectionState extends State<CategorizedRestaurantSection>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  static const _categories = RestaurantBrowseCategory.values;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  String _categoryLabel(RestaurantBrowseCategory cat) {
    final l = context.l10n;
    return switch (cat) {
      RestaurantBrowseCategory.recommended => l.browseCatRecommended,
      RestaurantBrowseCategory.themeParkDining => l.browseCatThemeParkDining,
      RestaurantBrowseCategory.budgetFriendly => l.browseCatBudgetFriendly,
      RestaurantBrowseCategory.upscaleFineDining => l.browseCatUpscaleDining,
    };
  }

  String _tierLabel(DiningPriceTier tier) {
    final l = context.l10n;
    return switch (tier) {
      DiningPriceTier.budget => l.hotelPriceBudget,
      DiningPriceTier.moderate => l.hotelPriceModerate,
      DiningPriceTier.upscale => l.hotelPriceUpscale,
      DiningPriceTier.luxury => l.hotelPriceLuxury,
    };
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        PlacesRepository.instance,
        CityPackRegistry.instance,
        DiscoverRadiusController.instance,
      ]),
      builder: (context, _) => _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final targetTier = TripBudgetMapper.diningPriceTier(widget.profile);

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.restaurant_rounded, color: tokens.accent, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.day == null
                      ? l.restaurantsPageTitle
                      : l.agendaDayDiningTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    color: tokens.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            widget.day == null
                ? l.restaurantsPageSubtitle
                : l.agendaDayDiningSubtitle(
                    widget.profile.budgetUsd,
                    _tierLabel(targetTier),
                  ),
            style: TextStyle(fontSize: 12, height: 1.35, color: tokens.textMuted),
          ),
          const SizedBox(height: 12),
          _SearchAffordance(
            hint: l.browseSearchAllRestaurants,
            onTap: () => showDestinationSearchSheet(
              context,
              initialFilter: PlaceSearchFilter.restaurants,
            ),
          ),
          const SizedBox(height: 12),
          DecoratedBox(
            decoration: BoxDecoration(
              color: tokens.panelFill,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: tokens.borderSubtle),
            ),
            child: TabBar(
              controller: _tabs,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: tokens.accent,
              dividerColor: Colors.transparent,
              labelColor: tokens.textPrimary,
              unselectedLabelColor: tokens.textMuted,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
              tabs: [
                for (final cat in _categories) Tab(text: _categoryLabel(cat)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: widget.compact ? 220 : 260,
            child: TabBarView(
              controller: _tabs,
              children: [
                for (final cat in _categories)
                  _RestaurantCategoryList(
                    places: StayDiningCatalogService.restaurantsForCategory(
                      category: cat,
                      profile: widget.profile,
                      day: widget.day,
                      excludePlaceIds: widget.excludePlaceIds,
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

class _RestaurantCategoryList extends StatelessWidget {
  const _RestaurantCategoryList({required this.places});

  final List<LuxPlace> places;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    if (places.isEmpty) {
      return Center(
        child: Text(
          l.browseCategoryEmpty,
          textAlign: TextAlign.center,
          style: TextStyle(color: tokens.textMuted, fontSize: 13),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: places.length,
      itemBuilder: (context, i) {
        final place = places[i];
        final tier = TripBudgetMapper.tierForPlace(place);
        return InkWell(
          onTap: () => showAttractionDetailSheet(context, place: place),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(Icons.dinner_dining_rounded, size: 18, color: tokens.accent),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: tokens.textPrimary,
                        ),
                      ),
                      Text(
                        '${switch (tier) {
                          DiningPriceTier.budget => l.hotelPriceBudget,
                          DiningPriceTier.moderate => l.hotelPriceModerate,
                          DiningPriceTier.upscale => l.hotelPriceUpscale,
                          DiningPriceTier.luxury => l.hotelPriceLuxury,
                        }} · ${place.location}',
                        style: TextStyle(fontSize: 11, color: tokens.textMuted),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: tokens.textMuted, size: 18),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SearchAffordance extends StatelessWidget {
  const _SearchAffordance({required this.hint, required this.onTap});

  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: luxThemeTokensOf(context).panelFill,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                size: 20,
                color: luxThemeTokensOf(context).textMuted,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  hint,
                  style: TextStyle(
                    fontSize: 13,
                    color: luxThemeTokensOf(context).textMuted,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
