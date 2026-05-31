import 'package:luxora_ai/data/florida_keys/florida_keys_hotels_catalog.dart';
import 'package:luxora_ai/data/hotels_catalog.dart';
import 'package:luxora_ai/data/miami/miami_hotels_catalog.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_hotels_catalog.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_plan.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/agenda_recommendation_service.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_budget_mapper.dart';
import 'package:luxora_ai/models/discover_radius.dart';

/// Hotel browse groupings on Agenda and Stays.
enum HotelBrowseCategory {
  recommended,
  disneyArea,
  budgetFriendly,
  upscaleLuxury,
  universalArea,
}

/// Restaurant browse groupings on Agenda and Restaurants.
enum RestaurantBrowseCategory {
  recommended,
  themeParkDining,
  budgetFriendly,
  upscaleFineDining,
}

/// Category-filtered stay and dining lists — 4–5 picks per tab + full search pool.
abstract final class StayDiningCatalogService {
  static const int picksPerCategory = 5;

  static List<LuxHotel> hotelsForCategory({
    required HotelBrowseCategory category,
    required TripProfile profile,
    TripPlan? plan,
    required AppLocalizations l,
  }) {
    final activeCityId = CityPackRegistry.instance.active.cityId;
    final pool = _hotelPool(activeCityId);

    final filtered = switch (category) {
      HotelBrowseCategory.recommended => _rankHotels(pool, profile),
      HotelBrowseCategory.disneyArea =>
        pool.where(_isDisneyAreaHotel).toList(),
      HotelBrowseCategory.budgetFriendly => pool
          .where(
            (h) =>
                h.priceRange == HotelPriceRange.budget ||
                h.bestForTags.contains(HotelBestForTag.budgetFriendly),
          )
          .toList(),
      HotelBrowseCategory.upscaleLuxury => pool
          .where(
            (h) =>
                h.priceRange == HotelPriceRange.upscale ||
                h.priceRange == HotelPriceRange.luxury,
          )
          .toList(),
      HotelBrowseCategory.universalArea =>
        pool.where(_isUniversalAreaHotel).toList(),
    };

    if (category == HotelBrowseCategory.recommended) {
      return filtered.take(picksPerCategory).toList();
    }

    return filtered.take(picksPerCategory).toList();
  }

  static List<LuxPlace> allHotelsAsPlaces() {
    return [
      for (final hotel in _hotelPool(CityPackRegistry.instance.active.cityId))
        if (HotelIntelligenceService.placeFor(hotel) case final place?) place,
    ];
  }

  static List<LuxHotel> _hotelPool(String activeCityId) {
    final ids = CityPackRegistry.instance.hotelIntelIds.toSet();
    final orlando = HotelsCatalog.all.where((h) => ids.contains(h.id));
    final miami = MiamiHotelsCatalog.all.where((h) => ids.contains(h.id));
    final keys = FloridaKeysHotelsCatalog.all.where((h) => ids.contains(h.id));
    final stAug = StAugustineHotelsCatalog.all.where((h) => ids.contains(h.id));
    final naplesHotels = NaplesHotelsCatalog.all.where((h) => ids.contains(h.id));
    final destin = Destin30aHotelsCatalog.all.where((h) => ids.contains(h.id));
    final nyc = NycHotelsCatalog.all.where((h) => ids.contains(h.id));
    final vegas = VegasHotelsCatalog.all.where((h) => ids.contains(h.id));
    final tampaBay = TampaBayHotelsCatalog.all.where((h) => ids.contains(h.id));
    return [...orlando, ...miami, ...keys, ...stAug, ...naplesHotels, ...destin, ...nyc, ...vegas, ...tampaBay]
        .where((h) => (h.cityPackId ?? 'orlando') == activeCityId)
        .toList();
  }

  static List<LuxPlace> restaurantsForCategory({
    required RestaurantBrowseCategory category,
    required TripProfile profile,
    TripDay? day,
    Set<String> excludePlaceIds = const {},
  }) {
    final pool = _restaurantPool().where((p) => !excludePlaceIds.contains(p.id));

    final filtered = switch (category) {
      RestaurantBrowseCategory.recommended => () {
          if (day == null) {
            return _rankRestaurants(pool, profile).map((e) => e.place);
          }
          final suggested = AgendaRecommendationService.suggestRestaurantsForDay(
            day: day,
            profile: profile,
            excludePlaceIds: excludePlaceIds,
          );
          if (suggested.isNotEmpty) {
            return suggested.map((s) => s.place);
          }
          return _rankRestaurants(pool, profile).map((e) => e.place);
        }(),
      RestaurantBrowseCategory.themeParkDining =>
        pool.where(_isThemeParkDining),
      RestaurantBrowseCategory.budgetFriendly => pool.where(
          (p) {
            final tier = TripBudgetMapper.tierForPlace(p);
            return tier == DiningPriceTier.budget ||
                tier == DiningPriceTier.moderate;
          },
        ),
      RestaurantBrowseCategory.upscaleFineDining => pool.where(
          (p) {
            final tier = TripBudgetMapper.tierForPlace(p);
            return tier == DiningPriceTier.upscale ||
                tier == DiningPriceTier.luxury;
          },
        ),
    };

    if (category == RestaurantBrowseCategory.recommended && day != null) {
      return filtered.take(picksPerCategory).toList();
    }

    return _rankRestaurants(filtered, profile)
        .take(picksPerCategory)
        .map((e) => e.place)
        .toList();
  }

