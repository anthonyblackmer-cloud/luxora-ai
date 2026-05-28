// ignore_for_file: avoid_print
//
// Regenerates assets/unsplash/curated.json from the Unsplash API (search → photo).
//
//   dart run tool/sync_unsplash_curated.dart
//   dart run tool/sync_unsplash_curated.dart --only cover-family-springs
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

  final idByPlace = <String, String>{};
  final onlyPlace = _argValue(args, '--only');
  final searches = onlyPlace != null
      ? {
          if (unsplashPlaceSearchQueries.containsKey(onlyPlace))
            onlyPlace: unsplashPlaceSearchQueries[onlyPlace]!,
        }
      : unsplashPlaceSearchQueries;

  if (searches.isEmpty) {
    stderr.writeln('No places to sync. Use --only place-id');
    exit(2);
  }

  final outFile = File('assets/unsplash/curated.json');
  await outFile.parent.create(recursive: true);
  final photos = onlyPlace != null
      ? await _loadCurated(outFile)
      : <Map<String, dynamic>>[];

  for (final entry in searches.entries) {
    final placeKey = entry.key;
    final query = entry.value;
    final photoId = await _searchPhotoId(query, headers);
    if (photoId == null) {
      stderr.writeln('No results for $placeKey ($query)');
      exit(2);
    }

    final photo = await _fetchPhoto(photoId, headers);
    if (photo == null) {
      stderr.writeln('Failed to load photo $photoId for $placeKey');
      exit(3);
    }

    final photoEntry = {...photo, 'placeKey': placeKey};
    idByPlace[placeKey] = photoId;
    stdout.writeln('OK $placeKey → $photoId (${photo['photographerName']})');

    final index = photos.indexWhere((p) => p['placeKey'] == placeKey);
    if (index >= 0) {
      photos[index] = photoEntry;
    } else {
      photos.add(photoEntry);
    }
  }

  await outFile.writeAsString('${JsonEncoder.withIndent('  ').convert(photos)}\n');

  final mapFile = File('tool/generated_unsplash_place_ids.json');
  final allIds = await _loadPlaceIdMap(mapFile);
  allIds.addAll(idByPlace);
  await mapFile.writeAsString('${JsonEncoder.withIndent('  ').convert(allIds)}\n');

  await _patchCatalogPhotoIds(idByPlace);

  stdout.writeln('Wrote ${outFile.path} (${photos.length} photos)');
  stdout.writeln('Wrote ${mapFile.path}');
  stdout.writeln('Patched lib/data/curated_places_catalog.dart');
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

/// Updates `unsplashPhotoId` for each place id in the catalog Dart file.
Future<void> _patchCatalogPhotoIds(Map<String, String> idByPlace) async {
  final catalogFile = File('lib/data/curated_places_catalog.dart');
  var content = await catalogFile.readAsString();

  for (final entry in idByPlace.entries) {
    final placeId = entry.key;
    final photoId = entry.value;
    final pattern = RegExp(
      "(id: '$placeId',[\\s\\S]*?unsplashPhotoId: ')[^']+(')",
    );
    if (!pattern.hasMatch(content)) {
      stderr.writeln('Catalog patch miss: $placeId');
      exit(4);
    }
    content = content.replaceFirstMapped(
      pattern,
      (m) => '${m.group(1)}$photoId${m.group(2)}',
    );
  }

  await catalogFile.writeAsString(content);
}

Future<String?> _searchPhotoId(String query, Map<String, String> headers) async {
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
