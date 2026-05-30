# Supabase setup (Luxora AI)

Connect your Supabase project to the Flutter app and live Concierge AI.

## 1. Copy API keys from the dashboard

In [Supabase Dashboard](https://supabase.com/dashboard) → your project → **Project Settings** → **API**:

| Field | Use in app |
|-------|------------|
| **Project URL** | `SUPABASE_URL` |
| **Publishable** key (`sb_publishable_...`) or legacy **anon** key (`eyJ...`) | `SUPABASE_ANON_KEY` |

Never put `service_role` or `sb_secret_...` in the app — only the publishable/anon key.

## 2. Add keys to local config

From the `luxora_ai` folder:

```bash
dart run tool/setup_supabase_config.dart \
  --url=https://YOUR_PROJECT.supabase.co \
  --anon-key=eyJ...
```

Or edit `config/unsplash.local.json` manually (gitignored):

```json
{
  "UNSPLASH_ACCESS_KEY": "...",
  "SUPABASE_URL": "https://YOUR_PROJECT.supabase.co",
  "SUPABASE_ANON_KEY": "eyJ..."
}
```

Run the app with **Run and Debug → Luxora AI** (uses `--dart-define-from-file=config/unsplash.local.json`).

## 3. Run database SQL

Dashboard → **SQL Editor** → paste and run the full contents of:

`supabase/setup_all.sql`

This creates the `places` table and allows the app to read active rows with the anon key.

## 4. Deploy Concierge AI (edge function)

### Option A — Supabase CLI (recommended)

```bash
cd "d:\Beta build\luxora_ai"
npx supabase login
npx supabase link --project-ref YOUR_PROJECT_REF
npx supabase secrets set OPENAI_API_KEY=sk-...
npx supabase functions deploy concierge-chat
```

Project ref is the short id in your dashboard URL: `https://supabase.com/dashboard/project/YOUR_PROJECT_REF`.

### Option B — Dashboard

1. **Edge Functions** → create function `concierge-chat`
2. Paste code from `supabase/functions/concierge-chat/index.ts`
3. **Secrets** → add `OPENAI_API_KEY` (your OpenAI key)

## 5. Verify

1. Restart the app (hot restart is not enough after changing dart-defines).
2. Debug console should show: `Supabase: connected (https://...)`
3. Open **Concierge** → send a message → real GPT reply (not the setup banner).

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| Setup message in Concierge | Add keys to `unsplash.local.json` and cold-restart |
| `SupabaseBootstrap` error in console | Check URL/key; project must be running |
| 503 OPENAI_API_KEY | Set secret on edge function |
| Places not syncing | Run `setup_all.sql`; table can be empty until you seed rows |

See also: `docs/CONCIERGE_AI.md`, `docs/DISCOVER_RADIUS.md`.
