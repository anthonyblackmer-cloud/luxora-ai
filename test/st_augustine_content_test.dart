import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_content.dart';
import 'package:luxora_ai/data/st_augustine/st_augustine_ticket_deals.dart';
import 'package:luxora_ai/models/lux_place.dart';

void main() {
  test('St. Augustine city pack meets launch content targets', () {
    final places = StAugustineContent.places;

    expect(StAugustineContent.districts.length, greaterThanOrEqualTo(18));
    expect(StAugustineContent.hotels.length, greaterThanOrEqualTo(50));
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
    expect(StAugustineContent.gems.length, greaterThanOrEqualTo(100));
    expect(StAugustineContent.localSecrets.length, greaterThanOrEqualTo(50));
    expect(StAugustineContent.moodRoutes.length, greaterThanOrEqualTo(10));
    expect(stAugustineTicketDealsCatalog.length, greaterThanOrEqualTo(8));

    for (final p in places) {
      expect(p.cityPackId, 'st-augustine');
    }
  });
}

