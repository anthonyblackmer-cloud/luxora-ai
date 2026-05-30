import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/rainviewer_service.dart';
import 'package:luxora_ai/services/weather_grid_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/weather_radar_labels.dart';
import 'package:luxora_ai/widgets/lux_background.dart';
import 'package:luxora_ai/widgets/lux_secondary_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

enum WeatherMapOverlay { precip, temperature, wind, cloudCover }

/// Opens the weather map in a full-screen route (above sheets/modals).
Future<void> showWeatherMapFullscreen(
  BuildContext context, {
  required LatLng center,
  required WeatherMapOverlay initialOverlay,
}) {
  return Navigator.of(context, rootNavigator: true).push<void>(
    MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (ctx) => _WeatherMapFullscreenPage(
        center: center,
        initialOverlay: initialOverlay,
      ),
    ),
  );
}

/// Interactive radar + regional weather overlays for the concierge sheet.
class WeatherMapPanel extends StatefulWidget {
  const WeatherMapPanel({
    super.key,
    required this.center,
    required this.initialOverlay,
    this.expandable = true,
    this.mapHeight = 220,
    this.interactive = true,
  });

  final LatLng center;
  final WeatherMapOverlay initialOverlay;

  /// When true, tapping the preview opens [showWeatherMapFullscreen].
  final bool expandable;

  /// Fixed preview height; pass `null` inside a bounded [Column] for full-screen.
  final double? mapHeight;

  /// Pan/zoom on the map; disabled on compact previews when [expandable] is true.
  final bool interactive;

  @override
  State<WeatherMapPanel> createState() => _WeatherMapPanelState();
}

class _WeatherMapPanelState extends State<WeatherMapPanel> {
  final MapController _mapController = MapController();

  List<RainViewerFrame> _radarFrames = const [];
  int _radarIndex = 0;
  bool _radarLoading = true;
  bool _playing = true;
  int _playIntervalMs = 650;
  Timer? _playTimer;

  List<WeatherGridCell> _gridCells = const [];
  bool _gridLoading = true;

  late WeatherMapOverlay _overlay;

  @override
  void initState() {
    super.initState();
    _overlay = widget.initialOverlay;
    _loadRadar();
    _loadGrid();
  }

