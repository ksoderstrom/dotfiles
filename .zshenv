# .zshenv — loaded for ALL shells (interactive, non-interactive, scripts)
# Keep this fast: no plugins, no completions, no slow initializations.

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export BROWSER='open'

export DO_NOT_TRACK=1

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export LESS='-F -g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# PATH — use typeset -U to auto-deduplicate
typeset -gU path
path=(
  $HOME/bin
  $HOME/.local/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /usr/local/sbin
  $path
)

# Cargo
[[ -f $HOME/.cargo/env ]] && source "$HOME/.cargo/env"

# Machine-local exports (not tracked — create ~/.zshenv.local to customize)
[[ -f $HOME/.zshenv.local ]] && source "$HOME/.zshenv.local"
