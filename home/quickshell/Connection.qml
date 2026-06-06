import Quickshell.Io
import QtQuick

Rectangle {
    implicitHeight: 26
    implicitWidth: connectionText.implicitWidth + 16
    color: hover.hovered ? Theme.highlightModuleBackgroundColor : Theme.moduleBackgroundColor
    radius: 16

    property bool connected: false

    Text {
        id: connectionText
        anchors.centerIn: parent
        color: hover.hovered ? Theme.highlightTextColor : Theme.textColor

        text: connected ? "" : ""
    }

    TapHandler {
        onTapped: nmtui.running = true
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: networkCheck.running = true
    }

    Process {
        id: networkCheck
        command: ["nmcli", "networking", "connectivity"]
    
        stdout: SplitParser {
            onRead: data => {connected = data.trim() === "full"}
        }
    }

    Process {
        id: nmtui 
        command: ["sh", "-c", "pkill nmtui || (kitty nmtui &)"]
    }

    HoverHandler {
        id: hover
    }

    Behavior on color {
        ColorAnimation { duration: 150 }
    }

    Behavior on implicitWidth {
        NumberAnimation { duration: 75; easing.type: Easing.InOutQuad }
    }
}
