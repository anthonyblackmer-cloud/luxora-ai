import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_content.dart';
import 'package:luxora_ai/data/tampa_bay/tampa_bay_ticket_deals.dart';
import 'package:luxora_ai/models/lux_place.dart';

void main() {
  test('Tampa Bay city pack meets launch content targets', () {
    final places = TampaBayContent.places;

    expect(TampaBayContent.districts.length, greaterThanOrEqualTo(18));
    expect(TampaBayContent.hotels.length, greaterThanOrEqualTo(50));
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
    expect(TampaBayContent.gems.length, greaterThanOrEqualTo(100));
    expect(TampaBayContent.localSecrets.length, greaterThanOrEqualTo(50));
    expect(TampaBayContent.moodRoutes.length, greaterThanOrEqualTo(10));
    expect(tampaBayTicketDealsCatalog.length, greaterThanOrEqualTo(8));

    for (final p in places) {
      expect(p.cityPackId, 'tampa-bay');
    }
  });
}
