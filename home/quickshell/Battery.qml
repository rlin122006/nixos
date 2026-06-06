import Quickshell
import Quickshell.Io
import QtQuick

Rectangle {
    implicitHeight: 26
    implicitWidth: batteryRow.implicitWidth + 16
    color: Theme.moduleBackgroundColor
    radius: 16

    property string batteryStatus: "Discharging"
    property int batteryLevel: 0

    Row {
        id: batteryRow
        spacing: 2
        anchors.centerIn: parent

        Text { 
            font.family: Theme.mapleMono
            color: batteryColor(batteryStatus)

            text: batteryIcon(batteryLevel)
        }

        Text { 
            font.family: Theme.mapleMono
            color: Theme.textColor

            text: batteryLevel + "%"
        }
    }

    Timer {
        interval: 30000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            capacityCheck.running = true
            statusCheck.running = true
        }
    }

    Process {
        id: capacityCheck
        command: ["cat", "/sys/class/power_supply/BAT1/capacity"]
    
        stdout: SplitParser {
            onRead: data => {batteryLevel = data.trim()}
        }
    }

    Process {
        id: statusCheck
        command: ["cat", "/sys/class/power_supply/BAT1/status"]

        stdout: SplitParser {
            onRead: data => {batteryStatus = data.trim()}
        }
    }

    function batteryIcon(batteryLevel) {
        if (batteryLevel > 80) return ""
        if (batteryLevel > 55) return ""
        if (batteryLevel > 30) return ""
        if (batteryLevel > 10) return ""
        return ""
    }

    function batteryColor(batteryStatus) {
        if (batteryStatus === "Charging") return "#a6e3a1"
        if (batteryLevel < 10) return "#f38ba8"
        return Theme.textColor
    }
}
