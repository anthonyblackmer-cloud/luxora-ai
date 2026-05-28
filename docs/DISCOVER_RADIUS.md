# Discover radius (Orlando hub)

Guests choose how far they will travel from **Orlando** (downtown anchor). Feed, Map, and Gems filter the curated catalog by great-circle distance.

## Radius options

| Chip | Miles | Typical use |
|------|-------|-------------|
| 25 mi | 25 | Theme parks, Winter Park, Wekiwa, I-Drive |
| 50 mi | 50 | **Default** — springs, Space Coast, Sanford |
| 100 mi | 100 | Tampa, Daytona, Clearwater day trips |
| All Florida | ∞ | Keys, Miami, statewide highlights |

Preference is stored in SharedPreferences (`luxora_discover_radius`).

## Data sources

1. **Shipped catalog** — `curated_places_catalog.dart` merges core, `curated_places_attractions.dart`, and `curated_places_major_attractions.dart` (**75+ map pins**, major theme parks, museums, beaches, springs, and statewide icons).
2. **Unsplash** — hero imagery via `assets/unsplash/curated.json` (run `dart run tool/sync_unsplash_curated.dart` to refresh).
3. **Supabase (optional)** — when `SUPABASE_URL` and `SUPABASE_ANON_KEY` are set, `PlacesRepository` merges rows from `public.places` (see `002_places_geo.sql`).

## Adding destinations

1. Add a `LuxPlace` row to `curated_places_attractions.dart` (lat/lng required).
2. Map Feed/Gem cards in `kFeedItemPlaceIds` / `kGemPlaceIds` if needed.
3. Add Unsplash search in `tool/unsplash_place_searches.dart` and run sync.
4. Optionally insert the same row in Supabase with matching `external_id`.

## Supabase configure

```bash
flutter run --dart-define=SUPABASE_URL=https://xxx.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=eyJ...
```

Seed example: `supabase/seed/places_orlando_seed.json`.
