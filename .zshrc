export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="robbyrussell"
#ZSH_THEME="aussiegeek"
ZSH_THEME="nessk_theme"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_USE_ASYNC=1

alias cleanhistory='history -c && fc -p'

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY

bindkey -r '^S'

#if [ "$TERM_PROGRAM" != "vscode" ] && command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#  tmux attach-session -t main || tmux new-session -s main
#fi

if [ "$TERM_PROGRAM" != "vscode" ] && command -v fastfetch &> /dev/null; then
    fastfetch
fi

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
  echo -ne "\e[5 q"
}
