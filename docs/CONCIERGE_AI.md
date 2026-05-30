# Live Concierge AI

Luxora's Concierge tab calls a **Supabase Edge Function** that proxies **OpenAI**. The API key never ships in the app.

## Architecture

```
Flutter ConciergeScreen
  → ConciergeContextBuilder (trip profile, style prefs, curated places)
  → ConciergeAiService (HTTP POST)
  → Supabase Edge Function: concierge-chat
  → OpenAI (gpt-4o-mini by default)
```

## One-time setup

### 1. Supabase project

Create a project at [supabase.com](https://supabase.com) or use an existing one.

### 2. Deploy the edge function

From the repo root:

```bash
cd "d:\Beta build\luxora_ai"
supabase login
supabase link --project-ref YOUR_PROJECT_REF
supabase secrets set OPENAI_API_KEY=sk-...
# Optional: supabase secrets set OPENAI_MODEL=gpt-4o
supabase functions deploy concierge-chat
```

The function lives at `supabase/functions/concierge-chat/index.ts`.

### 3. Local app config

Add Supabase keys to your gitignored local config. Easiest: extend `config/unsplash.local.json`:

```json
{
  "UNSPLASH_ACCESS_KEY": "your_unsplash_key",
  "SUPABASE_URL": "https://YOUR_PROJECT.supabase.co",
  "SUPABASE_ANON_KEY": "your_anon_key"
}
```

Run with **Run and Debug → Luxora AI** (uses `--dart-define-from-file=config/unsplash.local.json`).

Or pass defines manually:

```bash
flutter run \
  --dart-define-from-file=config/unsplash.local.json \
  --dart-define=SUPABASE_URL=https://YOUR_PROJECT.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=eyJ...
```

### 4. Verify

1. Open the Concierge tab.
2. If not configured, you'll see a setup message (not fake vacation prose).
3. After config + deploy, send a message — you should see "Luxora is thinking…" then a real GPT reply grounded in your trip profile and curated places.

## Context sent to the model

Each request includes:

- Active city pack (Orlando, Miami, etc.)
- Trip feel, moods, budget, party size, occasion
- Style memory chips
- Up to 18 curated place titles from Gems / discover radius (IDs the app knows)

The system prompt instructs the model to recommend from that list and avoid inventing ticket prices.

## Production / Codemagic

Add `SUPABASE_URL` and `SUPABASE_ANON_KEY` to your Codemagic `dart_defines.json` generation (alongside Unsplash). Keep `OPENAI_API_KEY` **only** in Supabase secrets.

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| Setup message on every send | Add `SUPABASE_URL` + `SUPABASE_ANON_KEY` to dart-defines |
| 503 OPENAI_API_KEY not configured | Run `supabase secrets set OPENAI_API_KEY=...` |
| 401 from function | Check anon key matches project |
| Generic error | Check Supabase function logs in dashboard |

## Tests

```bash
flutter test test/concierge_context_builder_test.dart
```
