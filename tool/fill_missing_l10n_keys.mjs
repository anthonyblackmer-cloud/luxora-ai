import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve('.');
const en = JSON.parse(
  fs.readFileSync(path.join(root, 'lib/l10n/app_en.arb'), 'utf8'),
);
const enKeys = Object.keys(en).filter((k) => !k.startsWith('@'));
const dir = path.join(root, 'tool/l10n_translations');

const localeToLang = {
  es: 'es',
  fr: 'fr',
  de: 'de',
  zh: 'zh-CN',
  ko: 'ko',
  ja: 'ja',
  ru: 'ru',
  it: 'it',
  hi: 'hi',
  pt: 'pt',
  tr: 'tr',
};

const keepEnglish = new Set(['appTitle', 'conciergeBrand']);

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function placeholders(text) {
  return [...text.matchAll(/\{[^}]+\}/g)].map((m) => m[0]);
}

function restorePlaceholders(source, translated) {
  const src = placeholders(source);
  const tr = placeholders(translated);
  if (src.length === 0 || src.length !== tr.length) return translated;
  let out = translated;
  for (let i = 0; i < src.length; i += 1) {
    out = out.replace(tr[i], src[i]);
  }
  return out;
}

async function translateText(text, target) {
  const url = new URL('https://translate.googleapis.com/translate_a/single');
  url.searchParams.set('client', 'gtx');
  url.searchParams.set('sl', 'en');
  url.searchParams.set('tl', target);
  url.searchParams.set('dt', 't');
  url.searchParams.set('q', text);
  const res = await fetch(url);
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  const data = await res.json();
  return data[0].map((part) => part[0]).join('');
}

for (const [locale, lang] of Object.entries(localeToLang)) {
  const file = path.join(dir, `${locale}.json`);
  const data = JSON.parse(fs.readFileSync(file, 'utf8'));
  let added = 0;
  for (const key of enKeys) {
    if (key in data) continue;
    const source = en[key];
    if (keepEnglish.has(key)) {
      data[key] = source;
      added += 1;
      continue;
    }
    const translated = await translateText(source, lang);
    data[key] = restorePlaceholders(source, translated);
    added += 1;
    await sleep(120);
  }
  const ordered = {};
  for (const key of enKeys) ordered[key] = data[key] ?? en[key];
  fs.writeFileSync(file, `${JSON.stringify(ordered, null, 2)}\n`, 'utf8');
  console.log(`${locale}: added ${added} keys`);
}
