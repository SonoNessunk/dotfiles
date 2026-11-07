--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

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

hl.window_rule({
	name = "Peazip",
	match = { class = "peazip"},
	float = true,
})

hl.window_rule({
	name = "Peazip Analyze",
	match = { class = "pea"},
	float = true,
})

hl.window_rule({
	name = "KDE Calculator",
	match = { class = "org.kde.kalk"},
	float = true,
})

hl.window_rule({
	name = "Picture-in-Picture",
	match = { title = "Picture-in-Picture"},
	float = true,
})

hl.window_rule({
	name = "Thunar Rename Dialog",
	match = { title = "^Rename.*" },
	float = true,
})

hl.window_rule({
	name = "Firefox Downlaod Library",
	match = { title = "Library"},
	float = true,
})

hl.window_rule({
	name = "Thunar File Operation Progress Dialog",
	match = { title = "File Operation Progress" },
	float = true,
})

hl.workspace_rule({
    workspace = "2",
    persistent = true,
    monitor = "DP-1",
})

hl.workspace_rule({
    workspace = "1",
    persistent = true,
    monitor = "DVI-D-1",
})

