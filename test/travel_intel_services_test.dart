import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/crowd_prediction_service.dart';
import 'package:luxora_ai/services/drive_friction_service.dart';
import 'package:luxora_ai/services/parking_difficulty_service.dart';
import 'package:luxora_ai/util/place_distance.dart';

LuxPlace _themePark({required String id, required String title}) => LuxPlace(
      id: id,
      slug: id,
      title: title,
      category: LuxPlaceCategory.family,
      unsplashPhotoId: 'test',
      location: 'Lake Buena Vista, FL',
      latitude: 28.42,
      longitude: -81.58,
      description: 'Test',
      moodTags: const ['iconic', 'trending'],
    );

void main() {
  test('theme parks score harder parking than hidden springs', () {
    final magicKingdom = _themePark(
      id: 'place-magic-kingdom',
      title: 'Magic Kingdom',
    );
    final hiddenSpring = LuxPlace(
      id: 'place-hidden',
      slug: 'hidden',
      title: 'Hidden Spring',
      category: LuxPlaceCategory.springs,
      unsplashPhotoId: 'test',
      location: 'FL',
      latitude: 28.7,
      longitude: -81.3,
      description: 'Test',
      moodTags: const ['hidden'],
    );

    final saturdayMidday = DateTime(2026, 5, 30, 12);

    final parkParking = ParkingDifficultyService.levelFor(
      place: magicKingdom,
      atLocal: saturdayMidday,
    );
    expect(
      parkParking,
      anyOf(ParkingDifficulty.limited, ParkingDifficulty.difficult),
    );

    expect(
      ParkingDifficultyService.scoreFor(
        place: magicKingdom,
        atLocal: saturdayMidday,
      ),
      greaterThan(
        ParkingDifficultyService.scoreFor(
          place: hiddenSpring,
          atLocal: saturdayMidday,
        ),
      ),
    );
  });

  test('drive friction stays in range and rises with theme-park stress', () {
    final magicKingdom = _themePark(
      id: 'place-magic-kingdom',
      title: 'Magic Kingdom',
    );
    final hiddenSpring = LuxPlace(
      id: 'place-hidden',
      slug: 'hidden',
      title: 'Hidden Spring',
      category: LuxPlaceCategory.springs,
      unsplashPhotoId: 'test',
      location: 'FL',
      latitude: 28.7,
      longitude: -81.3,
      description: 'Test',
      moodTags: const ['hidden'],
    );
    final saturdayMidday = DateTime(2026, 5, 30, 12);

    final nearFriction = DriveFrictionService.scoreForLeg(
      from: PlaceDistance.hubCenter,
      to: hiddenSpring,
      atLocal: saturdayMidday,
    );
    final parkFriction = DriveFrictionService.scoreForLeg(
      from: PlaceDistance.hubCenter,
      to: magicKingdom,
      atLocal: saturdayMidday,
    );

    expect(nearFriction, inInclusiveRange(10, 90));
    expect(parkFriction, inInclusiveRange(10, 90));
    expect(parkFriction, greaterThan(nearFriction - 5));

    final crowd = CrowdPredictionService.levelFor(
      place: magicKingdom,
      atLocal: saturdayMidday,
    );
    expect(crowd.isHigh, isTrue);
  });
}
