import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes

// ListView because this will have lots of items, Loader for conditionally showing thingies, or use the Item.visible thing

ListView {
    MouseArea {
        id: mousePosition
        anchors.fill: parent

        hoverEnabled: true

        PanelWindow {
            id: overlay
            anchors.left: true
            anchors.top: true

            implicitWidth: 80
            implicitHeight: implicitWidth

            color: "red"

            focusable: false

            // Next, add a shape

            PopupWindow {
                id: popup

                anchor.window: overlay
                anchor.rect.x: parentWindow.width / 2 - width / 2
                anchor.rect.y: parentWindow.height
                width: 500
                height: 500
                visible: false
                color: "transparent"

                // To do
                // 1. Make popup.visible turn into true on signal
                // 2. Make popup consume all the space in the monitor to make the circle spawn anywhere (with boundaries)
                // 3. Fix anchoring relationship between overlay and popup

                Rectangle {
                    id: mainCircle

                    focus: true

                    implicitWidth: 80
                    implicitHeight: implicitWidth
                    x: 100
                    y: 100

                    radius: implicitWidth / 2

                    color: "blue" // This should be dynamic depending on the background

                    antialiasing: true
                }
                // This is essentially done, but this should spawn on an event.

                GlobalShortcut {
                    name: "Themeswitcher"
                    description: "Opens the theme switcher"
                    property bool open: false

                    onPressed: {
                        mainCircle.color = "yellow";
                    }

                    onReleased: {
                        mainCircle.color = "transparent";
                    }
                }
            }
        }
    }
}
