--------------------
---- Appearance ----
--------------------

hl.config({
    -- gaps and borders
    general = {
        gaps_in  = 4,
        gaps_out = 8,

        border_size = 4,

        col = {
            active_border   = "rgba(ffddf4ff)",
            inactive_border = "rgba(e6e6fa80)",
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    -- shadows and blur
    decoration = {
        rounding       = 4,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 10,
            render_power = 8,
            color        = "rgba(13131740)",
        },

        blur = {
            enabled   = true,
            size      = 4,
            passes    = 3,
            vibrancy  = 0.1696,
            brightness = 0.8,
        },
    },

    animations = {
        enabled = true,
    },
})
