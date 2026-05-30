import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/data/hotels_catalog.dart';
import 'package:luxora_ai/data/miami/miami_hotels_catalog.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/util/place_distance.dart';

/// Hotel-aware concierge intelligence — matching, comparison, and reasoning.
abstract final class HotelIntelligenceService {
  static List<LuxHotel> allHotels() {
    final ids = CityPackRegistry.instance.hotelIntelIds.toSet();
    final orlando = HotelsCatalog.all.where((h) => ids.contains(h.id));
    final miami = MiamiHotelsCatalog.all.where((h) => ids.contains(h.id));
    return [...orlando, ...miami];
  }

  static LuxHotel? hotelById(String id) =>
      HotelsCatalog.byId(id) ?? MiamiHotelsCatalog.byId(id);

  static LuxPlace? placeFor(LuxHotel hotel) =>
      PlacesRepository.instance.byId(hotel.placeId);

  /// Top 3 stays for the matchmaker flow.
  static List<HotelMatchResult> match({
    required HotelMatchmakerInput input,
    required AppLocalizations l,
  }) {
    final scored = <(LuxHotel, int)>[];
    for (final hotel in allHotels()) {
      scored.add((hotel, _matchScore(hotel, input)));
    }
    scored.sort((a, b) => b.$2.compareTo(a.$2));

    return scored
        .take(3)
        .map(
          (e) => _buildMatchResult(
            hotel: e.$1,
            score: e.$2,
            input: input,
            l: l,
          ),
        )
        .toList();
  }

  static int _matchScore(LuxHotel hotel, HotelMatchmakerInput input) {
    // Trust rule: never boost by sponsor tier — scores are trip-fit only.
    var score = hotel.luxoraScore;

    if (input.budget != null) {
      score += _budgetFit(hotel.priceRange, input.budget!) * 12;
    }

    score += (input.luxuryLevel * 4 - (5 - _priceTier(hotel.priceRange)) * 4)
        .clamp(-15, 20);

    if (input.hasKids) {
      score += (hotel.familyScore - 50) ~/ 3;
    }
    if (input.isCouple) {
      score += (hotel.romanceScore - 50) ~/ 3;
    }

    for (final tag in input.plannedAttractions) {
      if (hotel.plannedAttractionTags.contains(tag)) score += 14;
    }

    for (final vibe in input.preferredVibes) {
      if (hotel.plannedAttractionTags.contains(vibe)) score += 8;
      if (_vibeMatchesTag(vibe, hotel)) score += 6;
    }

    if (input.transport == HotelTransportPreference.walkableArea) {
      score += (hotel.walkabilityScore - 50) ~/ 4;
    }
    if (input.transport == HotelTransportPreference.resortShuttle &&
        hotel.bestForTags.contains(HotelBestForTag.resortFeel)) {
      score += 10;
    }

    if (hotel.cityPackId == 'miami') {
      for (final vibe in input.preferredVibes) {
        final v = vibe.toLowerCase();
        if (v.contains('nightlife')) {
          score += (hotel.nightlifeScore - 50) ~/ 4;
        }
        if (v.contains('beach')) {
          score += (hotel.beachAccessScore - 50) ~/ 4;
        }
        if (v.contains('food')) {
          score += (hotel.foodAccessScore - 50) ~/ 4;
        }
      }
    }

    return score.clamp(0, 100);
  }

  static int _budgetFit(HotelPriceRange hotel, HotelPriceRange budget) {
    final h = _priceTier(hotel);
    final b = _priceTier(budget);
    final diff = (h - b).abs();
    return switch (diff) {
      0 => 3,
      1 => 2,
      2 => 0,
      _ => -2,
    };
  }

  static int _priceTier(HotelPriceRange r) => switch (r) {
        HotelPriceRange.budget => 1,
        HotelPriceRange.moderate => 2,
        HotelPriceRange.upscale => 3,
        HotelPriceRange.luxury => 4,
      };

  static bool _vibeMatchesTag(String vibe, LuxHotel hotel) {
    final v = vibe.toLowerCase();
    if (v.contains('romantic') &&
        hotel.bestForTags.contains(HotelBestForTag.bestForCouples)) {
      return true;
    }
    if (v.contains('family') &&
        hotel.bestForTags.contains(HotelBestForTag.familyFriendly)) {
      return true;
    }
    if (v.contains('quiet') &&
        hotel.bestForTags.contains(HotelBestForTag.quietEscape)) {
      return true;
    }
    return false;
  }

