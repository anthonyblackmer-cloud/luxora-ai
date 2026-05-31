/**
 * Forces localized onboarding chip labels when machine translation left English cognates.
 * Run after sync_english_fallbacks.mjs: node tool/fix_onboarding_chip_labels.mjs
 */
import fs from 'node:fs';
import path from 'node:path';

const dir = path.join(path.resolve('.'), 'tool/l10n_translations');

/** key -> locale -> label */
const overrides = {
  onboardPrefTravelerSolo: {
    es: 'En solitario',
    fr: 'Seul(e)',
    de: 'Allein',
    it: 'Da solo',
    pt: 'Sozinho',
    tr: 'Yalnız',
  },
  onboardPrefStyleFoodie: {
    tr: 'Gurme',
    pt: 'Gourmet',
  },
  onboardPrefStyleShopping: {
    it: 'Acquisti',
    fr: 'Achats',
  },
  onboardPrefStyleRelaxation: {
    fr: 'Détente',
  },
  onboardPrefStyleRomance: {
    fr: 'Romantisme',
    pt: 'Romantismo',
  },
  onboardPrefGoalRelaxation: {
    fr: 'Détente',
  },
  onboardPrefGoalRomance: {
    fr: 'Romantisme',
    pt: 'Romantismo',
  },
  onboardPrefTravelerCouple: {
    fr: 'En couple',
  },
  onboardPrefCuisineFoodTrucks: {
    pt: 'Food trucks',
  },
  onboardPrefStyleWellness: {
    de: 'Wohlbefinden',
  },
  onboardPrefAmenityPool: {
    de: 'Swimmingpool',
  },
  onboardPrefAmenitySpa: {
    es: 'Balneario',
    fr: 'Spa',
    de: 'Wellness-Spa',
    it: 'Centro benessere',
    pt: 'Spa',
    tr: 'Spa',
  },
  onboardPrefCuisineSushi: {
    de: 'Sushi',
    it: 'Sushi giapponese',
  },
  onboardPrefCuisineBrunch: {
    de: 'Brunch',
    fr: 'Brunch',
    it: 'Brunch',
    pt: 'Brunch',
    tr: 'Brunch',
  },
  onboardPrefCuisineDessert: {
    fr: 'Desserts',
    it: 'Dolci',
  },
  onboardPrefCuisineSteakhouse: {
    fr: 'Grillades',
  },
  onboardPrefExpGolf: {
    es: 'Golf',
    fr: 'Golf',
    de: 'Golf',
    it: 'Golf',
    pt: 'Golf',
    tr: 'Golf',
  },
  onboardPrefExpSpas: {
    de: 'Spa & Wellness',
    fr: 'Spas',
    pt: 'Spas e bem-estar',
  },
  onboardPrefExpShopping: {
    it: 'Acquisti',
  },
  onboardPrefExpSnorkeling: {
    it: 'Snorkeling subacqueo',
  },
  onboardPrefEmotionMemorable: {
    es: 'Inolvidable',
  },
  onboardPrefAvoidLateNights: {
    tr: 'Geç saatler',
  },
  onboardSummaryHotels: {
    de: 'Unterkünfte',
    fr: 'Hôtels',
  },
  onboardSummaryRestaurants: {
    de: 'Restaurants',
    fr: 'Restaurants',
    es: 'Restaurantes',
  },
  onboardLuxoraReplyEyebrow: {
    de: 'LUXORA',
    fr: 'LUXORA',
    it: 'LUXORA',
    pt: 'LUXORA',
    tr: 'LUXORA',
  },
  onboardDestination: {
    fr: 'Destination',
  },
};

let patched = 0;
for (const [locale, file] of Object.entries(
  Object.fromEntries(
    fs.readdirSync(dir).filter((f) => f.endsWith('.json')).map((f) => [
      f.replace('.json', ''),
      path.join(dir, f),
    ]),
  ),
)) {
  const data = JSON.parse(fs.readFileSync(file, 'utf8'));
  let localePatched = 0;
  for (const [key, byLocale] of Object.entries(overrides)) {
    const value = byLocale[locale];
    if (value == null || !(key in data)) continue;
    if (data[key] !== value) {
      data[key] = value;
      localePatched += 1;
    }
  }
  if (localePatched > 0) {
    fs.writeFileSync(file, `${JSON.stringify(data, null, 2)}\n`, 'utf8');
    console.log(`${locale}: patched ${localePatched} chip labels`);
    patched += localePatched;
  }
}
console.log(`done (${patched} total overrides)`);
