############################
# ///  ZSH CORE SETUP  /// #
############################

autoload -Uz compinit
compinit
autoload -Uz colors && colors
autoload -Uz vcs_info
setopt PROMPT_SUBST


########################
# ///  GIT PROMPT  /// #
########################

ZSH_THEME_GIT_PROMPT_PREFIX="%{${fg_bold[green]}%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="🗸"
ZSH_THEME_GIT_PROMPT_DIRTY="✗"

git_prompt_info() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if git diff --quiet 2>/dev/null; then
      echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${branch}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    else
      echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${branch}${ZSH_THEME_GIT_PROMPT_DIRTY}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    fi
  fi
}


####################
# ///  PROMPT  /// #
####################

PROMPT="%{${fg_bold[blue]}%}[ %{${fg[red]}%}%n@%m:%~\$(git_prompt_info)%{${fg_bold[blue]}%} ]%{$reset_color%}
 $ "


####################
# ///  PLUGIN  /// #
####################


# Autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highliting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#####################
# ///  HISTORY  /// #
#####################

HISTFILE=~/.zsh_history

setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY


######################
# ///  KEYBINDS  /// #
######################

stty -ixon
bindkey -r '^S'


###################
# ///  ALIAS  /// #
###################

alias cleanhistory='history -c && fc -p'


#######################
# ///  FUNCTIONS  /// #
#######################

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
    echo "Errore: nmap non installato"
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


#######################
# ///  AUTOSTART  /// #
#######################

if [ "$TERM_PROGRAM" != "vscode" ] && command -v fastfetch &> /dev/null; then
    fastfetch
fi
