#!/usr/bin/env bash
# Codemagic: write build/dart_defines.json for `flutter build ipa --dart-define-from-file=...`
# Always emits string values (never bare --dart-define=KEY with no value).
#
# Required in group `appstore_credentials` (or workflow env):
#   UNSPLASH_ACCESS_KEY, SUPABASE_URL, SUPABASE_ANON_KEY
# Optional:
#   MAPBOX_ACCESS_TOKEN (empty string ok — map uses Carto/OSM skins)
#   GOOGLE_PLACES_API_KEY (empty string ok — falls back to Unsplash heroes)
#   SUPABASE_CONCIERGE_FUNCTION (defaults to bright-processor)
#   ALLOW_MISSING_LUXORA_KEYS=1 — write empty strings instead of failing

set -euo pipefail

ROOT="${CM_BUILD_DIR:-$PWD}"
export ROOT
mkdir -p "$ROOT/build"

python3 << 'PY'
import json, os, sys

root = os.environ.get("ROOT") or os.getcwd()
unsplash = (os.environ.get("UNSPLASH_ACCESS_KEY") or "").strip()
supabase_url = (os.environ.get("SUPABASE_URL") or "").strip()
supabase_anon = (os.environ.get("SUPABASE_ANON_KEY") or "").strip()
mapbox = (os.environ.get("MAPBOX_ACCESS_TOKEN") or "").strip()
google_places = (os.environ.get("GOOGLE_PLACES_API_KEY") or "").strip()
concierge_fn = (
    os.environ.get("SUPABASE_CONCIERGE_FUNCTION") or "bright-processor"
).strip()
allow = (os.environ.get("ALLOW_MISSING_LUXORA_KEYS") or "").strip().lower() in (
    "1",
    "true",
    "yes",
)

out = os.path.join(root, "build", "dart_defines.json")
payload = {
    "UNSPLASH_ACCESS_KEY": unsplash,
    "SUPABASE_URL": supabase_url,
    "SUPABASE_ANON_KEY": supabase_anon,
    "SUPABASE_CONCIERGE_FUNCTION": concierge_fn,
    "MAPBOX_ACCESS_TOKEN": mapbox,
    "GOOGLE_PLACES_API_KEY": google_places,
}
with open(out, "w", encoding="utf-8") as f:
    json.dump(payload, f, ensure_ascii=False)

print("=== Luxora dart-define file (lengths only) ===")
for k, v in payload.items():
    print(f"{k} length:", len(v))
print("wrote:", out)

missing = [k for k in ("UNSPLASH_ACCESS_KEY", "SUPABASE_URL", "SUPABASE_ANON_KEY") if not payload[k]]
if missing and not allow:
    print(
        f"\nMissing required env: {', '.join(missing)}.\n"
        "Codemagic → Environment variables → group `appstore_credentials`.\n"
        "Do NOT add bare `--dart-define=MAPBOX_ACCESS_TOKEN` in the UI — use this script + yaml.\n"
        "Temporary bypass: ALLOW_MISSING_LUXORA_KEYS=1",
        file=sys.stderr,
    )
    sys.exit(1)
if allow and missing:
    print("ALLOW_MISSING_LUXORA_KEYS set — continuing with empty defines.", file=sys.stderr)
PY
