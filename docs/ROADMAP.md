# Luxora AI Flutter — Roadmap

## Phase 0 ✅

- Flutter iOS + Android project
- Cinematic theme, 8 flows, bottom navigation
- Emotional onboarding + local trip profile (SharedPreferences)
- Mock concierge + sample itinerary (replaced by live OpenAI when Supabase configured)

## Phase 1 — Ship-ready MVP

- [x] Curated place imagery + tab-specific presentation (`docs/IMAGE_STRATEGY.md`)
- [ ] Supabase `places` table + Storage bucket (SQL in `supabase/migrations/`)
- [ ] Wire `PlacesRepository` to Supabase (replace local catalog URLs)
- [x] OpenAI via backend — Edge Function `concierge-chat` + `ConciergeAiService` (see `docs/CONCIERGE_AI.md`)
- [ ] Supabase auth + cloud saved trips
- [ ] Mapbox Flutter map
- [ ] App icons, splash, store listings

## Phase 1b — Image language (in progress)

- [x] Feed heroes — vibrant editorial (`LuxImagePresentation.feedHero`)
- [x] Gems — moody scrim (`LuxImagePresentation.gemMood`)
- [x] Timeline thumbs (`LuxImagePresentation.timelineThumb`)
- [x] Trip mood covers (`TripCoverResolver`)
- [ ] AI-generated trip covers from profile + style memory

## Phase 2 — Growth

- [ ] Push notifications (trip reminders, weather)
- [ ] Shareable itinerary cards
- [ ] In-app purchases / premium tier (optional)
