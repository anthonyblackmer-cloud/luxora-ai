import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/map_mood_layer.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Mood layer toggles above the Luxora map.
class MapMoodLayerSelector extends StatelessWidget {
  const MapMoodLayerSelector({
    super.key,
    required this.selected,
    required this.onSelected,
    this.itinerarySelected = false,
    this.onItinerarySelected,
  });

  final MapMoodLayer selected;
  final ValueChanged<MapMoodLayer> onSelected;
  final bool itinerarySelected;
  final ValueChanged<bool>? onItinerarySelected;

  String _label(BuildContext context, MapMoodLayer layer) {
    final l = context.l10n;
    return switch (layer) {
      MapMoodLayer.all => l.mapLayerAll,
      MapMoodLayer.gems => l.mapLayerGems,
      MapMoodLayer.night => l.mapLayerNight,
      MapMoodLayer.dateNight => l.mapLayerDateNight,
      MapMoodLayer.weather => l.mapLayerWeather,
    };
  }

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);
    final l = context.l10n;
    final secondaryLayers = MapMoodLayer.values
        .where((layer) => layer != MapMoodLayer.all)
        .toList(growable: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.mapLayersTitle,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.8,
            color: tokens.accent.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildLayerChip(context, tokens, MapMoodLayer.all),
              if (onItinerarySelected != null) ...[
                const SizedBox(width: 8),
                FilterChip(
                  selected: itinerarySelected,
                  showCheckmark: false,
                  avatar: Icon(
                    Icons.route_rounded,
                    size: 16,
                    color: itinerarySelected
                        ? tokens.onAccent
                        : LuxColors.gold.withValues(alpha: 0.9),
                  ),
                  label: Text(
                    l.mapLayerItinerary,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: itinerarySelected
                          ? tokens.onAccent
                          : tokens.textPrimary,
                    ),
                  ),
                  selectedColor: LuxColors.gold.withValues(alpha: 0.88),
                  backgroundColor: tokens.panelFill,
                  side: BorderSide(
                    color: itinerarySelected
                        ? LuxColors.gold.withValues(alpha: 0.6)
                        : tokens.borderSubtle,
                  ),
                  onSelected: (selected) =>
                      onItinerarySelected?.call(selected),
                ),
              ],
              for (final layer in secondaryLayers) ...[
                const SizedBox(width: 8),
                _buildLayerChip(context, tokens, layer),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLayerChip(
    BuildContext context,
    LuxThemeTokens tokens,
    MapMoodLayer layer,
  ) {
    final isSelected = !itinerarySelected && selected == layer;
    final color = _layerColor(layer);
    return FilterChip(
      selected: isSelected,
      showCheckmark: false,
      avatar: Icon(
        layer.icon,
        size: 16,
        color: isSelected ? tokens.onAccent : color.withValues(alpha: 0.9),
      ),
      label: Text(
        _label(context, layer),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: isSelected ? tokens.onAccent : tokens.textPrimary,
        ),
      ),
      selectedColor: color.withValues(alpha: 0.88),
      backgroundColor: tokens.panelFill,
      side: BorderSide(
        color: isSelected
            ? color.withValues(alpha: 0.6)
            : tokens.borderSubtle,
      ),
      onSelected: (_) => onSelected(layer),
    );
  }

  static Color _layerColor(MapMoodLayer layer) => switch (layer) {
        MapMoodLayer.all => LuxColors.gold,
        MapMoodLayer.gems => const Color(0xFFC4B5A0),
        MapMoodLayer.night => const Color(0xFFA78BFA),
        MapMoodLayer.dateNight => const Color(0xFFF472B6),
        MapMoodLayer.weather => const Color(0xFF38BDF8),
      };
}
