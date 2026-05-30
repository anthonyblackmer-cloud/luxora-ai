# Luxora AI local secrets

## Setup (once)

1. Copy `unsplash.local.json.example` → `unsplash.local.json` in **this folder** (`luxora_ai/config/`).
2. Paste your Unsplash **Access Key** and (for live Concierge) Supabase keys:

```json
{
  "UNSPLASH_ACCESS_KEY": "your_access_key_here",
  "SUPABASE_URL": "https://YOUR_PROJECT.supabase.co",
  "SUPABASE_ANON_KEY": "your_anon_key"
}
```

3. Run `supabase/setup_all.sql` in the Supabase SQL Editor (creates `places` table + RLS).
4. Deploy the concierge edge function and set `OPENAI_API_KEY` in Supabase secrets — see `docs/SUPABASE_SETUP.md` and `docs/CONCIERGE_AI.md`.

5. Run **Luxora AI** from `luxora_ai/.vscode/launch.json` (Run and Debug → **Luxora AI**).
`unsplash.local.json` is gitignored.

**This file is not used by the Discipline trading app.** That app uses `.env` in its own project folder.
