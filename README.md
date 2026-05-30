# Luxora AI (Flutter — App Store & Play Store)

**Luxora AI** is an emotionally intelligent AI travel concierge that helps users discover, plan, and personalize unforgettable trips through curated itineraries, hidden gems, local experiences, and stress-free travel planning.

Downloadable **iOS and Android** app — Florida-first (Orlando MVP).

**Discover radius:** Feed, Map, and Gems filter **75+ curated destinations** (major theme parks, museums, springs, beaches, Space Coast, Tampa, Keys, and more) by distance from Orlando (25 / 50 / 100 mi or All Florida). See `docs/DISCOVER_RADIUS.md`. Optional Supabase sync via `--dart-define=SUPABASE_URL` + `SUPABASE_ANON_KEY`.

> The vacation already started.

### Unsplash imagery

Hero photos comply with the [Unsplash API](https://unsplash.com/developers). See `docs/UNSPLASH_COMPLIANCE.md`.

**One-time setup** (Access Key only — never the secret):

```bash
cd "d:\Beta build\luxora_ai"
copy config\unsplash.local.json.example config\unsplash.local.json
```

Edit `config/unsplash.local.json` and paste your Unsplash **Access Key**. That file is gitignored.

Then run from **Run and Debug → “Luxora AI”** in Cursor/VS Code, or:

```bash
flutter run --dart-define-from-file=config/unsplash.local.json
dart run tool/sync_unsplash_curated.dart
```

## Run the app

```bash
cd "d:\Beta build\luxora_ai"
flutter pub get
flutter run
```

Pick a device:

- **iPhone / Android phone** (USB or wireless debugging)
- **iOS Simulator** / **Android Emulator**
- `flutter run -d chrome` — web preview only (not the store build)

## GitHub repository

Local git is initialized on branch `main`. Remote (after you create the repo on GitHub):

**https://github.com/anthonyblackmer-cloud/luxora-ai**

One-time push (GitHub CLI was installed; you must sign in once):

```powershell
cd "d:\Beta build\luxora_ai"
gh auth login
gh repo create luxora-ai --private --source=. --remote=origin --push
```

If the empty repo already exists on GitHub, use:

```powershell
git push -u origin main
```

`config/unsplash.local.json` stays **gitignored** — never commit API keys.

## Codemagic

`codemagic.yaml` defines `luxora-ios-workflow` and `luxora-android-workflow`. In Codemagic: **Add application** → paste the repo URL above → enable YAML → configure signing for `com.luxora.luxoraAi` / `com.luxora.luxora_ai`.

Add these **Secrets** to `appstore_credentials` (iOS) and `google_play` (Android):

| Secret | Purpose |
|--------|---------|
| `UNSPLASH_ACCESS_KEY` | Hero / curated photos |
| `SUPABASE_URL` | Live Concierge backend |
| `SUPABASE_ANON_KEY` | Supabase anon or publishable key |

Keep `OPENAI_API_KEY` **only** in Supabase Edge Function secrets — not in Codemagic.

## Project layout

| Path | Purpose |
|------|---------|
| `lib/main.dart` | App entry |
| `lib/router/` | Navigation (go_router) |
| `lib/screens/` | Landing, onboarding, concierge, itinerary, map, gems, experiences, trips |
| `lib/theme/` | Luxury cinematic theme |
| `lib/data/` | Florida MVP catalog |
| `android/` · `ios/` | Store-ready native projects |
| `codemagic.yaml` | CI: iOS IPA + Android AAB |
| `assets/branding/app_icon.png` | Master app icon |

## Store release (later)

1. **Apple:** Apple Developer account → Xcode archive → App Store Connect  
2. **Google:** Play Console → signed AAB from `flutter build appbundle`  
3. Icons, screenshots, privacy policy, and app description

## Related folder

`d:\Beta build\luxora-ai` — Next.js **web prototype** (same product vision). **This Flutter repo is the real “app people download.”**

## Roadmap

See `docs/ROADMAP.md` — OpenAI, Supabase, Mapbox plug into Flutter via API packages.
