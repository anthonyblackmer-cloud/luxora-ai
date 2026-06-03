// Shared helpers for [research_city_experience_moments.dart].
library;

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

/// Metadata for each shippable city pack.
class CityResearchPack {
  const CityResearchPack({
    required this.cityId,
    required this.dartFolder,
    required this.classPrefix,
    required this.placeScanPaths,
    this.momentsCatalogPath,
  });

  final String cityId;
  final String dartFolder;
  final String classPrefix;
  final List<String> placeScanPaths;
  final String? momentsCatalogPath;
}

/// Parsed curated place used as a moment seed.
class PlaceSeed {
  const PlaceSeed({
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    required this.description,
    required this.moodTags,
    required this.sourceFile,
  });

  final String id;
  final String title;
  final String category;
  final String location;
  final String description;
  final List<String> moodTags;
  final String sourceFile;
}

/// Parsed moment already checked into lib/.
class ExistingMoment {
  const ExistingMoment({
    required this.id,
    required this.placeId,
    required this.kind,
    required this.title,
    this.phase,
    this.priority = 50,
  });

  final String id;
  final String placeId;
  final String kind;
  final String title;
  final String? phase;
  final int priority;
}

/// Draft moment suggestion for editorial review.
class MomentCandidate {
  const MomentCandidate({
    required this.placeId,
    required this.placeTitle,
    required this.kind,
    required this.phase,
    required this.priority,
    required this.titleDraft,
    required this.conciergeLineDraft,
    required this.insiderTipDraft,
    required this.tags,
    required this.researchNotes,
    required this.status,
    required this.suggestedId,
  });

  final String placeId;
  final String placeTitle;
  final String kind;
  final String phase;
  final int priority;
  final String titleDraft;
  final String conciergeLineDraft;
  final String insiderTipDraft;
  final List<String> tags;
  final List<String> researchNotes;
  final String status;
  final String suggestedId;

  Map<String, dynamic> toJson() => {
        'placeId': placeId,
        'placeTitle': placeTitle,
        'suggestedId': suggestedId,
        'kind': kind,
        'phase': phase,
        'priority': priority,
        'titleDraft': titleDraft,
        'conciergeLineDraft': conciergeLineDraft,
        'insiderTipDraft': insiderTipDraft,
        'tags': tags,
        'researchNotes': researchNotes,
        'status': status,
      };
}

const cityResearchPacks = <CityResearchPack>[
  CityResearchPack(
    cityId: 'orlando',
    dartFolder: 'orlando',
    classPrefix: 'Orlando',
    momentsCatalogPath: 'lib/data/orlando/orlando_experience_moments.dart',
    placeScanPaths: [
      'lib/data/curated_places_major_attractions.dart',
      'lib/data/curated_places_attractions.dart',
      'lib/data/curated_places_dining.dart',
    ],
  ),
  CityResearchPack(
    cityId: 'miami',
    dartFolder: 'miami',
    classPrefix: 'Miami',
    placeScanPaths: ['lib/data/miami/miami_curated_places.dart'],
  ),
  CityResearchPack(
    cityId: 'florida-keys',
    dartFolder: 'florida_keys',
    classPrefix: 'FloridaKeys',
    placeScanPaths: ['lib/data/florida_keys/florida_keys_curated_places.dart'],
  ),
  CityResearchPack(
    cityId: 'tampa-bay',
    dartFolder: 'tampa_bay',
    classPrefix: 'TampaBay',
    placeScanPaths: ['lib/data/tampa_bay/tampa_bay_curated_places.dart'],
  ),
  CityResearchPack(
    cityId: 'st-augustine',
    dartFolder: 'st_augustine',
    classPrefix: 'StAugustine',
    placeScanPaths: ['lib/data/st_augustine/st_augustine_curated_places.dart'],
  ),
  CityResearchPack(
    cityId: 'naples',
    dartFolder: 'naples',
    classPrefix: 'Naples',
    placeScanPaths: ['lib/data/naples/naples_curated_places.dart'],
  ),
  CityResearchPack(
    cityId: 'destin-30a',
    dartFolder: 'destin_30a',
    classPrefix: 'Destin30a',
    placeScanPaths: ['lib/data/destin_30a/destin_30a_curated_places.dart'],
  ),
  CityResearchPack(
    cityId: 'vegas',
    dartFolder: 'vegas',
    classPrefix: 'Vegas',
    placeScanPaths: ['lib/data/vegas/vegas_curated_places.dart'],
  ),
  CityResearchPack(
    cityId: 'nyc',
    dartFolder: 'nyc',
    classPrefix: 'Nyc',
    placeScanPaths: ['lib/data/nyc/nyc_curated_places.dart'],
  ),
];

