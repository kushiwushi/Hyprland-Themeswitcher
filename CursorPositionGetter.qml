pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick

Singleton {
    id: root
    property var cursorPos: []

    Themeswitcher {
        id: themeSwitcher
    }

    // The whole thing is kinda flawed and wastes precious CPU cores but it can be optimized.
    Process {
        id: getCursorPos
        running: true

        onRunningChanged: {
            if (themeSwitcher.idk)
                running = true;
        }

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
