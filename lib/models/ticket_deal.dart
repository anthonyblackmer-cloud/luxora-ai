import 'package:luxora_ai/models/partner_sponsorship.dart';

/// Category filters for Smart Ticket Savings.
enum TicketDealCategory {
  themeParks,
  attractions,
  tours,
  diningExperiences,
  waterParks,
  familyActivities,
  entertainment,
}

/// Sort modes for deal lists.
enum TicketDealSort {
  highestSavings,
  mostPopular,
  familyFriendly,
  luxuryExperiences,
  closestToMe,
}

/// How strongly Luxora trusts a listed offer (authorized reseller heuristic).
enum DealConfidence { high, verified, limited }

/// Curated ticket / experience savings opportunity.
class TicketDeal {
  const TicketDeal({
    required this.id,
    required this.title,
    required this.category,
    required this.officialPriceUsd,
    required this.discountPriceUsd,
    required this.sourceName,
    required this.expiresAt,
    this.sourceUrl,
    this.placeId,
    this.unsplashPhotoId,
    this.discountPercent,
    this.familyFriendly = true,
    this.luxury = false,
    this.popularityScore = 50,
    this.milesFromOrlando = 15,
    this.itineraryTags = const [],
    this.conciergeBestDay,
    this.conciergeCrowd,
    this.conciergeResidentNote,
    this.bundleOpportunity,
    this.confidence = DealConfidence.verified,
    this.sponsorship,
  });

  final String id;
  final String title;
  final TicketDealCategory category;
  final int officialPriceUsd;
  final int discountPriceUsd;
  final String sourceName;
  final String? sourceUrl;
  final DateTime expiresAt;
  final String? placeId;
  final String? unsplashPhotoId;
  final int? discountPercent;
  final bool familyFriendly;
  final bool luxury;
  final int popularityScore;
  final double milesFromOrlando;
  final List<String> itineraryTags;
  final String? conciergeBestDay;
  final String? conciergeCrowd;
  final String? conciergeResidentNote;
  final String? bundleOpportunity;
  final DealConfidence confidence;
  final PartnerSponsorship? sponsorship;

  int get savingsUsd => (officialPriceUsd - discountPriceUsd).clamp(0, 99999);

  int get effectiveDiscountPercent =>
      discountPercent ??
      (officialPriceUsd <= 0
          ? 0
          : ((savingsUsd / officialPriceUsd) * 100).round());

  bool get hasDiscount => savingsUsd > 0;
}

/// AI-style bundle or pass recommendation tied to the user's plan.
class TicketSavingsInsight {
  const TicketSavingsInsight({
    required this.message,
    required this.estimatedFamilySavingsUsd,
    this.relatedDealIds = const [],
  });

  final String message;
  final int estimatedFamilySavingsUsd;
  final List<String> relatedDealIds;
}
