# Change default zim location 
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

export LC_ALL=en_US.UTF-8

# Source zim
if [[ -s ${ZIM_HOME}/init.zsh ]]; then
  source ${ZIM_HOME}/init.zsh
fi

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export EDITOR="vim"

alias -g "..."="../.."
alias -g "...."="../../.."
alias -g "....."="../../../.."

alias mkdir="mkdir -p"

alias b="bundle"
alias be="bundle exec"

alias devbox="ssh devbox pkill mosh-server; mosh -p 31125 devbox"

# Git aliases
alias g="git status -sb"
alias ga="git add"
alias gr="git rm"
alias gb="git branch -v"
alias gc="git commit"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gco="git checkout"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gp="git pull --rebase"
alias gsl="git stash list"
alias gsp="git stash pop"
alias gss="git stash save"
alias gd="git diff --color-words"

bindkey "^[b" backward-word
bindkey "^[f" forward-word

export PATH="$HOME/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/opt/curl/bin:$PATH"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export NODE_BINARY="/Users/ks/n/bin/node"

if which tmux 2>&1 >/dev/null; then
  if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
    exec true
  fi
fi

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Always set the ssh agent in the same place
if [ "$SSH_AUTH_SOCK" != "$HOME/.ssh/ssh_auth_sock" ]; then
  ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh_auth_sock"
  export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"
fi

export PATH="$HOME/.fastlane/bin:$PATH"
