-----------------
---- Startup ----
-----------------

-- programs
local polkitagent = "/usr/lib/hyprpolkitagent/hyprpolkitagent"
local wallpaper = "hyprpaper"

-- startup
hl.on("hyprland.start", function () 
    hl.exec_cmd(polkitagent)
    hl.exec_cmd(wallpaper)
end)
