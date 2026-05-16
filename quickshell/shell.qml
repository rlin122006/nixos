//@ pragma UseQApplication
import Quickshell
import QtQuick

ShellRoot {
    PanelWindow {
        id: mainMonitor
        screen: Quickshell.screens.find(s => s.name === "DP-1")
        implicitWidth: Screen.width
        implicitHeight: 25
        color: "transparent"

        anchors {
            top: true
            left: true
            right: true
        }

        Rectangle {
            anchors.fill: parent
            color: Theme.backgroundColor

            Row {
                id: leftColumnMain
                spacing: 15

                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 10
                }

                Workspaces {}
                FocusedWindow {}
            }

            Row {
                id: centerColumnMain
                spacing: 15

                anchors {
                    centerIn: parent
                }

                Mpris {}
            }

            Row {
                id: rightColumnMain
                spacing: 15

                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 10
                }

                SystemTray {}
                Sound {}
                Connection {}
                Clock {}
            }
        }
    }

    PanelWindow {
        id: secondaryMonitor
        screen: Quickshell.screens.find(s => s.name === "HDMI-A-1")
        implicitWidth: Screen.width
        implicitHeight: 25
        color: "transparent"

        anchors {
            top: true
            left: true
            right: true
        }

        Rectangle {
            anchors.fill: parent
            color: Theme.backgroundColor

            Row {
                id: leftColumnSecondary
                spacing: 15

                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 10
                }

                WorkspacesAlt {}
                FocusedWindow {}
            }

            Row {
                id: centerColumnSecondary
                spacing: 15

                anchors {
                    centerIn: parent
                }

                Mpris {}
            }

            Row {
                id: rightColumnSecondary
                spacing: 15

                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 10
                }

                SystemTray {}
                Sound {}
                Connection {}
                Clock {}
            }
        }
    }
}
