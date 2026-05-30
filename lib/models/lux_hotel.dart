import 'package:luxora_ai/models/partner_sponsorship.dart';

/// Price tier for concierge filtering — not live booking rates.
enum HotelPriceRange {
  budget,
  moderate,
  upscale,
  luxury,
}

/// Tags describing who a stay is best for.
enum HotelBestForTag {
  bestForCouples,
  bestForDisney,
  bestForUniversal,
  luxuryStaycation,
  familyFriendly,
  quietEscape,
  walkableDining,
  resortFeel,
  budgetFriendly,
}

/// How the traveler plans to move around Orlando.
enum HotelTransportPreference {
  rentalCar,
  rideshare,
  resortShuttle,
  walkableArea,
}

/// Curated stay with intelligence scores and affiliate-ready metadata.
///
/// Links to a [LuxPlace] via [placeId] so home base, map pins, and saved
/// places reuse existing infrastructure — Luxora recommends stays; it does
/// not book them.
class LuxHotel {
  const LuxHotel({
    required this.id,
    required this.placeId,
    required this.name,
    required this.neighborhood,
    required this.unsplashPhotoId,
    required this.priceRange,
    required this.luxuryScore,
    required this.familyScore,
    required this.romanceScore,
    required this.walkabilityScore,
    required this.attractionDistances,
    required this.bestForTags,
    required this.emotionalDescription,
    this.hotelWebsiteUrl,
    this.checkRatesUrl,
    this.affiliateUrl,
    this.bookingPartner,
    this.externalId,
    this.lastUpdated,
    this.nearbyExperiencePlaceIds = const [],
    this.nearbyDiningPlaceIds = const [],
    this.plannedAttractionTags = const [],
    this.sponsorship,
    this.cityPackId,
    this.districtId,
    this.nightlifeScore = 50,
    this.beachAccessScore = 50,
    this.foodAccessScore = 50,
  });

  final String id;
  final String placeId;
  final String name;
  final String neighborhood;
  final String unsplashPhotoId;
  final HotelPriceRange priceRange;
  final int luxuryScore;
  final int familyScore;
  final int romanceScore;
  final int walkabilityScore;

  /// Human labels → drive-time estimates, e.g. `"Disney": "18 min"`.
  final Map<String, String> attractionDistances;
  final List<HotelBestForTag> bestForTags;
  final String emotionalDescription;

  final String? hotelWebsiteUrl;
  final String? checkRatesUrl;
  final String? affiliateUrl;
  final String? bookingPartner;
  final String? externalId;
  final DateTime? lastUpdated;

  final List<String> nearbyExperiencePlaceIds;
  final List<String> nearbyDiningPlaceIds;

  /// Tags used by the matchmaker: `disney`, `universal`, `winter_park`, etc.
  final List<String> plannedAttractionTags;

  final PartnerSponsorship? sponsorship;

  /// Which city pack owns this stay — null defaults to Orlando catalog.
  final String? cityPackId;

  /// Miami district id, e.g. `miami-south-beach`.
  final String? districtId;

  final int nightlifeScore;
  final int beachAccessScore;
  final int foodAccessScore;

  /// Composite concierge score — average of primary dimensions.
  int get luxoraScore =>
      ((luxuryScore + familyScore + romanceScore + walkabilityScore) / 4)
          .round();
}

/// User preferences for the AI Hotel Matchmaker flow.
class HotelMatchmakerInput {
  const HotelMatchmakerInput({
    this.tripType,
    this.budget,
    this.adults = 2,
    this.kids = 0,
    this.preferredVibes = const [],
    this.plannedAttractions = const [],
    this.luxuryLevel = 3,
    this.transport = HotelTransportPreference.rentalCar,
  });

  final String? tripType;
  final HotelPriceRange? budget;
  final int adults;
  final int kids;
  final List<String> preferredVibes;
  final List<String> plannedAttractions;
  final int luxuryLevel;
  final HotelTransportPreference transport;

  bool get hasKids => kids > 0;
  bool get isCouple => adults == 2 && kids == 0;
}

/// A ranked match with concierge narrative.
class HotelMatchResult {
  const HotelMatchResult({
    required this.hotel,
    required this.matchScore,
    required this.whyMatch,
    required this.bestForTraveler,
    required this.itineraryImpact,
    required this.nearbyHighlights,
    required this.tradeoffs,
  });

  final LuxHotel hotel;
  final int matchScore;
  final String whyMatch;
  final String bestForTraveler;
  final String itineraryImpact;
  final List<String> nearbyHighlights;
  final String tradeoffs;
}

/// Reason bullet shown on hotel detail — keyed for l10n lookup.
enum HotelRecommendationReason {
  matchesTripMood,
  closeToPlannedStops,
  savesDriveTime,
  fitsBudget,
  betterForGroup,
  nearbyDining,
  lowStressTravel,
}
