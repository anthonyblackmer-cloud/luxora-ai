import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/smart_itinerary/itinerary_place_picker.dart';
import 'package:luxora_ai/util/place_distance.dart';

void main() {
  final luma = _place(
    id: 'dining-luma-on-park',
    title: 'Luma on Park',
    category: LuxPlaceCategory.dining,
    tags: const ['foodie', 'romantic', 'trending'],
    source: LuxPlaceSource.curated,
    lat: 28.5970,
    lng: -81.3510,
  );
  final osmA = _place(
    id: 'osm-dining-a',
    title: 'Harbor Grill',
    category: LuxPlaceCategory.dining,
    tags: const ['foodie'],
    source: LuxPlaceSource.osm,
    lat: 28.5400,
    lng: -81.3800,
  );
  final osmB = _place(
    id: 'osm-dining-b',
    title: 'Lake Eola Kitchen',
    category: LuxPlaceCategory.dining,
    tags: const ['foodie', 'dining'],
    source: LuxPlaceSource.osm,
    lat: 28.5410,
    lng: -81.3720,
  );
  final seaworld = _place(
    id: 'place-seaworld-orlando',
    title: 'SeaWorld Orlando',
    category: LuxPlaceCategory.family,
    tags: const ['iconic', 'family'],
    lat: 28.4110,
    lng: -81.4610,
  );
  final volcano = _place(
    id: 'place-volcano-bay',
    title: "Universal's Volcano Bay",
    category: LuxPlaceCategory.family,
    tags: const ['water', 'family'],
    lat: 28.4630,
    lng: -81.4750,
  );

  test('rotates dining picks across days instead of always choosing the same spot', () {
    const profile = TripProfile(foodieInterest: 80);
    final pool = [luma, osmA, osmB];

    final day0 = ItineraryPlacePicker.pickDining(
      ctx: ItineraryPickContext(
        profile: profile,
        pool: pool,
        tripUsed: const {},
        dayUsed: const {},
        savedIds: const {},
        near: PlaceDistance.hubCenter,
        rotationSeed: 0,
      ),
    );
    final day1 = ItineraryPlacePicker.pickDining(
      ctx: ItineraryPickContext(
        profile: profile,
        pool: pool,
        tripUsed: {day0!.id},
        dayUsed: const {},
        savedIds: const {},
        near: PlaceDistance.hubCenter,
        rotationSeed: 1,
      ),
    );

    expect(day0, isNotNull);
    expect(day1, isNotNull);
    expect(day0!.id, isNot(equals(day1!.id)));
  });

  test('boosts OSM and fresh venues after curated picks are consumed', () {
    const profile = TripProfile(adventureInterest: 70);
    final pool = [luma, osmA, seaworld, volcano];

    final pick = ItineraryPlacePicker.pickExperience(
      ctx: ItineraryPickContext(
        profile: profile,
        pool: pool,
        tripUsed: {luma.id, seaworld.id},
        dayUsed: const {},
        savedIds: const {},
        near: PlaceDistance.hubCenter,
        rotationSeed: 4,
        intentText: 'water park day',
      ),
      categories: const [LuxPlaceCategory.family, LuxPlaceCategory.adventure],
      tags: const ['water', 'adventure'],
    );

    expect(pick?.id, volcano.id);
  });

  test('prefers unused trip stops over repeats', () {
    const profile = TripProfile(adventureInterest: 60, cultureInterest: 50);
    final wekiwa = _place(
      id: 'place-wekiwa-springs',
      title: 'Wekiwa Springs',
      category: LuxPlaceCategory.springs,
      tags: const ['springs', 'nature'],
      lat: 28.7570,
      lng: -81.4980,
    );
    final lakeEola = _place(
      id: 'place-lake-eola',
      title: 'Lake Eola Park',
      category: LuxPlaceCategory.nature,
      tags: const ['iconic', 'romantic'],
      lat: 28.5433,
      lng: -81.3790,
    );

    final pick = ItineraryPlacePicker.pickExperience(
      ctx: ItineraryPickContext(
        profile: profile,
        pool: [wekiwa, lakeEola],
        tripUsed: {lakeEola.id},
        dayUsed: const {},
        savedIds: const {},
        near: PlaceDistance.hubCenter,
        rotationSeed: 2,
      ),
      categories: const [LuxPlaceCategory.nature, LuxPlaceCategory.springs],
      tags: const ['nature', 'springs'],
    );

    expect(pick?.id, wekiwa.id);
  });
}

LuxPlace _place({
  required String id,
  required String title,
  required LuxPlaceCategory category,
  required double lat,
  required double lng,
  List<String> tags = const [],
  LuxPlaceSource source = LuxPlaceSource.curated,
}) {
  return LuxPlace(
    id: id,
    slug: id,
    title: title,
    category: category,
    unsplashPhotoId: 'test',
    location: 'Orlando, FL',
    latitude: lat,
    longitude: lng,
    description: 'Test place',
    moodTags: tags,
    source: source,
  );
}
