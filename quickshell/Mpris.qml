import Quickshell.Services.Mpris
import Quickshell.Io
import QtQuick

Rectangle {
    implicitHeight: 25
    implicitWidth: mprisText.implicitWidth + 5
    color: "transparent"

    property bool rmpcRunning: false
    property bool spotifyRunning: false

    Text {
        id: mprisText
        anchors.centerIn: parent
        color: hover.hovered ? Theme.highlightTextColor : Theme.textColor
        font.family: Theme.mapleMono

        text: {
            if (!player) return ""
            if (!rmpcRunning && !spotifyRunning) return ""
            const icon = player.playbackState === MprisPlaybackState.Playing ? "⏸" : "▶"
            return `${icon} ${player.trackTitle || "Unknown"} ~ ${player.trackArtist || "Unknown"} (${formatSecs(player.position)}/${formatSecs(player.length)})`
        }
    }

    TapHandler {
        onTapped: if (player?.canTogglePlaying) player.togglePlaying()
    }

    Timer {
        interval: 1000
        running: player?.playbackState === MprisPlaybackState.Playing
        repeat: true
        onTriggered: {if (player) player.positionChanged()}
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            rmpcCheck.running = true
            spotifyCheck.running = true
        }
    }

    Process {
        id: rmpcCheck
        command: ["pgrep", "-x", "rmpc"]
        
        onExited: (exitCode) => { rmpcRunning = exitCode === 0 }
    }

    Process {
        id: spotifyCheck
        command: ["pgrep", "-x", "spotify"]

        onExited: (exitCode) => { spotifyRunning = exitCode === 0 }
    }

    function formatSecs(s) {
        if (s === undefined || s === null || s < 0) {
            return "0:00"
        }
        const total = Math.floor(s)
        return `${Math.floor(total / 60)}:${String(total % 60).padStart(2, '0')}`
    }

    // blocked sources
    property var player: {
        const blocked = ["librewolf"]
        const active = Mpris.players.values.filter(p => {
            if (blocked.includes(p.desktopEntry)) return false
            const title = p.trackTitle?.trim()
            const artist = p.trackArtist?.join("").trim()
            if (!title && !artist) return false
            return true
        })
        const playing = active.find(p => p.playbackState === MprisPlaybackState.Playing)
        return playing ?? active[0] ?? null
    }

    HoverHandler {
        id: hover
    }

    Behavior on color {
        ColorAnimation { duration: 150 }
    }
}
