# dotfiles

Personal dotfiles for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

- **Neovim** — `.config/nvim/` — Lua config with lazy.nvim
- **tmux** — `.tmux.conf` — prefix `C-Space`, vim-tmux-navigator
- **Zsh** — `.zshenv` (env for all shells), `.zshrc` (interactive config); create `~/.zshenv.local` / `~/.zshrc.local` for machine-specific overrides

## Install

```sh
git clone <repo> ~/dotfiles
cd ~/dotfiles
stow .
```

Stow symlinks everything into `~`, so `~/.tmux.conf` and `~/.config/nvim/` will point back into this repo.

## Dependencies

Install with [Homebrew](https://brew.sh):

```sh
brew install neovim tmux stow lazygit ripgrep
```

### Neovim

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), which bootstraps itself on first launch. LSP servers are installed via Mason (`:Mason`).

### tmux

Plugins are managed by [TPM](https://github.com/tmux-plugins/tpm):

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then inside tmux: `<prefix> I` to install plugins.
