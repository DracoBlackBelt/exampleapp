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
