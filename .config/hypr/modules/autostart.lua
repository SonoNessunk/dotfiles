-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function () 
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("/home/sononessunk/Scripts/virtual_audio.sh")
    hl.dispatch(hl.exec_cmd("[workspace 2 silent] firefox --new-instance --profile ~/.config/mozilla/firefox/iz1ekosl.default-release --new-window"))
end)