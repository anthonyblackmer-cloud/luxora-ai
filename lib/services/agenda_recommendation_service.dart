import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/discover_radius.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_budget_mapper.dart';
import 'package:luxora_ai/util/place_distance.dart';

enum AgendaRestaurantReason {
  nearTodaysStops,
  fitsBudget,
  matchesDayVibe,
  foodiePick,
}

class AgendaRestaurantSuggestion {
  const AgendaRestaurantSuggestion({
    required this.place,
    required this.score,
    required this.primaryReason,
  });

  final LuxPlace place;
  final int score;
  final AgendaRestaurantReason primaryReason;
}

/// Budget- and context-aware hotel + per-day dining suggestions for Agenda.
abstract final class AgendaRecommendationService {
  static const int _maxHotels = 6;
  static const int _maxRestaurantsPerDay = 5;

  static List<LuxHotel> suggestHotels({
    required TripProfile profile,
    TripPlan? plan,
    required AppLocalizations l,
  }) {
    final input = _matchInputFromProfile(profile, plan);
    final matches = HotelIntelligenceService.match(input: input, l: l);
    if (matches.isNotEmpty) {
      return [for (final m in matches) m.hotel];
    }

    final target = TripBudgetMapper.hotelPriceRange(profile);
    final activeCityId = CityPackRegistry.instance.active.cityId;
    final scored = <(LuxHotel, int)>[];
    for (final hotel in HotelIntelligenceService.allHotels()) {
      if ((hotel.cityPackId ?? 'orlando') != activeCityId) continue;
      var score = hotel.luxoraScore;
      final diff = (TripBudgetMapper.hotelTierRank(hotel.priceRange) -
              TripBudgetMapper.hotelTierRank(target))
          .abs();
      score += switch (diff) {
        0 => 30,
        1 => 18,
        2 => 6,
        _ => -10,
      };
      if (profile.kids > 0) score += (hotel.familyScore - 50) ~/ 4;
      if (profile.moods.contains(TripMood.romantic)) {
        score += (hotel.romanceScore - 50) ~/ 4;
      }
      scored.add((hotel, score));
    }
    scored.sort((a, b) => b.$2.compareTo(a.$2));
    return scored.take(_maxHotels).map((e) => e.$1).toList();
  }

  static List<AgendaRestaurantSuggestion> suggestRestaurantsForDay({
    required TripDay day,
    required TripProfile profile,
    Set<String> excludePlaceIds = const {},
  }) {
    final radius = DiscoverRadiusController.instance.radius;
    final effective =
        radius == DiscoverRadius.allFlorida ? DiscoverRadius.miles100 : radius;
    final pool = PlacesRepository.instance
        .placesWithinRadius(effective)
        .where(
          (p) =>
              (p.category == LuxPlaceCategory.dining ||
                  p.category == LuxPlaceCategory.romantic) &&
              !excludePlaceIds.contains(p.id),
        )
        .toList();

    final dayPlaces = _dayPlaces(day);
    final dayTags = _dayContextTags(day, dayPlaces);
    final anchor = _dayAnchor(dayPlaces);
    final targetDining = TripBudgetMapper.diningPriceTier(profile);

    final scored = <AgendaRestaurantSuggestion>[];
    for (final place in pool) {
      var score = profile.foodieInterest.toDouble();
      final placeTier = TripBudgetMapper.tierForPlace(place);
      final budgetFit = TripBudgetMapper.diningFitScore(placeTier, targetDining);
      score += budgetFit;

      AgendaRestaurantReason reason = AgendaRestaurantReason.fitsBudget;
      if (budgetFit >= 20) {
        reason = AgendaRestaurantReason.fitsBudget;
      }

      if (anchor != null) {
        final miles = PlaceDistance.milesBetween(
          anchor,
          LatLng(place.latitude, place.longitude),
        );
        if (miles < 8) {
          score += 22 - miles * 1.5;
          reason = AgendaRestaurantReason.nearTodaysStops;
        } else if (miles < 18) {
          score += 10 - miles * 0.4;
        }
      }

      final tagHits = place.moodTags
          .where((t) => dayTags.contains(t.toLowerCase()))
          .length;
      if (tagHits > 0) {
        score += tagHits * 8;
        reason = AgendaRestaurantReason.matchesDayVibe;
      }

      if (profile.foodieInterest >= 70 &&
          place.moodTags.any((t) => t.toLowerCase() == 'foodie')) {
        score += 8;
        if (reason == AgendaRestaurantReason.fitsBudget) {
          reason = AgendaRestaurantReason.foodiePick;
        }
      }

      if (place.source == LuxPlaceSource.curated) score += 6;

      scored.add(
        AgendaRestaurantSuggestion(
          place: place,
          score: score.round(),
          primaryReason: reason,
        ),
      );
    }

    scored.sort((a, b) => b.score.compareTo(a.score));
    return scored.take(_maxRestaurantsPerDay).toList();
  }

