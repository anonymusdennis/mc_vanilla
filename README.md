# Ultimate Survival — Client Pack (Git source of truth)

This repository is the **optional client modpack** tracked by PackSync.  
Push changes here; players with PackSync installed see a diff on game start and can apply updates.

**Vanilla clients can join the server without any mods.** This pack is optional QoL.

**Minecraft 26.2** / NeoForge 26.2 — requires **Java 25** on the client.

## What's included

| Category | Mods |
|----------|------|
| **HUD / food** | AppleSkin, Jade (modern WAILA) |
| **Map** | JourneyMap |
| **Zoom** | Just Zoom |
| **Shaders** | Sodium + Iris + 118 shader packs |
| **Inventory** | Inventory Sorter (button only, no hotkeys) |
| **Crafting** | Crafting Tweaks (rotate / balance / clear) |
| **Craft from nearby chests** | QuickStack & Craft (JEI **[+]** pulls from nearby chests; client-only) |
| **Recipes** | JEI + WorldGen, Trades, Professions, Serverless Recipes |
| **Claims UI** | Open Parties and Claims (optional map overlay) |
| **LOD** | Distant Horizons (match server) |
| **Perf** | FerriteCore |
| **Updater** | PackSync |

JEI was chosen over NEI — far more addons exist for 1.21+/26.2.  
`just-enough-recipe-sharing` is excluded (requires a server mod).

## Layout

```
mods/              Client mods (PackSync-managed)
shaderpacks/       All shader packs collected from your Prism instances
config/            Shared client configs (minimal sort, crafting tweaks, zoom)
pack-manifest.json Auto-generated file index (git blob SHAs)
```

## Workflow

1. Edit `../ultimate-survival/client-pack/client-mods.list` or add configs
2. Run `../ultimate-survival/scripts/sync-client-pack-to-github.sh`
3. Commit and push to `main`
4. Players launch Minecraft — PackSync shows what changed

## Custom player mods

Jars in `mods/` that are **not** in this repo are treated as player-installed and are **never** removed or updated.

### QuickStack & Craft (client-only)

Patched from upstream 1.21.4 for MC 26.2 (`scripts/patch-quickstack-26.2.sh`). **Not installed on the server** — vanilla clients can still join.

- **Singleplayer / open-to-LAN (you host):** full quick-stack + JEI craft-from-nearby
- **Ultimate Survival multiplayer:** craft-from-nearby needs the server to handle chest scans; with client-only install, use quick-stack in your inventory and craft at a table from what you carry — or add the same jar to the server later if you want full MP support

## Server

Connect to `178.104.221.45:25566` — server runs Tectonic and server-side mods; clients do not need them.
