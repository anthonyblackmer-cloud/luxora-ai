import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:luxora_ai/models/city_pack/city_pack.dart';
import 'package:luxora_ai/models/city_pack/state_pack.dart';

/// Loads and exports City Pack JSON bundles.
abstract final class CityPackLoader {
  static CityPack parseCityPack(String jsonString) {
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
    return CityPack.fromJson(decoded);
  }

  static StatePack parseStatePack(String jsonString) {
    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
    return StatePack.fromJson(decoded);
  }

  static Future<CityPack> loadCityPackAsset(String assetPath) async {
    final raw = await rootBundle.loadString(assetPath);
    return parseCityPack(raw);
  }

  static String exportCityPack(CityPack pack) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(pack.toJson());
  }

  static String exportStatePack(StatePack pack) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(pack.toJson());
  }
}