  @override
  void didUpdateWidget(WeatherMapPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.center != widget.center) {
      _loadRadar(force: true);
      _loadGrid();
    }
  }

  @override
  void dispose() {
    _playTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadRadar({bool force = false}) async {
    setState(() => _radarLoading = true);
    final frames =
        await RainViewerService.instance.loadFrames(forceRefresh: force);
    if (!mounted) return;
    setState(() {
      _radarFrames = frames;
      _radarIndex = frames.isEmpty ? 0 : frames.length - 1;
      _radarLoading = false;
    });
    _restartAnimation();
  }

  Future<void> _loadGrid() async {
    setState(() => _gridLoading = true);
    final cells = await WeatherGridService.instance.fetchRegionalGrid(
      widget.center.latitude,
      widget.center.longitude,
    );
    if (!mounted) return;
    setState(() {
      _gridCells = cells;
      _gridLoading = false;
    });
  }

  void _restartAnimation() {
    _playTimer?.cancel();
    if (!_playing || _radarFrames.length < 2 || !_showsRadar) return;
    _playTimer = Timer.periodic(Duration(milliseconds: _playIntervalMs), (_) {
      if (!mounted || _radarFrames.isEmpty) return;
      setState(() {
        _radarIndex = (_radarIndex + 1) % _radarFrames.length;
      });
    });
  }

  bool get _showsRadar =>
      _overlay == WeatherMapOverlay.precip && _radarFrames.isNotEmpty;

  RainViewerFrame? get _activeRadarFrame => _radarFrames.isEmpty
      ? null
      : _radarFrames[_radarIndex.clamp(0, _radarFrames.length - 1)];

  void _setOverlay(WeatherMapOverlay overlay) {
    setState(() => _overlay = overlay);
    _restartAnimation();
  }

  void _togglePlay() {
    setState(() => _playing = !_playing);
    _restartAnimation();
  }

  void _stepRadar(int delta) {
    if (_radarFrames.isEmpty) return;
    setState(() {
      _playing = false;
      _radarIndex = (_radarIndex + delta).clamp(0, _radarFrames.length - 1);
    });
    _restartAnimation();
  }

  void _setPlayInterval(int milliseconds) {
    setState(() => _playIntervalMs = milliseconds);
    _restartAnimation();
  }

  void _jumpToOffset(Duration offsetFromNow) {
    if (_radarFrames.isEmpty) return;
    setState(() {
      _playing = false;
      _radarIndex = closestRadarFrameIndex(_radarFrames, offsetFromNow);
    });
    _restartAnimation();
  }

  void _openFullscreen() {
    showWeatherMapFullscreen(
      context,
      center: widget.center,
      initialOverlay: _overlay,
    );
  }

  bool get _mapInteractive => widget.interactive && !widget.expandable;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final locale = Localizations.localeOf(context);
    final useF = locale.languageCode == 'en';
    final loading = _overlay == WeatherMapOverlay.precip
        ? _radarLoading
        : _gridLoading;

    final mapStack = Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: widget.center,
            initialZoom: 8.4,
            minZoom: 6,
            maxZoom: 12,
            interactionOptions: InteractionOptions(
              flags: _mapInteractive
                  ? InteractiveFlag.all & ~InteractiveFlag.rotate
                  : InteractiveFlag.none,
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.luxora.luxora_ai',
            ),
            if (_showsRadar && _activeRadarFrame != null)
              TileLayer(
                urlTemplate: RainViewerService.instance
                    .tileUrlTemplate(_activeRadarFrame!.path),
                maxNativeZoom: 7,
                maxZoom: 12,
                tileDisplay: const TileDisplay.instantaneous(opacity: 0.72),
              ),
            if (_overlay == WeatherMapOverlay.temperature) _temperatureLayer(),
            if (_overlay == WeatherMapOverlay.cloudCover) _cloudLayer(),
            if (_overlay == WeatherMapOverlay.wind) _windLayer(),
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
                if (_showsRadar)
                  TextSourceAttribution(
                    'RainViewer',
                    onTap: () => launchUrl(
                      Uri.parse('https://www.rainviewer.com/'),
                      mode: LaunchMode.externalApplication,
                    ),
                  ),
                if (_overlay != WeatherMapOverlay.precip)
                  const TextSourceAttribution('Open-Meteo'),
              ],
            ),
          ],
        ),
        if (loading)
          ColoredBox(
            color: tokens.bg.withValues(alpha: 0.45),
            child: Center(
              child: CircularProgressIndicator(
                color: tokens.accent,
                strokeWidth: 2,
              ),
            ),
          ),
        if (widget.expandable)
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _openFullscreen,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: tokens.bg.withValues(alpha: 0.82),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.fullscreen_rounded,
                              size: 16,
                              color: tokens.textPrimary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              l.weatherRadarTapToExpand,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: tokens.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (_showsRadar && _radarFrames.length > 1)
          Positioned(
            top: 8,
            right: 8,
            child: Material(
              color: tokens.bg.withValues(alpha: 0.82),
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: _togglePlay,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _playing
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        size: 16,
                        color: tokens.textPrimary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _playing ? l.weatherRadarPause : l.weatherRadarPlay,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: tokens.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );

    final mapFrame = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: widget.mapHeight == null
          ? mapStack
          : SizedBox(height: widget.mapHeight, child: mapStack),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.mapHeight == null) Expanded(child: mapFrame) else mapFrame,
        const SizedBox(height: 10),
        Material(
          color: Colors.transparent,
          child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _OverlayChip(
              label: l.weatherOverlayPrecip,
              icon: Icons.water_drop_outlined,
              selected: _overlay == WeatherMapOverlay.precip,
              onTap: () => _setOverlay(WeatherMapOverlay.precip),
            ),
            _OverlayChip(
              label: l.weatherOverlayTemp,
              icon: Icons.thermostat_outlined,
              selected: _overlay == WeatherMapOverlay.temperature,
              onTap: () => _setOverlay(WeatherMapOverlay.temperature),
            ),
            _OverlayChip(
              label: l.weatherOverlayWind,
              icon: Icons.air_rounded,
              selected: _overlay == WeatherMapOverlay.wind,
              onTap: () => _setOverlay(WeatherMapOverlay.wind),
            ),
            _OverlayChip(
              label: l.weatherOverlayCloud,
              icon: Icons.cloud_queue_rounded,
              selected: _overlay == WeatherMapOverlay.cloudCover,
              onTap: () => _setOverlay(WeatherMapOverlay.cloudCover),
            ),
          ],
          ),
        ),
        if (_overlay == WeatherMapOverlay.temperature && _gridCells.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _LegendBar(
              startLabel: useF ? '55°F' : '13°C',
              endLabel: useF ? '95°F' : '35°C',
              startColor: const Color(0xFF38BDF8),
              endColor: const Color(0xFFEF4444),
            ),
          ),
        if (_showsRadar && _radarFrames.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: _RadarTimelineControls(
              frameLabel: weatherRadarFrameLabel(l, _activeRadarFrame!),
              frameIndex: _radarIndex,
              frameCount: _radarFrames.length,
              playing: _playing,
              playIntervalMs: _playIntervalMs,
              hasForecast: _radarFrames.any((f) => f.isForecast),
              onScrub: (index) {
                setState(() {
                  _radarIndex = index;
                  _playing = false;
                });
                _restartAnimation();
              },
              onTogglePlay: _togglePlay,
              onStepBack: () => _stepRadar(-1),
              onStepForward: () => _stepRadar(1),
              onSpeed: _setPlayInterval,
              onJumpNow: () => _jumpToOffset(Duration.zero),
              onJumpBack1h: () => _jumpToOffset(const Duration(hours: -1)),
              onJumpBack2h: () => _jumpToOffset(const Duration(hours: -2)),
              onJumpAhead30m: () => _jumpToOffset(const Duration(minutes: 30)),
              loopNote: l.weatherRadarLoopNote,
            ),
          ),
      ],
    );
  }

  PolygonLayer _temperatureLayer() {
    final temps =
        _gridCells.map((c) => c.temperatureF).whereType<double>().toList();
    if (temps.isEmpty) return PolygonLayer(polygons: const []);

    final minF = temps.reduce(math.min);
    final maxF = temps.reduce(math.max);

    return PolygonLayer(
      polygons: [
        for (final cell in _gridCells)
          if (cell.temperatureF != null)
            Polygon(
              points: _cellRing(cell),
              color: _temperatureColor(cell.temperatureF!, minF, maxF)
                  .withValues(alpha: 0.62),
              borderColor: Colors.transparent,
            ),
      ],
    );
  }

  PolygonLayer _cloudLayer() {
    return PolygonLayer(
      polygons: [
        for (final cell in _gridCells)
          if (cell.cloudCover != null)
            Polygon(
              points: _cellRing(cell),
              color: Color.fromRGBO(
                148,
                163,
                184,
                (cell.cloudCover! / 100.0 * 0.55).clamp(0.08, 0.55),
              ),
              borderColor: Colors.transparent,
            ),
      ],
    );
  }

  MarkerLayer _windLayer() {
    final tokens = luxThemeTokensOf(context);
    return MarkerLayer(
      markers: [
        for (final cell in _gridCells)
          if (cell.windSpeedMph != null && cell.windDirectionDeg != null)
            Marker(
              point: LatLng(cell.latitude, cell.longitude),
              width: 36,
              height: 36,
              child: Transform.rotate(
                angle: (cell.windDirectionDeg! + 180) * math.pi / 180,
                child: Icon(
                  Icons.navigation_rounded,
                  size: 14 + (cell.windSpeedMph!.clamp(0, 24) / 24 * 10),
                  color: tokens.accent.withValues(alpha: 0.9),
                ),
              ),
            ),
      ],
    );
  }

  List<LatLng> _cellRing(WeatherGridCell cell) {
    final h = cell.halfSpanDegrees;
    return [
      LatLng(cell.latitude - h, cell.longitude - h),
      LatLng(cell.latitude - h, cell.longitude + h),
      LatLng(cell.latitude + h, cell.longitude + h),
      LatLng(cell.latitude + h, cell.longitude - h),
    ];
  }

  Color _temperatureColor(double tempF, double minF, double maxF) {
    final span = math.max(1, maxF - minF);
    final t = ((tempF - minF) / span).clamp(0.0, 1.0);
    return Color.lerp(const Color(0xFF38BDF8), const Color(0xFFEF4444), t)!;
  }
}

