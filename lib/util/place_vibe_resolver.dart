import 'package:luxora_ai/data/feed_items.dart';
import 'package:luxora_ai/data/gem_discoveries.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/place_vibe.dart';

/// Maps catalog tags and editorial signals to scannable [PlaceVibe] chips.
abstract final class PlaceVibeResolver {
  static const _maxChips = 4;

  static List<PlaceVibe> forFeedItem(FeedItem item, LuxPlace? place) {
    final vibes = <PlaceVibe>[
      ..._kindVibes(item),
      if (place != null) ..._placeVibes(place),
    ];
    return _dedupe(vibes);
  }

  static List<PlaceVibe> forPlace(
    LuxPlace place, {
    bool isGem = false,
    bool matchedProfile = false,
    bool rainLikely = false,
  }) {
    final vibes = <PlaceVibe>[
      if (isGem) PlaceVibe.hiddenGem,
      if (matchedProfile) PlaceVibe.luxoraPick,
      ..._placeVibes(place, rainLikely: rainLikely),
    ];
    return _dedupe(vibes);
  }

  static List<PlaceVibe> forGem(HiddenGem gem, LuxPlace? place) {
    final vibes = <PlaceVibe>[
      PlaceVibe.hiddenGem,
      PlaceVibe.localPick,
      if (place != null) ..._placeVibes(place),
    ];
    final blob =
        '${gem.bestTime} ${gem.crowdLevel} ${gem.whySpecial}'.toLowerCase();
    if (blob.contains('sunset') || blob.contains('golden')) {
      vibes.add(PlaceVibe.sunsetReady);
    }
    if (blob.contains('family') || blob.contains('kid')) {
      vibes.add(PlaceVibe.familyApproved);
    }
    return _dedupe(vibes);
  }

  static List<PlaceVibe> _kindVibes(FeedItem item) => switch (item.kind) {
        FeedItemKind.viralSpot => [PlaceVibe.viral, PlaceVibe.trending],
        FeedItemKind.trending => [PlaceVibe.trending],
        FeedItemKind.liveUpdate => [PlaceVibe.live],
        FeedItemKind.seasonal => [PlaceVibe.seasonal],
        FeedItemKind.newOpening => [PlaceVibe.localPick, PlaceVibe.trending],
        FeedItemKind.creatorPick => [PlaceVibe.luxoraPick, PlaceVibe.localPick],
      };

  static List<PlaceVibe> _placeVibes(
    LuxPlace place, {
    bool rainLikely = false,
  }) {
    final tags = place.moodTags.map((t) => t.toLowerCase()).toSet();
    final vibes = <PlaceVibe>[];

    if (_any(tags, ['sunset', 'golden', 'twilight', 'rooftop'])) {
      vibes.add(PlaceVibe.sunsetReady);
    }
    if (_any(tags, ['viral', 'trending', 'social', 'buzz'])) {
      vibes.add(PlaceVibe.viral);
    }
    if (_any(tags, ['family', 'iconic', 'kids']) ||
        place.category == LuxPlaceCategory.family) {
      vibes.add(PlaceVibe.familyApproved);
    }
    if (_any(tags, ['hidden', 'gem', 'local', 'insider', 'secret'])) {
      vibes.add(PlaceVibe.hiddenGem);
    }
    if (rainLikely &&
        (_any(tags, ['indoor', 'museum', 'covered', 'spa']) ||
            place.category == LuxPlaceCategory.wellness ||
            place.category == LuxPlaceCategory.springs)) {
      vibes.add(PlaceVibe.rainSafe);
    }
    if (_any(tags, ['romantic', 'couples', 'date-night', 'date_night']) ||
        place.category == LuxPlaceCategory.romantic) {
      vibes.add(PlaceVibe.dateNight);
    }
    if (_any(tags, ['nightlife', 'night', 'bar', 'speakeasy', 'club']) ||
        place.category == LuxPlaceCategory.nightlife) {
      vibes.add(PlaceVibe.nightVibe);
    }
    if (_any(tags, ['foodie', 'dining', 'food']) ||
        place.category == LuxPlaceCategory.dining) {
      vibes.add(PlaceVibe.foodie);
    }
    if (_any(tags, ['luxury', 'upscale', 'premium'])) {
      vibes.add(PlaceVibe.luxury);
    }
    if (_any(tags, ['adventure', 'nature', 'water'])) {
      vibes.add(PlaceVibe.adventure);
    }
    if (_any(tags, ['wellness', 'spa', 'relaxing']) ||
        place.category == LuxPlaceCategory.wellness) {
      vibes.add(PlaceVibe.wellness);
    }
    if (_any(tags, ['beach', 'coastal', 'sand']) ||
        place.category == LuxPlaceCategory.beach) {
      vibes.add(PlaceVibe.beachDay);
    }
    if (place.source == LuxPlaceSource.curated) {
      vibes.add(PlaceVibe.luxoraPick);
    }

    return vibes;
  }

  static bool _any(Set<String> tags, List<String> needles) =>
      needles.any(tags.contains);

  static List<PlaceVibe> _dedupe(List<PlaceVibe> vibes) {
    final seen = <PlaceVibe>{};
    final out = <PlaceVibe>[];
    for (final vibe in vibes) {
      if (seen.add(vibe)) out.add(vibe);
      if (out.length >= _maxChips) break;
    }
    return out;
  }
}
