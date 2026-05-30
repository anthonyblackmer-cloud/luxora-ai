import 'package:luxora_ai/data/partner_sponsorships_catalog.dart';
import 'package:luxora_ai/data/ticket_deals_resolver.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/partner_sponsorship.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/map_launcher.dart';
import 'package:luxora_ai/services/partner_sponsorship_registry.dart';
import 'package:luxora_ai/services/places_repository.dart';

/// Resolves partner campaigns and builds Featured Partner sections.
///
/// **Trust rule:** organic rankers (DayFlowPlanner, HotelIntelligenceService,
/// TicketSavingsService, gem mood ranking) must never call [getSponsoredPriority]
/// or boost by [isSponsored]. Sponsored items only appear in labeled sections
/// or with explicit disclosure badges.
abstract final class PartnerSponsorshipService {
  static PartnerSponsorship? forPlace(String placeId) =>
      PartnerSponsorshipRegistry.forPlace(placeId);

  static PartnerSponsorship? forHotel(String hotelId) =>
      PartnerSponsorshipRegistry.forHotel(hotelId);

  static PartnerSponsorship? forTicketDeal(String dealId) =>
      PartnerSponsorshipRegistry.forTicketDeal(dealId);

  static PartnerSponsorship? forFeedItem(String feedId) =>
      PartnerSponsorshipRegistry.forFeedItem(feedId);

  static PartnerSponsorship? forHiddenGem(String gemId) =>
      PartnerSponsorshipRegistry.forHiddenGem(gemId);

  static bool isSponsorActive(PartnerSponsorship? s) =>
      PartnerSponsorshipRegistry.isSponsorActive(s);

  static String getSponsorBadge(AppLocalizations l, PartnerSponsorship s) =>
      s.getSponsorBadge(l);

  static int getSponsoredPriority(PartnerSponsorship s) =>
      s.getSponsoredPriority();

  static List<PartnerSponsorship> campaignsFor({
    PartnerType? type,
    SponsoredPlacement? placement,
  }) {
    final out = PartnerSponsorshipsCatalog.campaigns
        .where((c) => c.isSponsorActive())
        .where((c) => _campaignMatchesActiveCity(c))
        .where((c) => type == null || c.partnerType == type)
        .where((c) => placement == null || c.showsOn(placement))
        .toList();
    out.sort(
      (a, b) => b.getSponsoredPriority().compareTo(a.getSponsoredPriority()),
    );
    return out;
  }

  static List<FeaturedPartnerItem> featuredStays({int limit = 4}) {
    final campaigns = campaignsFor(
      type: PartnerType.hotel,
      placement: SponsoredPlacement.hotelCard,
    );
    final out = <FeaturedPartnerItem>[];
    for (final c in campaigns) {
      if (c.entityKind == PartnerEntityKind.hotel) {
        final hotel = HotelIntelligenceService.hotelById(c.entityId);
        final place = hotel == null
            ? null
            : HotelIntelligenceService.placeFor(hotel);
        if (hotel != null && place != null) {
          out.add(
            FeaturedPartnerItem(
              title: hotel.name,
              subtitle: hotel.neighborhood,
              sponsorship: c,
              place: place,
              hotel: hotel,
            ),
          );
        }
      } else if (c.entityKind == PartnerEntityKind.place) {
        final place = PlacesRepository.instance.byId(c.entityId);
        if (place != null) {
          out.add(
            FeaturedPartnerItem(
              title: place.title,
              subtitle: place.location,
              sponsorship: c,
              place: place,
            ),
          );
        }
      }
      if (out.length >= limit) break;
    }
    return out;
  }

  static List<FeaturedPartnerItem> featuredDining({int limit = 3}) =>
      _featuredPlaces(
        PartnerType.restaurant,
        SponsoredPlacement.restaurantCard,
        limit,
      );

  static List<FeaturedPartnerItem> featuredExperiences({int limit = 3}) =>
      _featuredPlaces(
        PartnerType.localExperience,
        SponsoredPlacement.discoveryFeed,
        limit,
      );