CityResearchPack? packForCity(String cityId) {
  for (final pack in cityResearchPacks) {
    if (pack.cityId == cityId) return pack;
  }
  return null;
}

CityResearchPack packFromJson(Map<String, dynamic> json) {
  final cityId = json['cityId'] as String;
  final folder = cityId.replaceAll('-', '_');
  final prefix = _classPrefixFromCityId(cityId);
  return CityResearchPack(
    cityId: cityId,
    dartFolder: folder,
    classPrefix: prefix,
    placeScanPaths: [
      'lib/data/$folder/${folder}_curated_places.dart',
    ],
    momentsCatalogPath: 'lib/data/$folder/${folder}_experience_moments.dart',
  );
}

String _classPrefixFromCityId(String cityId) {
  return cityId.split('-').map((part) {
    if (part == '30a') return '30a';
    return part.isEmpty
        ? part
        : '${part[0].toUpperCase()}${part.substring(1)}';
  }).join();
}

List<CityResearchPack> discoverPacksFromAssets() {
  final dir = Directory('assets/city_packs');
  if (!dir.existsSync()) return cityResearchPacks;

  final discovered = <String, CityResearchPack>{};
  for (final pack in cityResearchPacks) {
    discovered[pack.cityId] = pack;
  }

  for (final file in dir.listSync().whereType<File>()) {
    if (!file.path.endsWith('.json')) continue;
    if (file.path.contains('state_pack_')) continue;
    final decoded = jsonDecode(file.readAsStringSync());
    if (decoded is! Map<String, dynamic>) continue;
    final cityId = decoded['cityId'] as String?;
    if (cityId == null) continue;
    discovered.putIfAbsent(cityId, () => packFromJson(decoded));
  }

  final ids = discovered.keys.toList()..sort();
  return [for (final id in ids) discovered[id]!];
}

List<PlaceSeed> scanPlaces(CityResearchPack pack) {
  final seeds = <PlaceSeed>[];
  final seen = <String>{};

  for (final path in pack.placeScanPaths) {
    final file = File(path);
    if (!file.existsSync()) continue;
    for (final seed in _parsePlaceSeeds(file.readAsStringSync(), path)) {
      if (seen.add(seed.id)) seeds.add(seed);
    }
  }

  seeds.sort((a, b) => a.title.compareTo(b.title));
  return seeds;
}

List<PlaceSeed> _parsePlaceSeeds(String content, String sourceFile) {
  final seeds = <PlaceSeed>[];
  final blocks = RegExp(
    r'LuxPlace\s*\(',
    multiLine: true,
  ).allMatches(content);

  for (final match in blocks) {
    final start = match.start;
    final end = _findMatchingParenEnd(content, start + 'LuxPlace('.length - 1);
    if (end == null) continue;
    final block = content.substring(start, end + 1);

    final id = _fieldString(block, 'id');
    final title = _fieldString(block, 'title');
    if (id == null || title == null) continue;
    if (id.startsWith('cover-')) continue;

    seeds.add(
      PlaceSeed(
        id: id,
        title: title,
        category: _fieldCategory(block) ?? 'adventure',
        location: _fieldString(block, 'location') ?? '',
        description: _fieldString(block, 'description') ?? '',
        moodTags: _fieldStringList(block, 'moodTags'),
        sourceFile: sourceFile,
      ),
    );
  }

  return seeds;
}

int? _findMatchingParenEnd(String content, int openParenIndex) {
  var depth = 0;
  for (var i = openParenIndex; i < content.length; i++) {
    final ch = content[i];
    if (ch == '(') depth++;
    if (ch == ')') {
      depth--;
      if (depth == 0) return i;
    }
  }
  return null;
}

String? _fieldString(String block, String field) {
  final match = RegExp("$field:\\s*'((?:\\\\'|[^'])*)'").firstMatch(block);
  return match?.group(1)?.replaceAll(r"\'", "'");
}

String? _fieldCategory(String block) {
  final match =
      RegExp(r'category:\s*LuxPlaceCategory\.(\w+)').firstMatch(block);
  return match?.group(1);
}

List<String> _fieldStringList(String block, String field) {
  final match = RegExp('$field:\\s*\\[([^\\]]*)\\]').firstMatch(block);
  if (match == null) return const [];
  return RegExp(r"'([^']+)'")
      .allMatches(match.group(1)!)
      .map((m) => m.group(1)!)
      .toList();
}

