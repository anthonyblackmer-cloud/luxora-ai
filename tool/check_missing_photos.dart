// ignore_for_file: avoid_print
//
// Lists Unsplash ids referenced in lib/ but missing from curated.json.
//
//   dart run tool/check_missing_photos.dart

import 'dart:convert';
import 'dart:io';

import 'verify_photo_catalog.dart';

void main() {
  final curatedPath = File('assets/unsplash/curated.json');
  final curated = (jsonDecode(curatedPath.readAsStringSync()) as List)
      .map((e) => e['id'] as String)
      .toSet();
  final referenced = collectReferencedPhotoIds();
  final missing = referenced.where((id) => !curated.contains(id)).toList()
    ..sort();

  print('Referenced photo IDs: ${referenced.length}');
  print('In curated.json: ${curated.length}');
  print('Missing (${missing.length}):');
  for (final id in missing) {
    print('  $id');
  }
}