  static HotelMatchResult _buildMatchResult({
    required LuxHotel hotel,
    required int score,
    required HotelMatchmakerInput input,
    required AppLocalizations l,
  }) {
    final attractions = input.plannedAttractions;
    final attrLabel = attractions.isEmpty
        ? l.hotelMatchAttractionsGeneral
        : attractions.map(_attractionLabel).join(' + ');

    final whyMatch = attractions.length >= 2
        ? l.hotelMatchWhyMulti(attrLabel, hotel.name)
        : l.hotelMatchWhySingle(hotel.name, hotel.neighborhood);

    final bestFor = input.hasKids
        ? l.hotelMatchBestForFamily
        : input.isCouple
            ? l.hotelMatchBestForCouple
            : l.hotelMatchBestForGroup;

    final impact = _itineraryImpactText(hotel, input, l);
    final nearby = nearbyHighlights(hotel, l);
    final tradeoffs = _tradeoffs(hotel, input, l);

    return HotelMatchResult(
      hotel: hotel,
      matchScore: score,
      whyMatch: whyMatch,
      bestForTraveler: bestFor,
      itineraryImpact: impact,
      nearbyHighlights: nearby,
      tradeoffs: tradeoffs,
    );
  }

  static String _attractionLabel(String tag) => switch (tag) {
        'disney' => 'Disney',
        'universal' => 'Universal',
        'winter_park' => 'Winter Park',
        'idrive' => 'I-Drive',
        _ => tag,
      };

  static String _itineraryImpactText(
    LuxHotel hotel,
    HotelMatchmakerInput input,
    AppLocalizations l,
  ) {
    if (input.plannedAttractions.contains('disney') &&
        hotel.plannedAttractionTags.contains('disney')) {
      return l.hotelMatchImpactDisney(
        hotel.attractionDistances['Disney'] ?? '20 min',
      );
    }
    if (input.plannedAttractions.contains('universal') &&
        hotel.plannedAttractionTags.contains('universal')) {
      return l.hotelMatchImpactUniversal;
    }
    if (hotel.walkabilityScore >= 75) {
      return l.hotelMatchImpactWalkable;
    }
    return l.hotelMatchImpactDefault(
      hotel.attractionDistances.values.firstOrNull ?? '25 min',
    );
  }

  static String _tradeoffs(
    LuxHotel hotel,
    HotelMatchmakerInput input,
    AppLocalizations l,
  ) {
    if (hotel.priceRange == HotelPriceRange.luxury &&
        input.budget == HotelPriceRange.budget) {
      return l.hotelMatchTradeoffLuxuryBudget;
    }
    if (hotel.walkabilityScore < 40 &&
        input.transport == HotelTransportPreference.walkableArea) {
      return l.hotelMatchTradeoffCarNeeded;
    }
    if (hotel.familyScore < 60 && input.hasKids) {
      return l.hotelMatchTradeoffLessFamily;
    }
    if (hotel.romanceScore < 55 && input.isCouple) {
      return l.hotelMatchTradeoffLessRomantic;
    }
    return l.hotelMatchTradeoffDefault;
  }

  static List<String> nearbyHighlights(LuxHotel hotel, AppLocalizations l) {
    final out = <String>[];
    for (final id in hotel.nearbyDiningPlaceIds.take(2)) {
      final place = PlacesRepository.instance.byId(id);
      if (place != null) out.add(place.title);
    }
    for (final entry in hotel.attractionDistances.entries.take(2)) {
      out.add('${entry.key} · ${entry.value}');
    }
    if (out.isEmpty) {
      out.add(l.hotelNearbyDefault(hotel.neighborhood));
    }
    return out;
  }

  /// Concierge bullets for the detail sheet.
  static List<HotelRecommendationReason> recommendationReasons({
    required LuxHotel hotel,
    TripProfile? profile,
    DayFlow? flow,
    HotelMatchmakerInput? matchInput,
  }) {
    final reasons = <HotelRecommendationReason>[];

    if (profile != null) {
      if (profile.moods.contains(TripMood.romantic) &&
          hotel.romanceScore >= 75) {
        reasons.add(HotelRecommendationReason.matchesTripMood);
      }
      if ((profile.kids > 0 ||
              profile.moods.contains(TripMood.familyBonding)) &&
          hotel.familyScore >= 75) {
        reasons.add(HotelRecommendationReason.betterForGroup);
      }
    }

    if (flow != null && !flow.isEmpty) {
      final place = placeFor(hotel);
      if (place != null && _closeToFlow(place, flow)) {
        reasons.add(HotelRecommendationReason.closeToPlannedStops);
      }
    }

    final hubMiles = _milesFromHub(hotel);
    if (hubMiles < 12) {
      reasons.add(HotelRecommendationReason.savesDriveTime);
    }

    if (matchInput?.budget != null &&
        _budgetFit(hotel.priceRange, matchInput!.budget!) >= 2) {
      reasons.add(HotelRecommendationReason.fitsBudget);
    } else if (hotel.bestForTags.contains(HotelBestForTag.budgetFriendly)) {
      reasons.add(HotelRecommendationReason.fitsBudget);
    }

    if (hotel.nearbyDiningPlaceIds.isNotEmpty) {
      reasons.add(HotelRecommendationReason.nearbyDining);
    }

    if (hotel.bestForTags.contains(HotelBestForTag.resortFeel) ||
        hotel.bestForTags.contains(HotelBestForTag.quietEscape)) {
      reasons.add(HotelRecommendationReason.lowStressTravel);
    }

    if (reasons.length < 3) {
      reasons.add(HotelRecommendationReason.matchesTripMood);
    }

    return reasons.toSet().take(6).toList();
  }

