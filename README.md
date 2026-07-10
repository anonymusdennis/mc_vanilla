# Ultimate Survival — Client Pack (Git source of truth)

This repository is the **client modpack** tracked by PackSync.  
Push changes here; players see a diff on game start and can apply updates.

**Minecraft 26.2** / NeoForge 26.2 — requires **Java 25** on the client.

## Layout

```
mods/           Official optional/client mods (Distant Horizons, etc.)
config/         Shared client configs
defaultconfigs/
pack-manifest.json   Auto-generated file index (git blob SHAs)
```

## Workflow

1. Add or update files under `mods/` or `config/`
2. Run `./scripts/generate-manifest.sh`
3. Commit and push to `main`
4. Players launch Minecraft — PackSync shows what changed

## Custom player mods

Jars in `mods/` that are **not** in this repo are treated as player-installed and are **never** removed or updated.

## Server

Connect to `178.104.221.45:25566` — server runs Tectonic and server-side mods; clients do not need them.
