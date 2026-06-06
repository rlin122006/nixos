import QtQuick
import Quickshell.Hyprland

Rectangle {
    implicitHeight: 26
    implicitWidth: focusedWindowText.implicitWidth + 16
    color: Theme.moduleBackgroundColor 
    radius: 16

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

    Behavior on implicitWidth {
        NumberAnimation { duration: 75; easing.type: Easing.InOutQuad }
    }
}
