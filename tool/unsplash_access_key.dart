import 'dart:convert';
import 'dart:io';

/// Reads Unsplash Access Key from CLI, env, or [config/unsplash.local.json].
String? readUnsplashAccessKey(List<String> args) {
  for (final arg in args) {
    if (arg.startsWith('--access-key=')) {
      return arg.substring('--access-key='.length).trim();
    }
  }

  final env = Platform.environment['UNSPLASH_ACCESS_KEY']?.trim();
  if (env != null && env.isNotEmpty) {
    return env;
  }

  final file = File('config/unsplash.local.json');
  if (!file.existsSync()) {
    return null;
  }

  try {
    final map = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    _warnIfDisciplineKeysMixedIn(map);
    final key = (map['UNSPLASH_ACCESS_KEY'] as String?)?.trim();
    if (key == null || key.isEmpty) {
      return null;
    }
    return key;
  } catch (_) {
    return null;
  }
}

void _warnIfDisciplineKeysMixedIn(Map<String, dynamic> map) {
  const disciplineOnly = {
    'CHART_ALERTS_API_BASE',
    'COINGECKO_DEMO_API_KEY',
    'COINGECKO_PRO_API_KEY',
    'TWELVE_DATA_API_KEY',
  };
  final found = disciplineOnly.where(map.containsKey).toList();
  if (found.isEmpty) {
    return;
  }
  stderr.writeln(
    'config/unsplash.local.json looks like the Discipline app .env — '
    'it should only contain UNSPLASH_ACCESS_KEY for Luxora AI.\n'
    'See luxora_ai/config/README.md',
  );
}

String unsplashKeyHelpMessage() => '''
Missing Unsplash Access Key.

In luxora_ai/config/:
  copy unsplash.local.json.example → unsplash.local.json
  add your key:  "UNSPLASH_ACCESS_KEY": "…"

Then Run ▶ Luxora AI (luxora_ai/.vscode/launch.json).
''';
