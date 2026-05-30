// ignore_for_file: avoid_print
//
// Regenerates assets/unsplash/curated.json from the Unsplash API (search → photo).
//
//   dart run tool/sync_unsplash_curated.dart
//   dart run tool/sync_unsplash_curated.dart --only place-lake-eola
//   dart run tool/sync_unsplash_curated.dart --keys
//   dart run tool/sync_unsplash_curated.dart --backfill
//   dart run tool/sync_unsplash_curated.dart --hotels
//
// Reads key from config/unsplash.local.json

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'unsplash_access_key.dart';
import 'unsplash_place_searches.dart';

String? _argValue(List<String> args, String flag) {
  final i = args.indexOf(flag);
  if (i < 0 || i + 1 >= args.length) {
    return null;
  }
  return args[i + 1];
}

Future<void> main(List<String> args) async {
  final key = readUnsplashAccessKey(args);
  if (key == null || key.isEmpty) {
    stderr.writeln(unsplashKeyHelpMessage());
    exit(1);
  }

  final headers = {
    'Authorization': 'Client-ID $key',
    'Accept-Version': 'v1',
  };

  final onlyPlace = _argValue(args, '--only');
  final keysOnly = args.contains('--keys');
  final hotelsOnly = args.contains('--hotels');
  final backfill = args.contains('--backfill');

  if (backfill) {
    await _backfillReferencedPhotoIds(headers);
    return;
  }

  final Map<String, String> searches;
  if (onlyPlace != null) {
    searches = {
      if (unsplashPlaceSearchQueries.containsKey(onlyPlace))
        onlyPlace: unsplashPlaceSearchQueries[onlyPlace]!,
      if (unsplashFloridaKeysAllQueries.containsKey(onlyPlace))
        onlyPlace: unsplashFloridaKeysAllQueries[onlyPlace]!,
      if (unsplashHotelAllQueries.containsKey(onlyPlace))
        onlyPlace: unsplashHotelAllQueries[onlyPlace]!,
    };
  } else if (keysOnly) {
    searches = unsplashFloridaKeysAllQueries;
  } else if (hotelsOnly) {
    searches = unsplashHotelAllQueries;
  } else {
    searches = {
      ...unsplashPlaceSearchQueries,
      ...unsplashFloridaKeysAllQueries,
    };
  }

  if (searches.isEmpty) {
    stderr.writeln('No places to sync. Use --only place-id or --keys');
    exit(2);
  }

  final outFile = File('assets/unsplash/curated.json');
  await outFile.parent.create(recursive: true);
  final photos = await _loadCurated(outFile);

  final idByPlace = <String, String>{};
  var skipped = 0;
  for (final entry in searches.entries) {
    final placeKey = entry.key;
    final query = entry.value;
    final photoId = await _searchPhotoId(query, headers);
    if (photoId == null) {
      stderr.writeln('SKIP $placeKey — no results ($query)');
      skipped++;
      continue;
    }

    final photo = await _fetchPhoto(photoId, headers);
    if (photo == null) {
      stderr.writeln('SKIP $placeKey — failed to load $photoId');
      skipped++;
      continue;
    }

    final photoEntry = {...photo, 'placeKey': placeKey};
    idByPlace[placeKey] = photoId;
    stdout.writeln('OK $placeKey → $photoId (${photo['photographerName']})');
    _upsertPhoto(photos, photoEntry);
  }

  await outFile.writeAsString('${JsonEncoder.withIndent('  ').convert(photos)}\n');

  final mapFile = File('tool/generated_unsplash_place_ids.json');
  final allIds = await _loadPlaceIdMap(mapFile);
  allIds.addAll(idByPlace);
  await mapFile.writeAsString('${JsonEncoder.withIndent('  ').convert(allIds)}\n');

  await _patchCatalogPhotoIds(idByPlace);
  await _patchHotelCatalogPhotoIds(idByPlace);
  if (onlyPlace == null || keysOnly) {
    await _patchFloridaKeysPhotoPool(idByPlace);
  }

  stdout.writeln('Wrote ${outFile.path} (${photos.length} photos)');
  stdout.writeln('Wrote ${mapFile.path}');
  stdout.writeln('Patched curated catalog Dart files');
  if (skipped > 0) {
    stderr.writeln('Skipped $skipped target(s) — adjust query in unsplash_place_searches.dart');
  }
  if (idByPlace.isEmpty) {
    exit(2);
  }
}

void _upsertPhoto(List<Map<String, dynamic>> photos, Map<String, dynamic> entry) {
  final id = entry['id'] as String;
  final byId = photos.indexWhere((p) => p['id'] == id);
  if (byId >= 0) {
    photos[byId] = entry;
    return;
  }
  final placeKey = entry['placeKey'] as String?;
  if (placeKey != null && placeKey.isNotEmpty) {
    final byKey = photos.indexWhere((p) => p['placeKey'] == placeKey);
    if (byKey >= 0) {
      photos[byKey] = entry;
      return;
    }
  }
  photos.add(entry);
}

