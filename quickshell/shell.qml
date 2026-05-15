//@ pragma UseQApplication
import Quickshell
import QtQuick

ShellRoot {
    id: root

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
            
            border {
                width: 1
                color: Theme.borderColor
            }

            Row {
                id: leftColumnMain
                spacing: 10

                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 10
                }
            }

            Row {
                id: centerColumnMain
                spacing: 10

                anchors {
                    centerIn: parent
                }
            }

            Row {
                id: rightColumnMain
                spacing: 10

                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 10
                }
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
            
            border {
                width: 1
                color: Theme.borderColor
            }

            Row {
                id: leftColumnSecondary
                spacing: 10

                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 10
                }
            }

            Row {
                id: centerColumnSecondary
                spacing: 10

                anchors {
                    centerIn: parent
                }
            }

            Row {
                id: rightColumnSecondary
                spacing: 10

                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 10
                }
            }
        }
    }
}
