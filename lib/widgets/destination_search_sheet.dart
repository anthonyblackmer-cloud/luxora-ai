import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/catalog_localizer.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/models/sponsorship_extensions.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/place_distance.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/partner_sponsor_badge.dart';

/// Opens destination search (catalog title, city, category, tags).
Future<void> showDestinationSearchSheet(
  BuildContext context, {
  PlaceSearchFilter initialFilter = PlaceSearchFilter.all,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => _DestinationSearchSheet(initialFilter: initialFilter),
  );
}

/// Tappable search affordance — opens [showDestinationSearchSheet].
class DestinationSearchBar extends StatelessWidget {
  const DestinationSearchBar({super.key, this.hint = 'Search destinations…'});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.06),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => showDestinationSearchSheet(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                size: 22,
                color: LuxColors.stone400.withValues(alpha: 0.95),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  hint,
                  style: const TextStyle(
                    fontSize: 14,
                    color: LuxColors.stone500,
                  ),
                ),
              ),
              Icon(
                Icons.tune_rounded,
                size: 18,
                color: LuxColors.gold.withValues(alpha: 0.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Quick category filter for the search sheet — lets users pull a type of
/// place on demand instead of scrolling the full catalog.
enum PlaceSearchFilter { all, hotels, restaurants, destinations }

extension PlaceSearchFilterX on PlaceSearchFilter {
  String labelL10n(AppLocalizations l) => switch (this) {
        PlaceSearchFilter.all => l.discoverFilterAll,
        PlaceSearchFilter.hotels => l.discoverFilterHotels,
        PlaceSearchFilter.restaurants => l.discoverFilterRestaurants,
        PlaceSearchFilter.destinations => l.discoverFilterDestinations,
      };

  bool matches(LuxPlace p) => switch (this) {
        PlaceSearchFilter.all => true,
        PlaceSearchFilter.hotels => p.category == LuxPlaceCategory.hotel,
        PlaceSearchFilter.restaurants => p.category == LuxPlaceCategory.dining ||
            p.category == LuxPlaceCategory.nightlife,
        PlaceSearchFilter.destinations => p.category != LuxPlaceCategory.hotel &&
            p.category != LuxPlaceCategory.dining &&
            p.category != LuxPlaceCategory.nightlife,
      };
}

class _DestinationSearchSheet extends StatefulWidget {
  const _DestinationSearchSheet({this.initialFilter = PlaceSearchFilter.all});

  final PlaceSearchFilter initialFilter;

  @override
  State<_DestinationSearchSheet> createState() => _DestinationSearchSheetState();
}

class _DestinationSearchSheetState extends State<_DestinationSearchSheet> {
  final _controller = TextEditingController();
  final _focus = FocusNode();
  late PlaceSearchFilter _filter;

  @override
  void initState() {
    super.initState();
    _filter = widget.initialFilter;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focus.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _openPlace(LuxPlace place) {
    Navigator.of(context).pop();
    showAttractionDetailSheet(context, place: place);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final radius = DiscoverRadiusController.instance.radius;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: DraggableScrollableSheet(
        initialChildSize: 0.92,
        minChildSize: 0.5,
        maxChildSize: 0.92,
        expand: false,
        builder: (context, scrollController) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF0C0A09),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 8),
                  child: Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          l.discoverSearchTitle,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close_rounded),
                        color: LuxColors.stone400,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _controller,
                    focusNode: _focus,
                    textInputAction: TextInputAction.search,
                    style: const TextStyle(color: LuxColors.cream),
                    decoration: InputDecoration(
                      hintText: l.discoverSearchHint,
                      hintStyle: TextStyle(color: LuxColors.stone500.withValues(alpha: 0.9)),
                      prefixIcon: const Icon(Icons.search_rounded, color: LuxColors.stone500),
                      suffixIcon: ListenableBuilder(
                        listenable: _controller,
                        builder: (context, _) {
                          if (_controller.text.isEmpty) {
                            return const SizedBox.shrink();
                          }
                          return IconButton(
                            icon: const Icon(Icons.clear_rounded),
                            color: LuxColors.stone500,
                            onPressed: () {
                              _controller.clear();
                              setState(() {});
                            },
                          );
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.06),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: LuxColors.gold.withValues(alpha: 0.55),
                        ),
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 2),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final f in PlaceSearchFilter.values)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ChoiceChip(
                              label: Text(f.labelL10n(l)),
                              selected: _filter == f,
                              showCheckmark: false,
                              labelStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: _filter == f
                                    ? const Color(0xFF0C0A09)
                                    : LuxColors.stone300,
                              ),
                              selectedColor: LuxColors.gold,
                              backgroundColor:
                                  Colors.white.withValues(alpha: 0.06),
                              side: BorderSide(
                                color: _filter == f
                                    ? LuxColors.gold
                                    : Colors.white.withValues(alpha: 0.1),
                              ),
                              onSelected: (_) =>
                                  setState(() => _filter = f),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      radius.isUnlimited
                          ? l.discoverSearchScopeAll
                          : l.discoverSearchScopeForRadius(
                              radius.shortLabelL10n(l),
                            ),
                      style: const TextStyle(fontSize: 11, color: LuxColors.stone500),
                    ),
                  ),
                ),
                Expanded(
                  child: ListenableBuilder(
                    listenable: DiscoverRadiusController.instance,
                    builder: (context, _) {
                      final r = DiscoverRadiusController.instance.radius;
                      final repo = PlacesRepository.instance;

                      if (_controller.text.trim().isEmpty) {
                        // No query: All → curated suggestions; a category tab →
                        // pull the nearest venues of that type on demand.
                        if (_filter == PlaceSearchFilter.all) {
                          return _SuggestionsList(
                            scrollController: scrollController,
                            radius: r,
                            onTap: _openPlace,
                            onSuggestion: (term) {
                              _controller.text = term;
                              setState(() {});
                            },
                          );
                        }
                        return _BrowseList(
                          scrollController: scrollController,
                          title: _filter.labelL10n(l),
                          places: repo
                              .placesWithinRadius(r)
                              .where(_filter.matches)
                              .take(80)
                              .toList(),
                          onTap: _openPlace,
                        );
                      }

                      final results = repo
                          .searchPlaces(
                            _controller.text,
                            radius: r,
                            limit: _filter == PlaceSearchFilter.all ? 40 : 150,
                          )
                          .where(_filter.matches)
                          .take(60)
                          .toList();

                      if (results.isEmpty) {
                        return ListView(
                          controller: scrollController,
                          padding: const EdgeInsets.all(24),
                          children: [
                            const Icon(Icons.travel_explore_rounded,
                                size: 40, color: LuxColors.stone500),
                            const SizedBox(height: 12),
                            Text(
                              l.discoverSearchEmpty,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: LuxColors.stone500,
                                height: 1.45,
                              ),
                            ),
                          ],
                        );
                      }

                      return ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                        itemCount: results.length,
                        itemBuilder: (context, i) {
                          final place = results[i];
                          final miles = PlaceDistance.milesFromOrlandoHub(place);
                          return _SearchResultTile(
                            place: place,
                            milesLabel: PlaceDistance.milesLabel(miles),
                            onTap: () => _openPlace(place),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// On-demand category browse list (e.g. nearest Hotels / Restaurants) shown
/// when a filter tab is selected without a search query.
class _BrowseList extends StatelessWidget {
  const _BrowseList({
    required this.scrollController,
    required this.title,
    required this.places,
    required this.onTap,
  });

  final ScrollController scrollController;
  final String title;
  final List<LuxPlace> places;
  final void Function(LuxPlace place) onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    if (places.isEmpty) {
      return ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(24),
        children: [
          const Icon(Icons.travel_explore_rounded,
              size: 40, color: LuxColors.stone500),
          const SizedBox(height: 12),
          Text(
            l.discoverSearchEmpty,
            textAlign: TextAlign.center,
            style: const TextStyle(color: LuxColors.stone500, height: 1.45),
          ),
        ],
      );
    }
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      itemCount: places.length + 1,
      itemBuilder: (context, i) {
        if (i == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              '$title · ${places.length}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: LuxColors.stone500,
              ),
            ),
          );
        }
        final place = places[i - 1];
        return _SearchResultTile(
          place: place,
          milesLabel: PlaceDistance.milesLabel(
            PlaceDistance.milesFromOrlandoHub(place),
          ),
          onTap: () => onTap(place),
        );
      },
    );
  }
}

