export PATH="$HOME/src/flutter/bin:$PATH"

if command -v uwsm &> /dev/null && uwsm check may-start; then
	exec uwsm start hyprland.desktop
fi

. "$HOME/.cargo/env"

export PATH="$HOME/Scripts:$PATH"
