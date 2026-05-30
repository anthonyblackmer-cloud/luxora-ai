import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/rainviewer_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Compact RainViewer Doppler preview for weather share cards.
class ShareWeatherRadarPreview extends StatefulWidget {
  const ShareWeatherRadarPreview({
    super.key,
    required this.latitude,
    required this.longitude,
    this.height = 168,
    this.showCaption = true,
  });

  final double latitude;
  final double longitude;
  final double height;
  final bool showCaption;

  @override
  State<ShareWeatherRadarPreview> createState() =>
      _ShareWeatherRadarPreviewState();
}

class _ShareWeatherRadarPreviewState extends State<ShareWeatherRadarPreview> {
  List<RainViewerFrame> _frames = const [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final frames = await RainViewerService.instance.loadFrames();
    if (!mounted) return;
    setState(() {
      _frames = frames;
      _loading = false;
    });
  }

  RainViewerFrame? get _latestFrame => _frames.isEmpty ? null : _frames.last;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final center = LatLng(widget.latitude, widget.longitude);
    final frame = _latestFrame;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: widget.height,
            child: Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: center,
                    initialZoom: 8.4,
                    minZoom: 6,
                    maxZoom: 12,
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.none,
                    ),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.luxora.luxora_ai',
                    ),
                    if (frame != null)
                      TileLayer(
                        urlTemplate: RainViewerService.instance
                            .tileUrlTemplate(frame.path),
                        maxNativeZoom: 7,
                        maxZoom: 12,
                        tileDisplay:
                            const TileDisplay.instantaneous(opacity: 0.72),
                      ),
                  ],
                ),
                if (_loading)
                  ColoredBox(
                    color: LuxColors.gemSurface.withValues(alpha: 0.85),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: LuxColors.gold,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                if (!_loading && frame == null)
                  ColoredBox(
                    color: LuxColors.gemSurface.withValues(alpha: 0.85),
                    child: Center(
                      child: Text(
                        l.weatherRadarComingSoon,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 11,
                          color: LuxColors.stone400,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (widget.showCaption) ...[
          const SizedBox(height: 4),
          Text(
            l.shareRadarPreviewCaption,
            style: TextStyle(
              fontSize: 10,
              color: LuxColors.stone500.withValues(alpha: 0.95),
            ),
          ),
        ],
      ],
    );
  }
}
