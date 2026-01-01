import Quickshell
import Quickshell.Hyprland
import QtQuick

// ListView because this will have lots of items, Loader for conditionally showing thingies, or use the Item.visible thing

ShellRoot {
    id: root

    property var idk: true

    PanelWindow {
        id: overlay

        anchors.left: true
        anchors.top: true

        implicitWidth: 0
        implicitHeight: implicitWidth

        color: "transparent"

        focusable: false

        // Next, add a shape

        PopupWindow {
            id: popup

            anchor.window: overlay
            anchor.rect.x: overlay.implicitWidth
            anchor.rect.y: overlay.implicitHeight

            implicitWidth: 1920
            implicitHeight: 1080

            visible: false

            color: "transparent"

            Rectangle {
                id: mainCircle

                focus: true

                implicitWidth: 80
                implicitHeight: implicitWidth

                property var posX
                property var posY

                // Position of the main circle
                x: posX
                y: posY

                radius: implicitWidth / 2

                color: "transparent" // This should be dynamic depending on the background to prevent usability issues, or a striking color between white and black

                antialiasing: true

                MouseArea {
                    id: mousePosition

                    anchors.fill: parent

                    hoverEnabled: true
                }

                GlobalShortcut {
                    name: "Themeswitcher"
                    description: "Opens the theme switcher"
                    property bool open: false
                    property int offset: 40

                    onPressed: {
                        mainCircle.color = "yellow";
                        popup.visible = true;
                        CursorPositionGetter.running = true; // ?
                        root.idk = true;

                        // In here, we need to offset pixels by negative 40 for some reason idk why

                        mainCircle.x = Number(CursorPositionGetter.cursorPos[0]) - offset;
                        mainCircle.y = Number(CursorPositionGetter.cursorPos[1]) - offset;
                    }

                    onReleased: {
                        mainCircle.color = "transparent";
                        popup.visible = false;
                    }
                }

                CircleChild {}
            }
        }
    }
}
