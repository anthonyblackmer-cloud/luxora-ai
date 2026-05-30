// Merges Supabase keys into config/unsplash.local.json (gitignored).
//
// Usage:
//   dart run tool/setup_supabase_config.dart \
//     --url=https://YOUR_PROJECT.supabase.co \
//     --anon-key=eyJ...

import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  String? url;
  String? anonKey;

  for (final arg in args) {
    if (arg.startsWith('--url=')) {
      url = arg.substring('--url='.length).trim();
    } else if (arg.startsWith('--anon-key=')) {
      anonKey = arg.substring('--anon-key='.length).trim();
    }
  }

  final keyOk = anonKey != null &&
      anonKey.isNotEmpty &&
      (anonKey.startsWith('eyJ') || anonKey.startsWith('sb_publishable_'));

  if (url == null ||
      url.isEmpty ||
      !keyOk ||
      !url.startsWith('https://') ||
      !url.contains('.supabase.co')) {
    stderr.writeln(
      'Usage: dart run tool/setup_supabase_config.dart '
      '--url=https://YOUR_PROJECT.supabase.co '
      '--anon-key=sb_publishable_... or eyJ...',
    );
    exit(1);
  }

  final configPath = File('config/unsplash.local.json');
  if (!configPath.parent.existsSync()) {
    stderr.writeln('Run from luxora_ai repo root.');
    exit(1);
  }

  Map<String, dynamic> config = {};
  if (configPath.existsSync()) {
    config = jsonDecode(configPath.readAsStringSync()) as Map<String, dynamic>;
  }

  config['SUPABASE_URL'] = url;
  config['SUPABASE_ANON_KEY'] = anonKey;

  configPath.writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(config),
  );

  stdout.writeln('Updated ${configPath.path} with Supabase keys.');
  stdout.writeln('Next: run SQL in Supabase (supabase/setup_all.sql), deploy concierge-chat, set OPENAI_API_KEY.');
}
