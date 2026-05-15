import Quickshell
import QtQuick

Rectangle {
    implicitHeight: 25
    implicitWidth: clockText.implicitWidth + 5
    color: "transparent"

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    Text {
        id: clockText
        anchors.centerIn: parent
        font.family: Theme.mapleMono
        color: Theme.textColor

        text: Qt.formatDateTime(clock.date, "ddd, MMM dd ~ hh:mm")
    }
}
