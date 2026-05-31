import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_place.dart';
import 'package:luxora_ai/models/map_mood_layer.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_florida_map.dart';

/// Full-screen map viewer — same pins/route as the embedded map card.
class LuxMapFullscreenPage extends StatelessWidget {
  const LuxMapFullscreenPage({
    super.key,
    required this.hubCenter,
    required this.places,
    required this.routePlaceIds,
    required this.gemPlaceIds,
    required this.sponsoredPlaceIds,
    required this.radiusMiles,
    required this.mapMoodLayer,
    required this.showOrlandoHub,
    this.onPlaceTap,
  });

  final LatLng hubCenter;
  final List<LuxPlace> places;
  final List<String> routePlaceIds;
  final Set<String> gemPlaceIds;
  final Set<String> sponsoredPlaceIds;
  final double? radiusMiles;
  final MapMoodLayer mapMoodLayer;
  final bool showOrlandoHub;
  final void Function(LuxPlace place)? onPlaceTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);

    return Scaffold(
      backgroundColor: tokens.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
              child: Row(
                children: [
                  IconButton(
                    tooltip: l.mapCloseFullscreen,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                  ),
                  Expanded(
                    child: Text(
                      l.mapFullscreenTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: LuxFloridaMap(
                  hubCenter: hubCenter,
                  places: places,
                  routePlaceIds: routePlaceIds,
                  gemPlaceIds: gemPlaceIds,
                  sponsoredPlaceIds: sponsoredPlaceIds,
                  radiusMiles: radiusMiles,
                  mapMoodLayer: mapMoodLayer,
                  showOrlandoHub: showOrlandoHub,
                  clipBorderRadius: 12,
                  onPlaceTap: onPlaceTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
