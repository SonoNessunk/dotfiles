#############
# AUTOSTART #
#############

if [ "$TERM_PROGRAM" != "vscode" ] && command -v fastfetch &> /dev/null; then
    fastfetch
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
source /usr/share/nvm/init-nvm.sh

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZ::lib/key-bindings.zsh

# devo capire se serve o meno, a quanto pare quando carico tramite zinit il zcompdump viene creato in automatico
#mkdir -p "$XDG_CACHE_HOME/zsh"
#autoload -Uz compinit
#compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_find_no_dups

setopt autocd
setopt numeric_glob_sort

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

alias ls='ls --color'
alias update='sudo pacman -Syyuu --noconfirm; yay -Syyuu --noconfirm'
alias ssh-pala='ssh -i .ssh/ssh-tunnel-pala pala@0pala.ddnsfree.com'
eval "$(fzf --zsh)"

#############
# FUNCTIONS #
#############

tm() {
  if [ "$TERM_PROGRAM" != "vscode" ] && command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach-session -t main || tmux new-session -s main
  fi
}

y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
  echo -ne "\e[5 q"
}

adbscr() {
  local host="${1:-${IP:-192.168.1.100}}"
  local port out
  if ! command -v nmap >/dev/null 2>&1; then
    echo "Error: nmap not installed"
    return 1
  fi
  # Scansiona porte e leggi una per volta; -Pn evita il ping, -T4 velocizza, --open mostra solo porte aperte
  while read -r port; do
    [ -z "$port" ] && continue
    printf "Trying %s:%s" "$host" "$port"
    out=$(timeout 6 adb connect "$host:$port" 2>&1) || true
    if printf '%s' "$out" | grep -qiE 'connected to|already connected to'; then
      echo " - Connected"
      # mirror.sh
      return 0
    else
      echo " - Failed"
      adb disconnect "$host:$port" >/dev/null 2>&1 || true
    fi
  done < <(nmap "$host" -p- --open -Pn -T4 2>/dev/null | awk '/\/tcp/ {print $1}')
  echo "Check Debug Wireless, none of the available ports are ADB"
  return 2
}
