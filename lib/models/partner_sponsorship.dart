import 'package:luxora_ai/l10n/app_localizations.dart';

/// Where a partner campaign may appear — separate from organic AI surfaces.
enum SponsoredPlacement {
  discoveryFeed,
  hotelCard,
  restaurantCard,
  attractionCard,
  mapPin,
  itinerary,
  ticketSavings,
  hiddenGems,
  searchResults,
  cityHome,
}

/// Partner vertical — used for admin grouping and featured sections.
enum PartnerType {
  hotel,
  restaurant,
  attraction,
  themePark,
  tour,
  spa,
  ticketSeller,
  nightlife,
  localExperience,
}

/// Paid visibility tier — never overrides organic Luxora ranking.
enum SponsorTier {
  none,
  featured,
  premium,
  platinum,
}

/// Which entity type a campaign attaches to.
enum PartnerEntityKind {
  place,
  hotel,
  ticketDeal,
  feedItem,
  hiddenGem,
}

/// Admin-ready partner campaign metadata.
///
/// Organic Luxora recommendations must not read [sponsoredPriority] for ranking.
/// Use only in dedicated Featured Partner sections and labeled placements.
class PartnerSponsorship {
  const PartnerSponsorship({
    this.isSponsored = false,
    this.sponsorTier = SponsorTier.none,
    this.sponsoredPriority = 0,
    this.featuredUntil,
    this.campaignStartDate,
    this.partnerType = PartnerType.localExperience,
    this.sponsorCampaignId,
    this.partnerName,
    this.sponsorNotes,
    this.sponsorBadgeLabel,
    this.sponsorCtaLabel,
    this.sponsorUrl,
    this.placements = const [],
    this.entityKind = PartnerEntityKind.place,
    this.entityId = '',
  });

  final bool isSponsored;
  final SponsorTier sponsorTier;
  final int sponsoredPriority;
  final DateTime? featuredUntil;
  final DateTime? campaignStartDate;
  final PartnerType partnerType;
  final String? sponsorCampaignId;
  final String? partnerName;
  final String? sponsorNotes;
  final String? sponsorBadgeLabel;
  final String? sponsorCtaLabel;
  final String? sponsorUrl;
  final List<SponsoredPlacement> placements;
  final PartnerEntityKind entityKind;
  final String entityId;

  /// Campaign end date alias for admin dashboards.
  DateTime? get campaignEndDate => featuredUntil;

  /// Whether the campaign is live right now.
  bool isSponsorActive([DateTime? at]) {
    if (!isSponsored || sponsorTier == SponsorTier.none) return false;
    final now = at ?? DateTime.now();
    if (campaignStartDate != null && now.isBefore(campaignStartDate!)) {
      return false;
    }
    if (featuredUntil != null && now.isAfter(featuredUntil!)) return false;
    return true;
  }

  /// Priority within sponsored sections only (not AI rank).
  int getSponsoredPriority() {
    if (!isSponsorActive()) return 0;
    final tierBoost = switch (sponsorTier) {
      SponsorTier.platinum => 40,
      SponsorTier.premium => 25,
      SponsorTier.featured => 10,
      SponsorTier.none => 0,
    };
    return tierBoost + sponsoredPriority;
  }

  /// User-visible disclosure label.
  String getSponsorBadge(AppLocalizations l) {
    if (sponsorBadgeLabel != null && sponsorBadgeLabel!.trim().isNotEmpty) {
      return sponsorBadgeLabel!.trim();
    }
    return switch (sponsorTier) {
      SponsorTier.platinum => l.sponsorBadgeFeaturedPartner,
      SponsorTier.premium => l.sponsorBadgePromoted,
      SponsorTier.featured => l.sponsorBadgeSponsored,
      SponsorTier.none => l.sponsorBadgePartnerOffer,
    };
  }

  String ctaLabel(AppLocalizations l) {
    if (sponsorCtaLabel != null && sponsorCtaLabel!.trim().isNotEmpty) {
      return sponsorCtaLabel!.trim();
    }
    return switch (partnerType) {
      PartnerType.hotel => l.sponsorCtaCheckRates,
      PartnerType.ticketSeller => l.sponsorCtaGetTickets,
      PartnerType.restaurant => l.sponsorCtaBookNow,
      PartnerType.spa => l.sponsorCtaBookNow,
      PartnerType.tour => l.sponsorCtaViewOffer,
      _ => l.sponsorCtaVisitWebsite,
    };
  }

  bool showsOn(SponsoredPlacement placement) {
    if (!isSponsorActive()) return false;
    if (placements.isEmpty) return true;
    return placements.contains(placement);
  }

  PartnerSponsorship copyWith({
    bool? isSponsored,
    SponsorTier? sponsorTier,
    int? sponsoredPriority,
    DateTime? featuredUntil,
    DateTime? campaignStartDate,
    PartnerType? partnerType,
    String? sponsorCampaignId,
    String? partnerName,
    String? sponsorNotes,
    String? sponsorBadgeLabel,
    String? sponsorCtaLabel,
    String? sponsorUrl,
    List<SponsoredPlacement>? placements,
  }) {
    return PartnerSponsorship(
      isSponsored: isSponsored ?? this.isSponsored,
      sponsorTier: sponsorTier ?? this.sponsorTier,
      sponsoredPriority: sponsoredPriority ?? this.sponsoredPriority,
      featuredUntil: featuredUntil ?? this.featuredUntil,
      campaignStartDate: campaignStartDate ?? this.campaignStartDate,
      partnerType: partnerType ?? this.partnerType,
      sponsorCampaignId: sponsorCampaignId ?? this.sponsorCampaignId,
      partnerName: partnerName ?? this.partnerName,
      sponsorNotes: sponsorNotes ?? this.sponsorNotes,
      sponsorBadgeLabel: sponsorBadgeLabel ?? this.sponsorBadgeLabel,
      sponsorCtaLabel: sponsorCtaLabel ?? this.sponsorCtaLabel,
      sponsorUrl: sponsorUrl ?? this.sponsorUrl,
      placements: placements ?? this.placements,
      entityKind: entityKind,
      entityId: entityId,
    );
  }
}
