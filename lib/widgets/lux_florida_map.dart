import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/data/curated_places_catalog.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:url_launcher/url_launcher.dart';

/// Interactive Florida map — OpenStreetMap tiles (no API key). Swap to Mapbox later.
class LuxFloridaMap extends StatefulWidget {
  const LuxFloridaMap({
    super.key,
    required this.places,
    this.routePlaceIds = const [],
    this.gemPlaceIds = const {},
    this.onPlaceTap,
  });

  final List<LuxPlace> places;
  final List<String> routePlaceIds;
  final Set<String> gemPlaceIds;
  final void Function(LuxPlace place)? onPlaceTap;

  @override
  State<LuxFloridaMap> createState() => _LuxFloridaMapState();
}

class _LuxFloridaMapState extends State<LuxFloridaMap> {
  static const _orlando = LatLng(28.5383, -81.3792);

  final MapController _controller = MapController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fitToPlaces());
  }

  @override
  void didUpdateWidget(LuxFloridaMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.places != widget.places) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _fitToPlaces());
    }
  }

  void _fitToPlaces() {
    final points = widget.places
        .map((p) => LatLng(p.latitude, p.longitude))
        .toList();
    if (points.isEmpty) {
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

  @override
  Widget build(BuildContext context) {
    final route = _routePoints;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: FlutterMap(
        mapController: _controller,
        options: const MapOptions(
          initialCenter: _orlando,
          initialZoom: 8.2,
          minZoom: 6,
          maxZoom: 16,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.luxora.luxora_ai',
          ),
          if (route.length >= 2)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: route,
                  color: LuxColors.gold.withValues(alpha: 0.85),
                  strokeWidth: 3,
                ),
              ],
            ),
          MarkerLayer(
            markers: [
              for (final place in widget.places)
                Marker(
                  point: LatLng(place.latitude, place.longitude),
                  width: 44,
                  height: 44,
                  child: _PlaceMarker(
                    place: place,
                    isGem: widget.gemPlaceIds.contains(place.id),
                    isOnRoute: widget.routePlaceIds.contains(place.id),
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
      ),
    );
  }
}

class _PlaceMarker extends StatelessWidget {
  const _PlaceMarker({
    required this.place,
    required this.isGem,
    required this.isOnRoute,
    this.onTap,
  });

  final LuxPlace place;
  final bool isGem;
  final bool isOnRoute;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = isGem
        ? LuxColors.gold
        : isOnRoute
            ? LuxColors.ocean
            : LuxColors.stone300;
    final icon = isGem
        ? Icons.diamond_rounded
        : isOnRoute
            ? Icons.place_rounded
            : Icons.location_on_rounded;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF0C0A09).withValues(alpha: 0.88),
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.35),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Icon(icon, color: color, size: 20),
          ),
        ],
      ),
    );
  }
}

/// Default map layers for the Luxora demo trip.
List<String> defaultItineraryRouteIds() {
  final keys = kItineraryMomentPlaceIds.keys.toList()..sort();
  return keys.map((k) => kItineraryMomentPlaceIds[k]!).toList();
}

Set<String> defaultGemPlaceIds() => kGemPlaceIds.values.toSet();
