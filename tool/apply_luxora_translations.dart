// Merges luxoraTranslationsByLocale into lib/l10n/app_{locale}.arb files.
// Run from repo root: dart run tool/apply_luxora_translations.dart

import 'dart:convert';
import 'dart:io';

import 'luxora_translations_data.dart';

void main() {
  final enPath = 'lib/l10n/app_en.arb';
  final en =
      jsonDecode(File(enPath).readAsStringSync()) as Map<String, dynamic>;

  final enKeys = en.keys
      .where((k) => !k.startsWith('@'))
      .toList()
    ..sort();

  for (final locale in luxoraTranslationsByLocale.keys) {
    final translations = luxoraTranslationsByLocale[locale]!;
    final missing = enKeys.where((k) => !translations.containsKey(k)).toList();
    final extra =
        translations.keys.where((k) => !enKeys.contains(k)).toList();
    if (missing.isNotEmpty) {
      stderr.writeln('$locale missing keys: ${missing.join(', ')}');
      exit(1);
    }
    if (extra.isNotEmpty) {
      stderr.writeln('$locale extra keys: ${extra.join(', ')}');
      exit(1);
    }

    final out = <String, dynamic>{'@@locale': locale};
    for (final key in enKeys) {
      out[key] = translations[key];
      final metaKey = '@$key';
      if (en.containsKey(metaKey)) {
        out[metaKey] = en[metaKey];
      }
    }

    final outPath = 'lib/l10n/app_$locale.arb';
    File(outPath).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(out)}\n',
    );
    stdout.writeln('$locale: ${translations.length} keys -> $outPath');
  }
}
