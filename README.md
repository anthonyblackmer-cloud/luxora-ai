# Luxora AI (Flutter — App Store & Play Store)

**Luxora AI** is an emotionally intelligent AI travel concierge that helps users discover, plan, and personalize unforgettable trips through curated itineraries, hidden gems, local experiences, and stress-free travel planning.

Downloadable **iOS and Android** app — Florida-first (Orlando MVP).

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

## Project layout

| Path | Purpose |
|------|---------|
| `lib/main.dart` | App entry |
| `lib/router/` | Navigation (go_router) |
| `lib/screens/` | Landing, onboarding, concierge, itinerary, map, gems, experiences, trips |
| `lib/theme/` | Luxury cinematic theme |
| `lib/data/` | Florida MVP catalog |
| `android/` · `ios/` | Store-ready native projects |

## Store release (later)

1. **Apple:** Apple Developer account → Xcode archive → App Store Connect  
2. **Google:** Play Console → signed AAB from `flutter build appbundle`  
3. Icons, screenshots, privacy policy, and app description

## Related folder

`d:\Beta build\luxora-ai` — Next.js **web prototype** (same product vision). **This Flutter repo is the real “app people download.”**

## Roadmap

See `docs/ROADMAP.md` — OpenAI, Supabase, Mapbox plug into Flutter via API packages.
