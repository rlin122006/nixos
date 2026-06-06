//@ pragma UseQApplication
import Quickshell
import QtQuick

PanelWindow {
    implicitWidth: Screen.width
    implicitHeight: 34
    color: "transparent"

    anchors {
        top: true
        left: true
        right: true
    }

    Rectangle {
        color: Theme.backgroundColor
        radius: 16

        anchors {
            fill: parent
            leftMargin: 4
            rightMargin: 4
            topMargin: 4
        }

        Row {
            spacing: 16

            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 16
            }

            Workspaces {}
            FocusedWindow {}
        }

        Row {
            spacing: 16

            anchors {
                centerIn: parent
            }

            Mpris{}
        }

        Row {
            spacing: 16

            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 16
            }

            SystemTray {}
            Connection {}
            Sound {}
            Battery {}
            Clock {}
        }
    }
}