  static String reasonText(
    AppLocalizations l,
    HotelRecommendationReason reason,
    LuxHotel hotel,
  ) =>
      switch (reason) {
        HotelRecommendationReason.matchesTripMood =>
          l.hotelReasonMatchesMood,
        HotelRecommendationReason.closeToPlannedStops =>
          l.hotelReasonCloseStops,
        HotelRecommendationReason.savesDriveTime => l.hotelReasonSavesDrive(
            PlaceDistance.driveTimeLabel(_milesFromHub(hotel)),
          ),
        HotelRecommendationReason.fitsBudget =>
          l.hotelReasonFitsBudget(priceRangeLabel(l, hotel.priceRange)),
        HotelRecommendationReason.betterForGroup =>
          l.hotelReasonBetterGroup,
        HotelRecommendationReason.nearbyDining => l.hotelReasonNearbyDining,
        HotelRecommendationReason.lowStressTravel =>
          l.hotelReasonLowStress,
      };

  static bool _closeToFlow(LuxPlace hotel, DayFlow flow) {
    final hotelPt = LatLng(hotel.latitude, hotel.longitude);
    for (final block in flow.blocks) {
      final miles = PlaceDistance.milesBetween(
        hotelPt,
        LatLng(block.place.latitude, block.place.longitude),
      );
      if (miles < 15) return true;
    }
    return false;
  }

  static double _milesFromHub(LuxHotel hotel) {
    final place = placeFor(hotel);
    if (place == null) return 20;
    return PlaceDistance.milesFromOrlandoHub(place);
  }

  /// Estimated drive-time savings vs generic Orlando hub for day planning.
  static String driveTimeImpactLabel(LuxHotel hotel) {
    final place = placeFor(hotel);
    if (place == null) return '—';
    final miles = PlaceDistance.milesFromOrlandoHub(place);
    return PlaceDistance.driveTimeLabel(miles);
  }

  static int travelFrictionScore(LuxHotel hotel) {
    final walk = hotel.walkabilityScore;
    final miles = _milesFromHub(hotel);
    var friction = 50;
    friction -= (walk - 50) ~/ 3;
    friction += (miles - 10).round().clamp(0, 20);
    if (hotel.bestForTags.contains(HotelBestForTag.resortFeel)) {
      friction -= 8;
    }
    return friction.clamp(10, 90);
  }

  static String priceRangeLabel(AppLocalizations l, HotelPriceRange range) =>
      switch (range) {
        HotelPriceRange.budget => l.hotelPriceBudget,
        HotelPriceRange.moderate => l.hotelPriceModerate,
        HotelPriceRange.upscale => l.hotelPriceUpscale,
        HotelPriceRange.luxury => l.hotelPriceLuxury,
      };

  static String bestForTagLabel(AppLocalizations l, HotelBestForTag tag) =>
      switch (tag) {
        HotelBestForTag.bestForCouples => l.hotelTagCouples,
        HotelBestForTag.bestForDisney => l.hotelTagDisney,
        HotelBestForTag.bestForUniversal => l.hotelTagUniversal,
        HotelBestForTag.luxuryStaycation => l.hotelTagLuxuryStaycation,
        HotelBestForTag.familyFriendly => l.hotelTagFamily,
        HotelBestForTag.quietEscape => l.hotelTagQuiet,
        HotelBestForTag.walkableDining => l.hotelTagWalkableDining,
        HotelBestForTag.resortFeel => l.hotelTagResort,
        HotelBestForTag.budgetFriendly => l.hotelTagBudget,
      };

  static String checkRatesUrlFor(LuxHotel hotel) =>
      hotel.affiliateUrl ?? hotel.checkRatesUrl ?? hotel.hotelWebsiteUrl ?? '';

  static String websiteUrlFor(LuxHotel hotel) =>
      hotel.hotelWebsiteUrl ?? hotel.checkRatesUrl ?? '';
}

extension _FirstOrNull<E> on Iterable<E> {
  E? get firstOrNull {
    final it = iterator;
    if (it.moveNext()) return it.current;
    return null;
  }
}
