-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function () 
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("/home/sononessunk/Scripts/virtual_audio.sh")
    hl.exec_cmd("firefox --new-instance --profile ~/.config/mozilla/firefox/iz1ekosl.default-release --new-window", {
    	workspace = "2 silent"
    })
    
	hl.timer(function()
		hl.dispatch(hl.dsp.cursor.move({ x = 2880, y = 540 }))
	end, { timeout = 1000, type = "oneshot"})
end)
