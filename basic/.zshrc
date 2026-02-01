############################
# ///  ZSH CORE SETUP  /// #
############################

autoload -Uz colors && colors
autoload -Uz vcs_info
setopt PROMPT_SUBST


##########################################
# ///  VCS (git prompt replacement)  /// #
##########################################

zstyle ':vcs_info:git:*' formats '(%b%s)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'
zstyle ':vcs_info:*' enable git

precmd() {
  vcs_info
}

git_prompt_info() {
  if [[ -n "$vcs_info_msg_0_" ]]; then
    if git diff --quiet 2>/dev/null; then
      echo "%{${fg_bold[green]}%}${vcs_info_msg_0_}🗸%{$reset_color%}"
    else
      echo "%{${fg_bold[green]}%}${vcs_info_msg_0_}✗%{$reset_color%}"
    fi
  fi
}


####################
# ///  PROMPT  /// #
####################

PROMPT=" %{${fg_bold[blue]}%}[ %{${fg[red]}%}%n@%m:%~\$(git_prompt_info)%{${fg_bold[blue]}%} ]%{$reset_color%}
 $ "


##############################
# ///  PLUGIN (manuali)  /// #
##############################


# Autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highliting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#####################
# ///  HISTORY  /// #
#####################

HISTFILE=~/.zsh_history

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY


######################
# ///  KEYBINDS  /// #
######################

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

#if [ "$TERM_PROGRAM" != "vscode" ] && command -v fastfetch &> /dev/null; then
#    fastfetch
#fi
