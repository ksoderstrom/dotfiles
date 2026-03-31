# .zshrc — interactive shells only

# History
export ZSH=$HOME/.zsh
export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS EXTENDED_HISTORY INC_APPEND_HISTORY

# Input — treat / as word boundary so Ctrl+W stops at path components
bindkey -e
WORDCHARS="${WORDCHARS:s/\//}"

# Completions — homebrew fpath before antigen so compinit picks it up
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Plugin config (must be set before antigen loads plugins)
LP_ENABLE_LOAD=0
LP_ENABLE_BATT=0
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Plugins
source /opt/homebrew/share/antigen/antigen.zsh
antigen bundle liquidprompt/liquidprompt
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen apply

# History substring search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# Aliases
alias -g "..."="../.."
alias -g "...."="../../.."
alias -g "....."="../../../.."
alias mkdir="mkdir -p"
alias vim=nvim
alias g=git
alias df="df -h"
alias du="du -h"
alias ls="ls --color=auto"
alias ll="ls -lh"
alias l=ls

# GPG — needed for commit signing in terminal/tmux
export GPG_TTY=$(tty)

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# Auto-use .nvmrc when changing directories
autoload_nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [[ -n "$nvmrc_path" ]]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [[ "$nvmrc_node_version" == "N/A" ]]; then
      nvm install
    elif [[ "$nvmrc_node_version" != "$(nvm version)" ]]; then
      nvm use
    fi
  elif [[ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ]] && [[ "$(nvm version)" != "$(nvm version default)" ]]; then
    nvm use default --silent
  fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd autoload_nvmrc
autoload_nvmrc

# Worktrunk — git worktree manager
command -v wt &>/dev/null && eval "$(wt config shell init zsh)"

# dev — set up 3-pane tmux layout: nvim top-left (85%), shell bottom-left (15%), claude right (25%).
# Only runs when inside tmux with a single pane (fresh window).
dev() {
  [ -z "$TMUX" ] && return
  [ "$(tmux list-panes | wc -l | tr -d ' ')" -ne 1 ] && return

  local branch=$(git branch --show-current 2>/dev/null | sed 's|.*/||')
  tmux rename-window "$branch"
  tmux set-option -w automatic-rename off
  tmex -l "{31}2{61}1" -f 1 -- "nvim" "" "claude"
}

# wts — switch worktree and set up dev layout
compdef wts=wt
wts() {
  wt "$@" || return
  dev
}

# fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# iTerm2 shell integration
[[ -f ~/.iterm2_shell_integration.zsh ]] && source ~/.iterm2_shell_integration.zsh

# Machine-local interactive config (not tracked — create ~/.zshrc.local to customize)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
