export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export EDITOR="nano"
export VISUAL="nano"

# Flutter
if [[ -x "$HOME/src/flutter/bin/flutter" ]]; then
    export PATH="$HOME/src/flutter/bin:$PATH"
    export PATH="$PATH:$HOME/.pub-cache/bin"
fi

# Rust
if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi

# Script
if [[ -d "$HOME/Scripts" ]]; then
    export PATH="$HOME/Scripts:$PATH"
fi

# Chrome
if command -v google-chrome-stable &>/dev/null; then
    export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
fi

# GDBK
if [[ -d "/opt/gbdk" ]]; then
    export GBDK_HOME=/opt/gbdk/
    export GBDKDIR=/opt/gbdk/
    export PATH=$PATH:/opt/gbdk/bin
fi
