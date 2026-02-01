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
