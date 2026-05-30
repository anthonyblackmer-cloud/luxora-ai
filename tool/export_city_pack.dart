import 'dart:convert';
import 'dart:io';

/// Pretty-print and validate City Pack JSON bundles (no Flutter runtime).
///
/// ```text
/// dart run tool/export_city_pack.dart orlando
/// dart run tool/export_city_pack.dart --all
/// ```
void main(List<String> args) {
  if (args.contains('--all')) {
    const cities = ['orlando', 'miami', 'nyc', 'vegas', 'paris'];
    for (final city in cities) {
      _exportCity(city);
    }
    return;
  }

  final cityId = args.isNotEmpty ? args.first.trim().toLowerCase() : 'orlando';
  _exportCity(cityId);
}

void _exportCity(String cityId) {
  final path = 'assets/city_packs/city_pack_$cityId.json';
  final file = File(path);
  if (!file.existsSync()) {
    stderr.writeln('Missing $path');
    exit(1);
  }

  final decoded = jsonDecode(file.readAsStringSync());
  if (decoded is! Map<String, dynamic>) {
    stderr.writeln('$path must be a JSON object');
    exit(1);
  }

  _validatePack(decoded, path);

  const encoder = JsonEncoder.withIndent('  ');
  file.writeAsStringSync('${encoder.convert(decoded)}\n');

  final districts = (decoded['districts'] as List?)?.length ?? 0;
  final experiences = (decoded['experiences'] as List?)?.length ?? 0;
  stdout.writeln('Wrote $path ($districts districts, $experiences experiences)');
}

void _validatePack(Map<String, dynamic> json, String path) {
  for (final key in ['cityId', 'cityName', 'stateId', 'mapCenterLat', 'mapCenterLng']) {
    if (!json.containsKey(key)) {
      stderr.writeln('$path: missing required field "$key"');
      exit(1);
    }
  }
}
