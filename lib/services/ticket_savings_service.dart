import 'package:luxora_ai/data/ticket_deals_resolver.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/places_repository.dart';

/// Filters, sorts, savings math, and itinerary-aware recommendations.
abstract final class TicketSavingsService {
  static const _themeParkPlaceIds = {
    'place-magic-kingdom',
    'place-epcot',
    'place-hollywood-studios',
    'place-animal-kingdom',
    'place-universal-studios',
    'place-islands-of-adventure',
    'place-seaworld-orlando',
    'place-legoland-florida',
    'place-volcano-bay',
    'place-epic-universe',
    'place-typhoon-lagoon',
    'place-blizzard-beach',
    'place-aquatica-orlando',
  };

  static List<TicketDeal> allDeals() => TicketDealsResolver.allDealsForActive();

  static List<TicketDeal> filter(
    List<TicketDeal> deals,
    TicketDealCategory? category,
  ) {
    if (category == null) return deals;
    return deals.where((d) => d.category == category).toList();
  }

  static List<TicketDeal> sort(
    List<TicketDeal> deals,
    TicketDealSort mode,
  ) {
    // Trust rule: never sort by sponsor tier — savings and fit only.
    final copy = List<TicketDeal>.from(deals);
    copy.sort((a, b) {
      return switch (mode) {
        TicketDealSort.highestSavings =>
          b.savingsUsd.compareTo(a.savingsUsd),
        TicketDealSort.mostPopular =>
          b.popularityScore.compareTo(a.popularityScore),
        TicketDealSort.familyFriendly => (b.familyFriendly ? 1 : 0)
            .compareTo(a.familyFriendly ? 1 : 0),
        TicketDealSort.luxuryExperiences =>
          (b.luxury ? 1 : 0).compareTo(a.luxury ? 1 : 0),
        TicketDealSort.closestToMe =>
          a.milesFromOrlando.compareTo(b.milesFromOrlando),
      };
    });
    return copy;
  }

  static int familySavingsUsd({
    required TicketDeal deal,
    required int adults,
    required int kids,
  }) {
    final perTicket = deal.savingsUsd;
    if (perTicket <= 0) return 0;
    final kidWeight = 0.85;
    final tickets = adults + kids * kidWeight;
    return (perTicket * tickets).round();
  }

  static List<String> placeIdsFromItinerary(TripPlan plan) {
    return [
      for (final day in plan.days)
        for (final item in day.items)
          if (item.placeId != null) item.placeId!,
    ];
  }

  static List<String> placeIdsFromTitles(Iterable<String> titles) {
    final lower = titles.map((t) => t.toLowerCase()).toList();
    final ids = <String>[];
    for (final deal in TicketDealsResolver.catalogForActive()) {
      final pid = deal.placeId;
      if (pid == null) continue;
      final place = PlacesRepository.instance.byId(pid);
      if (place == null) continue;
      final name = place.title.toLowerCase();
      if (lower.any((t) => t.contains('disney') && name.contains('disney')) ||
          lower.any((t) => name.contains(t.split(' ').first) && t.length > 4)) {
        ids.add(pid);
      }
    }
    return ids;
  }

  static Set<String> detectItineraryTags({
    TripPlan? plan,
    Iterable<String> savedPlaceIds = const [],
    Iterable<String> itemTitles = const [],
  }) {
    final tags = <String>{};
    final placeIds = <String>{
      if (plan != null) ...placeIdsFromItinerary(plan),
      ...savedPlaceIds,
    };

    for (final id in placeIds) {
      tags.addAll(_tagsForPlaceId(id));
    }

    final blob = itemTitles.join(' ').toLowerCase();
    if (blob.contains('disney') || blob.contains('magic kingdom')) {
      tags.add('disney');
    }
    if (blob.contains('universal') || blob.contains('volcano')) {
      tags.add('universal');
    }
    if (blob.contains('seaworld') || blob.contains('aquatica')) {
      tags.add('seaworld');
    }
    if (blob.contains('legoland')) tags.add('legoland');
    if (blob.contains('wynwood') || blob.contains('vizcaya') ||
        blob.contains('little havana') || blob.contains('everglades')) {
      tags.add('miami-culture');
    }
    if (blob.contains('south beach') || blob.contains('ocean drive')) {
      tags.add('south-beach');
    }

    return tags;
  }

  static List<TicketDeal> dealsMatchingItinerary(Set<String> tags) {
    if (tags.isEmpty) return [];
    return TicketDealsResolver.catalogForActive().where((d) {
      return d.itineraryTags.any(tags.contains);
    }).toList()
      ..sort((a, b) => b.savingsUsd.compareTo(a.savingsUsd));
  }

