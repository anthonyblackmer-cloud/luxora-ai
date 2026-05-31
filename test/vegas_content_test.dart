import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/vegas/vegas_content.dart';
import 'package:luxora_ai/data/vegas/vegas_ticket_deals.dart';
import 'package:luxora_ai/models/lux_place.dart';

void main() {
  test('Las Vegas city pack meets launch content targets', () {
    final places = VegasContent.places;

    expect(VegasContent.districts.length, greaterThanOrEqualTo(10));
    expect(VegasContent.hotels.length, greaterThanOrEqualTo(75));
    expect(
      places.where((p) => p.category == LuxPlaceCategory.dining).length,
      greaterThanOrEqualTo(200),
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
      greaterThanOrEqualTo(100),
    );
    expect(
      places.where((p) => p.id.contains('-exp-')).length,
      greaterThanOrEqualTo(150),
    );    expect(
      places.where((p) => p.id.contains('-show-')).length,
      greaterThanOrEqualTo(100),
    );
    expect(
      places.where((p) => p.id.contains('-nightlife-')).length,
      greaterThanOrEqualTo(75),
    );
    expect(VegasContent.gems.length, greaterThanOrEqualTo(100));
    expect(VegasContent.localSecrets.length, greaterThanOrEqualTo(75));
    expect(VegasContent.moodRoutes.length, greaterThanOrEqualTo(10));
    expect(vegasTicketDealsCatalog.length, greaterThanOrEqualTo(8));

    for (final p in places) {
      expect(p.cityPackId, 'vegas');
    }
  });
}
