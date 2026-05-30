import 'package:luxora_ai/models/partner_sponsorship.dart';

/// Nightlife-aware concierge row — external links only, no ticketing.
class NightlifeVenue {
  const NightlifeVenue({
    required this.id,
    required this.name,
    required this.neighborhood,
    required this.districtId,
    required this.placeId,
    required this.dressCode,
    required this.bestArrivalTime,
    required this.reservationRecommended,
    required this.priceLevel,
    required this.vibeTags,
    required this.musicTags,
    required this.transportNote,
    required this.lateNightFoodPlaceIds,
    this.websiteUrl,
    this.sponsorship,
  });

  final String id;
  final String name;
  final String neighborhood;
  final String districtId;
  final String placeId;
  final String dressCode;
  final String bestArrivalTime;
  final bool reservationRecommended;
  final int priceLevel;
  final List<String> vibeTags;
  final List<String> musicTags;
  final String transportNote;
  final List<String> lateNightFoodPlaceIds;
  final String? websiteUrl;
  final PartnerSponsorship? sponsorship;
}
