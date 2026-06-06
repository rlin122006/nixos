local hyprpaper = "systemctl --user restart hyprpaper"
local hypridle = "systemctl --user restart hypridle"
local bar = "qs"

hl.on("hyprland.start", function ()
    hl.exec_cmd(hypridle)
    hl.exec_cmd(hyprpaper)
    hl.exec_cmd(bar)
end)
