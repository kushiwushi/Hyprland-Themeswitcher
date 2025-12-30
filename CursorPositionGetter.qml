pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

Singleton {
    property var cursorPos: []

    // Errors out for some reason
    // Themeswitcher {
    //     id: themeSwitcherInstance
    // }
    Process {
        // Make this snapshot, use an alias i guess

        id: getCursorPos
        running: true
        onRunningChanged:
        // Something like this
        //  if (themeSwitcherInstance.OnPressed)
        //    running = true;
        {}
        command: ["sh", "-c", "hyprctl cursorpos"]

        stdout: StdioCollector {
            onStreamFinished: {
                var cleanedText = text.trim();
                if (cleanedText) {
                    cursorPos = cleanedText.split(/, ?/);
                }
            }
        }
    }
}
