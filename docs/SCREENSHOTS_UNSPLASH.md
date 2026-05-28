# Screenshot checklist — Unsplash API review

Capture on a device or simulator with network access and `config/unsplash.local.json` configured (see README).

## Required shots

1. **Luxora AI branding** — Landing or Concierge header showing “Luxora AI” (not Unsplash).
2. **Feed hero** — Experience Feed card with photo + overlay badge + **“Photo by … on Unsplash”** at bottom of image.
3. **Gems card** — Hidden Gems with moody hero + attribution bar.
4. **Trips cover** — Saved trip card with mood cover + attribution.
5. **Timeline** — Itinerary with thumbnail + compact attribution.
6. **Tap / select flow** — Feed or Gems card after tap (optional: network log showing `download_location` request).
7. **Visual distinction** — Side-by-side or single frame showing Luxora dark glass UI vs generic Unsplash website (not required in-app; marketing collage OK).

## What reviewers should see

- Images load from `images.unsplash.com` (hotlink).
- Photographer name is a tappable link.
- “Unsplash” is tappable and opens https://unsplash.com
- No “Unsplash” in app title, icon, or primary navigation labels.

## Build command

```bash
flutter run --release --dart-define-from-file=config/unsplash.local.json
```

Or use **Run and Debug → Luxora AI** in Cursor.
