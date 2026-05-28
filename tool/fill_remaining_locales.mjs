/**
 * Fills it, pt, ru, hi, tr, ja, ko JSON from English via Google Translate (unofficial).
 * Run: node tool/fill_remaining_locales.mjs
 */
import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve('.');
const en = JSON.parse(
  fs.readFileSync(path.join(root, 'lib/l10n/app_en.arb'), 'utf8'),
);
const keys = Object.keys(en).filter((k) => !k.startsWith('@'));
const outDir = path.join(root, 'tool/l10n_translations');

const LOCALES = {
  it: 'it',
  pt: 'pt',
  ru: 'ru',
  hi: 'hi',
  tr: 'tr',
  ja: 'ja',
  ko: 'ko',
};

const SKIP_KEYS = new Set(['appTitle', 'conciergeBrand']);

async function translateText(text, target) {
  const url = new URL(
    'https://translate.googleapis.com/translate_a/single',
  );
  url.searchParams.set('client', 'gtx');
  url.searchParams.set('sl', 'en');
  url.searchParams.set('tl', target);
  url.searchParams.set('dt', 't');
  url.searchParams.set('q', text);
  const res = await fetch(url);
  if (!res.ok) {
    throw new Error(`HTTP ${res.status}`);
  }
  const data = await res.json();
  return data[0].map((part) => part[0]).join('');
}

function sleep(ms) {
  return new Promise((r) => setTimeout(r, ms));
}

async function translateLocale(locale, target) {
  const outPath = path.join(outDir, `${locale}.json`);
  const data = {};
  let i = 0;
  for (const key of keys) {
    const value = en[key];
    if (SKIP_KEYS.has(key)) {
      data[key] = value;
      continue;
    }
    try {
      data[key] = await translateText(value, target);
    } catch (err) {
      console.warn(`  ${key}: ${err.message}, keeping EN`);
      data[key] = value;
    }
    i += 1;
    if (i % 15 === 0) {
      process.stdout.write(`  ${locale}: ${i}/${keys.length}\r`);
      await sleep(400);
    }
  }
  fs.writeFileSync(
    outPath,
    `${JSON.stringify(data, null, 2)}\n`,
    'utf8',
  );
  console.log(`${locale}: wrote ${keys.length} keys`);
}

for (const [locale, target] of Object.entries(LOCALES)) {
  console.log(`Translating ${locale}...`);
  await translateLocale(locale, target);
  await sleep(800);
}

console.log('done');
