import 'package:flutter/material.dart';
import 'package:luxora_ai/models/map_basemap_skin.dart';

/// Map basemap URLs and attribution per [MapBasemapSkin].
abstract final class MapTileConfig {
  static const mapboxAccessToken = String.fromEnvironment('MAPBOX_ACCESS_TOKEN');

  static const cartoVoyagerUrl =
      'https://basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png';

  static const cartoLightUrl =
      'https://basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png';

  static const cartoDarkUrl =
      'https://basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png';

  static const openStreetMapUrl =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  static bool get hasMapboxToken => mapboxAccessToken.isNotEmpty;

  static const int tileDimension = 256;

  static const double zoomOffset = 0;

  static const double minZoom = 3;

  static const double maxZoom = 18;

  static const int maxNativeZoom = 20;

  static String mapboxStreetsUrl() =>
      'https://api.mapbox.com/styles/v1/mapbox/streets-v12/tiles/256/{z}/{x}/{y}?access_token=$mapboxAccessToken';

  static String mapboxOutdoorsUrl() =>
      'https://api.mapbox.com/styles/v1/mapbox/outdoors-v12/tiles/256/{z}/{x}/{y}?access_token=$mapboxAccessToken';

  static String urlTemplateFor(MapBasemapSkin skin) => switch (skin) {
        MapBasemapSkin.voyager => cartoVoyagerUrl,
        MapBasemapSkin.openStreetMap => openStreetMapUrl,
        MapBasemapSkin.cartoLight => cartoLightUrl,
        MapBasemapSkin.cartoDark => cartoDarkUrl,
        MapBasemapSkin.mapboxStreets => mapboxStreetsUrl(),
        MapBasemapSkin.mapboxOutdoors => mapboxOutdoorsUrl(),
      };

  static const String fallbackUrlTemplate = openStreetMapUrl;

  static Color tileBackgroundColorFor(MapBasemapSkin skin) => switch (skin) {
        MapBasemapSkin.voyager => const Color(0xFFE8ECE6),
        MapBasemapSkin.openStreetMap => const Color(0xFFF2EFE9),
        MapBasemapSkin.cartoLight => const Color(0xFFF5F5F5),
        MapBasemapSkin.cartoDark => const Color(0xFF1A1A1A),
        MapBasemapSkin.mapboxStreets => const Color(0xFFE8EDF4),
        MapBasemapSkin.mapboxOutdoors => const Color(0xFFE6EDE8),
      };

  static String attributionLabelFor(MapBasemapSkin skin) => switch (skin) {
        MapBasemapSkin.voyager ||
        MapBasemapSkin.cartoLight ||
        MapBasemapSkin.cartoDark =>
          '© CARTO © OpenStreetMap',
        MapBasemapSkin.openStreetMap => '© OpenStreetMap',
        MapBasemapSkin.mapboxStreets ||
        MapBasemapSkin.mapboxOutdoors =>
          '© Mapbox © OpenStreetMap',
      };

  static String attributionUrlFor(MapBasemapSkin skin) => switch (skin) {
        MapBasemapSkin.voyager ||
        MapBasemapSkin.cartoLight ||
        MapBasemapSkin.cartoDark =>
          'https://carto.com/attributions',
        MapBasemapSkin.openStreetMap => 'https://www.openstreetmap.org/copyright',
        MapBasemapSkin.mapboxStreets ||
        MapBasemapSkin.mapboxOutdoors =>
          'https://www.mapbox.com/about/maps/',
      };

  /// Default skin when no user preference is loaded.
  static MapBasemapSkin get defaultSkin => MapBasemapSkin.voyager;
}
