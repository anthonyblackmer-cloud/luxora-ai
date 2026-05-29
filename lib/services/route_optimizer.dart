import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/util/place_distance.dart';

/// Result of optimizing a multi-stop day: the stops in an efficient visiting
/// order plus total driving distance and a rough drive-time estimate.
class OptimizedRoute {
  const OptimizedRoute({
    required this.start,
    required this.stops,
    required this.totalMiles,
    this.returnsToStart = false,
  });

  /// Origin the route departs from (e.g. the Orlando hub / hotel).
  final LatLng start;

  /// Stops in optimized visiting order.
  final List<LuxPlace> stops;

  /// Total driving distance (great-circle approximation) in miles.
  final double totalMiles;

  final bool returnsToStart;

  String get driveTimeLabel => PlaceDistance.driveTimeLabel(totalMiles);

  String get milesLabel => PlaceDistance.milesLabel(totalMiles);
}

/// Orders stops to reduce total driving using nearest-neighbor seeding plus a
/// 2-opt refinement. Distances are great-circle estimates (no routing API),
/// which is enough to sequence a day sensibly and drive the cinematic path.
abstract final class RouteOptimizer {
  static OptimizedRoute optimize({
    required LatLng start,
    required List<LuxPlace> places,
    bool returnToStart = false,
  }) {
    if (places.isEmpty) {
      return OptimizedRoute(
        start: start,
        stops: const [],
        totalMiles: 0,
        returnsToStart: returnToStart,
      );
    }

    // Nodes: index 0 is the fixed start, 1..n are stops.
    final points = <LatLng>[
      start,
      for (final p in places) LatLng(p.latitude, p.longitude),
    ];

    final order = _nearestNeighborOrder(points);
    _twoOptImprove(points, order, returnToStart);

    final stops = [for (final i in order.skip(1)) places[i - 1]];
    final total = _pathMiles(points, order, returnToStart);

    return OptimizedRoute(
      start: start,
      stops: stops,
      totalMiles: total,
      returnsToStart: returnToStart,
    );
  }

  static List<int> _nearestNeighborOrder(List<LatLng> points) {
    final n = points.length;
    final visited = List<bool>.filled(n, false);
    final order = <int>[0];
    visited[0] = true;
    var current = 0;
    for (var step = 1; step < n; step++) {
      var best = -1;
      var bestDist = double.infinity;
      for (var j = 1; j < n; j++) {
        if (visited[j]) continue;
        final d = PlaceDistance.milesBetween(points[current], points[j]);
        if (d < bestDist) {
          bestDist = d;
          best = j;
        }
      }
      visited[best] = true;
      order.add(best);
      current = best;
    }
    return order;
  }

  static void _twoOptImprove(
    List<LatLng> points,
    List<int> order,
    bool returnToStart,
  ) {
    final n = order.length;
    if (n < 4) return;
    var improved = true;
    var guard = 0;
    while (improved && guard < 50) {
      improved = false;
      guard++;
      // Keep index 0 (start) fixed; consider reversing segments [i..k].
      for (var i = 1; i < n - 1; i++) {
        for (var k = i + 1; k < n; k++) {
          if (_reverseDelta(points, order, i, k, returnToStart) < -1e-6) {
            _reverse(order, i, k);
            improved = true;
          }
        }
      }
    }
  }

  static double _reverseDelta(
    List<LatLng> points,
    List<int> order,
    int i,
    int k,
    bool returnToStart,
  ) {
    final n = order.length;
    final a = points[order[i - 1]];
    final b = points[order[i]];
    final c = points[order[k]];
    double before = PlaceDistance.milesBetween(a, b);
    double after = PlaceDistance.milesBetween(a, c);
    if (k + 1 < n) {
      final d = points[order[k + 1]];
      before += PlaceDistance.milesBetween(c, d);
      after += PlaceDistance.milesBetween(b, d);
    } else if (returnToStart) {
      final start = points[order[0]];
      before += PlaceDistance.milesBetween(c, start);
      after += PlaceDistance.milesBetween(b, start);
    }
    return after - before;
  }

  static void _reverse(List<int> order, int i, int k) {
    while (i < k) {
      final tmp = order[i];
      order[i] = order[k];
      order[k] = tmp;
      i++;
      k--;
    }
  }

  static double _pathMiles(
    List<LatLng> points,
    List<int> order,
    bool returnToStart,
  ) {
    var total = 0.0;
    for (var i = 0; i < order.length - 1; i++) {
      total += PlaceDistance.milesBetween(points[order[i]], points[order[i + 1]]);
    }
    if (returnToStart && order.length > 1) {
      total += PlaceDistance.milesBetween(
        points[order.last],
        points[order.first],
      );
    }
    return total;
  }
}
