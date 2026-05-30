import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/partner_sponsorship.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/services/partner_sponsorship_registry.dart';

/// Resolves active sponsorship from embedded fields or the partner catalog.
extension LuxPlaceSponsorship on LuxPlace {
  PartnerSponsorship? get activeSponsorship =>
      PartnerSponsorshipRegistry.forPlace(id) ??
      (sponsorship?.isSponsorActive() == true ? sponsorship : null);
}

extension LuxHotelSponsorship on LuxHotel {
  PartnerSponsorship? get activeSponsorship =>
      PartnerSponsorshipRegistry.forHotel(id) ??
      PartnerSponsorshipRegistry.forPlace(placeId) ??
      (sponsorship?.isSponsorActive() == true ? sponsorship : null);
}

extension TicketDealSponsorship on TicketDeal {
  PartnerSponsorship? get activeSponsorship =>
      PartnerSponsorshipRegistry.forTicketDeal(id) ??
      (sponsorship?.isSponsorActive() == true ? sponsorship : null);
}

extension FeedItemSponsorship on FeedItem {
  PartnerSponsorship? get activeSponsorship =>
      PartnerSponsorshipRegistry.forFeedItem(id) ??
      (sponsorship?.isSponsorActive() == true ? sponsorship : null);
}

extension HiddenGemSponsorship on HiddenGem {
  PartnerSponsorship? get activeSponsorship =>
      PartnerSponsorshipRegistry.forHiddenGem(id) ??
      (sponsorship?.isSponsorActive() == true ? sponsorship : null);
}
