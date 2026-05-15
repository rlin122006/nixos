import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

Item {
    id: item
    implicitHeight: 25
    implicitWidth: row.implicitWidth + 5

    property string targetMonitor: "HDMI-A-1"
    property int workspaceCount: 8

    RowLayout {
        id: row

        Repeater {
            model: item.workspaceCount

            delegate: Item {
                id: wsItem

                readonly property int wsId: index + 1
                readonly property string wsName: wsId.toString()

                // workspace lookup
                readonly property HyprlandWorkspace workspace: {
                    for (let i = 0; i < Hyprland.workspaces.values.length; i++) {
                        const ws = Hyprland.workspaces.values[i];
                        if (ws.id === wsId) return ws;
                    }
                    return null;
                }

                // checks for active workspace
                readonly property bool isActiveHere: {
                    if (!workspace) return false;
                    if (!workspace.monitor) return false;
                    return workspace.active
                        && workspace.monitor.name === item.targetMonitor;
                }

                implicitWidth: label.implicitWidth + 6
                implicitHeight: label.implicitHeight + 8

                Text {
                    id: label
                    anchors.centerIn: parent
                    font.bold: wsItem.isActiveHere
                    font.family: Theme.mapleMono
                    font.pointSize: 10
                    color: wsItem.isActiveHere ? Theme.highlightTextColor : Theme.textColor

                    text: wsItem.wsName

                    Behavior on color {
                        ColorAnimation { duration: 150 }
                    }
                }
            }
        }
    }
}
