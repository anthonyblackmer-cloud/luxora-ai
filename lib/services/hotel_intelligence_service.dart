import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_hotels_catalog.dart';
import 'package:luxora_ai/data/hotels_catalog.dart';
import 'package:luxora_ai/data/florida_keys/florida_keys_hotels_catalog.dart';
import 'package:luxora_ai/data/miami/miami_hotels_catalog.dart';
import 'package:luxora_ai/data/naples/naples_hotels_catalog.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_hotels_catalog.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_hotels_catalog.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/drive_friction_service.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/map_launcher.dart';
import 'package:luxora_ai/services/orlando_addon_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/trip_budget_mapper.dart';
import 'package:luxora_ai/util/place_distance.dart';

/// Hotel-aware concierge intelligence — matching, comparison, and reasoning.
abstract final class HotelIntelligenceService {
  static List<LuxHotel> allHotels() {
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
        .where(OrlandoAddonService.isHotelAccessible)
        .toList();
  }

  static LuxHotel? hotelById(String id) =>
      HotelsCatalog.byId(id) ??
      MiamiHotelsCatalog.byId(id) ??
      FloridaKeysHotelsCatalog.byId(id) ??
      StAugustineHotelsCatalog.byId(id) ??
      NaplesHotelsCatalog.byId(id) ??
      Destin30aHotelsCatalog.byId(id) ??
      NycHotelsCatalog.byId(id) ??
      VegasHotelsCatalog.byId(id) ??
      TampaBayHotelsCatalog.byId(id);

  static LuxPlace? placeFor(LuxHotel hotel) =>
      PlacesRepository.instance.byId(hotel.placeId);

  /// Top 3 stays for the matchmaker flow — active city pack only.
  static List<HotelMatchResult> match({
    required HotelMatchmakerInput input,
    required AppLocalizations l,
  }) {
    final activeCityId = CityPackRegistry.instance.active.cityId;
    final pool = allHotels()
        .where((h) => (h.cityPackId ?? 'orlando') == activeCityId)
        .toList();
    final scored = <(LuxHotel, int)>[];
    for (final hotel in pool) {
      scored.add((hotel, _matchScore(hotel, input)));
    }
    scored.sort((a, b) {
      final byScore = b.$2.compareTo(a.$2);
      if (byScore != 0) return byScore;
      return b.$1.luxoraScore.compareTo(a.$1.luxoraScore);
    });

    return scored
        .take(3)
        .map(
          (e) => _buildMatchResult(
            hotel: e.$1,
            score: e.$2.clamp(0, 100),
            input: input,
            l: l,
          ),
        )
        .toList();
  }

  /// City-aware attraction chips for the matchmaker UI.
  static List<({String tag, String label})> matchmakerAttractionOptions(
    String cityId,
  ) =>
      switch (cityId) {
        'miami' => const [
            (tag: 'beach', label: 'Beach'),
            (tag: 'nightlife', label: 'Nightlife'),
            (tag: 'foodie', label: 'Food & Wynwood'),
            (tag: 'luxury', label: 'Luxury'),
          ],
        'florida-keys' => const [
            (tag: 'water', label: 'Water & boating'),
            (tag: 'fishing', label: 'Fishing'),
            (tag: 'beach', label: 'Beach'),
            (tag: 'luxury', label: 'Luxury'),
            (tag: 'romantic', label: 'Romantic'),
          ],
        _ => const [
            (tag: 'disney', label: 'Disney'),
            (tag: 'universal', label: 'Universal'),
            (tag: 'winter_park', label: 'Winter Park'),
            (tag: 'idrive', label: 'I-Drive'),
          ],
      };

  static List<({String tag, String label})> visibleMatchmakerAttractions(
    String cityId,
  ) {
    final options = matchmakerAttractionOptions(cityId);
    if (cityId != 'orlando') return options;
    return options.where((o) {
      if (o.tag == 'disney' || o.tag == 'universal') {
        return OrlandoAddonService.canAccessThemeParks();
      }
      return true;
    }).toList();
  }

