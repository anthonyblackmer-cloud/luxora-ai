// Imports Orlando-area venues from OpenStreetMap (Overpass API, keyless) and
// bakes them into a bundled asset: assets/places/osm_places.json.
//
// The app loads that asset at startup (see PlacesAssetRepository) so thousands
// of real venues are searchable / savable / routable with accurate coordinates
// and websites — no API key and no runtime network dependency.
//
// Run: dart run tool/import_osm_places.dart
//
// Re-run anytime to refresh. OSM data © OpenStreetMap contributors (ODbL).
import 'dart:convert';
import 'dart:io';

/// Orlando metro bounding box: south, west, north, east.
const _bbox = (south: 28.20, west: -81.72, north: 28.86, east: -81.10);

const _overpassEndpoints = <String>[
  'https://overpass-api.de/api/interpreter',
  'https://overpass.kumi.systems/api/interpreter',
];

/// Photo placeholders (must exist in assets/unsplash/curated.json).
const _photoDining = 'JZYQ_P94T-Q';
const _photoNightlife = 'p0vZplFhKYI';
const _photoHotel = 'xEaAoizNFV8';

String _overpassQuery() {
  final b = '${_bbox.south},${_bbox.west},${_bbox.north},${_bbox.east}';
  // Exclude fast_food to cut chain clutter; keep sit-down dining, cafes,
  // bars/pubs, and lodging.
  return '''
[out:json][timeout:180];
(
  node["amenity"="restaurant"]["name"]($b);
  way["amenity"="restaurant"]["name"]($b);
  node["amenity"="cafe"]["name"]($b);
  way["amenity"="cafe"]["name"]($b);
  node["amenity"="bar"]["name"]($b);
  node["amenity"="pub"]["name"]($b);
  node["tourism"="hotel"]["name"]($b);
  way["tourism"="hotel"]["name"]($b);
  node["tourism"="motel"]["name"]($b);
  node["tourism"="resort"]["name"]($b);
  way["tourism"="resort"]["name"]($b);
);
out center tags;
''';
}

Future<List<dynamic>> _fetchElements() async {
  final query = _overpassQuery();
  for (final endpoint in _overpassEndpoints) {
    try {
      stdout.writeln('Querying $endpoint ...');
      final client = HttpClient()
        ..connectionTimeout = const Duration(seconds: 60);
      final req = await client.postUrl(Uri.parse(endpoint));
      req.headers.set(HttpHeaders.contentTypeHeader,
          'application/x-www-form-urlencoded');
      req.headers.set(HttpHeaders.userAgentHeader,
          'LuxoraAI-OSM-Import/1.0 (places ingestion)');
      req.add(utf8.encode('data=${Uri.encodeComponent(query)}'));
      final res = await req.close();
      final body = await res.transform(utf8.decoder).join();
      client.close(force: true);
      if (res.statusCode != 200) {
        stderr.writeln('  HTTP ${res.statusCode}; trying next endpoint.');
        continue;
      }
      final decoded = jsonDecode(body) as Map<String, dynamic>;
      final elements = decoded['elements'] as List<dynamic>? ?? [];
      stdout.writeln('  Received ${elements.length} elements.');
      return elements;
    } catch (e) {
      stderr.writeln('  Failed on $endpoint: $e');
    }
  }
  throw Exception('All Overpass endpoints failed.');
}

