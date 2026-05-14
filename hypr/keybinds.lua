------------------
---- Keybinds ----
------------------

-- programs
local terminal = "kitty"
local appLauncher = "fuzzel"
local browser = "librewolf"
local fileExplorer = "kitty yazi"

-- keys
local mainMod = "SUPER"
local altMod = "ALT"

-- open programs
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(appLauncher))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(fileExplorer))

-- close windows
local closeWindowBind = hl.bind(mainMod .. " + S", hl.dsp.window.close())

-- window controls
hl.bind(mainMod .. " + A", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("command hyprctl dispatch 'hl.dsp.exit()'"))
-- SUPER + left to move, SUPER + right to resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- work space controls
-- switch workspaces with mainMod + 0-9
-- move active window to a workspace with altMod + 0-9
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(altMod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- music workspace
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("magic"))
hl.bind(altMod .. " + D", hl.dsp.window.move({ workspace = "special:magic" }))
