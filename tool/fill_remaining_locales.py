#!/usr/bin/env python3
"""Translate app_en.arb strings into it, pt, ru, hi, tr, ja, ko JSON files."""

from __future__ import annotations

import json
import time
from pathlib import Path

from deep_translator import GoogleTranslator

ROOT = Path(__file__).resolve().parent.parent
EN_PATH = ROOT / "lib/l10n/app_en.arb"
OUT_DIR = ROOT / "tool/l10n_translations"

# Google Translate language codes
LOCALES = {
    "it": "it",
    "pt": "pt",
    "ru": "ru",
    "hi": "hi",
    "tr": "tr",
    "ja": "ja",
    "ko": "ko",
}

KEEP_AS_EN = {"appTitle", "conciergeBrand", "LUXORA"}


def main() -> None:
    en = json.loads(EN_PATH.read_text(encoding="utf-8"))
    keys = sorted(k for k in en if not k.startswith("@"))

    OUT_DIR.mkdir(parents=True, exist_ok=True)

    for locale, target in LOCALES.items():
        out_path = OUT_DIR / f"{locale}.json"
        if out_path.exists():
            existing = json.loads(out_path.read_text(encoding="utf-8"))
            if all(existing.get(k) != en[k] for k in keys[:5] if k in existing):
                print(f"skip {locale} (already translated)")
                continue

        print(f"translating {locale}...")
        translator = GoogleTranslator(source="en", target=target)
        data: dict[str, str] = {}
        for i, key in enumerate(keys):
            value = en[key]
            if key in ("appTitle", "conciergeBrand"):
                data[key] = value
                continue
            try:
                data[key] = translator.translate(value)
            except Exception as exc:  # noqa: BLE001
                print(f"  {key} failed: {exc}, keeping en")
                data[key] = value
            if i % 20 == 0:
                time.sleep(0.3)
        out_path.write_text(
            json.dumps(data, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        print(f"wrote {out_path} ({len(data)} keys)")

    print("done")


if __name__ == "__main__":
    main()