  static List<FeaturedPartnerItem> featuredTicketPartners({int limit = 3}) {
    final campaigns = campaignsFor(
      type: PartnerType.ticketSeller,
      placement: SponsoredPlacement.ticketSavings,
    );
    final out = <FeaturedPartnerItem>[];
    for (final c in campaigns) {
      final deal = TicketDealsResolver.byIdAnyCity(c.entityId);
      if (deal == null) continue;
      out.add(
        FeaturedPartnerItem(
          title: deal.title,
          subtitle: c.partnerName ?? deal.sourceName,
          sponsorship: c,
          deal: deal,
        ),
      );
      if (out.length >= limit) break;
    }
    return out;
  }

  static List<FeaturedPartnerItem> featuredForCityHome({int limit = 4}) {
    return campaignsFor(placement: SponsoredPlacement.cityHome)
        .take(limit)
        .map((c) {
      if (c.entityKind == PartnerEntityKind.hotel) {
        final hotel = HotelIntelligenceService.hotelById(c.entityId);
        final place = hotel == null
            ? null
            : HotelIntelligenceService.placeFor(hotel);
        if (hotel == null || place == null) return null;
        return FeaturedPartnerItem(
          title: hotel.name,
          subtitle: c.partnerName ?? hotel.neighborhood,
          sponsorship: c,
          place: place,
          hotel: hotel,
        );
      }
      final place = PlacesRepository.instance.byId(c.entityId);
      if (place == null) return null;
      return FeaturedPartnerItem(
        title: place.title,
        subtitle: c.partnerName ?? place.location,
        sponsorship: c,
        place: place,
      );
    }).whereType<FeaturedPartnerItem>().toList();
  }

  static Set<String> sponsoredMapPlaceIds() {
    final ids = <String>{};
    for (final c in campaignsFor(placement: SponsoredPlacement.mapPin)) {
      if (c.entityKind == PartnerEntityKind.place) {
        ids.add(c.entityId);
      } else if (c.entityKind == PartnerEntityKind.hotel) {
        final hotel = HotelIntelligenceService.hotelById(c.entityId);
        if (hotel != null) ids.add(hotel.placeId);
      }
    }
    return ids;
  }

  static bool _campaignMatchesActiveCity(PartnerSponsorship c) {
    final activeCity = CityPackRegistry.instance.active.cityId;
    final entityCity = _entityCityPackId(c);
    return entityCity == activeCity;
  }

  static String _entityCityPackId(PartnerSponsorship c) {
    if (c.entityId.startsWith('miami-') ||
        c.entityId.startsWith('deal-miami-') ||
        (c.sponsorCampaignId?.startsWith('camp-miami') ?? false)) {
      return 'miami';
    }
    if (c.entityKind == PartnerEntityKind.hotel) {
      final hotel = HotelIntelligenceService.hotelById(c.entityId);
      if (hotel?.cityPackId != null) return hotel!.cityPackId!;
    }
    return 'orlando';
  }

  static Future<void> openSponsorCta(PartnerSponsorship sponsorship) async {
    final url = sponsorship.sponsorUrl;
    if (url == null || url.isEmpty) return;
    await MapLauncher.openUrl(url);
  }

  static List<FeaturedPartnerItem> _featuredPlaces(
    PartnerType type,
    SponsoredPlacement placement,
    int limit,
  ) {
    final out = <FeaturedPartnerItem>[];
    for (final c in campaignsFor(type: type, placement: placement)) {
      if (c.entityKind != PartnerEntityKind.place) continue;
      final place = PlacesRepository.instance.byId(c.entityId);
      if (place == null) continue;
      out.add(
        FeaturedPartnerItem(
          title: place.title,
          subtitle: c.partnerName ?? place.location,
          sponsorship: c,
          place: place,
        ),
      );
      if (out.length >= limit) break;
    }
    return out;
  }
}

/// Row in a Featured Partner carousel — never mixed into organic lists silently.
class FeaturedPartnerItem {
  const FeaturedPartnerItem({
    required this.title,
    required this.subtitle,
    required this.sponsorship,
    this.place,
    this.hotel,
    this.deal,
  });

  final String title;
  final String subtitle;
  final PartnerSponsorship sponsorship;
  final LuxPlace? place;
  final LuxHotel? hotel;
  final TicketDeal? deal;
}
