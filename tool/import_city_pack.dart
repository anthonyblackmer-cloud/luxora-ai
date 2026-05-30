import 'dart:convert';
import 'dart:io';

/// Import a City Pack JSON file into `assets/city_packs/`.
///
/// ```text
/// dart run tool/import_city_pack.dart path/to/city_pack_miami.json
/// ```
void main(List<String> args) {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run tool/import_city_pack.dart <source.json>');
    exit(1);
  }

  final source = File(args.first);
  if (!source.existsSync()) {
    stderr.writeln('File not found: ${source.path}');
    exit(1);
  }

  final decoded = jsonDecode(source.readAsStringSync());
  if (decoded is! Map<String, dynamic>) {
    stderr.writeln('JSON root must be an object');
    exit(1);
  }

  final cityId = decoded['cityId']?.toString();
  if (cityId == null || cityId.isEmpty) {
    stderr.writeln('Missing cityId in pack');
    exit(1);
  }

  final destDir = Directory('assets/city_packs');
  if (!destDir.existsSync()) {
    destDir.createSync(recursive: true);
  }

  final destPath = 'assets/city_packs/city_pack_$cityId.json';
  const encoder = JsonEncoder.withIndent('  ');
  File(destPath).writeAsStringSync('${encoder.convert(decoded)}\n');
  stdout.writeln('Imported $destPath from ${source.path}');
}
