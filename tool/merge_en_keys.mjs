import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve('.');
const en = JSON.parse(
  fs.readFileSync(path.join(root, 'lib/l10n/app_en.arb'), 'utf8'),
);
const locales = ['es', 'fr', 'de', 'zh', 'ko', 'ja', 'ru', 'it', 'hi', 'pt', 'tr'];

for (const loc of locales) {
  const file = path.join(root, 'lib/l10n', `app_${loc}.arb`);
  const data = JSON.parse(fs.readFileSync(file, 'utf8'));
  let added = 0;
  for (const k of Object.keys(en)) {
    if (k.startsWith('@')) continue;
    if (!(k in data)) {
      data[k] = en[k];
      added += 1;
    }
    const meta = `@${k}`;
    if (en[meta] && !(meta in data)) {
      data[meta] = en[meta];
    }
  }
  const ordered = {};
  for (const k of Object.keys(en)) {
    if (k in data) ordered[k] = data[k];
  }
  for (const k of Object.keys(data)) {
    if (!(k in ordered)) ordered[k] = data[k];
  }
  fs.writeFileSync(file, `${JSON.stringify(ordered, null, 2)}\n`);
  console.log(`${loc}: added ${added}`);
}
