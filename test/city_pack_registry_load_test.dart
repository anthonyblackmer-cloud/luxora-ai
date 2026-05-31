import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('CityPackRegistry.load completes without throwing', () async {
    await CityPackRegistry.instance.load();
    expect(CityPackRegistry.instance.allCities, isNotEmpty);
    expect(CityPackRegistry.instance.active.cityId, isNotEmpty);
    expect(
      CityPackRegistry.instance.citiesInState('florida')
          .any((c) => c.cityId == 'st-augustine'),
      isTrue,
    );
  });
}