Future<List<Map<String, dynamic>>> _loadCurated(File outFile) async {
  if (!outFile.existsSync()) {
    return [];
  }
  final decoded = jsonDecode(await outFile.readAsString()) as List<dynamic>;
  return decoded.map((e) => Map<String, dynamic>.from(e as Map)).toList();
}

Future<Map<String, String>> _loadPlaceIdMap(File mapFile) async {
  if (!mapFile.existsSync()) {
    return {};
  }
  final decoded = jsonDecode(await mapFile.readAsString()) as Map<String, dynamic>;
  return decoded.map((k, v) => MapEntry(k, v as String));
}

/// Updates `unsplashPhotoId` for each place id across curated catalog Dart files.
Future<void> _patchCatalogPhotoIds(Map<String, String> idByPlace) async {
  const catalogFiles = [
    'lib/data/curated_places_catalog.dart',
    'lib/data/curated_places_attractions.dart',
    'lib/data/curated_places_major_attractions.dart',
    'lib/data/curated_places_dining.dart',
    'lib/data/curated_places_lodging.dart',
    'lib/data/florida_keys/florida_keys_curated_places.dart',
  ];

  for (final path in catalogFiles) {
    final file = File(path);
    if (!file.existsSync()) continue;

    var content = await file.readAsString();
    var patched = 0;

    for (final entry in idByPlace.entries) {
      final placeId = entry.key;
      final photoId = entry.value;

      if (placeId.startsWith('pool-keys-')) continue;
      if (!content.contains("id: '$placeId'")) {
        continue;
      }

      final literalPattern = RegExp(
        "(id: '$placeId',[\\s\\S]*?unsplashPhotoId: ')[^']+(')",
      );
      if (literalPattern.hasMatch(content)) {
        content = content.replaceFirstMapped(
          literalPattern,
          (m) => '${m.group(1)}$photoId${m.group(2)}',
        );
        patched++;
        continue;
      }

      final constPattern = RegExp(
        "(id: '$placeId',[\\s\\S]*?unsplashPhotoId: )_Photo\\.\\w+",
      );
      if (constPattern.hasMatch(content)) {
        content = content.replaceFirstMapped(
          constPattern,
          (m) => "${m.group(1)}'$photoId'",
        );
        patched++;
        continue;
      }

      stderr.writeln('Catalog patch miss in $path: $placeId');
    }

    if (patched > 0) {
      await file.writeAsString(content);
      stdout.writeln('Patched $path ($patched places)');
    }
  }
}

Future<void> _patchHotelCatalogPhotoIds(Map<String, String> idByPlace) async {
  const hotelCatalogFiles = [
    'lib/data/hotels_catalog.dart',
    'lib/data/miami/miami_hotels_catalog.dart',
  ];

  for (final path in hotelCatalogFiles) {
    final file = File(path);
    if (!file.existsSync()) continue;

    var content = await file.readAsString();
    var patched = 0;

    for (final entry in idByPlace.entries) {
      final placeId = entry.key;
      final photoId = entry.value;
      if (!content.contains("placeId: '$placeId'")) continue;

      final pattern = RegExp(
        "(placeId: '$placeId',[\\s\\S]*?unsplashPhotoId: ')[^']+(')",
      );
      if (!pattern.hasMatch(content)) {
        stderr.writeln('Hotel catalog patch miss in $path: $placeId');
        continue;
      }
      content = content.replaceFirstMapped(
        pattern,
        (m) => '${m.group(1)}$photoId${m.group(2)}',
      );
      patched++;
    }

    if (patched > 0) {
      await file.writeAsString(content);
      stdout.writeln('Patched $path ($patched hotels)');
    }
  }
}

Future<void> _patchFloridaKeysPhotoPool(Map<String, String> idByPlace) async {
  final poolIds = <String>[];
  for (final key in unsplashKeysPhotoPoolOrder) {
    final id = idByPlace[key] ??
        idByPlace['place-keys-robbies-marina'] ??
        (poolIds.isNotEmpty ? poolIds.last : null);
    if (id == null) {
      stderr.writeln('Photo pool missing slot $key — skipped pool patch');
      return;
    }
    poolIds.add(id);
  }

  const oldPhotos = [
    'AK2vwEobto4',
    'X_LNSoZ7xeM',
    'eQ2ElhooTjc',
    'sWK9wki5zHU',
    'JZYQ_P94T-Q',
    'xEaAoizNFV8',
    'RibghBxKlKc',
    'p0vZplFhKYI',
    'M4RVCkMpb1I',
    'z78FxiNCA5w',
  ];

  final oldToNew = <String, String>{};
  for (var i = 0; i < oldPhotos.length; i++) {
    oldToNew[oldPhotos[i]] = poolIds[i];
  }

  const poolFiles = [
    'lib/data/florida_keys/florida_keys_content.dart',
    'lib/data/florida_keys/florida_keys_hotels_catalog.dart',
    'lib/data/florida_keys/florida_keys_gem_discoveries.dart',
  ];

  for (final path in poolFiles) {
    final file = File(path);
    if (!file.existsSync()) continue;
    var content = await file.readAsString();
    for (final entry in oldToNew.entries) {
      content = content.replaceAll(entry.key, entry.value);
    }
    await file.writeAsString(content);
  }

  await _rewritePhotoPoolConst(
    'lib/data/florida_keys/florida_keys_content.dart',
    poolIds,
  );
  await _rewritePhotoPoolConst(
    'lib/data/florida_keys/florida_keys_hotels_catalog.dart',
    poolIds.take(8).toList(),
  );

  stdout.writeln('Patched Florida Keys photo pool (${poolIds.length} ids)');
}