  static List<LuxPlace> allRestaurants() => _restaurantPool();

  static bool _isDisneyAreaHotel(LuxHotel hotel) {
    if (hotel.bestForTags.contains(HotelBestForTag.bestForDisney)) {
      return true;
    }
    if (hotel.plannedAttractionTags.contains('disney')) return true;
    final blob = '${hotel.name} ${hotel.neighborhood}'.toLowerCase();
    return blob.contains('disney') ||
        blob.contains('golden oak') ||
        blob.contains('lake buena vista') ||
        blob.contains('kissimmee') ||
        blob.contains('bonnet creek');
  }

  static bool _isUniversalAreaHotel(LuxHotel hotel) {
    if (hotel.bestForTags.contains(HotelBestForTag.bestForUniversal)) {
      return true;
    }
    if (hotel.plannedAttractionTags.contains('universal')) return true;
    final blob = '${hotel.name} ${hotel.neighborhood}'.toLowerCase();
    return blob.contains('universal') || blob.contains('citywalk');
  }

  static bool _isThemeParkDining(LuxPlace place) {
    final blob =
        '${place.title} ${place.location} ${place.slug} ${place.description}'
            .toLowerCase();
    return blob.contains('disney') ||
        blob.contains('universal') ||
        blob.contains('disney springs') ||
        blob.contains('citywalk') ||
        blob.contains('buena vista') ||
        blob.contains('contemporary') ||
        blob.contains('grand floridian') ||
        place.moodTags.any((t) => t.toLowerCase() == 'iconic');
  }

  static List<LuxHotel> _rankHotels(List<LuxHotel> hotels, TripProfile profile) {
    final target = TripBudgetMapper.hotelPriceRange(profile);
    final scored = hotels.map((hotel) {
      var score = hotel.luxoraScore.toDouble();
      final diff = (TripBudgetMapper.hotelTierRank(hotel.priceRange) -
              TripBudgetMapper.hotelTierRank(target))
          .abs();
      score += switch (diff) {
        0 => 28,
        1 => 16,
        2 => 6,
        _ => -8,
      };
      if (profile.kids > 0) score += (hotel.familyScore - 50) / 4;
      return (hotel: hotel, score: score);
    }).toList()
      ..sort((a, b) => b.score.compareTo(a.score));
    return [for (final e in scored) e.hotel];
  }

  static List<({LuxPlace place, double score})> _rankRestaurants(
    Iterable<LuxPlace> places,
    TripProfile profile,
  ) {
    final target = TripBudgetMapper.diningPriceTier(profile);
    final scored = places.map((place) {
      var score = profile.foodieInterest.toDouble();
      score += TripBudgetMapper.diningFitScore(
        TripBudgetMapper.tierForPlace(place),
        target,
      );
      if (place.source == LuxPlaceSource.curated) score += 8;
      return (place: place, score: score);
    }).toList()
      ..sort((a, b) => b.score.compareTo(a.score));
    return scored;
  }

  static List<LuxPlace> _restaurantPool() {
    final radius = DiscoverRadiusController.instance.radius;
    final effective =
        radius == DiscoverRadius.allFlorida ? DiscoverRadius.miles100 : radius;
    var pool = _diningInRadius(effective);
    if (pool.isEmpty && !effective.isUnlimited) {
      pool = _diningInRadius(DiscoverRadius.miles100);
    }
    if (pool.isEmpty) {
      pool = _allActiveCityDining();
    }
    return pool;
  }

  static bool _isDining(LuxPlace p) =>
      p.category == LuxPlaceCategory.dining ||
      p.category == LuxPlaceCategory.romantic;

  static List<LuxPlace> _diningInRadius(DiscoverRadius radius) {
    return PlacesRepository.instance
        .placesWithinRadius(radius)
        .where(_isDining)
        .toList();
  }

  static List<LuxPlace> _allActiveCityDining() {
    final activeCityId = CityPackRegistry.instance.active.cityId;
    return PlacesRepository.instance.mappablePlaces.where((p) {
      if (!_isDining(p)) return false;
      final packId = p.cityPackId ?? 'orlando';
      return packId == activeCityId;
    }).toList();
  }
}
