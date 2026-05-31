import 'package:luxora_ai/models/lux_place.dart';

/// Contextual local-only tips — hard to Google, keyed by place slug/id.
abstract final class LocalSecretsRegistry {
  static const _bySlug = <String, String>{
    'winter-park-park-avenue': 'localSecretWinterParkParkAvenue',
    'world-food-trucks': 'localSecretWorldFoodTrucks',
    'wekiwa-springs-state-park': 'localSecretWekiwaSprings',
    'disney-springs': 'localSecretDisneySpringsParking',
    'lake-eola-park': 'localSecretLakeEolaSunset',
    'wynwood-walls': 'localSecretMiamiWynwoodAlley',
    'calle-ocho-little-havana': 'localSecretMiamiLittleHavanaDomino',
    'vizcaya-museum-gardens': 'localSecretMiamiVizcayaMangrove',
    'ocean-drive-south-beach': 'localSecretMiamiOceanDriveSunrise',
    'tampa-riverwalk': 'localSecretTampaBayRiverwalkParking',
    'clearwater-beach': 'localSecretTampaBayClearwaterSunset',
    'salvador-dali-museum': 'localSecretTampaBayDaliGarden',
    'st-pete-pier': 'localSecretTampaBayPierTiming',
    'ybor-city-historic': 'localSecretTampaBayYborCourtyard',
    'bellagio-fountains': 'localSecretVegasBellagioFountains',
    'fremont-street': 'localSecretVegasFremontTiming',
    'times-square': 'localSecretNycTimesSquareStrategy',
    'empire-state': 'localSecretNycObservationDeck',
    'central-park': 'localSecretNycCentralParkEntrance',
    'brooklyn-bridge': 'localSecretNycBrooklynBridgePhoto',
  };

  static const _byId = <String, String>{
    'place-miami-panther-coffee': 'localSecretMiamiPantherAlley',
    'place-tarpon-sponge-docks': 'localSecretTampaBaySpongeDocks',
    'place-bellagio-fountains': 'localSecretVegasBellagioFountains',
    'place-fremont-street': 'localSecretVegasFremontTiming',
    'place-caesars-palace': 'localSecretVegasCaesarsEntrance',
    'place-the-venetian': 'localSecretVegasVenetianWalk',
    'place-times-square': 'localSecretNycTimesSquareStrategy',
    'place-empire-state': 'localSecretNycObservationDeck',
    'place-central-park': 'localSecretNycCentralParkEntrance',
    'place-broadway-district': 'localSecretNycBroadwayTickets',
    'place-brooklyn-bridge': 'localSecretNycBrooklynBridgePhoto',
    'place-staten-island-ferry': 'localSecretNycFerryGoldenHour',
  };

  /// ARB key for the secret copy, or null when none curated yet.
  static String? l10nKeyFor(LuxPlace place) =>
      _bySlug[place.slug] ?? _byId[place.id];
}
