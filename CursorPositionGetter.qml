import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

Scope {
    property var cursorPos: []
    Process {
        id: getCursorPos
        running: true
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
