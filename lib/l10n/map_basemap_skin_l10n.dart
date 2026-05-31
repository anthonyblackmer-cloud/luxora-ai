import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/models/map_basemap_skin.dart';

extension MapBasemapSkinL10n on AppLocalizations {
  String mapSkinLabel(MapBasemapSkin skin) => switch (skin) {
        MapBasemapSkin.voyager => mapSkinVoyager,
        MapBasemapSkin.openStreetMap => mapSkinOsm,
        MapBasemapSkin.cartoLight => mapSkinCartoLight,
        MapBasemapSkin.cartoDark => mapSkinCartoDark,
        MapBasemapSkin.mapboxStreets => mapSkinMapboxStreets,
        MapBasemapSkin.mapboxOutdoors => mapSkinMapboxOutdoors,
      };

  String mapSkinMood(MapBasemapSkin skin) => switch (skin) {
        MapBasemapSkin.voyager => mapSkinVoyagerMood,
        MapBasemapSkin.openStreetMap => mapSkinOsmMood,
        MapBasemapSkin.cartoLight => mapSkinCartoLightMood,
        MapBasemapSkin.cartoDark => mapSkinCartoDarkMood,
        MapBasemapSkin.mapboxStreets => mapSkinMapboxStreetsMood,
        MapBasemapSkin.mapboxOutdoors => mapSkinMapboxOutdoorsMood,
      };
}
