import Quickshell.Services.SystemTray
import QtQuick

Rectangle {
    implicitHeight: 25
    implicitWidth: trayRow.implicitWidth + 5
    color: "transparent"

    Row {
        id: trayRow
        anchors.centerIn: parent
        spacing: 10

        Repeater {
            model: SystemTray.items

            delegate: Item {
                width: 14
                height: 14

                Image {
                    anchors.fill: parent

                    source: {
                        var icon = modelData.icon
                        if (icon.startsWith("image://icon/")) {
                            var parts = icon.replace("image://icon/", "").split("?path=")
                            return "file://" + parts[1] + "/" + parts[0] + ".png"
                        }
                        return icon
                    }

                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }
}
