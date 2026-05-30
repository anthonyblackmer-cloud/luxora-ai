import 'package:luxora_ai/data/partner_sponsorships_catalog.dart';
import 'package:luxora_ai/models/partner_sponsorship.dart';

/// Lightweight campaign lookup — no PlacesRepository / catalog graph imports.
///
/// Keeps [sponsorship_extensions.dart] free of heavy service dependencies so
/// the web compiler does not hit InvalidType cycles during incremental builds.
abstract final class PartnerSponsorshipRegistry {
  static final Map<String, PartnerSponsorship> _byEntityKey = {
    for (final c in PartnerSponsorshipsCatalog.campaigns)
      _key(c.entityKind, c.entityId): c,
  };

  static String _key(PartnerEntityKind kind, String id) => '${kind.name}:$id';

  static PartnerSponsorship? forPlace(String placeId) =>
      _active(_byEntityKey[_key(PartnerEntityKind.place, placeId)]);

  static PartnerSponsorship? forHotel(String hotelId) =>
      _active(_byEntityKey[_key(PartnerEntityKind.hotel, hotelId)]);

  static PartnerSponsorship? forTicketDeal(String dealId) =>
      _active(_byEntityKey[_key(PartnerEntityKind.ticketDeal, dealId)]);

  static PartnerSponsorship? forFeedItem(String feedId) =>
      _active(_byEntityKey[_key(PartnerEntityKind.feedItem, feedId)]);

  static PartnerSponsorship? forHiddenGem(String gemId) =>
      _active(_byEntityKey[_key(PartnerEntityKind.hiddenGem, gemId)]);

  static PartnerSponsorship? _active(PartnerSponsorship? s) {
    if (s == null || !s.isSponsorActive()) return null;
    return s;
  }

  static bool isSponsorActive(PartnerSponsorship? s) =>
      s != null && s.isSponsorActive();
}
