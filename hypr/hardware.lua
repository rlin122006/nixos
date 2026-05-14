------------------
---- Hardware ----
------------------

-- monitors
-- main
hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@164.83",
    position = "0x0",
    scale    = "1",
})

-- side
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60.00",
    position = "-1920x0",
    scale    = "1",
})

-- fallback
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- keyboard and mouse
hl.config({
    input = {
        kb_layout  = "us",

        follow_mouse = 1, 
        sensitivity = -0.65,
    },
})
