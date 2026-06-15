local mainMod = "SUPER"
local altMod = "ALT"

local terminal = "kitty"
local appLauncher = "fuzzel"
local browser = "librewolf"
local lock = "hyprlock"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(appLauncher))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + S", hl.dsp.window.close())

hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -"))
hl.bind(mainMod .. " + SHIFT" .. " + L", hl.dsp.exec_cmd(lock))

hl.bind(mainMod .. " + A", hl.dsp.layout("swapsplit"))
hl.bind(mainMod .. " + Z", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("mouse:274", hl.dsp.window.fullscreen(), { mouse = true })

hl.bind(mainMod .. " + left", hl.dsp.focus({direction = "left"}))
hl.bind(mainMod .. " + right", hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + up", hl.dsp.focus({direction = "up"}))
hl.bind(mainMod .. " + down", hl.dsp.focus({direction = "down"}))

hl.bind(mainMod .. " + H", hl.dsp.focus({direction = "left"}))
hl.bind(mainMod .. " + L", hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + K", hl.dsp.focus({direction = "up"}))
hl.bind(mainMod .. " + J", hl.dsp.focus({direction = "down"}))

for i = 1, 8 do
    local key = i
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(altMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("magic"))
hl.bind(altMod .. " + D", hl.dsp.window.move({ workspace = "special:magic" }))

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "fullscreen",
    scale = 0.45,
})

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("command hyprctl dispatch 'hl.dsp.exit()'"))

hl.config({
    input = {
        kb_layout  = "us",
        sensitivity = -0.7,
        touchpad = {
        	scroll_factor = 1.0,
        	middle_button_emulation = true,
        	drag_lock = 1,
        },
    },
    gestures = {
        workspace_swipe_distance = 300,
        workspace_swipe_cancel_ratio = 0.025,
    },
    binds = {
        hide_special_on_workspace_change = true,
    },
})

hl.device({
    name = "asce1206:00-04f3:3315-touchpad",
    sensitivity = 0,
})
