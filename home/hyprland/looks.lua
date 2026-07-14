hl.monitor({
    output   = "",
    mode     = "2880x1800@120.00",
    position = "0x0",
    scale    = "2",
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "1920x1080@143.98",
  position = "-1920x0",
  scale = "1",
})

hl.config({
    general = {
        border_size = 2,
        gaps_in = 2,
        gaps_out = 4,

        col = {
            active_border = "rgba(b9b9b9ff)",
            inactive_border = "rgba(10101080)",
        },
        layout = "dwindle",
    },

    decoration = {
        rounding = 16,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,
        dim_strength = 0.5,
        dim_special = 0.2,

        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            xray = true,
            noise = 0.0117,
            contrast = 0.8916,
            vibrancy  = 0.1696,
            vibrancy_darkness = 0.0,
            special = true,
            brightness = 0.8,
        },

        shadow = {
            enabled = true,
            range = 10,
            render_power = 8,
            sharp = false,
            color = "rgba(13131740)",
        },
    },

    animations = {
        enabled = true,
    },
})

hl.layer_rule({ 
    match = { namespace = "fuzzel" }, 
    blur = true,
    xray = true,
    ignore_alpha = 0.5,
    dim_around = true,
})

hl.layer_rule({
    match = { namespace = "notifications" },
    blur = true,
    xray = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    match = { namespace = "quickshell" },
    blur = true,
    xray = true,
    ignore_alpha = 0.5,
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
