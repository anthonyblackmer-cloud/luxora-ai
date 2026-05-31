import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/naples/naples_content.dart';
import 'package:luxora_ai/data/naples/naples_ticket_deals.dart';
import 'package:luxora_ai/models/lux_place.dart';

void main() {
  test('Naples city pack meets launch content targets', () {
    final places = NaplesContent.places;

    expect(NaplesContent.districts.length, greaterThanOrEqualTo(18));
    expect(NaplesContent.hotels.length, greaterThanOrEqualTo(50));
    expect(
      places.where((p) => p.category == LuxPlaceCategory.dining).length,
      greaterThanOrEqualTo(150),
    );
    expect(
      places
          .where(
            (p) =>
                p.category == LuxPlaceCategory.adventure ||
                p.category == LuxPlaceCategory.beach ||
                p.category == LuxPlaceCategory.nature,
          )
          .length,
      greaterThanOrEqualTo(75),
    );
    expect(
      places.where((p) => p.id.contains('-exp-')).length,
      greaterThanOrEqualTo(100),
    );
    expect(NaplesContent.gems.length, greaterThanOrEqualTo(100));
    expect(NaplesContent.localSecrets.length, greaterThanOrEqualTo(50));
    expect(NaplesContent.moodRoutes.length, greaterThanOrEqualTo(10));
    expect(naplesTicketDealsCatalog.length, greaterThanOrEqualTo(8));

    for (final p in places) {
      expect(p.cityPackId, 'naples');
    }
  });
}
