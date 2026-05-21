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