Future<void> _rewritePhotoPoolConst(String path, List<String> ids) async {
  final file = File(path);
  var content = await file.readAsString();
  final lines = ids.map((id) => "    '$id',").join('\n');
  final pattern = RegExp(
    r'static const _photos = \[\s*[\s\S]*?\];',
  );
  if (!pattern.hasMatch(content)) {
    stderr.writeln('Pool const not found in $path');
    return;
  }
  content = content.replaceFirst(
    pattern,
    'static const _photos = [\n$lines\n  ];',
  );
  await file.writeAsString(content);
}

Future<String?> _searchPhotoId(String query, Map<String, String> headers) async {
  await Future<void>.delayed(const Duration(milliseconds: 1200));
  final uri = Uri.parse(
    'https://api.unsplash.com/search/photos?query=${Uri.encodeQueryComponent(query)}&per_page=1&orientation=landscape',
  );
  final response = await http.get(uri, headers: headers);
  if (response.statusCode != 200) {
    stderr.writeln('Search failed: ${response.statusCode} ${response.body}');
    return null;
  }
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  final results = json['results'] as List<dynamic>?;
  if (results == null || results.isEmpty) {
    return null;
  }
  return (results.first as Map<String, dynamic>)['id'] as String?;
}

Future<void> _backfillReferencedPhotoIds(Map<String, String> headers) async {
  final outFile = File('assets/unsplash/curated.json');
  await outFile.parent.create(recursive: true);
  final photos = await _loadCurated(outFile);
  final curatedIds = photos.map((p) => p['id'] as String).toSet();
  final missing = _referencedPhotoIds().where((id) => !curatedIds.contains(id)).toList()
    ..sort();

  if (missing.isEmpty) {
    stdout.writeln('All referenced photo ids are already in ${outFile.path}');
    return;
  }

  var added = 0;
  for (final photoId in missing) {
    final photo = await _fetchPhoto(photoId, headers);
    if (photo == null) {
      stderr.writeln('SKIP backfill $photoId — Unsplash GET failed');
      continue;
    }
    _upsertPhoto(photos, photo);
    stdout.writeln('OK backfill $photoId (${photo['photographerName']})');
    added++;
    await Future<void>.delayed(const Duration(milliseconds: 1200));
  }

  await outFile.writeAsString('${JsonEncoder.withIndent('  ').convert(photos)}\n');
  stdout.writeln('Wrote ${outFile.path} (${photos.length} photos, +$added backfilled)');
  if (added == 0) {
    exit(2);
  }
}

Set<String> _referencedPhotoIds() {
  final dir = Directory('lib/data');
  final ids = <String>{};
  for (final f in dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))) {
    final content = f.readAsStringSync();
    final consts = <String, String>{};
    for (final m
        in RegExp(r"static const (\w+) = '([^']+)';").allMatches(content)) {
      consts[m.group(1)!] = m.group(2)!;
    }
    for (final m in RegExp(r"unsplashPhotoId: '([^']+)'").allMatches(content)) {
      ids.add(m.group(1)!);
    }
    for (final m
        in RegExp(r'unsplashPhotoId: _Photo\.(\w+)').allMatches(content)) {
      final c = consts[m.group(1)];
      if (c != null) ids.add(c);
    }
    for (final m in RegExp(r"heroUnsplashId: '([^']+)'").allMatches(content)) {
      ids.add(m.group(1)!);
    }
    for (final m
        in RegExp(r"luxuryHeroUnsplashId: '([^']+)'").allMatches(content)) {
      ids.add(m.group(1)!);
    }
  }
  return ids;
}

Future<Map<String, dynamic>?> _fetchPhoto(
  String photoId,
  Map<String, String> headers,
) async {
  final uri = Uri.parse('https://api.unsplash.com/photos/$photoId');
  final response = await http.get(uri, headers: headers);
  if (response.statusCode != 200) {
    stderr.writeln('GET /photos/$photoId: ${response.statusCode}');
    return null;
  }
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  final urls = json['urls'] as Map<String, dynamic>;
  final links = json['links'] as Map<String, dynamic>;
  final user = json['user'] as Map<String, dynamic>;
  final userLinks = user['links'] as Map<String, dynamic>;

  return {
    'id': json['id'],
    'hotlinkUrl': urls['regular'] ?? urls['full'],
    'photographerName': user['name'],
    'photographerProfileUrl': userLinks['html'],
    'unsplashPhotoPageUrl': links['html'],
    'downloadLocation': links['download_location'],
  };
}
