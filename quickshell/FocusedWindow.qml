import QtQuick
import Quickshell.Hyprland

Rectangle {
    implicitHeight: 25
    implicitWidth: focusedWindowText.implicitWidth
    color: "transparent"

    Text {
        id: focusedWindowText
        anchors.centerIn: parent
        font.family: Theme.mapleMono
        color: Theme.textColor

        text: {
            const app = Hyprland.activeToplevel?.wayland?.appId ?? "Desktop"
            return app.charAt(0).toUpperCase() + app.slice(1)
        }
    }
}
