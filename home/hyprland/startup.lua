local screenPowersaver = "systemctl --user restart screen-powersaver"
local bar = "uwsm app -- qs"

hl.on("hyprland.start", function ()
    hl.exec_cmd(screenPowersaver)
    hl.exec_cmd(bar)
end)