List<ExistingMoment> parseExistingMoments(String? path) {
  if (path == null) return const [];
  final file = File(path);
  if (!file.existsSync()) return const [];

  final content = file.readAsStringSync();
  final moments = <ExistingMoment>[];
  final blocks = RegExp(r'ExperienceMoment\s*\(|OrlandoExperienceMoment\s*\(')
      .allMatches(content);

  for (final match in blocks) {
    final start = match.start;
    final end = _findMatchingParenEnd(content, start + match.group(0)!.length - 1);
    if (end == null) continue;
    final block = content.substring(start, end + 1);

    final id = _fieldString(block, 'id');
    final placeId = _fieldString(block, 'placeId');
    final title = _fieldString(block, 'title');
    final kind = _fieldKind(block);
    if (id == null || placeId == null || title == null || kind == null) continue;

    moments.add(
      ExistingMoment(
        id: id,
        placeId: placeId,
        kind: kind,
        title: title,
        phase: _fieldPhase(block),
        priority: _fieldInt(block, 'priority') ?? 50,
      ),
    );
  }

  return moments;
}

String? _fieldKind(String block) {
  final match = RegExp(
    r'kind:\s*(?:ExperienceMomentKind|OrlandoMomentKind)\.(\w+)',
  ).firstMatch(block);
  return match?.group(1);
}

String? _fieldPhase(String block) {
  final match = RegExp(r'phase:\s*DayPhase\.(\w+)').firstMatch(block);
  return match?.group(1);
}

int? _fieldInt(String block, String field) {
  final match = RegExp('$field:\\s*(\\d+)').firstMatch(block);
  return match == null ? null : int.tryParse(match.group(1)!);
}

List<MomentCandidate> buildCandidates({
  required CityResearchPack pack,
  required List<PlaceSeed> places,
  required List<ExistingMoment> existing,
  required String cityName,
  Map<String, String> wikiNotesByPlaceId = const {},
}) {
  final existingByPlace = <String, List<ExistingMoment>>{};
  for (final moment in existing) {
    existingByPlace.putIfAbsent(moment.placeId, () => []).add(moment);
  }

  final candidates = <MomentCandidate>[];
  for (final place in places) {
    if (!_isMomentWorthy(place)) continue;

    final current = existingByPlace[place.id] ?? const [];
    final profile = _inferMomentProfile(place);
    final slug = _slugFromTitle(place.title);
    final suggestedId = 'moment-$slug';

    if (current.isNotEmpty) {
      for (final moment in current) {
        candidates.add(
          MomentCandidate(
            placeId: place.id,
            placeTitle: place.title,
            kind: moment.kind,
            phase: moment.phase ?? profile.phase,
            priority: moment.priority,
            titleDraft: moment.title,
            conciergeLineDraft: '(existing catalog entry)',
            insiderTipDraft: '(existing catalog entry)',
            tags: place.moodTags.take(4).toList(),
            researchNotes: [
              'Already in ${pack.momentsCatalogPath ?? 'catalog'}',
              if (wikiNotesByPlaceId.containsKey(place.id))
                wikiNotesByPlaceId[place.id]!,
            ],
            status: 'existing',
            suggestedId: moment.id,
          ),
        );
      }
      continue;
    }

    final notes = <String>[
      'Seed from ${place.sourceFile}',
      'Category ${place.category}; tags ${place.moodTags.join(', ')}',
    ];
    final wiki = wikiNotesByPlaceId[place.id];
    if (wiki != null) notes.add(wiki);

    candidates.add(
      MomentCandidate(
        placeId: place.id,
        placeTitle: place.title,
        kind: profile.kind,
        phase: profile.phase,
        priority: profile.priority,
        titleDraft: profile.titleDraft(place),
        conciergeLineDraft: profile.conciergeDraft(place, cityName),
        insiderTipDraft: profile.insiderDraft(place),
        tags: profile.tags(place),
        researchNotes: notes,
        status: 'new',
        suggestedId: suggestedId,
      ),
    );
  }

  candidates.sort((a, b) {
    final statusOrder = {'new': 0, 'existing': 1};
    final sa = statusOrder[a.status] ?? 2;
    final sb = statusOrder[b.status] ?? 2;
    if (sa != sb) return sa.compareTo(sb);
    return b.priority.compareTo(a.priority);
  });

  return candidates;
}

