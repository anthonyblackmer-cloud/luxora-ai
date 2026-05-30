// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

void main() {
  final curated = (jsonDecode(File('assets/unsplash/curated.json').readAsStringSync())
          as List)
      .map((e) => e['id'] as String)
      .toSet();
  final dir = Directory('lib/data/florida_keys');
  final re = RegExp(r"unsplashPhotoId: '([^']+)'|'([A-Za-z0-9_-]{6,})',");
  final missing = <String>{};
  for (final entity in dir.listSync(recursive: true)) {
    if (entity is! File || !entity.path.endsWith('.dart')) continue;
    final text = entity.readAsStringSync();
    for (final m in re.allMatches(text)) {
      final id = m.group(1) ?? m.group(2);
      if (id == null || id.length < 8) continue;
      if (!curated.contains(id)) missing.add(id);
    }
  }
  print('Missing from curated.json (${missing.length}):');
  for (final id in missing) {
    print('  $id');
  }
}
