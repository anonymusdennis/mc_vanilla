# Ultimate Survival — Client Pack (Git source of truth)

This repository is the **client modpack** tracked by [PackSync](https://github.com/anonymusdennis/packsync).  
Push changes here; players see a diff on game start and can apply updates.

## Layout

```
mods/           Official optional/client mods (Jade, AppleSkin, Distant Horizons, etc.)
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

## Distant Horizons

Optional client-only LOD mod. Place the NeoForge 1.21.1 jar in `mods/` when you want it in the official pack.

## Server

Connect to `178.104.221.45:25566` — server runs Tectonic and server-side mods; clients do not need them.
