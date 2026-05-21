# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## What this is

A minimal QML scaffold for the **Toon smart thermostat** (Quby/Eneco). Copy this project as a starting point for a new Toon app. There is no build step — files are deployed directly to the Toon device.

## Architecture

`ExampleApp.qml` is the central `App` object. It registers all widgets with the Toon `registry` in `init()`. Rename `Example` → your app name throughout all files when starting a new app.

### Key files

| File | Purpose |
|---|---|
| `ExampleApp.qml` | App root: state, timers, API functions, settings I/O |
| `ExampleTile.qml` | Home screen tile — shows "test", click opens screen |
| `ExampleScreen.qml` | Detail screen stub |
| `ExampleMenu.qml` | Menu entry stub |
| `ExampleTray.qml` | System tray icon stub |

## Conventions

- `isNxt` is a Toon-provided boolean: `true` for Toon 2 (higher resolution). Always use it for sizing — never hardcode one size for both devices.
- Module name is `apps.example` — change to `apps.<yourapp>` in `qmldir`.
- Settings are persisted via FileIO (read) and XMLHttpRequest PUT (write) to `/mnt/data/tsc/example.userSettings.json`.
- Colors: use `dimmableColors.clockTileColor` when available (dim mode), fall back to `colors.clockTileColor`.
- All `registry.registerWidget` calls go in `function init()` (called by the `App` base type), not in `Component.onCompleted`.

## Versioning

Update `version.txt` and prepend a block to `Changelog.txt` on every release.
