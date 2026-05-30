import 'package:flutter_test/flutter_test.dart';

import 'package:luxora_ai/data/hotels_catalog.dart';
import 'package:luxora_ai/data/miami/miami_hotels_catalog.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await UnsplashPhotoRegistry.instance.ensureLoaded();
    await PlacesRepository.instance.initialize();
  });

  test('hotel catalog photo ids match linked place heroes', () {
    for (final hotel in HotelsCatalog.all) {
      final place = PlacesRepository.instance.byId(hotel.placeId);
      expect(place, isNotNull, reason: hotel.name);
      expect(
        hotel.unsplashPhotoId,
        place!.unsplashPhotoId,
        reason: '${hotel.name} catalog/place photo mismatch',
      );
    }
  });

  test('Orlando hotel places and catalog rows resolve hero photos', () {
    for (final hotel in HotelsCatalog.all) {
      final place = PlacesRepository.instance.byId(hotel.placeId);
      expect(place, isNotNull, reason: 'missing place ${hotel.placeId}');
      expect(
        place!.unsplashPhoto?.hotlinkUrl,
        startsWith('https://'),
        reason: '${hotel.name} place → ${place.unsplashPhotoId}',
      );
      expect(
        UnsplashPhotoRegistry.instance.byId(hotel.unsplashPhotoId)?.hotlinkUrl,
        startsWith('https://'),
        reason: '${hotel.name} catalog → ${hotel.unsplashPhotoId}',
      );
    }
  });

  test('Miami hotel places resolve hero photos', () {
    for (final hotel in MiamiHotelsCatalog.all) {
      final place = HotelIntelligenceService.placeFor(hotel);
      expect(place?.unsplashPhoto?.hotlinkUrl, startsWith('https://'),
          reason: hotel.name);
    }
  });
}
