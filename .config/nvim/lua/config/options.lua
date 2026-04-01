-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.foldlevelstart = 99

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true  -- overrides ignorecase when pattern contains uppercase
vim.opt.hlsearch = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"    -- always show; prevents layout shift on LSP attach
vim.opt.cursorline = true
vim.opt.showmode = false      -- lualine shows the mode instead

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Performance
vim.opt.updatetime = 250   -- faster CursorHold events (LSP hover, gitsigns)
vim.opt.timeoutlen = 300

-- Persistence
vim.opt.undofile = true  -- persist undo history across sessions

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Don't sync with system clipboard automatically.
-- Use <leader>y / <leader>p for explicit system clipboard access.
vim.opt.clipboard = ""

vim.opt.mouse = "a"
vim.opt.autoread = true  -- reload files changed outside Neovim
