#!/usr/bin/env bash
# Regenerate pack-manifest.json with git blob SHAs for all pack files.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

python3 << 'PY'
import hashlib, json, os
from pathlib import Path

def git_blob_sha1(data: bytes) -> str:
    header = f"blob {len(data)}\0".encode()
    return hashlib.sha1(header + data).hexdigest()

files = []
for folder in ("mods", "config", "defaultconfigs", "shaderpacks"):
    p = Path(folder)
    if not p.exists():
        continue
    for f in sorted(p.rglob("*")):
        if not f.is_file() or f.name.startswith("."):
            continue
        rel = f.as_posix()
        data = f.read_bytes()
        files.append({
            "path": rel,
            "sha1": git_blob_sha1(data),
            "size": len(data),
        })

manifest = {
    "format": 1,
    "description": "Ultimate Survival client pack index (git blob SHAs)",
    "files": files,
}
Path("pack-manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
print(f"Wrote pack-manifest.json with {len(files)} file(s)")
PY
