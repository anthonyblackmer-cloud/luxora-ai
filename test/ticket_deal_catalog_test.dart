import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/ticket_deal.dart';
import 'package:luxora_ai/models/ticket_deal_catalog.dart';

void main() {
  test('TicketDealJson round-trip preserves core fields', () {
    final original = TicketDeal(
      id: 'deal-test',
      title: 'Test Deal',
      category: TicketDealCategory.attractions,
      officialPriceUsd: 100,
      discountPriceUsd: 80,
      sourceName: 'Undercover Tourist',
      sourceUrl: 'https://www.undercovertourist.com/',
      expiresAt: DateTime.utc(2026, 12, 1),
      placeId: 'place-test',
      popularityScore: 77,
    );

    final map = TicketDealJson.toMap(original);
    final restored = TicketDealJson.fromMap(map);

    expect(restored.id, original.id);
    expect(restored.discountPriceUsd, original.discountPriceUsd);
    expect(restored.sourceUrl, original.sourceUrl);
    expect(restored.expiresAt.toUtc(), original.expiresAt);
  });

  test('TicketDealCatalogBundle JSON round-trip', () {
    final bundle = TicketDealCatalogBundle(
      version: 1,
      cityId: 'orlando',
      updatedAt: DateTime.utc(2026, 5, 30),
      deals: const [],
    );

    final decoded = TicketDealCatalogBundle.fromJson(
      jsonDecode(jsonEncode(bundle.toJson())) as Map<String, dynamic>,
    );

    expect(decoded.cityId, 'orlando');
    expect(decoded.version, 1);
    expect(decoded.updatedAt, bundle.updatedAt);
  });
}
