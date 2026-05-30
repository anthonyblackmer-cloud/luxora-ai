import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';
import 'package:luxora_ai/util/place_distance.dart';

/// Time-of-day segments a day flows through. The planner fills each segment
/// with the place that best fits the traveler's interest dials, so the day
/// reads like a concierge sequenced it — calm start, peak midday, the meal,
/// an optional night out — rather than a flat percentage.
enum DayPhase { morning, midday, afternoon, evening, night }

/// The "why" behind a block, surfaced as a one-line rationale in the UI so the
/// plan feels intelligent and personal instead of arbitrary.
enum DayBlockReason {
  morningPool,
  morningCalm,
  middayAdventure,
  middayCulture,
  middayIcon,
  afternoonDowntime,
  afternoonGem,
  eveningDining,
  nightOut,
}

/// A single stop in the day, anchored to a time-of-day phase with a reason.
class DayBlock {
  const DayBlock({
    required this.phase,
    required this.place,
    required this.reason,
  });

  final DayPhase phase;
  final LuxPlace place;
  final DayBlockReason reason;
}

/// A sequenced day: ordered blocks from morning to night, the origin it departs
/// from (home-base hotel when set), and the rough driving distance along the
/// narrative order.
class DayFlow {
  const DayFlow({
    required this.blocks,
    required this.start,
    required this.totalMiles,
    this.homeBase,
    this.emphases = const [],
  });

  final List<DayBlock> blocks;
  final LatLng start;
  final double totalMiles;
  final LuxPlace? homeBase;

  /// Dials the traveler leaned into (>= [DayFlowPlanner._highThreshold]),
  /// surfaced as qualitative vibe chips instead of raw percentages.
  final List<DayInterest> emphases;

  bool get isEmpty => blocks.isEmpty;
  int get stopCount => blocks.length;

  String get milesLabel => PlaceDistance.milesLabel(totalMiles);
  String get driveTimeLabel => PlaceDistance.driveTimeLabel(totalMiles);

  List<String> get orderedPlaceIds => [for (final b in blocks) b.place.id];
}

/// The interest dimensions the planner reasons over.
enum DayInterest { foodie, nightlife, poolside, adventure, culture }

/// Builds a [DayFlow] from a [TripProfile], the available places, and an
/// optional home base. Pure / synchronous so the map can rebuild it cheaply.
abstract final class DayFlowPlanner {
  static const int _highThreshold = 60;

