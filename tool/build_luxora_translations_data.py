#!/usr/bin/env python3
"""Generates tool/luxora_translations_data.dart from tool/l10n_translations/*.json"""

from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC_DIR = Path(__file__).resolve().parent / "l10n_translations"
OUT = ROOT / "tool" / "luxora_translations_data.dart"
LOCALE_ORDER = ["es", "fr", "de", "zh", "ko", "ja", "ru", "it", "hi", "pt", "tr"]


def dart_str(value: str) -> str:
    escaped = (
        value.replace("\\", "\\\\")
        .replace("'", "\\'")
        .replace("\n", "\\n")
        .replace("$", r"\$")
    )
    return f"'{escaped}'"


def main() -> None:
    en = json.loads((ROOT / "lib/l10n/app_en.arb").read_text(encoding="utf-8"))
    en_keys = sorted(k for k in en if not k.startswith("@"))

    lines = [
        "// Luxora UI translations (non-English).",
        "// Regenerate: python tool/build_luxora_translations_data.py",
        "// ignore_for_file: lines_longer_than_80_chars",
        "",
        "const luxoraTranslationsByLocale = <String, Map<String, String>>{",
    ]

    for locale in LOCALE_ORDER:
        path = SRC_DIR / f"{locale}.json"
        data = json.loads(path.read_text(encoding="utf-8"))
        missing = [k for k in en_keys if k not in data]
        extra = [k for k in data if k not in en_keys]
        if missing:
            raise SystemExit(f"{locale} missing {len(missing)} keys: {missing[:5]}...")
        if extra:
            raise SystemExit(f"{locale} extra keys: {extra[:5]}...")
        lines.append(f"  '{locale}': {{")
        for key in en_keys:
            lines.append(f"    '{key}': {dart_str(data[key])},")
        lines.append("  },")

    lines.append("};")
    lines.append("")
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {OUT} ({len(LOCALE_ORDER)} locales, {len(en_keys)} keys each)")


if __name__ == "__main__":
    main()