  static List<TicketSavingsInsight> insightsFor({
    TripPlan? plan,
    TripProfile? profile,
    Iterable<String> savedPlaceIds = const [],
  }) {
    final tags = detectItineraryTags(
      plan: plan,
      savedPlaceIds: savedPlaceIds,
      itemTitles: plan == null
          ? const []
          : [
              for (final day in plan.days)
                for (final item in day.items) item.title,
            ],
    );
    final matches = dealsMatchingItinerary(tags);
    if (matches.isEmpty) return [];

    final adults = profile?.adults ?? 2;
    final kids = profile?.kids ?? 0;
    final insights = <TicketSavingsInsight>[];

    final disneyDays = tags.where((t) => t.startsWith('disney') || t == 'magic-kingdom').length;
    if (tags.contains('disney') || disneyDays > 0) {
      final pass = matches.firstWhere(
        (d) => d.id == 'deal-disney-3day-pass',
        orElse: () => matches.first,
      );
      final save = familySavingsUsd(deal: pass, adults: adults, kids: kids) * 2;
      insights.add(TicketSavingsInsight(
        message: 'disney_pass',
        estimatedFamilySavingsUsd: save.clamp(40, 500),
        relatedDealIds: [pass.id, ...matches.map((d) => d.id).take(3)],
      ));
    }

    if (tags.contains('universal')) {
      final combo = matches.firstWhere(
        (d) => d.id == 'deal-universal-2park',
        orElse: () => matches.first,
      );
      insights.add(TicketSavingsInsight(
        message: 'universal_combo',
        estimatedFamilySavingsUsd:
            familySavingsUsd(deal: combo, adults: adults, kids: kids),
        relatedDealIds: [combo.id],
      ));
    }

    if (tags.contains('seaworld')) {
      final combo = matches.firstWhere(
        (d) => d.id == 'deal-seaworld-aquatica-combo',
        orElse: () => matches.first,
      );
      insights.add(TicketSavingsInsight(
        message: 'seaworld_combo',
        estimatedFamilySavingsUsd:
            familySavingsUsd(deal: combo, adults: adults, kids: kids),
        relatedDealIds: [combo.id],
      ));
    }

    if (tags.contains('vizcaya') || tags.contains('pamm') ||
        tags.contains('miami-culture')) {
      final culture = matches.firstWhere(
        (d) => d.id == 'deal-miami-vizcaya-admission',
        orElse: () => matches.first,
      );
      insights.add(TicketSavingsInsight(
        message: 'miami_culture',
        estimatedFamilySavingsUsd:
            familySavingsUsd(deal: culture, adults: adults, kids: kids),
        relatedDealIds: [culture.id],
      ));
    }

    if (tags.contains('everglades')) {
      final airboat = matches.firstWhere(
        (d) => d.id == 'deal-miami-everglades-airboat',
        orElse: () => matches.first,
      );
      insights.add(TicketSavingsInsight(
        message: 'miami_everglades',
        estimatedFamilySavingsUsd:
            familySavingsUsd(deal: airboat, adults: adults, kids: kids),
        relatedDealIds: [airboat.id],
      ));
    }

    if (tags.contains('wynwood') || tags.contains('arts')) {
      final art = matches.firstWhere(
        (d) => d.id == 'deal-miami-wynwood-art-walk',
        orElse: () => matches.first,
      );
      insights.add(TicketSavingsInsight(
        message: 'miami_wynwood',
        estimatedFamilySavingsUsd:
            familySavingsUsd(deal: art, adults: adults, kids: kids),
        relatedDealIds: [art.id],
      ));
    }

    if (insights.isEmpty && matches.isNotEmpty) {
      final top = matches.first;
      insights.add(TicketSavingsInsight(
        message: 'generic',
        estimatedFamilySavingsUsd:
            familySavingsUsd(deal: top, adults: adults, kids: kids),
        relatedDealIds: [top.id],
      ));
    }

    return insights;
  }

  static bool isThemeParkPlace(String placeId) =>
      _themeParkPlaceIds.contains(placeId);

  static Set<String> _tagsForPlaceId(String id) {
    return switch (id) {
      'place-magic-kingdom' => {'disney', 'magic-kingdom', 'theme-park'},
      'place-epcot' ||
      'place-hollywood-studios' ||
      'place-animal-kingdom' ||
      'place-typhoon-lagoon' ||
      'place-blizzard-beach' =>
        {'disney', 'theme-park'},
      'place-universal-studios' => {'universal', 'theme-park'},
      'place-islands-of-adventure' => {'universal', 'islands-of-adventure'},
      'place-volcano-bay' => {'universal', 'volcano-bay', 'water-park'},
      'place-epic-universe' => {'universal', 'epic-universe'},
      'place-seaworld-orlando' => {'seaworld'},
      'place-aquatica-orlando' => {'seaworld', 'aquatica', 'water-park'},
      'place-discovery-cove' => {'seaworld', 'discovery-cove'},
      'place-legoland-florida' => {'legoland'},
      'place-miami-vizcaya' => {'vizcaya', 'culture', 'romantic'},
      'place-miami-perez-art' => {'pamm', 'culture', 'arts', 'rainy-day'},
      'place-miami-wynwood-walls' => {'wynwood', 'arts', 'culture'},
      'place-miami-little-havana' => {'little-havana', 'culture', 'foodie'},
      'place-miami-everglades' => {'everglades', 'adventure', 'nature'},
      'place-miami-ocean-drive' => {'south-beach', 'art-deco', 'beach'},
      'place-miami-frost-science' => {'frost-science', 'family', 'rainy-day'},
      'place-miami-key-biscayne' => {'key-biscayne', 'beach', 'outdoor'},
      _ => <String>{},
    };
  }
}