class _WeatherMapFullscreenPage extends StatelessWidget {
  const _WeatherMapFullscreenPage({
    required this.center,
    required this.initialOverlay,
  });

  final LatLng center;
  final WeatherMapOverlay initialOverlay;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return LuxBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: LuxSecondaryAppBar(title: l.weatherLiveRadar),
        body: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: WeatherMapPanel(
              center: center,
              initialOverlay: initialOverlay,
              expandable: false,
              mapHeight: null,
              interactive: true,
            ),
          ),
        ),
      ),
    );
  }
}

class _OverlayChip extends StatelessWidget {
  const _OverlayChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    return FilterChip(
      label: Text(label),
      avatar: Icon(
        icon,
        size: 16,
        color: selected ? tokens.onAccent : tokens.textMuted,
      ),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: tokens.accent,
      checkmarkColor: tokens.onAccent,
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: selected ? tokens.onAccent : tokens.textPrimary,
      ),
      backgroundColor: tokens.panelFill,
      side: BorderSide(
        color: selected ? tokens.accent : tokens.borderSubtle,
      ),
      showCheckmark: false,
    );
  }
}

class _RadarTimelineControls extends StatelessWidget {
  const _RadarTimelineControls({
    required this.frameLabel,
    required this.frameIndex,
    required this.frameCount,
    required this.playing,
    required this.playIntervalMs,
    required this.hasForecast,
    required this.onScrub,
    required this.onTogglePlay,
    required this.onStepBack,
    required this.onStepForward,
    required this.onSpeed,
    required this.onJumpNow,
    required this.onJumpBack1h,
    required this.onJumpBack2h,
    required this.onJumpAhead30m,
    required this.loopNote,
  });

