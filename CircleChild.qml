// pragma Singleton (?)

import Quickshell
import Quickshell.Hyprland
import QtQuick

ShellRoot {
    id: root

    PanelWindow {

        id: overlay

        anchors.left: true
        anchors.top: true

        implicitWidth: 0
        implicitHeight: implicitWidth

        color: "transparent"

        focusable: false

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
                // Maybe needs a lazy loader?

                id: circleChild

                focus: true

                implicitWidth: 80
                implicitHeight: implicitWidth

                property var posX
                property var posY

                // Position of the child circle (this should be relative to the parent circle)
                x: posX
                y: posY

                radius: implicitWidth / 2

                color: "red" // This should be dynamic depending on the background

                antialiasing: true

        }
    }
}
