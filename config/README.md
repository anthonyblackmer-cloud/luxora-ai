# Luxora AI local secrets

## Setup (once)

1. Copy `unsplash.local.json.example` → `unsplash.local.json` in **this folder** (`luxora_ai/config/`).
2. Paste your Unsplash **Access Key** as the value (quotes required):

```json
{
  "UNSPLASH_ACCESS_KEY": "your_access_key_here"
}
```

3. Run **Luxora AI** from `luxora_ai/.vscode/launch.json` (Run and Debug → **Luxora AI**).

`unsplash.local.json` is gitignored.

**This file is not used by the Discipline trading app.** That app uses `.env` in its own project folder.
