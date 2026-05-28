# Map setup (Luxora AI)

## What works today

The **Map** tab uses [flutter_map](https://pub.dev/packages/flutter_map) with **OpenStreetMap** tiles. No API key is required for local dev.

- Pins come from `lib/data/curated_places_catalog.dart` (`latitude` / `longitude` on each `LuxPlace`).
- **Gold diamonds** = Gems (`kGemPlaceIds`).
- **Cyan markers** = sample itinerary stops (`kItineraryMomentPlaceIds`).
- **Gold line** = mood route between itinerary stops.

Run the app (full restart after `flutter pub get`):

```text
cd luxora_ai
flutter pub get
flutter run -d chrome
```

Open **Map** → pinch/zoom and pan. Tap a pin for the place name.

## Why it was blank before

`map_screen.dart` was a Phase 0 **placeholder** (“Immersive map loading”). No map package was wired until `flutter_map` was added.

## Upgrade to Mapbox (roadmap)

1. Create a [Mapbox](https://account.mapbox.com/) account and a **public access token**.
2. Add `mapbox_maps_flutter` (or keep `flutter_map` and swap the tile URL to Mapbox raster tiles).
3. Store the token in `config/mapbox.local.json` (gitignored), same pattern as `config/unsplash.local.json`:

   ```json
   { "MAPBOX_ACCESS_TOKEN": "pk.eyJ..." }
   ```

4. Pass via launch config: `--dart-define-from-file=config/mapbox.local.json`.
5. Replace the `TileLayer` in `lib/widgets/lux_florida_map.dart` with Mapbox tiles or the official Mapbox widget.

## Supabase (Phase 2)

When `places` moves to Supabase, add `latitude` and `longitude` columns (see `supabase/migrations/001_places.sql`) and load pins from `PlacesRepository.fetchFromSupabase` instead of the local catalog only.

## Production note (OSM)

OpenStreetMap tile servers are for **light development use**. For a shipped app, use Mapbox, MapTiler, or another tile provider with a proper license.
