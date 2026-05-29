require("hyprland.monitors")
require("hyprland.appearance")
require("hyprland.keybindings")
require("hyprland.guestures")

hl.on("hyprland.start", function ()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
end)

hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("XCURSOR_SIZE", "16")

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
    input = {
        kb_layout = "us,ru",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:win_space_toggle",
        kb_rules = "",

        repeat_delay = 150,
        repeat_rate = 50,

        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
        },

        sensitivity = 0,
    },
    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
    },
    ecosystem = {
        no_update_news = true,
    },
})

