hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 0,
        border_size = 1,
        col = {
            active_border = { colors = { "rgba(015158EE)", "rgba(007E8AEE)" }, angle = 45 },
            inactive_border = "rgba(383838AA)",
        },

        layout = "dwindle",

        allow_tearing = false,
    },

    decoration = {
        rounding = 0,
        blur = {
            enabled = true,
            size = 1,
            passes = 1,
            vibrancy = 0.1696,
        },
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
    },

    animations = {
        enabled = true,
    },
})

hl.workspace_rule({ workspace = "special:magic", gaps_out = 16 })

hl.curve("changer", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "changer" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1, bezier = "changer", style = "slidefadevert -100%" })
hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "changer" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "changer", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 4, bezier = "changer" })
--hl.animation({ leaf = "borderangle", enabled = true, speed = 40, bezier = "linear", style = "loop" })
hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "changer" })
