# Change default zim location 
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

export LC_CTYPE=en_US.UTF-8

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

bindkey "^[b" backward-word
bindkey "^[f" forward-word

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

if which tmux 2>&1 >/dev/null; then
  if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
    exec true
  fi
fi
