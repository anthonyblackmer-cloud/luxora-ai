import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/map_basemap_skin.dart';
import 'package:luxora_ai/models/map_mood_layer.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/map_tile_config.dart';
import 'package:luxora_ai/state/luxora_app_state.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:url_launcher/url_launcher.dart';

/// Interactive map — selectable basemap skin + Luxora pins/routes.
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
    this.cinematic = false,
    this.mapMoodLayer = MapMoodLayer.all,
    this.clipBorderRadius = 16,
    this.onPlaceTap,
    this.onExpandTap,
  });

  final List<LuxPlace> places;
  final LatLng hubCenter;
  final List<String> routePlaceIds;
  final Set<String> gemPlaceIds;
  final Set<String> sponsoredPlaceIds;
  final double? radiusMiles;
  final bool showOrlandoHub;
  final bool cinematic;
  final MapMoodLayer mapMoodLayer;
  final double clipBorderRadius;
  final void Function(LuxPlace place)? onPlaceTap;
  final VoidCallback? onExpandTap;

  @override
  State<LuxFloridaMap> createState() => _LuxFloridaMapState();
}

class _LuxFloridaMapState extends State<LuxFloridaMap>
    with SingleTickerProviderStateMixin {
  static const _distance = Distance();
  static const _mapKey = ValueKey<String>('lux_florida_map_core');

  final MapController _controller = MapController();
  AnimationController? _routeAnim;
  bool _fitDone = false;

  @override
  void initState() {
    super.initState();
    if (widget.cinematic && widget.routePlaceIds.length >= 2) {
      _routeAnim = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2600),
      )..addListener(() {
          if (mounted) setState(() {});
        });
      _routeAnim!.forward();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _fitToPlacesOnce());
  }

  @override
  void didUpdateWidget(LuxFloridaMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    final placesChanged = oldWidget.places != widget.places ||
        oldWidget.hubCenter != widget.hubCenter ||
        oldWidget.showOrlandoHub != widget.showOrlandoHub;
    if (placesChanged) {
      _fitDone = false;
      WidgetsBinding.instance.addPostFrameCallback((_) => _fitToPlacesOnce());
    }
    if (oldWidget.routePlaceIds != widget.routePlaceIds &&
        widget.cinematic &&
        widget.routePlaceIds.length >= 2) {
      _routeAnim ??= AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2600),
      )..addListener(() {
          if (mounted) setState(() {});
        });
      _routeAnim!.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _routeAnim?.dispose();
    super.dispose();
  }

  void _fitToPlacesOnce() {
    if (_fitDone) return;
    _fitDone = true;

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
        maxZoom: MapTileConfig.maxZoom,
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

  double get _routeAnimT {
    if (!widget.cinematic || _routeAnim == null) return 1;
    return Curves.easeOutCubic.transform(_routeAnim!.value);
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
    final t = _routeAnimT;
    final drawnRoute = _partialPolyline(route, t);
    final routeLen = route.length;
    final tokens = luxThemeTokensOf(context);
    final routeColor = _routeColorForLayer(widget.mapMoodLayer, tokens);
    final mapSkin = LuxoraAppState.of(context).mapBasemapSkin;
    final tileBackground = mapSkin.tileBackgroundColor();

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.clipBorderRadius),
      child: ColoredBox(
        color: tileBackground,
        child: Stack(
          children: [
            Positioned.fill(
              child: FlutterMap(
                key: _mapKey,
                mapController: _controller,
                options: MapOptions(
                  initialCenter: widget.hubCenter,
                  initialZoom: 8.2,
                  minZoom: MapTileConfig.minZoom,
                  maxZoom: MapTileConfig.maxZoom,
                  backgroundColor: tileBackground,
                  interactionOptions: const InteractionOptions(
                    flags: InteractiveFlag.all,
                  ),
                ),
                children: [
                  TileLayer(
                    key: ValueKey(mapSkin),
                    urlTemplate: mapSkin.urlTemplate(),
                    fallbackUrl: mapSkin.fallbackUrlTemplate(),
                    tileDimension: MapTileConfig.tileDimension,
                    zoomOffset: MapTileConfig.zoomOffset,
                    minZoom: MapTileConfig.minZoom,
                    maxZoom: MapTileConfig.maxZoom,
                    maxNativeZoom: MapTileConfig.maxNativeZoom,
                    userAgentPackageName: 'com.luxora.luxora_ai',
                    keepBuffer: 4,
                    panBuffer: 2,
                    retinaMode: false,
                    tileDisplay: const TileDisplay.instantaneous(),
                  ),
                  if (widget.radiusMiles != null && widget.radiusMiles! > 0)
                    CircleLayer(
                      circles: [
                        CircleMarker(
                          point: widget.hubCenter,
                          radius: widget.radiusMiles! * 1609.344,
                          useRadiusInMeter: true,
                          color: routeColor.withValues(alpha: 0.08),
                          borderColor: routeColor.withValues(alpha: 0.45),
                          borderStrokeWidth: 2,
                        ),
                      ],
                    ),
                  if (drawnRoute.length >= 2)
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: drawnRoute,
                          color: routeColor.withValues(alpha: 0.16),
                          strokeWidth: 12,
                        ),
                        Polyline(
                          points: drawnRoute,
                          color: routeColor.withValues(alpha: 0.34),
                          strokeWidth: 7,
                        ),
                        Polyline(
                          points: drawnRoute,
                          color: routeColor.withValues(alpha: 0.95),
                          strokeWidth: 2.8,
                        ),
                      ],
                    ),
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
                                  color: routeColor.withValues(alpha: 0.92),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: tokens.isLight
                                        ? tokens.bg
                                        : tokens.textPrimary,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: routeColor.withValues(alpha: 0.45),
                                      blurRadius: 14,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.home_work_rounded,
                                  size: 18,
                                  color: tokens.onAccent,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                CityPackRegistry.instance.hubLabel
                                    .split(',')
                                    .first,
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w800,
                                  color: tokens.textPrimary,
                                  shadows: [
                                    Shadow(
                                      color: tokens.isLight
                                          ? tokens.bg.withValues(alpha: 0.85)
                                          : Colors.black,
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      for (final place in widget.places)
                        Marker(
                          point: LatLng(place.latitude, place.longitude),
                          width: 48,
                          height: 48,
                          child: _PlaceMarker(
                            place: place,
                            isGem: widget.gemPlaceIds.contains(place.id),
                            isOnRoute:
                                widget.routePlaceIds.contains(place.id),
                            isSponsored:
                                widget.sponsoredPlaceIds.contains(place.id),
                            mapMoodLayer: widget.mapMoodLayer,
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
                        mapSkin.attributionLabel(),
                        onTap: () => launchUrl(
                          Uri.parse(mapSkin.attributionUrl()),
                          mode: LaunchMode.externalApplication,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (widget.onExpandTap != null)
              Positioned(
                top: 10,
                right: 10,
                child: Tooltip(
                  message: context.l10n.mapExpandMap,
                  child: Material(
                    color: tokens.isLight
                        ? tokens.bg.withValues(alpha: 0.92)
                        : const Color(0xFF1C1917).withValues(alpha: 0.88),
                    elevation: 2,
                    shadowColor: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: widget.onExpandTap,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.fullscreen_rounded,
                          size: 22,
                          color: tokens.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static Color _routeColorForLayer(MapMoodLayer layer, LuxThemeTokens tokens) =>
      switch (layer) {
        MapMoodLayer.night => const Color(0xFFA78BFA),
        MapMoodLayer.dateNight => const Color(0xFFF472B6),
        MapMoodLayer.weather => LuxColors.ocean,
        MapMoodLayer.gems => const Color(0xFFC4B5A0),
        MapMoodLayer.all => tokens.accent,
      };
}

class _PlaceMarker extends StatelessWidget {
  const _PlaceMarker({
    required this.place,
    required this.isGem,
    required this.isOnRoute,
    this.isSponsored = false,
    this.mapMoodLayer = MapMoodLayer.all,
    this.reveal = 1,
    this.onTap,
  });

  final LuxPlace place;
  final bool isGem;
  final bool isOnRoute;
  final bool isSponsored;
  final MapMoodLayer mapMoodLayer;
  final double reveal;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    final color = _pinColor(tokens);
    final icon = isGem
        ? Icons.diamond_rounded
        : isSponsored
            ? Icons.verified_rounded
            : isOnRoute
                ? Icons.place_rounded
                : _layerIcon();
    final eased = Curves.easeOutBack.transform(reveal.clamp(0, 1));
    final glowStrength =
        (0.35 + (isSponsored ? 0.2 : 0) + (isGem ? 0.25 : 0)) * reveal;

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
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: glowStrength),
                      blurRadius: 14 + (isGem ? 8 : 0),
                      spreadRadius: isGem ? 2 : 0,
                    ),
                    if (mapMoodLayer != MapMoodLayer.all)
                      BoxShadow(
                        color: color.withValues(alpha: 0.22 * reveal),
                        blurRadius: 22,
                        spreadRadius: 4,
                      ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: tokens.isLight
                        ? tokens.bg.withValues(alpha: 0.92)
                        : const Color(0xFF0C0A09).withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: color,
                      width: isSponsored || isGem ? 2.5 : 2,
                    ),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _pinColor(LuxThemeTokens tokens) {
    if (isGem) return const Color(0xFFC4B5A0);
    if (isSponsored) return tokens.accent;
    if (isOnRoute) return LuxColors.ocean;
    return switch (mapMoodLayer) {
      MapMoodLayer.night => const Color(0xFFA78BFA),
      MapMoodLayer.dateNight => const Color(0xFFF472B6),
      MapMoodLayer.weather => LuxColors.ocean,
      MapMoodLayer.gems => const Color(0xFFC4B5A0),
      MapMoodLayer.all => tokens.textMuted,
    };
  }

  IconData _layerIcon() => switch (mapMoodLayer) {
        MapMoodLayer.night => Icons.nightlife_rounded,
        MapMoodLayer.dateNight => Icons.favorite_rounded,
        MapMoodLayer.weather => Icons.wb_sunny_rounded,
        MapMoodLayer.gems => Icons.diamond_outlined,
        MapMoodLayer.all => Icons.location_on_rounded,
      };
}

/// Default map layers for the Luxora demo trip.
List<String> defaultItineraryRouteIds() {
  final map = CityPackRegistry.instance.itineraryMomentPlaceIds;
  final keys = map.keys.toList()..sort();
  return keys.map((k) => map[k]!).toList();
}

Set<String> defaultGemPlaceIds() =>
    CityPackRegistry.instance.gemPlaceIds.values.toSet();
