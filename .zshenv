export PATH="$HOME/src/flutter/bin:$PATH"

if uwsm check may-start; then
	exec uwsm start hyprland.desktop
fi

. "$HOME/.cargo/env"

export PATH="$HOME/Scripts:$PATH"
