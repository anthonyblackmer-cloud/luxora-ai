/**
 * Restores English ICU placeholder names in translated JSON (e.g. {feel}, not {느낌}).
 * Run: node tool/fix_luxora_icu_placeholders.mjs
 */
import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve('.');
const en = JSON.parse(
  fs.readFileSync(path.join(root, 'lib/l10n/app_en.arb'), 'utf8'),
);
const keys = Object.keys(en).filter((k) => !k.startsWith('@'));
const dir = path.join(root, 'tool/l10n_translations');
const locales = fs
  .readdirSync(dir)
  .filter((f) => f.endsWith('.json'))
  .map((f) => f.replace('.json', ''));

function fixPlaceholders(enValue, translated) {
  const enPh = [...enValue.matchAll(/\{([^}]+)\}/g)];
  const trPh = [...translated.matchAll(/\{([^}]+)\}/g)];
  if (enPh.length === 0) return translated;
  if (enPh.length !== trPh.length) {
    console.warn(`placeholder count mismatch: "${enValue}" vs "${translated}"`);
    return translated;
  }
  let out = translated;
  for (let i = 0; i < enPh.length; i++) {
    out = out.replace(trPh[i][0], enPh[i][0]);
  }
  return out;
}

for (const locale of locales) {
  const file = path.join(dir, `${locale}.json`);
  const data = JSON.parse(fs.readFileSync(file, 'utf8'));
  let fixed = 0;
  for (const key of keys) {
    if (!en[`@${key}`]?.placeholders) continue;
    const next = fixPlaceholders(en[key], data[key]);
    if (next !== data[key]) {
      data[key] = next;
      fixed += 1;
    }
  }
  fs.writeFileSync(file, `${JSON.stringify(data, null, 2)}\n`, 'utf8');
  console.log(`${locale}: fixed ${fixed} strings`);
}
