/**
 * Generates tool/luxora_translations_data.dart from tool/l10n_translations/*.json
 * Run: node tool/build_luxora_translations_data.mjs
 */
import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve('.');
const srcDir = path.join(root, 'tool/l10n_translations');
const outPath = path.join(root, 'tool/luxora_translations_data.dart');
const LOCALE_ORDER = [
  'es',
  'fr',
  'de',
  'zh',
  'ko',
  'ja',
  'ru',
  'it',
  'hi',
  'pt',
  'tr',
];

const en = JSON.parse(
  fs.readFileSync(path.join(root, 'lib/l10n/app_en.arb'), 'utf8'),
);
const enKeys = Object.keys(en)
  .filter((k) => !k.startsWith('@'))
  .sort();

function dartStr(value) {
  const escaped = value
    .replace(/\\/g, '\\\\')
    .replace(/'/g, "\\'")
    .replace(/\n/g, '\\n')
    .replace(/\$/g, '\\$');
  return `'${escaped}'`;
}

const lines = [
  '// Luxora UI translations (non-English).',
  '// Regenerate: node tool/build_luxora_translations_data.mjs',
  '// ignore_for_file: lines_longer_than_80_chars',
  '',
  'const luxoraTranslationsByLocale = <String, Map<String, String>>{',
];

for (const locale of LOCALE_ORDER) {
  const data = JSON.parse(
    fs.readFileSync(path.join(srcDir, `${locale}.json`), 'utf8'),
  );
  const missing = enKeys.filter((k) => !(k in data));
  const extra = Object.keys(data).filter((k) => !enKeys.includes(k));
  if (missing.length) {
    throw new Error(`${locale} missing: ${missing.slice(0, 5).join(', ')}`);
  }
  if (extra.length) {
    throw new Error(`${locale} extra: ${extra.slice(0, 5).join(', ')}`);
  }
  lines.push(`  '${locale}': {`);
  for (const key of enKeys) {
    lines.push(`    '${key}': ${dartStr(data[key])},`);
  }
  lines.push('  },');
}

lines.push('};', '');
fs.writeFileSync(outPath, `${lines.join('\n')}`, 'utf8');
console.log(
  `Wrote ${outPath} (${LOCALE_ORDER.length} locales, ${enKeys.length} keys each)`,
);
