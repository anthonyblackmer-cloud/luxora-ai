# Google Places API (New)

Luxora uses **Places API (New)** for real venue photos and website links when a place row does not already have them from OSM or the curated catalog.

## 1. Google Cloud

1. [Google Cloud Console](https://console.cloud.google.com/) → your project  
2. **Billing** → link a billing account  
3. **APIs & Services → Library** → enable **Places API (New)**  
4. **Credentials → Create credentials → API key**  
5. Restrict the key to **Places API (New)** (and your app/server as needed)

## 2. Local app config

Copy `config/unsplash.local.json.example` → `config/unsplash.local.json` if needed, then add:

```json
{
  "GOOGLE_PLACES_API_KEY": "AIza..."
}
```

Run with the existing VS Code launch config (**Luxora AI**), which already passes:

```text
--dart-define-from-file=config/unsplash.local.json
```

Or:

```text
flutter run --dart-define-from-file=config/unsplash.local.json
```

## 3. What happens in the app

| Component | Behavior |
|-----------|----------|
| `GooglePlacesConfig` | Reads `GOOGLE_PLACES_API_KEY` via `String.fromEnvironment` |
| `GooglePlacesApiClient` | Calls Places API (New) — text search, details, photo media |
| `GooglePlacesEnrichmentService` | Matches curated places by name + location; caches photo URL + website |
| `LuxPlaceImage` | Shows Google venue photo when enriched; otherwise Unsplash |
| Attraction detail sheet | Opens venue website from OSM, curated data, or Google enrichment |

If the key is **empty**, everything falls back to the existing Unsplash + catalog behavior.

## 4. CI (Codemagic)

Add to group `appstore_credentials`:

```text
GOOGLE_PLACES_API_KEY
```

The build script writes it into `build/dart_defines.json` automatically.

## 5. Quick API test

```powershell
curl.exe -X POST "https://places.googleapis.com/v1/places:searchText" `
  -H "Content-Type: application/json" `
  -H "X-Goog-Api-Key: YOUR_KEY" `
  -H "X-Goog-FieldMask: places.displayName,places.id" `
  -d "{\"textQuery\":\"Luma on Park Winter Park FL\"}"
```

## Security note

For production, prefer calling Places from a **Supabase edge function** so the key is not shipped in the app binary. The current integration uses the dart-define pattern (same as Mapbox/Unsplash) for development and early releases.
