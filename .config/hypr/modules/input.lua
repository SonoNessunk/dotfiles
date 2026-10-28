---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "it",
        kb_variant = "",
        kb_model   = "pc105",
        kb_options = "terminate:ctrl_alt_bksp",
        kb_rules   = "",
        
        numlock_by_default = true,
          
        repeat_rate = 80,
        repeat_delay = 300,
        
        
        follow_mouse = 1,

        sensitivity = 0,
	    accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.device {
    name = "wacom-intuos-s-pen",
    output = "DP-1"
}
