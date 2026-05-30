import 'package:flutter/material.dart';
import 'package:luxora_ai/data/trip_plans.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/saved_places_storage.dart';
import 'package:luxora_ai/services/partner_sponsorship_service.dart';
import 'package:luxora_ai/services/ticket_savings_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/attraction_detail_sheet.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/partner_sponsor_badge.dart';
import 'package:luxora_ai/widgets/ticket_deal_card.dart';
import 'package:luxora_ai/services/places_repository.dart';

class TicketSavingsScreen extends StatefulWidget {
  const TicketSavingsScreen({super.key});

  @override
  State<TicketSavingsScreen> createState() => _TicketSavingsScreenState();
}

class _TicketSavingsScreenState extends State<TicketSavingsScreen> {
  TicketDealCategory? _category;
  TicketDealSort _sort = TicketDealSort.highestSavings;
  TicketDeal? _calculatorDeal;

  @override
  void initState() {
    super.initState();
    final deals = TicketSavingsService.allDeals();
    if (deals.isNotEmpty) _calculatorDeal = deals.first;
  }

  List<TicketDeal> _visibleDeals() {
    var deals = TicketSavingsService.allDeals();
    deals = TicketSavingsService.filter(deals, _category);
    return TicketSavingsService.sort(deals, _sort);
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return SafeArea(
      child: ValueListenableBuilder<TripProfile?>(
        valueListenable: TripProfileStore.instance.profile,
        builder: (context, profile, _) {
          return ValueListenableBuilder<Set<String>>(
            valueListenable: SavedPlacesStorage.instance.savedIds,
            builder: (context, savedIds, _) {
              final adults = profile?.adults ?? 2;
              final kids = profile?.kids ?? 0;
              final deals = _visibleDeals();
              final insights = TicketSavingsService.insightsFor(
                plan: sampleGoldenEscapePlan,
                profile: profile,
                savedPlaceIds: savedIds,
              );
              final itineraryMatches = TicketSavingsService.dealsMatchingItinerary(
                TicketSavingsService.detectItineraryTags(
                  plan: sampleGoldenEscapePlan,
                  savedPlaceIds: savedIds,
                ),
              );

              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Text(
                    l.ticketSavingsBadgeLabel,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.5,
                      color: LuxColors.gold.withValues(alpha: 0.8),
                    ),
                  ),
                  Text(
                    l.ticketSavingsTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l.ticketSavingsSubtitle,
                    style: const TextStyle(
                      color: LuxColors.stone400,
                      height: 1.45,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FeaturedPartnerSection(
                    title: l.featuredTicketPartnersTitle,
                    subtitle: l.featuredTicketPartnersSubtitle,
                    items: PartnerSponsorshipService.featuredTicketPartners(),
                    onItemTap: (_) {},
                    onCtaTap: (item) =>
                        PartnerSponsorshipService.openSponsorCta(
                      item.sponsorship,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (insights.isNotEmpty)
                    _AiInsightCard(insight: insights.first, l: l),
                  if (itineraryMatches.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.ticketItineraryMatchTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            l.ticketOverpaying,
                            style: TextStyle(
                              fontSize: 12,
                              color: LuxColors.gold.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  _PotentialSavingsCalculator(
                    deal: _calculatorDeal,
                    deals: TicketSavingsService.allDeals(),
                    adults: adults,
                    kids: kids,
                    onDealChanged: (d) => setState(() => _calculatorDeal = d),
                  ),
                  const SizedBox(height: 18),
                  Text(l.ticketFilterLabel,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _FilterChip(
                        label: l.ticketFilterAll,
                        selected: _category == null,
                        onTap: () => setState(() => _category = null),
                      ),
                      for (final c in TicketDealCategory.values)
                        _FilterChip(
                          label: _categoryLabel(l, c),
                          selected: _category == c,
                          onTap: () => setState(() => _category = c),
                        ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(l.ticketSortLabel,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final s in TicketDealSort.values)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(_sortLabel(l, s),
                                  style: const TextStyle(fontSize: 12)),
                              selected: _sort == s,
                              onSelected: (_) => setState(() => _sort = s),
                              selectedColor:
                                  LuxColors.gold.withValues(alpha: 0.22),
                              checkmarkColor: LuxColors.gold,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(l.ticketDealsSectionTitle,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 10),
                  if (deals.isEmpty)
                    Text(l.ticketNoDeals,
                        style: const TextStyle(color: LuxColors.stone400))
                  else
                    for (final deal in deals)
                      TicketDealCard(
                        deal: deal,
                        familySavingsUsd: TicketSavingsService.familySavingsUsd(
                          deal: deal,
                          adults: adults,
                          kids: kids,
                        ),
                        onTap: () {
                          final placeId = deal.placeId;
                          if (placeId == null) return;
                          final place = PlacesRepository.instance.byId(placeId);
                          if (place != null) {
                            showAttractionDetailSheet(context, place: place);
                          }
                        },
                      ),
                  const SizedBox(height: 24),
                ],
              );
            },
          );
        },
      ),
    );
  }

  String _categoryLabel(AppLocalizations l, TicketDealCategory c) =>
      switch (c) {
        TicketDealCategory.themeParks => l.ticketFilterThemeParks,
        TicketDealCategory.attractions => l.ticketFilterAttractions,
        TicketDealCategory.tours => l.ticketFilterTours,
        TicketDealCategory.diningExperiences => l.ticketFilterDining,
        TicketDealCategory.waterParks => l.ticketFilterWaterParks,
        TicketDealCategory.familyActivities => l.ticketFilterFamily,
        TicketDealCategory.entertainment => l.ticketFilterEntertainment,
      };

  String _sortLabel(AppLocalizations l, TicketDealSort s) => switch (s) {
        TicketDealSort.highestSavings => l.ticketSortHighestSavings,
        TicketDealSort.mostPopular => l.ticketSortMostPopular,
        TicketDealSort.familyFriendly => l.ticketSortFamilyFriendly,
        TicketDealSort.luxuryExperiences => l.ticketSortLuxury,
        TicketDealSort.closestToMe => l.ticketSortClosest,
      };
}

class _AiInsightCard extends StatelessWidget {
  const _AiInsightCard({required this.insight, required this.l});

  final dynamic insight;
  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final message = switch (insight.message as String) {
      'disney_pass' => l.ticketInsightDisneyPass,
      'universal_combo' => l.ticketInsightUniversalCombo,
      'seaworld_combo' => l.ticketInsightSeaworldCombo,
      'miami_culture' => l.ticketInsightMiamiCulture,
      'miami_everglades' => l.ticketInsightMiamiEverglades,
      'miami_wynwood' => l.ticketInsightMiamiWynwood,
      _ => l.ticketInsightGeneric,
    };
    return GlassCard(
      glow: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.auto_awesome_rounded, color: LuxColors.gold, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.ticketAiInsightTitle,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    color: LuxColors.gold.withValues(alpha: 0.85),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.45,
                    color: LuxColors.cream,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l.ticketEstimatedFamilySave(_usd(insight.estimatedFamilySavingsUsd)),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: LuxColors.gold,
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

class _PotentialSavingsCalculator extends StatelessWidget {
  const _PotentialSavingsCalculator({
    required this.deal,
    required this.deals,
    required this.adults,
    required this.kids,
    required this.onDealChanged,
  });

  final TicketDeal? deal;
  final List<TicketDeal> deals;
  final int adults;
  final int kids;
  final ValueChanged<TicketDeal?> onDealChanged;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final selected = deal;
    if (selected == null) return const SizedBox.shrink();

    final perTicket = selected.savingsUsd;
    final family = TicketSavingsService.familySavingsUsd(
      deal: selected,
      adults: adults,
      kids: kids,
    );

    return GlassCard(
      glow: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.ticketCalculatorTitle,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<TicketDeal>(
            initialValue: selected,
            isExpanded: true,
            dropdownColor: const Color(0xFF1C1917),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.06),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: [
              for (final d in deals)
                DropdownMenuItem(
                  value: d,
                  child: Text(
                    d.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
            selectedItemBuilder: (context) => [
              for (final d in deals)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    d.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
            onChanged: onDealChanged,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _CalcStat(
                  label: l.ticketOfficialPrice,
                  value: '\$${selected.officialPriceUsd}',
                ),
              ),
              Expanded(
                child: _CalcStat(
                  label: l.ticketDiscountPrice,
                  value: '\$${selected.discountPriceUsd}',
                  highlight: true,
                ),
              ),
              Expanded(
                child: _CalcStat(
                  label: l.ticketSaveAmountLabel,
                  value: '\$$perTicket',
                  highlight: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            l.ticketSavePerTicket(_usd(perTicket)),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: LuxColors.cream,
            ),
          ),
          Text(
            l.ticketFamilySave(_usd(family)),
            style: const TextStyle(fontSize: 13, color: LuxColors.stone400),
          ),
        ],
      ),
    );
  }
}

class _CalcStat extends StatelessWidget {
  const _CalcStat({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  final String label;
  final String value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: LuxColors.stone500)),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: highlight ? 16 : 14,
            color: highlight ? LuxColors.gold : LuxColors.cream,
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label, style: const TextStyle(fontSize: 12)),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: LuxColors.gold.withValues(alpha: 0.2),
      checkmarkColor: LuxColors.gold,
    );
  }
}

String _usd(int amount) => '\$$amount';
