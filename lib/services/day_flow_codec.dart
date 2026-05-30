import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/day_flow_planner.dart';
import 'package:luxora_ai/services/places_repository.dart';

/// JSON snapshot of [DayFlow] — place ids resolved through [PlacesRepository].
abstract final class DayFlowCodec {
  static Map<String, dynamic> encode(DayFlow flow) => {
        'blocks': [
          for (final block in flow.blocks)
            {
              'phase': block.phase.name,
              'placeId': block.place.id,
              'reason': block.reason.name,
            },
        ],
        'startLat': flow.start.latitude,
        'startLng': flow.start.longitude,
        'totalMiles': flow.totalMiles,
        if (flow.homeBase != null) 'homeBaseId': flow.homeBase!.id,
        'emphases': [for (final e in flow.emphases) e.name],
      };

  static DayFlow? decode(
    Map<String, dynamic> json, {
    PlacesRepository? repo,
  }) {
    final repository = repo ?? PlacesRepository.instance;
    final blocksRaw = json['blocks'] as List<dynamic>? ?? const [];
    final blocks = <DayBlock>[];
    for (final raw in blocksRaw) {
      if (raw is! Map<String, dynamic>) continue;
      final placeId = raw['placeId'] as String?;
      if (placeId == null) continue;
      final place = repository.byId(placeId);
      if (place == null) continue;
      final phase = _enumByName(DayPhase.values, raw['phase'] as String?);
      final reason =
          _enumByName(DayBlockReason.values, raw['reason'] as String?);
      if (phase == null || reason == null) continue;
      blocks.add(DayBlock(phase: phase, place: place, reason: reason));
    }
    if (blocks.isEmpty) return null;

    final startLat = (json['startLat'] as num?)?.toDouble();
    final startLng = (json['startLng'] as num?)?.toDouble();
    final homeBaseId = json['homeBaseId'] as String?;
    final homeBase =
        homeBaseId == null ? null : repository.byId(homeBaseId);

    return DayFlow(
      blocks: blocks,
      start: LatLng(startLat ?? blocks.first.place.latitude,
          startLng ?? blocks.first.place.longitude),
      totalMiles: (json['totalMiles'] as num?)?.toDouble() ?? 0,
      homeBase: homeBase,
      emphases: [
        for (final name in (json['emphases'] as List<dynamic>? ?? const []))
          if (_enumByName(DayInterest.values, name.toString()) case final e?)
            e,
      ],
    );
  }

  static T? _enumByName<T extends Enum>(List<T> values, String? name) {
    if (name == null) return null;
    for (final value in values) {
      if (value.name == name) return value;
    }
    return null;
  }
}

/// Prefer Concierge-persisted flow, else build from profile + bookmarks.
DayFlow resolveDayFlowForActiveCity({
  required TripProfile? profile,
  required List<LuxPlace> pool,
  required LuxPlace? homeBase,
  required Set<String> savedIds,
  DayFlow? storedFlow,
}) {
  if (storedFlow != null && !storedFlow.isEmpty) {
    return storedFlow;
  }
  return DayFlowPlanner.plan(
    profile: profile,
    pool: pool,
    homeBase: homeBase,
    savedIds: savedIds,
  );
}