bool _isMomentWorthy(PlaceSeed place) {
  if (place.moodTags.contains('trip-cover')) return false;
  if (place.moodTags.contains('iconic')) return true;
  if (place.moodTags.contains('show') ||
      place.moodTags.contains('broadway') ||
      place.moodTags.contains('entertainment')) {
    return true;
  }
  const highSignalCategories = {
    'family',
    'beach',
    'springs',
    'nature',
    'romantic',
    'nightlife',
  };
  if (highSignalCategories.contains(place.category)) return true;
  if (place.id.contains('place-') &&
      !place.id.contains('-exp-') &&
      place.description.length > 40) {
    return true;
  }
  return false;
}

class _MomentProfile {
  const _MomentProfile({
    required this.kind,
    required this.phase,
    required this.priority,
  });

  final String kind;
  final String phase;
  final int priority;

  String titleDraft(PlaceSeed place) {
    final lower = place.title.toLowerCase();
    if (kind == 'fireworks') return '${place.title} night spectacular';
    if (kind == 'show') {
      if (lower.contains('broadway')) return 'Broadway curtain night';
      return '${place.title} headline show';
    }
    if (kind == 'diningWindow') return '${place.title} reservation window';
    if (phase == 'morning') return '${place.title} at open';
    if (phase == 'evening') return '${place.title} golden hour';
    return '${place.title} signature moment';
  }

  String conciergeDraft(PlaceSeed place, String cityName) {
    final when = switch (phase) {
      'morning' => 'Morning at ${place.title}',
      'midday' => 'Midday anchor at ${place.title}',
      'evening' => 'Evening payoff at ${place.title}',
      _ => 'Plan around ${place.title}',
    };
    return '$when — a must-feel beat in your $cityName itinerary, not filler between drives.';
  }

  String insiderDraft(PlaceSeed place) {
    if (place.description.trim().isNotEmpty) {
      final trimmed = place.description.trim();
      return trimmed.length > 160 ? '${trimmed.substring(0, 157)}…' : trimmed;
    }
    return 'Arrive before peak crowds; pair with a nearby meal in ${place.location}.';
  }

  List<String> tags(PlaceSeed place) {
    final tags = <String>{...place.moodTags.take(3)};
    tags.add(kind == 'show' ? 'show' : 'iconic');
    if (phase == 'evening') tags.add('night');
    return tags.take(5).toList();
  }
}

_MomentProfile _inferMomentProfile(PlaceSeed place) {
  final tags = place.moodTags.map((t) => t.toLowerCase()).toSet();
  final category = place.category.toLowerCase();
  final title = place.title.toLowerCase();

  if (tags.contains('broadway') ||
      tags.contains('show') ||
      title.contains('show') ||
      title.contains('sphere') ||
      title.contains('fountain')) {
    return const _MomentProfile(kind: 'show', phase: 'evening', priority: 95);
  }
  if (title.contains('firework') ||
      tags.contains('fireworks') ||
      title.contains('spectacular')) {
    return const _MomentProfile(
      kind: 'fireworks',
      phase: 'evening',
      priority: 100,
    );
  }
  if (category == 'beach' || tags.contains('sunset') || tags.contains('sunrise')) {
    return const _MomentProfile(
      kind: 'atmosphere',
      phase: 'evening',
      priority: 75,
    );
  }
  if (category == 'springs' || category == 'nature') {
    return const _MomentProfile(
      kind: 'atmosphere',
      phase: 'morning',
      priority: 70,
    );
  }
  if (category == 'nightlife' || tags.contains('nightlife')) {
    return const _MomentProfile(kind: 'show', phase: 'evening', priority: 80);
  }
  if (tags.contains('foodie') || category == 'dining') {
    return const _MomentProfile(
      kind: 'diningWindow',
      phase: 'evening',
      priority: 72,
    );
  }
  if (tags.contains('seasonal') || tags.contains('holiday')) {
    return const _MomentProfile(
      kind: 'seasonal',
      phase: 'midday',
      priority: 68,
    );
  }
  return const _MomentProfile(
    kind: 'atmosphere',
    phase: 'midday',
    priority: 65,
  );
}

