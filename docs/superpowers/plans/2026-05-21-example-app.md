# Example Toon App Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a minimal but complete Toon QML app scaffold that displays "test" on a home screen tile and can be used as a copy-paste starting point for new apps.

**Architecture:** All files live in `/home/job/Toon/example/`. The central `ExampleApp.qml` extends the Toon `App` base type and registers a tile, screen, menu entry, and tray icon with the Toon `registry`. No build step — files are deployed directly to the device.

**Tech Stack:** Qt Quick 2.1 QML, `qb.components`, `qb.base` (Toon platform libraries). No test framework exists for this platform; verification is by inspection of the created files.

---

### Task 1: Bootstrap — folder structure and metadata files

**Files:**
- Create: `example/qmldir`
- Create: `example/version.txt`
- Create: `example/Changelog.txt`
- Create: `example/drawables/.gitkeep`
- Create: `example/lang/.gitkeep`

- [ ] **Step 1: Create `qmldir`**

```
module apps.example
ExampleApp 1.0 ExampleApp.qml
ExampleScreen 1.0 ExampleScreen.qml
```

Save to `example/qmldir`.

- [ ] **Step 2: Create `version.txt`**

```
1.0.0
```

Save to `example/version.txt`.

- [ ] **Step 3: Create `Changelog.txt`**

```
1.0.0
- Initial scaffold: tile, screen, menu, tray
```

Save to `example/Changelog.txt`.

- [ ] **Step 4: Create empty `drawables/` and `lang/` folders**

Create `example/drawables/.gitkeep` and `example/lang/.gitkeep` (empty files to make git track the folders).

- [ ] **Step 5: Verify structure**

Run:
```bash
find /home/job/Toon/example -not -path '*/docs/*' | sort
```

Expected output:
```
/home/job/Toon/example
/home/job/Toon/example/Changelog.txt
/home/job/Toon/example/drawables
/home/job/Toon/example/drawables/.gitkeep
/home/job/Toon/example/lang
/home/job/Toon/example/lang/.gitkeep
/home/job/Toon/example/qmldir
/home/job/Toon/example/version.txt
```

- [ ] **Step 6: Commit**

```bash
cd /home/job/Toon/example && git init && git add qmldir version.txt Changelog.txt drawables/.gitkeep lang/.gitkeep
git commit -m "feat: bootstrap example app scaffold"
```

---

### Task 2: ExampleTile.qml — home screen tile

**Files:**
- Create: `example/ExampleTile.qml`

- [ ] **Step 1: Create `ExampleTile.qml`**

```qml
import QtQuick 2.1
import qb.components 1.0

Tile {
    id: exampleTile

    onClicked: {
        if (app.exampleScreen)
            app.exampleScreen.show()
    }

    Text {
        id: testLabel
        text: "test"
        font.pixelSize: isNxt ? 22 : 18
        font.family: qfont.regular.name
        color: (typeof dimmableColors !== 'undefined') ? dimmableColors.clockTileColor : colors.clockTileColor
        anchors.centerIn: parent
    }
}
```

Save to `example/ExampleTile.qml`.

- [ ] **Step 2: Inspect the file**

Run:
```bash
cat /home/job/Toon/example/ExampleTile.qml
```

Confirm: `Tile` root item, `Text` centered on parent, `isNxt` used for font size, `onClicked` calls `app.exampleScreen.show()`.

- [ ] **Step 3: Commit**

```bash
cd /home/job/Toon/example && git add ExampleTile.qml
git commit -m "feat: add ExampleTile showing 'test'"
```

---

### Task 3: ExampleScreen.qml — detail screen

**Files:**
- Create: `example/ExampleScreen.qml`

- [ ] **Step 1: Create `ExampleScreen.qml`**

```qml
import QtQuick 2.1
import qb.components 1.0

Screen {
    id: root

    screenTitle: "Example"

    // TODO: add screen content here
}
```

Save to `example/ExampleScreen.qml`.

- [ ] **Step 2: Inspect the file**

Run:
```bash
cat /home/job/Toon/example/ExampleScreen.qml
```

Confirm: `Screen` root item, `screenTitle` set, TODO stub present.

- [ ] **Step 3: Commit**

```bash
cd /home/job/Toon/example && git add ExampleScreen.qml
git commit -m "feat: add ExampleScreen stub"
```

---

### Task 4: ExampleMenu.qml — menu entry

**Files:**
- Create: `example/ExampleMenu.qml`

- [ ] **Step 1: Create `ExampleMenu.qml`**

```qml
import QtQuick 2.1
import qb.components 1.0
import qb.base 1.0

MenuItem {
    property ExampleApp app

    label: "Example"
    // TODO: set image to your app thumbnail, e.g.:
    // image: "qrc:/tsc/ExampleThumb.png"
    weight: 200

    onClicked: {
        if (app && app.exampleScreen)
            app.exampleScreen.show()
    }
}
```

Save to `example/ExampleMenu.qml`.

- [ ] **Step 2: Inspect the file**

Run:
```bash
cat /home/job/Toon/example/ExampleMenu.qml
```

Confirm: `MenuItem` root item, `label` set, `onClicked` opens screen, `weight` set.

- [ ] **Step 3: Commit**

```bash
cd /home/job/Toon/example && git add ExampleMenu.qml
git commit -m "feat: add ExampleMenu stub"
```

---

### Task 5: ExampleTray.qml — system tray icon

**Files:**
- Create: `example/ExampleTray.qml`

- [ ] **Step 1: Create `ExampleTray.qml`**

