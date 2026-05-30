// ignore_for_file: avoid_print
//
// CI guard: every Unsplash id referenced in lib/ must exist in curated.json.
//
//   dart run tool/verify_photo_catalog.dart

import 'dart:convert';
import 'dart:io';

Set<String> collectReferencedPhotoIds() {
  final dir = Directory('lib');
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
    for (final m
        in RegExp(r"static const _photos = \[([\s\S]*?)\];").allMatches(content)) {
      for (final id in RegExp(r"'([^']+)'").allMatches(m.group(1)!)) {
        ids.add(id.group(1)!);
      }
    }
  }

  return ids;
}

void main() {
  final curatedPath = File('assets/unsplash/curated.json');
  if (!curatedPath.existsSync()) {
    stderr.writeln('Missing ${curatedPath.path}');
    exit(1);
  }

  final curated = (jsonDecode(curatedPath.readAsStringSync()) as List)
      .map((e) => e['id'] as String)
      .toSet();
  final referenced = collectReferencedPhotoIds();
  final missing = referenced.where((id) => !curated.contains(id)).toList()
    ..sort();

  if (missing.isNotEmpty) {
    stderr.writeln(
      'Photo catalog integrity failed: ${missing.length} id(s) missing from curated.json',
    );
    for (final id in missing) {
      stderr.writeln('  $id');
    }
    stderr.writeln('Run: dart run tool/sync_unsplash_curated.dart --backfill');
    exit(1);
  }

  stdout.writeln(
    'Photo catalog OK — ${referenced.length} referenced ids in curated.json (${curated.length} entries)',
  );
}
