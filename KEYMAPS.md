# Keymaps Cheatsheet

## tmux

Prefix: `C-Space`

### Panes

| Key | Action |
|-----|--------|
| `C-h/j/k/l` | Navigate panes (no prefix, shared with vim) |
| `prefix h` | Split left |
| `prefix j` | Split down |
| `prefix k` | Split up |
| `prefix l` | Split right |
| `prefix H/J/K/L` | Resize pane (repeatable) |
| `prefix x` | Kill pane (confirm) |
| `prefix X` | Kill window (confirm) |
| `prefix C-Space` | Last active pane |
| `prefix z` | Toggle pane zoom (fullscreen) |
| `prefix q` | Show pane numbers, then type number to jump |
| `prefix {` / `prefix }` | Swap pane left / right |
| `prefix !` | Break pane into its own window |

### Windows

| Key | Action |
|-----|--------|
| `prefix c` | New window |
| `prefix ,` | Rename window |
| `prefix &` | Kill window (confirm) |
| `prefix Left/Right` | Move window left/right (repeatable) |
| `prefix n` / `prefix p` | Next / previous window |
| `prefix 1-9` | Jump to window by number |
| `prefix w` | Window/session tree picker |
| `prefix l` | Last window (overridden — use split right) |
| `prefix .` | Move window to another session |
| `prefix f` | Find window by name |

### Sessions

| Key | Action |
|-----|--------|
| `prefix s` | Session picker |
| `prefix d` | Detach |
| `prefix $` | Rename session |
| `prefix (` / `prefix )` | Previous / next session |
| `prefix L` | Last session (overridden — use resize) |

### Copy mode (vi)

| Key | Action |
|-----|--------|
| `prefix [` | Enter copy mode |
| `v` | Begin selection |
| `y` | Yank selection (tmux-yank copies to system clipboard) |
| `q` / `Esc` | Exit copy mode |
| `/` / `?` | Search forward / backward |

### Other

| Key | Action |
|-----|--------|
| `prefix R` | Reload config |
| `prefix b` | Toggle status bar |
| `prefix I` | Install plugins (TPM) |
| `prefix ?` | List all key bindings |
| `prefix t` | Show clock |
| `prefix :` | Command prompt |

## Neovim

Leader: `Space`

### Swedish layout

`ö` = `[`, `ä` = `]` — all bracket motions work with these.

### Essentials

| Key | Action |
|-----|--------|
| `jk` | Escape (insert mode) |
| `Q` | Disabled (no ex mode) |
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `<leader>Q` | Quit all (force) |
| `Esc` | Clear search highlight |
| `<leader>R` | Reload config |

### Navigation

| Key | Action |
|-----|--------|
| `C-d` / `C-u` | Half-page down/up (centered) |
| `n` / `N` | Next/prev search match (centered) |
| `s` | Flash jump |
| `S` | Flash treesitter select |
| `gg` / `G` | Top / bottom of file |
| `{` / `}` | Previous / next paragraph |
| `%` | Jump to matching bracket |
| `C-o` / `C-i` | Jump back / forward in jumplist |
| `gf` | Go to file under cursor |
| `*` / `#` | Search word under cursor forward / backward |
| `zz` / `zt` / `zb` | Center / top / bottom cursor on screen |

### Editing

| Key | Action |
|-----|--------|
| `J` / `K` (visual) | Move selection down/up |
| `<` / `>` (visual) | Indent and stay in visual |
| `p` (visual) | Paste without clobbering register |
| `sa` / `sd` / `sr` | Surround add/delete/replace (mini.surround) |
| `ciw` / `caw` | Change inner/around word |
| `ci"` / `ca"` | Change inner/around quotes (also `'`, `` ` ``, `(`, `{`, `[`) |
| `dit` / `dat` | Delete inner/around HTML tag |
| `J` (normal) | Join line below |
| `~` | Toggle case |
| `gu` / `gU` | Lowercase / uppercase (with motion) |
| `C-a` / `C-x` | Increment / decrement number |
| `.` | Repeat last change |
| `u` / `C-r` | Undo / redo |

### Clipboard

| Key | Action |
|-----|--------|
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader>p` | Paste from system clipboard |

### Splits

| Key | Action |
|-----|--------|
| `C-h/j/k/l` | Navigate splits (shared with tmux) |
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |
| `<leader>se` | Equalize splits |
| `<leader>sx` | Close split |
| `C-Arrow` | Resize split |

### Buffers

| Key | Action |
|-----|--------|
| `S-h` / `S-l` | Previous / next buffer |
| `<leader>bd` | Delete buffer |
| `<leader><leader>` | Quick buffer switch (telescope) |

### Telescope (find)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |
| `<leader>fw` | Grep word under cursor |
| `<leader>fd` | Diagnostics |
| `<leader>fs` | Document symbols |
| `<leader>fS` | Workspace symbols |

### Harpoon

| Key | Action |
|-----|--------|
| `<leader>a` | Add file to harpoon |
| `C-e` | Harpoon quick menu |
| `<leader>1-4` | Jump to harpoon file 1-4 |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `gy` | Go to type definition |
| `K` | Hover documentation |
| `C-k` (insert) | Signature help |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename symbol |
| `<leader>cf` | Format buffer |
| `<leader>cd` | Show diagnostic float |
| `<leader>cs` | Symbol outline (aerial) |
| `öd` / `äd` | Previous / next diagnostic |

### Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |
| `äc` / `öc` | Next / prev hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gS` | Stage buffer |
| `<leader>gu` | Undo stage hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame line (full) |
| `<leader>gB` | Toggle inline blame |
| `<leader>gd` | Diff against index |
| `<leader>gD` | Diffview open |
| `<leader>gx` | Diffview close |
| `<leader>gh` | File history |

### Trouble (diagnostics panel)

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle diagnostics |
| `<leader>xd` | Buffer diagnostics |
| `<leader>xq` | Quickfix list |

### Tests (neotest)

| Key | Action |
|-----|--------|
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run file tests |
| `<leader>ts` | Test summary |
| `<leader>to` | Test output |
| `<leader>tS` | Stop tests |

### File Explorer

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle neo-tree |
