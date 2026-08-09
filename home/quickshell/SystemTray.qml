import Quickshell.Services.SystemTray
import QtQuick

Rectangle {
    implicitHeight: 26
    implicitWidth: trayRow.implicitWidth > 0 ? trayRow.implicitWidth + 16 : 0
    color: Theme.moduleBackgroundColor
    radius: 16

    Row {
        id: trayRow
        anchors.centerIn: parent
        spacing: 6

        Repeater {
            model: SystemTray.items

            delegate: Item {
                width: 16
                height: 16

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
