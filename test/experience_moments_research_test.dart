import 'package:flutter_test/flutter_test.dart';

import '../tool/experience_moments_research_lib.dart';

void main() {
  test('scanPlaces finds Orlando flagship seeds', () {
    final pack = packForCity('orlando')!;
    final places = scanPlaces(pack);
    expect(places.map((p) => p.id), contains('place-magic-kingdom'));
  });

  test('parseExistingMoments reads Orlando catalog', () {
    final pack = packForCity('orlando')!;
    final existing = parseExistingMoments(pack.momentsCatalogPath);
    expect(existing.length, greaterThan(10));
    expect(existing.map((m) => m.title), contains('Happily Ever After'));
  });

  test('buildCandidates marks catalog entries as existing', () {
    final pack = packForCity('orlando')!;
    final places = scanPlaces(pack);
    final existing = parseExistingMoments(pack.momentsCatalogPath);
    final candidates = buildCandidates(
      pack: pack,
      places: places,
      existing: existing,
      cityName: 'Orlando',
    );

    expect(
      candidates.any(
        (c) =>
            c.placeId == 'place-magic-kingdom' && c.status == 'existing',
      ),
      isTrue,
    );
  });

  test('discoverPacksFromAssets includes JSON-only packs', () {
    final packs = discoverPacksFromAssets();
    expect(packs.map((p) => p.cityId), contains('paris'));
  });
}
