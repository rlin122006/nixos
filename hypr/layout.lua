----------------
---- Layout ----
----------------

-- dwindle layout settings
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- master layout settings
hl.config({
    master = {
        new_status = "master",
    },
})

-- scrolling layout settings
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

-- window rules
-- ignore maximize requests from all apps
local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

-- fix xwayland dragging
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
