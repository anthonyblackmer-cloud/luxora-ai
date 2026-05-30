import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:url_launcher/url_launcher.dart';

/// Interactive Florida map — OpenStreetMap tiles (no API key). Swap to Mapbox later.
class LuxFloridaMap extends StatefulWidget {
  const LuxFloridaMap({
    super.key,
    required this.places,
    required this.hubCenter,
    this.routePlaceIds = const [],
    this.gemPlaceIds = const {},
    this.sponsoredPlaceIds = const {},
    this.radiusMiles,
    this.showOrlandoHub = true,
    this.cinematic = true,
    this.onPlaceTap,
  });

  final List<LuxPlace> places;
  final LatLng hubCenter;
  final List<String> routePlaceIds;
  final Set<String> gemPlaceIds;
  final Set<String> sponsoredPlaceIds;
  /// When set, draws a ring from the Orlando hub (discover radius).
  final double? radiusMiles;
  final bool showOrlandoHub;
  /// Animates route reveal + staggered pin drops when true.
  final bool cinematic;
  final void Function(LuxPlace place)? onPlaceTap;

  @override
  State<LuxFloridaMap> createState() => _LuxFloridaMapState();
}

class _LuxFloridaMapState extends State<LuxFloridaMap>
    with SingleTickerProviderStateMixin {
  static const _distance = Distance();

  final MapController _controller = MapController();
  late AnimationController _routeAnim;

  @override
  void initState() {
    super.initState();
    _routeAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    );
    if (widget.cinematic && widget.routePlaceIds.length >= 2) {
      _routeAnim.forward();
    } else {
      _routeAnim.value = 1;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _fitToPlaces());
  }

  @override
  void didUpdateWidget(LuxFloridaMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.places != widget.places ||
        oldWidget.radiusMiles != widget.radiusMiles ||
        oldWidget.hubCenter != widget.hubCenter) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _fitToPlaces());
    }
    if (oldWidget.routePlaceIds != widget.routePlaceIds) {
      if (widget.cinematic && widget.routePlaceIds.length >= 2) {
        _routeAnim.forward(from: 0);
      } else {
        _routeAnim.value = 1;
      }
    }
  }

  @override
  void dispose() {
    _routeAnim.dispose();
    super.dispose();
  }

  void _fitToPlaces() {
    final hub = widget.hubCenter;
    final points = <LatLng>[
      if (widget.showOrlandoHub) hub,
      ...widget.places.map((p) => LatLng(p.latitude, p.longitude)),
    ];
    if (points.isEmpty) {
      _controller.move(hub, 9);
      return;
    }
    if (points.length == 1) {
      _controller.move(points.first, 11);
      return;
    }
    _controller.fitCamera(
      CameraFit.coordinates(
        coordinates: points,
        padding: const EdgeInsets.all(48),
      ),
    );
  }

  List<LatLng> get _routePoints {
    final byId = {for (final p in widget.places) p.id: p};
    return [
      for (final id in widget.routePlaceIds)
        if (byId[id] != null)
          LatLng(byId[id]!.latitude, byId[id]!.longitude),
    ];
  }

  static List<LatLng> _partialPolyline(List<LatLng> points, double t) {
    if (points.length < 2 || t <= 0) return const [];
    if (t >= 1) return List<LatLng>.of(points);

    var totalMeters = 0.0;
    final segmentMeters = <double>[];
    for (var i = 0; i < points.length - 1; i++) {
      final d = _distance.as(
        LengthUnit.Meter,
        points[i],
        points[i + 1],
      );
      segmentMeters.add(d);
      totalMeters += d;
    }
    if (totalMeters <= 0) return List<LatLng>.of(points);

    final target = totalMeters * t;
    var acc = 0.0;
    final out = <LatLng>[points.first];
    for (var i = 0; i < segmentMeters.length; i++) {
      final seg = segmentMeters[i];
      if (acc + seg >= target) {
        final segT = (target - acc) / seg;
        final a = points[i];
        final b = points[i + 1];
        out.add(
          LatLng(
            a.latitude + (b.latitude - a.latitude) * segT,
            a.longitude + (b.longitude - a.longitude) * segT,
          ),
        );
        return out;
      }
      acc += seg;
      out.add(points[i + 1]);
    }
    return out;
  }

  double _pinReveal(int routeIndex, int routeLen, double t) {
    if (!widget.cinematic || routeLen <= 0) return 1;
    if (routeLen == 1) return t.clamp(0, 1);
    final threshold = (routeIndex + 1) / routeLen;
    return ((t - threshold + 0.12) / 0.28).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final route = _routePoints;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AnimatedBuilder(
        animation: _routeAnim,
        builder: (context, _) {
          final t = Curves.easeOutCubic.transform(_routeAnim.value);
          final drawnRoute = _partialPolyline(route, t);
          final routeLen = route.length;

          return FlutterMap(
            mapController: _controller,
            options: MapOptions(
              initialCenter: widget.hubCenter,
              initialZoom: 8.2,
              minZoom: 6,
              maxZoom: 16,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.luxora.luxora_ai',
              ),
              if (widget.radiusMiles != null && widget.radiusMiles! > 0)
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: widget.hubCenter,
                      radius: widget.radiusMiles! * 1609.344,
                      useRadiusInMeter: true,
                      color: LuxColors.gold.withValues(alpha: 0.08),
                      borderColor: LuxColors.gold.withValues(alpha: 0.45),
                      borderStrokeWidth: 2,
                    ),
                  ],
                ),
              if (drawnRoute.length >= 2) ...[
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: drawnRoute,
                      color: LuxColors.gold.withValues(alpha: 0.18),
                      strokeWidth: 10,
                    ),
                    Polyline(
                      points: drawnRoute,
                      color: LuxColors.gold.withValues(alpha: 0.35),
                      strokeWidth: 6,
                    ),
                    Polyline(
                      points: drawnRoute,
                      color: LuxColors.gold.withValues(alpha: 0.92),
                      strokeWidth: 2.5,
                    ),
                  ],
                ),
              ],
              MarkerLayer(
                markers: [
                  if (widget.showOrlandoHub)
                    Marker(
                      point: widget.hubCenter,
                      width: 52,
                      height: 52,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: LuxColors.gold.withValues(alpha: 0.9),
                              shape: BoxShape.circle,
                              border: Border.all(color: LuxColors.cream, width: 2),
                            ),
                            child: const Icon(
                              Icons.home_work_rounded,
                              size: 18,
                              color: Color(0xFF0C0A09),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            CityPackRegistry.instance.hubLabel.split(',').first,
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                              color: LuxColors.cream,
                              shadows: [
                                Shadow(color: Colors.black, blurRadius: 6),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  for (final place in widget.places)
                    Marker(
                      point: LatLng(place.latitude, place.longitude),
                      width: 44,
                      height: 44,
                      child: _PlaceMarker(
                        place: place,
                        isGem: widget.gemPlaceIds.contains(place.id),
                        isOnRoute: widget.routePlaceIds.contains(place.id),
                        isSponsored: widget.sponsoredPlaceIds.contains(place.id),
                        reveal: widget.routePlaceIds.contains(place.id)
                            ? _pinReveal(
                                widget.routePlaceIds.indexOf(place.id),
                                routeLen,
                                t,
                              )
                            : 1,
                        onTap: () => widget.onPlaceTap?.call(place),
                      ),
                    ),
                ],
              ),
              RichAttributionWidget(
                alignment: AttributionAlignment.bottomLeft,
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap',
                    onTap: () => launchUrl(
                      Uri.parse('https://www.openstreetmap.org/copyright'),
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PlaceMarker extends StatelessWidget {
  const _PlaceMarker({
    required this.place,
    required this.isGem,
    required this.isOnRoute,
    this.isSponsored = false,
    this.reveal = 1,
    this.onTap,
  });

  final LuxPlace place;
  final bool isGem;
  final bool isOnRoute;
  final bool isSponsored;
  final double reveal;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = isGem
        ? LuxColors.gold
        : isSponsored
            ? LuxColors.gold.withValues(alpha: 0.85)
            : isOnRoute
                ? LuxColors.ocean
                : LuxColors.stone300;
    final icon = isGem
        ? Icons.diamond_rounded
        : isSponsored
            ? Icons.verified_rounded
            : isOnRoute
                ? Icons.place_rounded
                : Icons.location_on_rounded;
    final eased = Curves.easeOutBack.transform(reveal.clamp(0, 1));

    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: reveal.clamp(0, 1),
        child: Transform.scale(
          scale: 0.35 + 0.65 * eased,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF0C0A09).withValues(alpha: 0.88),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: color,
                    width: isSponsored ? 2.5 : 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: (0.35 + (isSponsored ? 0.15 : 0)) * reveal),
                      blurRadius: 8 + 6 * reveal + (isSponsored ? 4 : 0),
                    ),
                  ],
                ),
                child: Icon(icon, color: color, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Default map layers for the Luxora demo trip.
List<String> defaultItineraryRouteIds() {
  final map = CityPackRegistry.instance.itineraryMomentPlaceIds;
  final keys = map.keys.toList()..sort();
  return keys.map((k) => map[k]!).toList();
}

Set<String> defaultGemPlaceIds() =>
    CityPackRegistry.instance.gemPlaceIds.values.toSet();