```qml
import QtQuick 2.1
import qb.components 1.0
import qb.base 1.0

SystrayIcon {
    id: exampleSystrayIcon
    visible: true
    posIndex: 9100
    property string objectName: "exampleSystrayIcon"

    onClicked: {
        if (app.exampleScreen)
            app.exampleScreen.show()
    }

    // TODO: add an icon image here, e.g.:
    // Image {
    //     anchors.centerIn: parent
    //     source: "qrc:/tsc/ExampleTray.png"
    // }
}
```

Save to `example/ExampleTray.qml`.

- [ ] **Step 2: Inspect the file**

Run:
```bash
cat /home/job/Toon/example/ExampleTray.qml
```

Confirm: `SystrayIcon` root item, `objectName` set, `onClicked` opens screen, image stub comment present.

- [ ] **Step 3: Commit**

```bash
cd /home/job/Toon/example && git add ExampleTray.qml
git commit -m "feat: add ExampleTray stub"
```

---

### Task 6: ExampleApp.qml — app root with full registration

**Files:**
- Create: `example/ExampleApp.qml`

- [ ] **Step 1: Create `ExampleApp.qml`**

```qml
import QtQuick 2.1
import qb.components 1.0
import qb.base 1.0

App {
    id: root

    property url tileUrl:      "ExampleTile.qml"
    property url menuUrl:      "ExampleMenu.qml"
    property url trayUrl:      "ExampleTray.qml"
    // TODO: replace with your actual thumbnail resource:
    // property url thumbnailIcon: "qrc:/tsc/ExampleThumb.png"
    property url thumbnailIcon: "drawables/example_thumb.png"

    property ExampleScreen exampleScreen

    // TODO: add state properties here, e.g.:
    // property string someValue: ""

    Component.onCompleted: {
        registry.registerWidget("tile", tileUrl, this, null, {
            thumbLabel: "Example",
            thumbIcon: thumbnailIcon,
            thumbCategory: "general",
            thumbWeight: 30,
            baseTileWeight: 10,
            thumbIconVAlignment: "center"
        })
        registry.registerWidget("screen", Qt.resolvedUrl("ExampleScreen.qml"), this, "exampleScreen")
        registry.registerWidget("menuItem", menuUrl, this, "exampleMenu", {weight: 200})
        registry.registerWidget("systrayIcon", trayUrl, this, "exampleTray")
    }

    // TODO: add timers here, e.g.:
    // Timer {
    //     id: updateTimer
    //     interval: 60000
    //     repeat: true
    //     onTriggered: fetchData()
    // }

    // TODO: add functions here, e.g.:
    // function fetchData() { ... }

    // TODO: persist settings via XMLHttpRequest PUT to:
    // /mnt/data/tsc/example.userSettings.json
}
```

Save to `example/ExampleApp.qml`.

- [ ] **Step 2: Inspect the file**

Run:
```bash
cat /home/job/Toon/example/ExampleApp.qml
```

Confirm: `App` root item, all four `registry.registerWidget` calls present (tile, screen, menuItem, systrayIcon), `exampleScreen` typed property declared, URL properties all set, stub comments present.

- [ ] **Step 3: Verify qmldir exports match actual filenames**

Run:
```bash
cat /home/job/Toon/example/qmldir
ls /home/job/Toon/example/*.qml
```

Confirm: every `.qml` file listed in `ls` has a matching entry in `qmldir` (or intentionally omitted if it's not a public type). `ExampleApp` and `ExampleScreen` must be in `qmldir`.

- [ ] **Step 4: Commit**

```bash
cd /home/job/Toon/example && git add ExampleApp.qml
git commit -m "feat: add ExampleApp root with full Toon registry wiring"
```

---

### Task 7: Final check and CLAUDE.md

**Files:**
- Create: `example/CLAUDE.md`

- [ ] **Step 1: Create `CLAUDE.md`**

```markdown
# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## What this is

A minimal QML scaffold for the **Toon smart thermostat** (Quby/Eneco). Copy this project as a starting point for a new Toon app. There is no build step — files are deployed directly to the Toon device.

## Architecture

`ExampleApp.qml` is the central `App` object. It registers all widgets with the Toon `registry` in `Component.onCompleted`. Rename `Example` → your app name throughout all files when starting a new app.

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
- Settings are persisted via XMLHttpRequest PUT to `/mnt/data/tsc/example.userSettings.json`.
- Colors: use `dimmableColors.clockTileColor` when available (dim mode), fall back to `colors.clockTileColor`.

## Versioning

Update `version.txt` and prepend a block to `Changelog.txt` on every release.
```

Save to `example/CLAUDE.md`.

- [ ] **Step 2: Final file listing**

Run:
```bash
find /home/job/Toon/example -not -path '*/docs/*' -not -name '.gitkeep' | sort
```

Expected:
```
/home/job/Toon/example
/home/job/Toon/example/Changelog.txt
/home/job/Toon/example/CLAUDE.md
/home/job/Toon/example/ExampleApp.qml
/home/job/Toon/example/ExampleMenu.qml
/home/job/Toon/example/ExampleScreen.qml
/home/job/Toon/example/ExampleTile.qml
/home/job/Toon/example/ExampleTray.qml
/home/job/Toon/example/drawables
/home/job/Toon/example/lang
/home/job/Toon/example/qmldir
/home/job/Toon/example/version.txt
```

- [ ] **Step 3: Commit**

```bash
cd /home/job/Toon/example && git add CLAUDE.md
git commit -m "docs: add CLAUDE.md for example scaffold"
```