  static HotelMatchmakerInput _matchInputFromProfile(
    TripProfile profile,
    TripPlan? plan,
  ) {
    return HotelMatchmakerInput(
      budget: TripBudgetMapper.hotelPriceRange(profile),
      adults: profile.adults,
      kids: profile.kids,
      luxuryLevel: switch (profile.luxuryLevel) {
        LuxuryLevel.comfortable => 2,
        LuxuryLevel.premium => 3,
        LuxuryLevel.ultraLuxury => 5,
      },
      plannedAttractions: _attractionsFromPlan(plan),
      preferredVibes: [
        for (final mood in profile.moods) mood.name,
        if (profile.foodieInterest >= 60) 'foodie',
        if (profile.nightlifeInterest >= 60) 'nightlife',
      ],
    );
  }

  static List<String> _attractionsFromPlan(TripPlan? plan) {
    if (plan == null) return const [];
    final tags = <String>{};
    for (final day in plan.days) {
      for (final item in day.items) {
        final lower = '${item.title} ${item.category}'.toLowerCase();
        if (lower.contains('disney') ||
            lower.contains('magic kingdom') ||
            lower.contains('epcot')) {
          tags.add('disney');
        }
        if (lower.contains('universal') ||
            lower.contains('islands of adventure')) {
          tags.add('universal');
        }
        if (lower.contains('beach')) tags.add('beach');
        if (lower.contains('nightlife')) tags.add('nightlife');
      }
    }
    return tags.toList();
  }

  static List<LuxPlace> _dayPlaces(TripDay day) {
    final repo = PlacesRepository.instance;
    return [
      for (final item in day.items)
        if (item.placeId != null) repo.byId(item.placeId!),
    ].whereType<LuxPlace>().toList();
  }

  static Set<String> _dayContextTags(TripDay day, List<LuxPlace> places) {
    final tags = <String>{'foodie', 'dining'};
    for (final item in day.items) {
      final blob = '${item.title} ${item.category} ${item.location}'.toLowerCase();
      if (blob.contains('disney') ||
          blob.contains('magic kingdom') ||
          blob.contains('epcot') ||
          blob.contains('hollywood studios') ||
          blob.contains('animal kingdom')) {
        tags.addAll(const ['family', 'iconic', 'trending']);
      }
      if (blob.contains('universal') || blob.contains('volcano')) {
        tags.addAll(const ['family', 'adventure', 'trending']);
      }
      if (blob.contains('theme park')) {
        tags.addAll(const ['family', 'casual', 'trending']);
      }
      if (blob.contains('beach') || blob.contains('pool')) {
        tags.addAll(const ['beach', 'relaxing', 'seafood']);
      }
      if (blob.contains('romantic') || blob.contains('sunset')) {
        tags.addAll(const ['romantic', 'luxury']);
      }
    }
    for (final place in places) {
      tags.addAll(place.moodTags.map((t) => t.toLowerCase()));
    }
    if (day.label.toLowerCase().contains('explore')) {
      tags.addAll(const ['hidden', 'local', 'foodie']);
    }
    return tags;
  }

  static LatLng? _dayAnchor(List<LuxPlace> places) {
    if (places.isEmpty) return PlaceDistance.hubCenter;
    final last = places.last;
    return LatLng(last.latitude, last.longitude);
  }
}
