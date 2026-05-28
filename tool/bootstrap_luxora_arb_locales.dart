// Copies shared settings strings from Discipline ARBs into Luxora locale files.
// Run from repo root: dart run tool/bootstrap_luxora_arb_locales.dart

import 'dart:convert';
import 'dart:io';

const _locales = [
  'de',
  'es',
  'fr',
  'hi',
  'it',
  'ja',
  'ko',
  'pt',
  'ru',
  'tr',
  'zh',
];

const _keysFromDiscipline = [
  'settings',
  'appearance',
  'dark_mode',
  'light_mode',
  'language',
  'settings_language_picker_note',
];

void main() {
  final disciplineL10n = Directory(
    '../leverage_position_calculator/lib/l10n',
  );
  if (!disciplineL10n.existsSync()) {
    stderr.writeln(
      'Discipline l10n not found at ${disciplineL10n.path} — copy settings keys manually.',
    );
    exit(1);
  }

  final luxoraEn =
      jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync()) as Map<String, dynamic>;

  for (final locale in _locales) {
    final disciplinePath = disciplineL10n.path + Platform.pathSeparator + 'app_$locale.arb';
    final disciplineFile = File(disciplinePath);
    if (!disciplineFile.existsSync()) {
      stderr.writeln('Skip $locale — missing discipline arb');
      continue;
    }
    final discipline =
        jsonDecode(disciplineFile.readAsStringSync()) as Map<String, dynamic>;

    final out = <String, dynamic>{'@@locale': locale};
    for (final entry in luxoraEn.entries) {
      final key = entry.key;
      if (key.startsWith('@@') || key.startsWith('@')) {
        continue;
      }
      if (_keysFromDiscipline.contains(key) && discipline.containsKey(key)) {
        out[key] = discipline[key];
      } else {
        out[key] = entry.value;
      }
    }

    final outPath = 'lib/l10n/app_$locale.arb';
    File(outPath).writeAsStringSync(
      const JsonEncoder.withIndent('  ').convert(out) + '\n',
    );
    stdout.writeln('Wrote $outPath');
  }
}
