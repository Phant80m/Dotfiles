
-- ==================================================
-- ENVIRONMENT VARIABLES
-- ==================================================

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("NVD_BACKEND", "direct")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- ==================================================
-- COLORS
-- ==================================================

local colors = {
    red          = "ed8796aa",
    brightRed    = "ee99a0aa",
    green        = "a6da95aa",
    brightGreen  = "8bd5caaa",
    yellow       = "eed49faa",
    brightYellow = "f5a97faa",
    blue         = "8aadf4aa",
    brightBlue   = "91d7e3aa",
    magenta      = "c6a0f680",
    brightMagenta = "f5bde6aa",
    cyan         = "7dc4e4aa",
    brightCyan   = "98d3eeaa",
    white        = "cad3f5aa",
    brightWhite  = "b8c0e0aa",
    twhite       = "cad3f5ee",
}

-- ==================================================
-- MONITORS
-- ==================================================

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1440@144",
    position = "0x0",
    scale    = 1,
})

-- ==================================================
-- PROGRAMS
-- ==================================================

local terminal    = "kitty"
local fileManager = "nemo"
local menu        = "rofi -show drun"

-- ==================================================
-- AUTOSTART
-- ==================================================

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("swww-daemon")
    hl.exec_cmd("wlsunset -L 144.9671 -l -37.8183 -t 4000 -T 6500 -g 1")
end)

-- ==================================================
-- ANIMATIONS
-- ==================================================

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("myBezier", {
    type = "bezier",
    points = {
        {0.05, 0.9},
        {0.1, 1.05},
    },
})

hl.curve("overshot", {
    type = "bezier",
    points = {
        {0.05, 0.9},
        {0.1, 1.1},
    },
})

hl.curve("cubic", {
    type = "bezier",
    points = {
        {0.54, 0.22},
        {0.07, 0.74},
    },
})

hl.curve("overshotCircle", {
    type = "bezier",
    points = {
        {0.175, 0.885},
        {0.32, 1.275},
    },
})

hl.curve("bounce", {
    type = "bezier",
    points = {
        {1, 1.6},
        {0.1, 0.85},
    },
})

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 7,
    bezier = "default",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 3,
    bezier = "bounce",
    style = "popin 23%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 7,
    bezier = "bounce",
    style = "slide",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "overshotCircle",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "overshot",
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "default",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "bounce",
    style = "slide",
})

-- ==================================================
-- DECORATION
-- ==================================================

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 2,

        col = {
            active_border = "rgba(" .. colors.magenta .. ")",
            inactive_border = "rgba(" .. colors.twhite .. ")",
        },

        layout = "dwindle",
        resize_on_border = false,
        allow_tearing = false,
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,

        shadow = {
            enabled = true,
            range = 20,
            render_power = 4,
            color = 0xaa000000,
        },

        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            noise = 0.1,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },
})

-- ==================================================
-- INPUT
-- ==================================================

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

-- ==================================================
-- SCRATCHPAD
-- ==================================================

-- SUPER + S toggles the magic special workspace.
-- SUPER + SHIFT + S sends the focused window to it.

-- ==================================================
-- KEYBINDINGS
-- ==================================================

local mainMod = "SUPER"

-- Terminal and applications
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Window controls
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Exit Hyprland
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())

-- Media controls
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("playerctl next"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("playerctl previous"))

-- Scratchpad
hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({ workspace = "special:magic" })
)

-- Move focus with SUPER + arrow keys
hl.bind(mainMod .. " + left",
    hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + right",
    hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + up",
    hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + down",
    hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with SUPER + number
for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end

-- Scroll through workspaces
hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)

-- Mouse window movement and resizing
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

-- Audio controls
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/volume mute"),
    { locked = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true }
)

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/volume up"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/volume down"),
    { locked = true, repeating = true }
)

-- Brightness
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/brightness up"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/brightness down"),
    { locked = true, repeating = true }
)

-- Screenshots
hl.bind(
    "SUPER + SHIFT + S",
    hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -')
)

hl.bind(
    "SUPER + SHIFT + Q",
    hl.dsp.exec_cmd("~/.local/bin/ascella area")
)

-- Fullscreen
hl.bind(
    "SUPER + F",
    hl.dsp.exec_cmd("hyprctl dispatch fullscreen 1")
)

hl.bind(
    "SUPER + SHIFT + F",
    hl.dsp.exec_cmd("hyprctl dispatch fullscreen 0")
)

-- Waybar
hl.bind(
    "SUPER + O",
    hl.dsp.exec_cmd("waybar")
)

-- Theme switching
hl.bind(
    "SUPER + U",
    hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/pixel.sh")
)

-- Wallpaper
hl.bind(
    "SUPER + R",
    hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/wall.sh")
)

-- Bar scripts
hl.bind(
    "SUPER + B",
    hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/bars.sh")
)

-- ==================================================
-- WINDOW RULES
-- ==================================================

-- Pavucontrol: floating, centered, half-screen size
hl.window_rule({
    name = "pavucontrol",
    match = {
        class = "org.pulseaudio.pavucontrol",
    },

    float = true,
    center = true,
    size = "50% 50%",
})

-- Nemo opacity
hl.window_rule({
    name = "nemo-opacity",
    match = {
        class = "nemo",
    },

    opacity = "0.94 0.94",
})
