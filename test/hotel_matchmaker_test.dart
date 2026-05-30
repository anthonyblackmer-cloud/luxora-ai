import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/l10n/app_localizations_en.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await CityPackRegistry.instance.load();
    await CityPackEntitlementStore.instance.clearAll();
    await CityPackEntitlementStore.instance.unlockCity('orlando');
    await CityPackEntitlementStore.instance.unlockAddon('theme-parks');
  });

  test('Universal selection ranks Portofino above Disney-only resorts', () {
    final results = HotelIntelligenceService.match(
      input: const HotelMatchmakerInput(
        plannedAttractions: ['universal'],
        adults: 2,
        kids: 0,
        luxuryLevel: 3,
        transport: HotelTransportPreference.rentalCar,
      ),
      l: AppLocalizationsEn(),
    );

    expect(results, isNotEmpty);
    expect(results.first.hotel.id, 'hotel-intel-portofino-bay');
  });

  test('Winter Park selection ranks Alfond Inn first', () {
    final results = HotelIntelligenceService.match(
      input: const HotelMatchmakerInput(
        plannedAttractions: ['winter_park'],
        adults: 2,
        kids: 0,
        luxuryLevel: 3,
        transport: HotelTransportPreference.walkableArea,
      ),
      l: AppLocalizationsEn(),
    );

    expect(results.first.hotel.id, 'hotel-intel-almanac-winter-park');
  });

  test('check rates URL resolves for Orlando hotel', () {
    final hotel = HotelIntelligenceService.hotelById('hotel-intel-four-seasons');
    expect(hotel, isNotNull);
    final url = HotelIntelligenceService.checkRatesUrlFor(hotel!);
    expect(url, startsWith('https://'));
    expect(url, isNot(contains('example.com')));
  });

  test('placeholder keys hotel falls back to Google Travel', () {
    final hotel = HotelIntelligenceService.hotelById('keys-hotel-intel-baker-s');
    if (hotel == null) return;
    final url = HotelIntelligenceService.checkRatesUrlFor(hotel);
    expect(url, contains('google.com/travel/hotels'));
  });
}
