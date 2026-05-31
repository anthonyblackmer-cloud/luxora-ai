import 'package:flutter/material.dart';
import 'package:luxora_ai/services/map_tile_config.dart';

/// Basemap tile style for [LuxFloridaMap] and fullscreen map.
enum MapBasemapSkin {
  voyager,
  openStreetMap,
  cartoLight,
  cartoDark,
  mapboxStreets,
  mapboxOutdoors,
}

extension MapBasemapSkinCatalog on MapBasemapSkin {
  static const MapBasemapSkin defaultSkin = MapBasemapSkin.voyager;

  static List<MapBasemapSkin> selectable({required bool hasMapboxToken}) {
    return [
      MapBasemapSkin.voyager,
      MapBasemapSkin.openStreetMap,
      MapBasemapSkin.cartoLight,
      MapBasemapSkin.cartoDark,
      if (hasMapboxToken) ...[
        MapBasemapSkin.mapboxStreets,
        MapBasemapSkin.mapboxOutdoors,
      ],
    ];
  }

  static MapBasemapSkin fromStored(String? raw, {required bool hasMapboxToken}) {
    if (raw == null) return defaultSkin;
    for (final skin in MapBasemapSkin.values) {
      if (skin.name != raw) continue;
      if (!hasMapboxToken && skin.requiresMapboxToken) return defaultSkin;
      return skin;
    }
    return defaultSkin;
  }

  bool get requiresMapboxToken =>
      this == MapBasemapSkin.mapboxStreets ||
      this == MapBasemapSkin.mapboxOutdoors;

  /// Swatch colors for the settings preview card (land, water, accent).
  (Color land, Color water, Color accent) get previewColors => switch (this) {
        MapBasemapSkin.voyager => (
            const Color(0xFFE8ECE6),
            const Color(0xFF9ECAE1),
            const Color(0xFF88C479),
          ),
        MapBasemapSkin.openStreetMap => (
            const Color(0xFFF2EFE9),
            const Color(0xFF9DB9E8),
            const Color(0xFFEBC08D),
          ),
        MapBasemapSkin.cartoLight => (
            const Color(0xFFF5F5F5),
            const Color(0xFFCFE8F3),
            const Color(0xFFE0E0E0),
          ),
        MapBasemapSkin.cartoDark => (
            const Color(0xFF1A1A1A),
            const Color(0xFF2C4C7E),
            const Color(0xFF4A4A4A),
          ),
        MapBasemapSkin.mapboxStreets => (
            const Color(0xFFE8EDF4),
            const Color(0xFF7EB6D4),
            const Color(0xFFF5B041),
          ),
        MapBasemapSkin.mapboxOutdoors => (
            const Color(0xFFE6EDE8),
            const Color(0xFF6BAED6),
            const Color(0xFF74A657),
          ),
      };

  String urlTemplate() => MapTileConfig.urlTemplateFor(this);

  String fallbackUrlTemplate() => MapTileConfig.fallbackUrlTemplate;

  Color tileBackgroundColor() => MapTileConfig.tileBackgroundColorFor(this);

  String attributionLabel() => MapTileConfig.attributionLabelFor(this);

  String attributionUrl() => MapTileConfig.attributionUrlFor(this);
}
