import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_content.dart';
import 'package:luxora_ai/data/destin_30a/destin_30a_ticket_deals.dart';
import 'package:luxora_ai/models/lux_place.dart';

void main() {
  test('Destin & 30A city pack meets launch content targets', () {
    final places = Destin30aContent.places;

    expect(Destin30aContent.districts.length, greaterThanOrEqualTo(18));
    expect(Destin30aContent.hotels.length, greaterThanOrEqualTo(50));
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
    expect(Destin30aContent.gems.length, greaterThanOrEqualTo(100));
    expect(Destin30aContent.localSecrets.length, greaterThanOrEqualTo(50));
    expect(Destin30aContent.moodRoutes.length, greaterThanOrEqualTo(10));
    expect(destin30aTicketDealsCatalog.length, greaterThanOrEqualTo(8));

    for (final p in places) {
      expect(p.cityPackId, 'destin-30a');
    }
  });
}

