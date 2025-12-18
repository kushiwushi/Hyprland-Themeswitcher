import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes

//

Scope {
    PanelWindow {
        id: overlay
        implicitWidth: 100
        implicitHeight: 100

        color: "transparent"

        // Next, add a shape

        Rectangle {
            id: mainCircle

            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand
            focus: true

            implicitWidth: 100
            implicitHeight: implicitWidth
            radius: implicitWidth / 2

            color: "grey" // This should be dynamic depending on the background

            antialiasing: true

            Keys.onPressed: {
                if (event.key === Qt.Key_Control) {
                    mainCircle.color == "red";
                }
            }
            // This is essentially done, but this should spawn on an event.
        }
    }
}
