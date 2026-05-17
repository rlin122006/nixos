import Quickshell.Io
import QtQuick

Rectangle {
    implicitHeight: 25
    implicitWidth: connectionText.implicitWidth + 5
    color: "transparent"

    property bool connected: false

    Text {
        id: connectionText
        anchors.centerIn: parent
        color: hover.hovered ? Theme.highlightTextColor : Theme.textColor

        text: connected ? "" : ""
    }

    TapHandler {
        onTapped: networkManagerApplet.running = true
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
        id: networkManagerApplet
        command: ["sh", "-c", "pkill nm-connection || (nm-connection-editor &)"]
    }

    HoverHandler {
        id: hover
    }

    Behavior on color {
        ColorAnimation { duration: 150 }
    }
}
