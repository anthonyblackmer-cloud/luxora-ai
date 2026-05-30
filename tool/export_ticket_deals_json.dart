import 'dart:convert';
import 'dart:io';

import 'package:luxora_ai/data/miami/miami_ticket_deals.dart';
import 'package:luxora_ai/data/ticket_deals_catalog.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/ticket_deal_catalog.dart';
import 'package:luxora_ai/services/ticket_deal_source_links.dart';

/// Regenerates bundled ticket-deal JSON from Dart seed catalogs.
///
/// Run from repo root:
///   flutter test test/export_ticket_deals_json_test.dart
void main() {
  _exportCity('orlando', ticketDealsCatalog);
  _exportCity('miami', miamiTicketDealsCatalog);
  stdout.writeln('Exported ticket deal JSON to assets/deals/');
}

void _exportCity(String cityId, List<TicketDeal> deals) {
  final enriched = [
    for (final deal in deals)
      TicketDeal(
        id: deal.id,
        title: deal.title,
        category: deal.category,
        officialPriceUsd: deal.officialPriceUsd,
        discountPriceUsd: deal.discountPriceUsd,
        sourceName: deal.sourceName,
        sourceUrl: TicketDealSourceLinks.resolve(deal),
        expiresAt: deal.expiresAt,
        placeId: deal.placeId,
        unsplashPhotoId: deal.unsplashPhotoId,
        discountPercent: deal.discountPercent,
        familyFriendly: deal.familyFriendly,
        luxury: deal.luxury,
        popularityScore: deal.popularityScore,
        milesFromOrlando: deal.milesFromOrlando,
        itineraryTags: deal.itineraryTags,
        conciergeBestDay: deal.conciergeBestDay,
        conciergeCrowd: deal.conciergeCrowd,
        conciergeResidentNote: deal.conciergeResidentNote,
        bundleOpportunity: deal.bundleOpportunity,
        confidence: deal.confidence,
      ),
  ];

  final bundle = TicketDealCatalogBundle(
    version: 1,
    cityId: cityId,
    updatedAt: DateTime.now().toUtc(),
    deals: enriched,
  );

  final dir = Directory('assets/deals');
  if (!dir.existsSync()) dir.createSync(recursive: true);

  final file = File('assets/deals/deals_$cityId.json');
  const encoder = JsonEncoder.withIndent('  ');
  file.writeAsStringSync('${encoder.convert(bundle.toJson())}\n');
  stdout.writeln('  ${file.path} (${enriched.length} deals)');
}