String _slugify(String input) {
  final s = input
      .toLowerCase()
      .replaceAll(RegExp(r"[^a-z0-9]+"), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');
  return s.isEmpty ? 'place' : s;
}

String _category(Map<String, dynamic> tags) {
  final amenity = tags['amenity'] as String?;
  final tourism = tags['tourism'] as String?;
  if (tourism == 'hotel' || tourism == 'motel' || tourism == 'resort') {
    return 'hotel';
  }
  if (amenity == 'bar' || amenity == 'pub') return 'nightlife';
  return 'dining';
}

String _photoFor(String category) => switch (category) {
      'hotel' => _photoHotel,
      'nightlife' => _photoNightlife,
      _ => _photoDining,
    };

String _titleCase(String s) => s
    .split(RegExp(r'[\s_]+'))
    .where((w) => w.isNotEmpty)
    .map((w) => w[0].toUpperCase() + w.substring(1))
    .join(' ');

List<String> _cuisines(Map<String, dynamic> tags) {
  final raw = tags['cuisine'] as String?;
  if (raw == null || raw.isEmpty) return const [];
  return raw
      .split(RegExp(r'[;,]'))
      .map((c) => _titleCase(c.trim().replaceAll('_', ' ')))
      .where((c) => c.isNotEmpty)
      .toList();
}

String _locationString(Map<String, dynamic> tags) {
  final num = tags['addr:housenumber'] as String?;
  final street = tags['addr:street'] as String?;
  final city = tags['addr:city'] as String?;
  final parts = <String>[];
  if (street != null) {
    parts.add(num != null ? '$num $street' : street);
  }
  parts.add(city ?? 'Orlando');
  parts.add('FL');
  return parts.join(', ');
}

String _description(String category, List<String> cuisines) {
  switch (category) {
    case 'hotel':
      return 'Lodging option imported from OpenStreetMap — set it as your trip home base to route your day from here.';
    case 'nightlife':
      return cuisines.isEmpty
          ? 'Local bar / pub near your route.'
          : '${cuisines.join(', ')} bar near your route.';
    default:
      return cuisines.isEmpty
          ? 'Local restaurant near your route — tap for directions and menu.'
          : '${cuisines.join(', ')} restaurant — tap for directions and menu.';
  }
}

List<String> _moodTags(String category, List<String> cuisines) {
  switch (category) {
    case 'hotel':
      return const ['stay'];
    case 'nightlife':
      return const ['nightlife'];
    default:
      return const ['foodie'];
  }
}

String? _website(Map<String, dynamic> tags) {
  final w = (tags['website'] ?? tags['contact:website']) as String?;
  if (w == null || w.trim().isEmpty) return null;
  final t = w.trim();
  if (t.startsWith('http://') || t.startsWith('https://')) return t;
  return 'https://$t';
}

void main() async {
  final elements = await _fetchElements();

  final rows = <Map<String, dynamic>>[];
  final seenSlugs = <String>{};
  var skipped = 0;

  for (final el in elements) {
    final e = el as Map<String, dynamic>;
    final tags = (e['tags'] as Map<String, dynamic>?) ?? {};
    final name = (tags['name'] as String?)?.trim();
    if (name == null || name.isEmpty) {
      skipped++;
      continue;
    }

    double? lat;
    double? lon;
    if (e['lat'] != null && e['lon'] != null) {
      lat = (e['lat'] as num).toDouble();
      lon = (e['lon'] as num).toDouble();
    } else if (e['center'] is Map) {
      final c = e['center'] as Map<String, dynamic>;
      lat = (c['lat'] as num?)?.toDouble();
      lon = (c['lon'] as num?)?.toDouble();
    }
    if (lat == null || lon == null) {
      skipped++;
      continue;
    }

    final type = e['type'] as String? ?? 'node';
    final osmId = e['id'].toString();
    final id = 'osm-$type-$osmId';
    var slug = '${_slugify(name)}-$osmId';
    if (!seenSlugs.add(slug)) {
      slug = '$slug-${rows.length}';
      seenSlugs.add(slug);
    }

    final category = _category(tags);
    final cuisines = _cuisines(tags);

    rows.add({
      'external_id': id,
      'slug': slug,
      'title': name,
      'category': category,
      'unsplash_photo_id': _photoFor(category),
      'location': _locationString(tags),
      'latitude': lat,
      'longitude': lon,
      'description': _description(category, cuisines),
      'mood_tags': _moodTags(category, cuisines),
      'website': _website(tags),
      'source': 'osm',
      'sort_order': 1000,
      'is_active': true,
    });
  }

  rows.sort((a, b) => (a['title'] as String).compareTo(b['title'] as String));

  final outDir = Directory('assets/places');
  outDir.createSync(recursive: true);
  final outFile = File('assets/places/osm_places.json');
  outFile.writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(rows),
  );

  // Category tally
  final byCat = <String, int>{};
  for (final r in rows) {
    byCat[r['category'] as String] = (byCat[r['category'] as String] ?? 0) + 1;
  }
  stdout.writeln('Wrote ${rows.length} places → ${outFile.path}');
  stdout.writeln('  by category: $byCat (skipped $skipped without name/coords)');
}
