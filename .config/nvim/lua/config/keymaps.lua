local map = vim.keymap.set

-- ── Swedish layout fixes ──────────────────────────────────────────────────────
-- On a Swedish keyboard, [ and ] are awkward to reach.
-- Remap ö → [ and ä → ] so all bracket-prefixed motions work naturally.
-- remap=true chains into plugin mappings like [c, ]d, öö→[[, ää→]] etc.
map({ "n", "v", "o" }, "ö", "[", { remap = true })
map({ "n", "v", "o" }, "ä", "]", { remap = true })

-- ── Essentials ────────────────────────────────────────────────────────────────
map("n", "Q", "<nop>")  -- disable ex mode
map("i", "jk", "<Esc>")
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>q", "<cmd>q<CR>")
map("n", "<leader>Q", "<cmd>qa!<CR>")
map("n", "<Esc>", "<cmd>noh<CR>")

-- ── Navigation ────────────────────────────────────────────────────────────────
-- Move by visual lines when no count given, real lines when a count is used.
-- This makes j/k intuitive on wrapped lines but still works with e.g. 5j.
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Half-page jumps that keep the cursor centered on screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep search matches centered and unfold if inside a fold
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- ── Editing ───────────────────────────────────────────────────────────────────
map("v", "J", "<cmd>m '>+1<CR>gv=gv")
map("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- Stay in visual mode after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Paste over selection without clobbering the default register.
-- Normally pasting over a selection replaces the register with the deleted text.
map("v", "p", '"_dP')

-- ── Clipboard ─────────────────────────────────────────────────────────────────
-- Explicit system clipboard access (clipboard="" keeps registers isolated otherwise)
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>Y", '"+Y')
map({ "n", "v" }, "<leader>p", '"+p')

-- ── Windows / Splits ──────────────────────────────────────────────────────────
-- C-h/j/k/l are handled by vim-tmux-navigator (splits + tmux panes)

map("n", "<leader>sv", "<cmd>vsplit<CR>")
map("n", "<leader>sh", "<cmd>split<CR>")
map("n", "<leader>se", "<C-w>=")
map("n", "<leader>sx", "<cmd>close<CR>")

map("n", "<C-Up>",    "<cmd>resize +2<CR>")
map("n", "<C-Down>",  "<cmd>resize -2<CR>")
map("n", "<C-Left>",  "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- ── Buffers ───────────────────────────────────────────────────────────────────
map("n", "<S-h>", "<cmd>bprevious<CR>")
map("n", "<S-l>", "<cmd>bnext<CR>")
map("n", "<leader>bd", "<cmd>bdelete<CR>")
