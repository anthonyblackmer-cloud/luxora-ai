# Luxora image strategy

## Phase 1 — Curated heroes (current)

- **`places` catalog** in app (`lib/data/curated_places_catalog.dart`) mirrors future Supabase rows.
- **Unsplash API** — all heroes use `UnsplashImage` (hotlink + attribution + download tracking). See `docs/UNSPLASH_COMPLIANCE.md`.
- **`PlacesRepository`** resolves by id/slug; swap to Supabase for non-Unsplash assets later.
- **`LuxPlaceImage`** applies presentation per surface (Feed / Gems / Timeline / Trips).
- Run `dart run tool/sync_unsplash_curated.dart` before release to refresh `assets/unsplash/curated.json` from the API.

### Supabase schema (deploy when backend is live)

See `supabase/migrations/001_places.sql`.

## Phase 2 — Image language by tab

| Tab | Presentation | Intent |
|-----|----------------|--------|
| **Feed** | `LuxImagePresentation.feedHero` — tall, light scrim, slight vibrance | Editorial / trend / live energy |
| **Gems** | `LuxImagePresentation.gemMood` — shorter, heavy scrim, muted | Hidden luxury, insider quiet |
| **Timeline** | `LuxImagePresentation.timelineThumb` — 56px supporting | Context, not hero |
| **Trips** | `LuxImagePresentation.tripCover` — mood-matched banner | Trip identity |

Same `places` row; different crop/scrim in `LuxPlaceImage`.

## Scrim / readability

Hero surfaces (`feedHero`, `gemMood`, `tripCover`) use a **35–55% black gradient** in `LuxPlaceImage` so badges, mood labels, and Unsplash attribution stay readable without losing the luxury photo.

## Auto image matching (roadmap)

Search queries live in `tool/unsplash_place_searches.dart` (`unsplashPlaceSearchQueries` + `unsplashMoodSearchHints`).

Example future logic:

| Signal | Unsplash search |
|--------|-----------------|
| `rooftop sunset` | `rooftop sunset luxury restaurant Orlando` |
| `hidden spring` | `crystal springs Florida nature aerial` |
| `romantic escape` | `couple sunset luxury travel aesthetic` |
| `family bonding` | `Florida family outdoors springs kayaking kids` |

Refresh one place after changing a query:

```text
dart run tool/sync_unsplash_curated.dart --only cover-family-springs
```

## Phase 3 — Dynamic sourcing

1. Google Places Photos (venue truth, map pins)
2. Unsplash API (editorial filler, attributed) — mood → query → search → assign `unsplashPhotoId`
3. AI mood covers from `TripProfile` + concierge style memory

Store `cover_generation_id` on trips when AI covers ship.

## Long-term

Personalized trip mood imagery from destination + `tripFeel` + moods + budget band + style memory — stable until user changes intent.
