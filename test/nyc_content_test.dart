import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/nyc/nyc_content.dart';
import 'package:luxora_ai/data/nyc/nyc_ticket_deals.dart';
import 'package:luxora_ai/models/lux_place.dart';

void main() {
  test('New York City city pack meets launch content targets', () {
    final places = NycContent.places;

    expect(NycContent.districts.length, greaterThanOrEqualTo(18));
    expect(NycContent.hotels.length, greaterThanOrEqualTo(100));
    expect(
      places.where((p) => p.category == LuxPlaceCategory.dining).length,
      greaterThanOrEqualTo(300),
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
      greaterThanOrEqualTo(150),
    );
    expect(
      places.where((p) => p.id.contains('-exp-')).length,
      greaterThanOrEqualTo(150),
    );    expect(
      places.where((p) => p.id.contains('-broadway-')).length,
      greaterThanOrEqualTo(50),
    );
    expect(
      places.where((p) => p.id.contains('-guide-')).length,
      greaterThanOrEqualTo(25),
    );
    expect(NycContent.gems.length, greaterThanOrEqualTo(150));
    expect(NycContent.localSecrets.length, greaterThanOrEqualTo(100));
    expect(NycContent.moodRoutes.length, greaterThanOrEqualTo(10));
    expect(nycTicketDealsCatalog.length, greaterThanOrEqualTo(8));

    for (final p in places) {
      expect(p.cityPackId, 'nyc');
    }
  });
}
