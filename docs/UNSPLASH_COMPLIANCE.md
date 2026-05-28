# Unsplash API compliance — Luxora AI

Luxora AI uses the [Unsplash API](https://unsplash.com/developers) for hero imagery. The app name is **Luxora AI** — never “Unsplash” in product branding.

## Implementation

| Requirement | Location |
|-------------|----------|
| Hotlink only (`urls.regular` from API) | `UnsplashImage` → `Image.network(photo.hotlinkUrl)` |
| No disk cache / rehost | No `CachedNetworkImage`; no local Unsplash assets |
| Attribution on every photo | `UnsplashAttribution` inside `UnsplashImage` |
| Download tracking | `UnsplashDownloadTracker` → `GET links.download_location` + `Client-ID` |
| Single render path | `LuxPlaceImage` → `UnsplashImage` only when `unsplashPhoto` is set |

## Access key (one-time local file)

1. Copy `config/unsplash.local.json.example` → `config/unsplash.local.json`
2. Paste your Unsplash **Access Key** (not the secret key)
3. Run via **Run and Debug → Luxora AI** in Cursor/VS Code (uses `--dart-define-from-file`)

`config/unsplash.local.json` is gitignored.

Refresh canonical metadata + hotlink URLs from the API:

```bash
dart run tool/sync_unsplash_curated.dart
```

Commit the updated `assets/unsplash/curated.json` before store submission.

## When download tracking fires

- Trip cover displayed (`trackUsageOnDisplay`)
- Timeline thumb on itinerary (`trackUsageOnDisplay`)
- User taps Feed or Gems card (`trackUsage` on tap)
- User taps any `UnsplashImage` (image tap)

## Screenshots for Unsplash application

See `docs/SCREENSHOTS_UNSPLASH.md`.

## App description (stores)

Luxora AI is an emotionally intelligent AI travel concierge that helps users discover, plan, and personalize unforgettable trips through curated itineraries, hidden gems, local experiences, and stress-free travel planning.
