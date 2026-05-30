import 'package:luxora_ai/models/sponsorship_extensions.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/services/map_launcher.dart';

/// Resolves external URLs for ticket deal sources (sponsorship first, then catalog).
abstract final class TicketDealSourceLinks {
  static const _bySourceName = <String, String>{
    'Undercover Tourist': 'https://www.undercovertourist.com/',
    'ParkSavers': 'https://www.parksavers.com/',
    'Medieval Times': 'https://www.medievaltimes.com/orlando',
    'SeaWorld Authorized Partner': 'https://seaworld.com/orlando/',
    'LEGOLAND Authorized Reseller': 'https://www.legoland.com/florida/',
    'ICON Park Direct': 'https://www.iconparkorlando.com/',
    'Groupon': 'https://www.groupon.com/local/orlando',
    'Vizcaya Direct': 'https://vizcaya.org/',
    'PAMM Direct': 'https://www.pamm.org/',
    'Frost Science Direct': 'https://www.frostscience.org/',
    'Bayside Partners': 'https://www.baysidemarketplace.com/',
    'Wynwood Partners': 'https://www.thewynwoodwalls.com/',
    'MDPL Authorized Guide': 'https://mdpl.org/',
    'Miami Culinary Tours': 'https://www.miamiculinarytours.com/',
    'Seaquarium Authorized Partner': 'https://www.miamiseaquarium.com/',
    'Jungle Island Direct': 'https://www.jungleisland.com/',
    'Zoo Miami Direct': 'https://www.zoomiami.org/',
    'Crandon Park Partners':
        'https://www.miamidade.gov/global/parks/crandon-beach-park.page',
  };

  static String? resolve(TicketDeal deal) {
    if (deal.sourceUrl != null && deal.sourceUrl!.isNotEmpty) {
      return deal.sourceUrl;
    }
    final sponsored = deal.activeSponsorship?.sponsorUrl;
    if (sponsored != null && sponsored.isNotEmpty) return sponsored;
    return _bySourceName[deal.sourceName];
  }

  static Future<void> open(TicketDeal deal) async {
    final url = resolve(deal);
    if (url == null || url.isEmpty) return;
    await MapLauncher.openUrl(url);
  }
}