class _SuggestionsList extends StatelessWidget {
  const _SuggestionsList({
    required this.scrollController,
    required this.radius,
    required this.onTap,
    required this.onSuggestion,
  });

  final ScrollController scrollController;
  final DiscoverRadius radius;
  final void Function(LuxPlace place) onTap;
  final void Function(String term) onSuggestion;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final repo = PlacesRepository.instance;
    final iconic = repo.searchPlaces('iconic', radius: radius, limit: 8);
    final recent = repo.placesWithinRadius(radius).take(8).toList();

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        Text(
          l.discoverPopularInRadius,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: LuxColors.stone500,
          ),
        ),
        const SizedBox(height: 8),
        ...recent.map(
          (p) => _SearchResultTile(
            place: p,
            milesLabel: PlaceDistance.milesLabel(
              PlaceDistance.milesFromOrlandoHub(p),
            ),
            onTap: () => onTap(p),
          ),
        ),
        if (iconic.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(
            l.discoverTrySearching,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: LuxColors.stone500,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final term in [
                'Disney',
                'Universal',
                'springs',
                'beach',
                'Kennedy',
                'SeaWorld',
              ])
                ActionChip(
                  label: Text(term),
                  onPressed: () => onSuggestion(term),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  const _SearchResultTile({
    required this.place,
    required this.milesLabel,
    required this.onTap,
  });

  final LuxPlace place;
  final String milesLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: LuxColors.gold.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    _iconFor(place.category),
                    size: 20,
                    color: LuxColors.gold,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catalogText(context, place.title),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      if (place.activeSponsorship != null) ...[
                        const SizedBox(height: 4),
                        PartnerSponsorBadge(
                          sponsorship: place.activeSponsorship!,
                          compact: true,
                        ),
                      ],
                      const SizedBox(height: 2),
                      Text(
                        '${catalogText(context, place.location)} · ${place.category.labelL10n(l)} · ${l.milesFromActiveHub(milesLabel)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: LuxColors.stone500,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: LuxColors.stone500),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _iconFor(LuxPlaceCategory category) => switch (category) {
        LuxPlaceCategory.beach => Icons.beach_access_rounded,
        LuxPlaceCategory.dining => Icons.restaurant_rounded,
        LuxPlaceCategory.nature => Icons.park_rounded,
        LuxPlaceCategory.nightlife => Icons.nightlife_rounded,
        LuxPlaceCategory.wellness => Icons.spa_rounded,
        LuxPlaceCategory.family => Icons.family_restroom_rounded,
        LuxPlaceCategory.springs => Icons.water_rounded,
        LuxPlaceCategory.romantic => Icons.favorite_rounded,
        LuxPlaceCategory.adventure => Icons.terrain_rounded,
        LuxPlaceCategory.hotel => Icons.hotel_rounded,
      };
}
