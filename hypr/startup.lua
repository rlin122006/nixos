-----------------
---- Startup ----
-----------------

-- programs
local polkitagent = "/usr/lib/hyprpolkitagent/hyprpolkitagent"
local wallpaper = "hyprpaper"
local desktopBar = "quickshell"
local musicPlayer = "mpd"
local mpdBridge = "/usr/local/bin/mpd-bridge.sh"
local notificationDaemon = "mako"

-- startup
hl.on("hyprland.start", function () 
    hl.exec_cmd(polkitagent)
    hl.exec_cmd(notificationDaemon)
    hl.exec_cmd(musicPlayer)
    hl.exec_cmd(mpdBridge)
    hl.exec_cmd(wallpaper)
    hl.exec_cmd(desktopBar)
end)
