// Offline research assistant for city-pack "must-do moment" catalogs.
//
// Scans curated place seeds per city pack, compares against any existing
// experience_moments.dart catalog, optionally queries Wikipedia for hints,
// and writes JSON + optional Dart drafts for editorial review.
//
// Run from repo root:
//
//   dart run tool/research_city_experience_moments.dart orlando
//   dart run tool/research_city_experience_moments.dart miami --wiki
//   dart run tool/research_city_experience_moments.dart --all
//   dart run tool/research_city_experience_moments.dart vegas --write-draft
//
// Outputs:
//   tool/generated/experience_moments/{cityId}_research.json
//   tool/generated/experience_moments/{cityId}_draft.dart   (--write-draft)
//
// After approving a draft:
//   1. Move to lib/data/{folder}/{folder}_experience_moments.dart
//   2. Register in lib/data/experience_moments_registry.dart
//   3. Run flutter test test/orlando_experience_moment_test.dart (and city tests)
import 'dart:convert';
import 'dart:io';

import 'experience_moments_research_lib.dart';

Future<void> main(List<String> args) async {
  if (!File('pubspec.yaml').existsSync()) {
    stderr.writeln('Run from luxora_ai repo root.');
    exit(1);
  }

  final writeDraft = args.contains('--write-draft');
  final useWiki = args.contains('--wiki');
  final runAll = args.contains('--all');
  final cityArgs = args.where((a) => !a.startsWith('--')).toList();

  final packs = discoverPacksFromAssets();
  final selected = <CityResearchPack>[];
  if (runAll) {
    selected.addAll(packs);
  } else {
    final ids = cityArgs.isEmpty ? ['orlando'] : cityArgs;
    for (final id in ids) {
      final pack = packForCity(id);
      if (pack == null) {
        stderr.writeln('Unknown city pack "$id" — skipping.');
        continue;
      }
      selected.add(pack);
    }
  }

  if (selected.isEmpty) {
    stderr.writeln('No city packs selected.');
    exit(1);
  }

  final outDir = Directory('tool/generated/experience_moments');
  outDir.createSync(recursive: true);

  for (final pack in selected) {
    await _researchCity(
      pack: pack,
      outDir: outDir,
      writeDraft: writeDraft,
      useWiki: useWiki,
    );
  }
}

Future<void> _researchCity({
  required CityResearchPack pack,
  required Directory outDir,
  required bool writeDraft,
  required bool useWiki,
}) async {
  final cityName = _cityNameFromJson(pack.cityId) ?? pack.classPrefix;
  final places = scanPlaces(pack);
  final catalogPath = pack.momentsCatalogPath ??
      'lib/data/${pack.dartFolder}/${pack.dartFolder}_experience_moments.dart';
  final existing = parseExistingMoments(catalogPath);

  Map<String, String> wikiHints = const {};
  if (useWiki) {
    stdout.writeln('${pack.cityId}: querying Wikipedia (max 12 flagship seeds)...');
    wikiHints = await fetchWikipediaHints(cityName: cityName, places: places);
  }

  final candidates = buildCandidates(
    pack: pack,
    places: places,
    existing: existing,
    cityName: cityName,
    wikiNotesByPlaceId: wikiHints,
  );

  final report = buildResearchReport(
    pack: pack,
    cityName: cityName,
    places: places,
    existing: existing,
    candidates: candidates,
  );

  final jsonPath = '${outDir.path}/${pack.cityId}_research.json';
  File(jsonPath).writeAsStringSync(
    '${const JsonEncoder.withIndent('  ').convert(report)}\n',
  );

  final newCount = report['newCandidateCount'];
  final gapCount = (report['gapPlaceIds'] as List).length;
  stdout.writeln(
    '${pack.cityId}: ${places.length} place seeds, '
    '${existing.length} existing moments, '
    '$newCount new drafts, $gapCount gaps without catalog coverage.',
  );
  stdout.writeln('  → $jsonPath');

  if (writeDraft) {
    final draft = writeDraftCatalog(pack: pack, candidates: candidates);
    final draftPath = '${outDir.path}/${pack.cityId}_draft.dart';
    File(draftPath).writeAsStringSync(draft);
    stdout.writeln('  → $draftPath');
    if (newCount > 0) {
      stdout.writeln('  Registry line: ${registrySnippet(pack)}');
    }
  }
}

String? _cityNameFromJson(String cityId) {
  final path = 'assets/city_packs/city_pack_$cityId.json';
  final file = File(path);
  if (!file.existsSync()) return null;
  final decoded = jsonDecode(file.readAsStringSync());
  if (decoded is! Map<String, dynamic>) return null;
  return decoded['cityName'] as String?;
}
