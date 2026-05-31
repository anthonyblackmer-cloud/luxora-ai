import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/map_mood_layer.dart';
import 'package:luxora_ai/models/place_vibe.dart';
import 'package:luxora_ai/util/map_mood_layer_filter.dart';
import 'package:luxora_ai/util/place_vibe_resolver.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feed viral item resolves viral and trending vibes', () {
    const item = FeedItem(
      id: 'x',
      kind: FeedItemKind.viralSpot,
      title: 't',
      subtitle: 's',
      location: 'l',
      headline: 'h',
      socialProof: 'p',
      gradient: [],
    );
    final vibes = PlaceVibeResolver.forFeedItem(item, null);
    expect(vibes, contains(PlaceVibe.viral));
    expect(vibes, contains(PlaceVibe.trending));
  });

  test('map gems layer matches hidden tag', () {
    const place = LuxPlace(
      id: 'p1',
      slug: 'p1',
      title: 'Secret spot',
      category: LuxPlaceCategory.nature,
      unsplashPhotoId: 'x',
      location: 'Orlando',
      latitude: 28.5,
      longitude: -81.3,
      description: 'd',
      moodTags: ['hidden', 'local'],
    );
    expect(
      MapMoodLayerFilter.matchesPlace(
        place: place,
        layer: MapMoodLayer.gems,
        gemPlaceIds: const {},
        rainLikely: false,
      ),
      isTrue,
    );
  });

  test('weather layer prefers indoor when rain likely', () {
    const place = LuxPlace(
      id: 'p2',
      slug: 'p2',
      title: 'Museum',
      category: LuxPlaceCategory.wellness,
      unsplashPhotoId: 'x',
      location: 'Orlando',
      latitude: 28.5,
      longitude: -81.3,
      description: 'd',
      moodTags: ['indoor'],
    );
    expect(
      MapMoodLayerFilter.matchesPlace(
        place: place,
        layer: MapMoodLayer.weather,
        gemPlaceIds: const {},
        rainLikely: true,
      ),
      isTrue,
    );
  });
}
