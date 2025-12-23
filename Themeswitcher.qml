import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes

// ListView because this will have lots of items, Loader for conditionally showing thingies, or use the Item.visible thing

ListView {
    MouseArea {
        anchors.fill: parent

        PanelWindow {
            id: overlay
            implicitWidth: 80
            implicitHeight: implicitWidth

            color: "transparent"

            // Next, add a shape

            Rectangle {
                id: mainCircle

                focus: true

                x: 50
                y: 50
                implicitWidth: 80
                implicitHeight: implicitWidth

                radius: implicitWidth / 2

                color: "transparent" // This should be dynamic depending on the background

                antialiasing: true
            }
            // This is essentially done, but this should spawn on an event.

            GlobalShortcut {
                name: "Themeswitcher"
                description: "Opens the theme switcher"

                onPressed: {
                    var open = false;
                    if (!open) {
                        mainCircle.color = "red";
                        open = true;
                    } else {
                        mainCircle.color = "transparent";
                    }
                }

                onReleased: {}
            }
        }
    }
}
