export NODE_BINARY="/Users/ks/n/bin/node"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
