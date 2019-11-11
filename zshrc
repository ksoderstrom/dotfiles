export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
export LC_ALL=en_US.UTF-8
if [[ -s ${ZIM_HOME}/init.zsh ]]; then
  source ${ZIM_HOME}/init.zsh
fi

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

alias -g "..."="../.."
alias -g "...."="../../.."
alias -g "....."="../../../.."

alias mkdir="mkdir -p"

alias b="bundle"
alias be="bundle exec"

alias devbox="ssh devbox pkill mosh-server; mosh -p 31125 devbox"

bindkey "^[b" backward-word
bindkey "^[f" forward-word

export PATH="$HOME/bin:$HOME/.rbenv/bin:$PATH"
[ -x "$(command -v rbenv)" ] && eval "$(rbenv init -)"
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

if [ `hostname` = "devbox" ]; then
  export RAILS_DATABASE_HOST=postgres
fi

# export TERM=screen-256color
export TERM=screen-256color-bce

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Android stuff
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