  static int _matchScore(LuxHotel hotel, HotelMatchmakerInput input) {
    // Trust rule: never boost by sponsor tier — scores are trip-fit only.
    var score = hotel.luxoraScore;

    final targetTier = input.budget != null ? _priceTier(input.budget!) : 2;
    final hotelTier = _priceTier(hotel.priceRange);
    final tierDelta = hotelTier - targetTier;
    final boostScale = tierDelta <= 0
        ? 1.0
        : tierDelta == 1
            ? 0.3
            : 0.08;

    if (input.budget != null) {
      score += TripBudgetMapper.hotelBudgetFitScore(
        hotel.priceRange,
        input.budget!,
      );
    }

    if (input.budget == HotelPriceRange.budget &&
        hotel.priceRange == HotelPriceRange.budget) {
      score += 18;
    }
    if (hotel.bestForTags.contains(HotelBestForTag.budgetFriendly) &&
        input.budget == HotelPriceRange.budget) {
      score += 14;
    }

    score += (input.luxuryLevel * 4 - (5 - hotelTier) * 4).clamp(-15, 20);

    if (input.hasKids) {
      score += (((hotel.familyScore - 50) ~/ 3) * boostScale).round();
    }
    if (input.isCouple) {
      score += (((hotel.romanceScore - 50) ~/ 3) * boostScale).round();
    }

    var attractionHits = 0;
    for (final tag in input.plannedAttractions) {
      if (hotel.plannedAttractionTags.contains(tag)) {
        score += (22 * boostScale).round();
        attractionHits++;
      } else if (_attractionMatchesBestFor(tag, hotel)) {
        score += (18 * boostScale).round();
        attractionHits++;
      }
    }
    if (input.plannedAttractions.isNotEmpty && attractionHits == 0) {
      score -= targetTier == 1 ? 8 : 28;
    }

    for (final vibe in input.preferredVibes) {
      if (_vibeMatchesTag(vibe, hotel)) score += 8;
      if (hotel.plannedAttractionTags.contains(vibe)) {
        score += (6 * boostScale).round();
      }
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
      for (final tag in input.plannedAttractions) {
        if (tag == 'nightlife') {
          score += (hotel.nightlifeScore - 50) ~/ 3;
        }
        if (tag == 'beach') {
          score += (hotel.beachAccessScore - 50) ~/ 3;
        }
        if (tag == 'foodie') {
          score += (hotel.foodAccessScore - 50) ~/ 3;
        }
      }
    }

    return score;
  }

  static bool _attractionMatchesBestFor(String tag, LuxHotel hotel) =>
      switch (tag) {
        'disney' => hotel.bestForTags.contains(HotelBestForTag.bestForDisney),
        'universal' =>
          hotel.bestForTags.contains(HotelBestForTag.bestForUniversal),
        'winter_park' =>
          hotel.plannedAttractionTags.contains('winter_park') ||
              hotel.neighborhood.toLowerCase().contains('winter park'),
        'idrive' =>
          hotel.plannedAttractionTags.contains('idrive') ||
              hotel.neighborhood.toLowerCase().contains('drive'),
        _ => false,
      };

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
    if (v.contains('budgetfriendly') &&
        (hotel.bestForTags.contains(HotelBestForTag.budgetFriendly) ||
            hotel.priceRange == HotelPriceRange.budget)) {
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
    final primaryTag = _primaryAttractionMatch(hotel, attractions);
    final attrLabel = attractions.isEmpty
        ? l.hotelMatchAttractionsGeneral
        : (primaryTag != null
            ? _attractionLabel(primaryTag)
            : attractions.map(_attractionLabel).join(' + '));

    final whyMatch = primaryTag != null
        ? l.hotelMatchWhySingle(hotel.name, hotel.neighborhood)
        : attractions.length >= 2
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
        'beach' => 'Beach',
        'nightlife' => 'Nightlife',
        'foodie' => 'Food & Wynwood',
        'water' => 'Water',
        'fishing' => 'Fishing',
        'luxury' => 'Luxury',
        'romantic' => 'Romantic',
        _ => tag,
      };

  static String? _primaryAttractionMatch(
    LuxHotel hotel,
    List<String> attractions,
  ) {
    for (final tag in attractions) {
      if (hotel.plannedAttractionTags.contains(tag) ||
          _attractionMatchesBestFor(tag, hotel)) {
        return tag;
      }
    }
    return null;
  }

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
    final place = placeFor(hotel);
    if (place == null) return 50;

    var friction = DriveFrictionService.scoreFromHub(place);
    final walk = hotel.walkabilityScore;
    friction -= (walk - 50) ~/ 3;
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
      _resolveHotelUrl(
        hotel.affiliateUrl ?? hotel.checkRatesUrl ?? hotel.hotelWebsiteUrl,
        hotel,
        forRates: true,
      );

  static String websiteUrlFor(LuxHotel hotel) =>
      _resolveHotelUrl(
        hotel.hotelWebsiteUrl ?? hotel.checkRatesUrl ?? hotel.affiliateUrl,
        hotel,
        forRates: false,
      );

  static bool hasCheckRatesLink(LuxHotel hotel) =>
      checkRatesUrlFor(hotel).isNotEmpty;

  static bool hasWebsiteLink(LuxHotel hotel) => websiteUrlFor(hotel).isNotEmpty;

  static String _resolveHotelUrl(
    String? raw,
    LuxHotel hotel, {
    required bool forRates,
  }) {
    final candidate = MapLauncher.normalizeUrl(raw ?? '');
    if (candidate.isNotEmpty && !_isPlaceholderUrl(candidate)) {
      return candidate;
    }
    return forRates
        ? _googleTravelHotelsUrl(hotel)
        : _googleWebsiteSearchUrl(hotel);
  }

  static bool _isPlaceholderUrl(String url) =>
      url.contains('example.com');

  static String _googleTravelHotelsUrl(LuxHotel hotel) {
    final q = Uri.encodeComponent('${hotel.name} ${hotel.neighborhood}');
    return 'https://www.google.com/travel/hotels?q=$q';
  }

  static String _googleWebsiteSearchUrl(LuxHotel hotel) {
    final q = Uri.encodeComponent('${hotel.name} official website');
    return 'https://www.google.com/search?q=$q';
  }
}

extension _FirstOrNull<E> on Iterable<E> {
  E? get firstOrNull {
    final it = iterator;
    if (it.moveNext()) return it.current;
    return null;
  }
}
