/**
 * Re-translates keys in tool/l10n_translations/*.json that still match English.
 * Also adds any keys missing from app_en.arb.
 * Run: node tool/sync_english_fallbacks.mjs
 */
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
  const toTranslate = enKeys.filter((key) => {
    if (keepEnglish.has(key)) return false;
    if (!(key in data)) return true;
    return data[key] === en[key];
  });

  if (toTranslate.length === 0) {
    console.log(`${locale}: up to date`);
    continue;
  }

  console.log(`${locale}: translating ${toTranslate.length} keys...`);
  let done = 0;
  for (const key of toTranslate) {
    const source = en[key];
    try {
      const translated = await translateText(source, lang);
      data[key] = restorePlaceholders(source, translated);
    } catch (err) {
      console.warn(`  ${key}: ${err.message}`);
      data[key] = source;
    }
    done += 1;
    if (done % 10 === 0) {
      process.stdout.write(`  ${locale}: ${done}/${toTranslate.length}\r`);
    }
    await sleep(100);
  }

  const ordered = {};
  for (const key of enKeys) ordered[key] = data[key] ?? en[key];
  fs.writeFileSync(file, `${JSON.stringify(ordered, null, 2)}\n`, 'utf8');
  console.log(`${locale}: wrote ${toTranslate.length} updates`);
}

console.log('done');