  final String frameLabel;
  final int frameIndex;
  final int frameCount;
  final bool playing;
  final int playIntervalMs;
  final bool hasForecast;
  final ValueChanged<int> onScrub;
  final VoidCallback onTogglePlay;
  final VoidCallback onStepBack;
  final VoidCallback onStepForward;
  final ValueChanged<int> onSpeed;
  final VoidCallback onJumpNow;
  final VoidCallback onJumpBack1h;
  final VoidCallback onJumpBack2h;
  final VoidCallback onJumpAhead30m;
  final String loopNote;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          frameLabel,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: tokens.textPrimary,
          ),
        ),
        Slider(
          value: frameIndex.toDouble(),
          min: 0,
          max: (frameCount - 1).toDouble(),
          onChanged: (v) => onScrub(v.round()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              tooltip: l.weatherRadarStepBack,
              onPressed: onStepBack,
              icon: const Icon(Icons.skip_previous_rounded),
            ),
            IconButton(
              tooltip: playing ? l.weatherRadarPause : l.weatherRadarPlay,
              onPressed: onTogglePlay,
              icon: Icon(
                playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
              ),
            ),
            IconButton(
              tooltip: l.weatherRadarStepForward,
              onPressed: onStepForward,
              icon: const Icon(Icons.skip_next_rounded),
            ),
          ],
        ),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          alignment: WrapAlignment.center,
          children: [
            _JumpChip(label: l.weatherRadarJump2h, onTap: onJumpBack2h),
            _JumpChip(label: l.weatherRadarJump1h, onTap: onJumpBack1h),
            _JumpChip(label: l.weatherRadarJumpNow, onTap: onJumpNow),
            if (hasForecast)
              _JumpChip(label: l.weatherRadarJump30m, onTap: onJumpAhead30m),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          alignment: WrapAlignment.center,
          children: [
            _SpeedChip(
              label: l.weatherRadarSpeedSlow,
              selected: playIntervalMs >= 950,
              onTap: () => onSpeed(1000),
            ),
            _SpeedChip(
              label: l.weatherRadarSpeedNormal,
              selected: playIntervalMs > 450 && playIntervalMs < 950,
              onTap: () => onSpeed(650),
            ),
            _SpeedChip(
              label: l.weatherRadarSpeedFast,
              selected: playIntervalMs <= 450,
              onTap: () => onSpeed(350),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          loopNote,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            height: 1.35,
            color: tokens.textMuted,
          ),
        ),
      ],
    );
  }
}

class _JumpChip extends StatelessWidget {
  const _JumpChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    return ActionChip(
      label: Text(label, style: const TextStyle(fontSize: 11)),
      onPressed: onTap,
      backgroundColor: tokens.panelFill,
      side: BorderSide(color: tokens.borderSubtle),
    );
  }
}

class _SpeedChip extends StatelessWidget {
  const _SpeedChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    return FilterChip(
      label: Text(label, style: const TextStyle(fontSize: 11)),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: tokens.accent.withValues(alpha: 0.25),
      checkmarkColor: tokens.accent,
      backgroundColor: tokens.panelFill,
      side: BorderSide(
        color: selected ? tokens.accent : tokens.borderSubtle,
      ),
    );
  }
}

class _LegendBar extends StatelessWidget {
  const _LegendBar({
    required this.startLabel,
    required this.endLabel,
    required this.startColor,
    required this.endColor,
  });

  final String startLabel;
  final String endLabel;
  final Color startColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    return Row(
      children: [
        Text(
          startLabel,
          style: TextStyle(fontSize: 10, color: tokens.textMuted),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(colors: [startColor, endColor]),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          endLabel,
          style: TextStyle(fontSize: 10, color: tokens.textMuted),
        ),
      ],
    );
  }
}