  /// Builds a day plan from trip profile and place pool.
  /// Trust rule: never boost stops by sponsor tier — mood, distance, and fit only.
  static DayFlow plan({
    required TripProfile? profile,
    required List<LuxPlace> pool,
    LuxPlace? homeBase,
    Set<String> savedIds = const {},
  }) {
    final p = TripOccasionInterpreter.apply(profile ?? const TripProfile());
    final start = homeBase != null
        ? LatLng(homeBase.latitude, homeBase.longitude)
        : PlaceDistance.hubCenter;

    final isMiami = CityPackRegistry.instance.active.cityId == 'miami';

    final used = <String>{if (homeBase != null) homeBase.id};
    final blocks = <DayBlock>[];
    var cursor = start;

    LuxPlace? pick(
      List<LuxPlaceCategory> categories, {
      List<String> tags = const [],
    }) {
      final lowerTags = {for (final t in tags) t.toLowerCase()};
      LuxPlace? best;
      var bestScore = double.negativeInfinity;
      for (final place in pool) {
        if (used.contains(place.id)) continue;
        var score = 0.0;
        final catIndex = categories.indexOf(place.category);
        if (catIndex >= 0) {
          score += (categories.length - catIndex) * 10.0;
        }
        final tagHits = place.moodTags
            .where((t) => lowerTags.contains(t.toLowerCase()))
            .length;
        score += tagHits * 5.0;
        // Must relate to the phase in some way.
        if (score <= 0) continue;
        // Honor the traveler's own bookmarks.
        if (savedIds.contains(place.id)) score += 30.0;
        // Curated editorial beats bulk OSM at equal relevance.
        if (place.source == LuxPlaceSource.curated) score += 6.0;
        // Keep the day tight: nearer the previous stop is better.
        final miles = PlaceDistance.milesBetween(
          cursor,
          LatLng(place.latitude, place.longitude),
        );
        score -= miles * 0.18;
        if (score > bestScore) {
          bestScore = score;
          best = place;
        }
      }
      if (best != null) {
        used.add(best.id);
        cursor = LatLng(best.latitude, best.longitude);
      }
      return best;
    }

    void add(DayPhase phase, LuxPlace? place, DayBlockReason reason) {
      if (place == null) return;
      blocks.add(DayBlock(phase: phase, place: place, reason: reason));
    }

    // --- Morning: a gentle start. ---
    if (p.poolsideInterest >= 50) {
      add(
        DayPhase.morning,
        pick(
          isMiami
              ? const [
                  LuxPlaceCategory.beach,
                  LuxPlaceCategory.wellness,
                  LuxPlaceCategory.nature,
                ]
              : const [
                  LuxPlaceCategory.wellness,
                  LuxPlaceCategory.beach,
                  LuxPlaceCategory.springs,
                ],
          tags: isMiami
              ? const ['beach', 'pool', 'spa', 'wellness', 'relaxing']
              : const ['pool', 'spa', 'wellness', 'relaxing', 'beach'],
        ),
        DayBlockReason.morningPool,
      );
    }
    if (blocks.isEmpty) {
      add(
        DayPhase.morning,
        pick(
          isMiami
              ? const [
                  LuxPlaceCategory.beach,
                  LuxPlaceCategory.nature,
                  LuxPlaceCategory.wellness,
                  LuxPlaceCategory.adventure,
                ]
              : const [
                  LuxPlaceCategory.springs,
                  LuxPlaceCategory.nature,
                  LuxPlaceCategory.beach,
                  LuxPlaceCategory.wellness,
                ],
          tags: isMiami
              ? const ['beach', 'nature', 'relaxing', 'scenic', 'sunrise']
              : const ['springs', 'nature', 'relaxing', 'scenic'],
        ),
        DayBlockReason.morningCalm,
      );
    }

    // --- Midday: peak energy. ---
    final wantsAdventure = p.adventureInterest >= p.cultureInterest &&
        p.adventureInterest >= 40;
    if (wantsAdventure) {
      add(
        DayPhase.midday,
        pick(
          isMiami
              ? const [
                  LuxPlaceCategory.adventure,
                  LuxPlaceCategory.beach,
                  LuxPlaceCategory.nature,
                ]
              : const [
                  LuxPlaceCategory.adventure,
                  LuxPlaceCategory.springs,
                  LuxPlaceCategory.beach,
                  LuxPlaceCategory.nature,
                ],
          tags: isMiami
              ? const ['adventure', 'water', 'culture', 'outdoors', 'arts']
              : const ['adventure', 'water', 'springs', 'thrill', 'outdoors'],
        ),
        DayBlockReason.middayAdventure,
      );
    } else if (p.cultureInterest >= 40) {
      add(
        DayPhase.midday,
        pick(
          const [LuxPlaceCategory.family, LuxPlaceCategory.nature,
              LuxPlaceCategory.romantic],
          tags: const ['iconic', 'culture', 'historic', 'arts', 'trending'],
        ),
        DayBlockReason.middayCulture,
      );
    }
    if (blocks.length < 2) {
      add(
        DayPhase.midday,
        pick(
          isMiami
              ? const [
                  LuxPlaceCategory.adventure,
                  LuxPlaceCategory.family,
                  LuxPlaceCategory.beach,
                ]
              : const [
                  LuxPlaceCategory.family,
                  LuxPlaceCategory.adventure,
                  LuxPlaceCategory.nature,
                  LuxPlaceCategory.beach,
                ],
          tags: const ['iconic', 'trending', 'family', 'culture'],
        ),
        DayBlockReason.middayIcon,
      );
    }

    // --- Afternoon: downtime (skipped for a packed pace unless poolside). ---
    final wantAfternoon =
        p.pace != PacePreference.packed || p.poolsideInterest >= 60;
    if (wantAfternoon) {
      final gemReason = p.discoveryStyle == DiscoveryStyle.hiddenGems;
      add(
        DayPhase.afternoon,
        pick(
          isMiami
              ? const [
                  LuxPlaceCategory.beach,
                  LuxPlaceCategory.wellness,
                  LuxPlaceCategory.nature,
                  LuxPlaceCategory.adventure,
                ]
              : const [
                  LuxPlaceCategory.wellness,
                  LuxPlaceCategory.beach,
                  LuxPlaceCategory.springs,
                  LuxPlaceCategory.nature,
                ],
          tags: const ['relaxing', 'pool', 'spa', 'beach', 'hidden', 'scenic'],
        ),
        gemReason ? DayBlockReason.afternoonGem : DayBlockReason.afternoonDowntime,
      );
    }

    // --- Evening: the meal. ---
    if (p.foodieInterest >= 25) {
      add(
        DayPhase.evening,
        pick(
          const [LuxPlaceCategory.dining, LuxPlaceCategory.romantic],
          tags: const ['foodie', 'romantic', 'dining'],
        ),
        DayBlockReason.eveningDining,
      );
    }

    // --- Night: out late, only if nightlife is high enough for the pace. ---
    final nightThreshold = switch (p.pace) {
      PacePreference.packed => 25,
      PacePreference.balanced => 35,
      PacePreference.slow => 55,
    };
    if (p.nightlifeInterest >= nightThreshold &&
        !(p.occasion.isFamily || p.kids > 0)) {
      add(
        DayPhase.night,
        pick(
          const [LuxPlaceCategory.nightlife, LuxPlaceCategory.dining],
          tags: const ['nightlife', 'trending', 'social', 'bar'],
        ),
        DayBlockReason.nightOut,
      );
    }

    var total = 0.0;
    var prev = start;
    for (final b in blocks) {
      final here = LatLng(b.place.latitude, b.place.longitude);
      total += PlaceDistance.milesBetween(prev, here);
      prev = here;
    }

    return DayFlow(
      blocks: blocks,
      start: start,
      totalMiles: total,
      homeBase: homeBase,
      emphases: _emphases(p),
    );
  }

  static List<DayInterest> _emphases(TripProfile p) {
    final scored = <(DayInterest, int)>[
      (DayInterest.foodie, p.foodieInterest),
      (DayInterest.poolside, p.poolsideInterest),
      (DayInterest.adventure, p.adventureInterest),
      (DayInterest.culture, p.cultureInterest),
      (DayInterest.nightlife, p.nightlifeInterest),
    ]..sort((a, b) => b.$2.compareTo(a.$2));
    return [
      for (final s in scored)
        if (s.$2 >= _highThreshold) s.$1,
    ].take(3).toList();
  }
}
