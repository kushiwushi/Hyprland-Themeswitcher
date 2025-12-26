import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes

// ListView because this will have lots of items, Loader for conditionally showing thingies, or use the Item.visible thing

ListView {
    CursorPositionGetter {
        id: cursorPositionGetterInstance
    }
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

            color: "transparent"

            focusable: false

            // Next, add a shape

            PopupWindow {
                id: popup

                anchor.window: overlay
                anchor.rect.x: parentWindow.width / 2 - width / 2
                anchor.rect.y: parentWindow.height

                implicitWidth: 1920
                implicitHeight: 1080

                visible: false

                color: "transparent"

                // To do
                // 3. Fix anchoring relationship between overlay and popup

                Rectangle {
                    id: mainCircle

                    focus: true

                    implicitWidth: 80
                    implicitHeight: implicitWidth

                    property var pos1: cursorPositionGetterInstance.cursorPos[0]
                    property var pos2: cursorPositionGetterInstance.cursorPos[1]

                    x: pos1 // mousePosition.x
                    y: pos2 // mousePosition.y

                    radius: implicitWidth / 2

                    color: "transparent" // This should be dynamic depending on the background

                    antialiasing: true
                }
                // This is essentially done, but this should spawn on an event.

                GlobalShortcut {
                    name: "Themeswitcher"
                    description: "Opens the theme switcher"
                    property bool open: false

                    onPressed: {
                        mainCircle.color = "yellow";
                        popup.visible = true;
                        cursorPositionGetterInstance.running = true;
                    }

                    onReleased: {
                        mainCircle.color = "transparent";
                        popup.visible = false;
                    }
                }
            }
        }
    }
}
