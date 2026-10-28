------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@165",
    position = "1920x0",
    scale    = "1",
    vrr      = 0,
})

hl.monitor({
    output   = "DVI-D-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = "1",
    vrr      = 0,
})