import Quickshell
import QtQuick

Rectangle {
    implicitHeight: 26
    implicitWidth: clockText.implicitWidth + 16
    color: Theme.moduleBackgroundColor
    radius: 16

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
