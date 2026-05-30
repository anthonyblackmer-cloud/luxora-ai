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
  };

  static const _byId = <String, String>{
    'place-miami-panther-coffee': 'localSecretMiamiPantherAlley',
  };

  /// ARB key for the secret copy, or null when none curated yet.
  static String? l10nKeyFor(LuxPlace place) =>
      _bySlug[place.slug] ?? _byId[place.id];
}