Future<Map<String, String>> fetchWikipediaHints({
  required String cityName,
  required List<PlaceSeed> places,
  int maxPlaces = 12,
}) async {
  final hints = <String, String>{};
  final targets = places.where(_isMomentWorthy).take(maxPlaces);

  for (final place in targets) {
    final query = '${place.title} $cityName';
    try {
      final uri = Uri.https(
        'en.wikipedia.org',
        '/w/api.php',
        {
          'action': 'opensearch',
          'search': query,
          'limit': '2',
          'namespace': '0',
          'format': 'json',
        },
      );
      final response = await http
          .get(uri, headers: {'User-Agent': 'LuxoraAI-Moments-Research/1.0'})
          .timeout(const Duration(seconds: 12));
      if (response.statusCode != 200) continue;
      final decoded = jsonDecode(response.body);
      if (decoded is! List || decoded.length < 2) continue;
      final titles = (decoded[1] as List).cast<String>();
      if (titles.isEmpty) continue;
      hints[place.id] = 'Wikipedia: ${titles.first}';
    } catch (_) {
      // Offline / rate-limit — skip quietly.
    }
  }

  return hints;
}

String _slugFromTitle(String title) {
  final slug = title
      .toLowerCase()
      .replaceAll(RegExp(r"[^a-z0-9]+"), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');
  return slug.isEmpty ? 'moment' : slug.substring(0, slug.length > 48 ? 48 : slug.length);
}

String _escapeDart(String value) => value
    .replaceAll(r'\', r'\\')
    .replaceAll("'", r"\'")
    .replaceAll('\n', ' ');

String writeDraftCatalog({
  required CityResearchPack pack,
  required List<MomentCandidate> candidates,
}) {
  final fresh = candidates.where((c) => c.status == 'new').toList();
  final buffer = StringBuffer()
    ..writeln("import 'package:luxora_ai/models/experience_moment.dart';")
    ..writeln("import 'package:luxora_ai/services/day_flow_planner.dart';")
    ..writeln()
    ..writeln('/// DRAFT — generated by tool/research_city_experience_moments.dart')
    ..writeln('/// Review titles, show names, and seasons before shipping.')
    ..writeln('abstract final class ${pack.classPrefix}ExperienceMomentsCatalog {')
    ..writeln('  static const all = <ExperienceMoment>[');

  if (fresh.isEmpty) {
    buffer.writeln('    // No new candidates — add moments manually or broaden seeds.');
  }

  for (final candidate in fresh) {
    buffer
      ..writeln('    ExperienceMoment(')
      ..writeln("      id: '${_escapeDart(candidate.suggestedId)}',")
      ..writeln("      placeId: '${_escapeDart(candidate.placeId)}',")
      ..writeln('      kind: ExperienceMomentKind.${candidate.kind},')
      ..writeln('      phase: DayPhase.${candidate.phase},')
      ..writeln('      priority: ${candidate.priority},')
      ..writeln("      title: '${_escapeDart(candidate.titleDraft)}',")
      ..writeln(
        "      conciergeLine: '${_escapeDart(candidate.conciergeLineDraft)}',",
      )
      ..writeln(
        "      insiderTip: '${_escapeDart(candidate.insiderTipDraft)}',",
      )
      ..writeln(
        "      tags: [${candidate.tags.map((t) => "'${_escapeDart(t)}'").join(', ')}],",
      )
      ..writeln('    ),');
  }

  buffer
    ..writeln('  ];')
    ..writeln()
    ..writeln('  static List<ExperienceMoment> forPlace(String placeId) =>')
    ..writeln('      all.where((m) => m.placeId == placeId).toList(growable: false);')
    ..writeln('}');

  return buffer.toString();
}

Map<String, dynamic> buildResearchReport({
  required CityResearchPack pack,
  required String cityName,
  required List<PlaceSeed> places,
  required List<ExistingMoment> existing,
  required List<MomentCandidate> candidates,
}) {
  final newCount = candidates.where((c) => c.status == 'new').length;
  final gaps = <String>[];
  for (final place in places.where(_isMomentWorthy)) {
    final hasMoment = existing.any((m) => m.placeId == place.id) ||
        candidates.any((c) => c.placeId == place.id && c.status == 'existing');
    if (!hasMoment) gaps.add(place.id);
  }

  return {
    'cityId': pack.cityId,
    'cityName': cityName,
    'generatedAt': DateTime.now().toUtc().toIso8601String(),
    'placeSeedCount': places.length,
    'existingMomentCount': existing.length,
    'newCandidateCount': newCount,
    'gapPlaceIds': gaps,
    'candidates': candidates.map((c) => c.toJson()).toList(),
  };
}

String registrySnippet(CityResearchPack pack) =>
    "      '${pack.cityId}' => ${pack.classPrefix}ExperienceMomentsCatalog.all,";
