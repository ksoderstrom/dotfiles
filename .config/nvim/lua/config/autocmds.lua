local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Auto-reload files changed outside of Neovim (e.g. by Claude Code)
local reload_group = augroup("AutoReload", { clear = true })
autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = reload_group,
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

-- Refresh gitsigns after external file changes are reloaded
autocmd("FileChangedShellPost", {
  group = reload_group,
  callback = function()
    local gs = package.loaded.gitsigns
    if gs then gs.refresh() end
  end,
})

-- Resize splits when window is resized
local resize_group = augroup("ResizeSplits", { clear = true })
autocmd("VimResized", {
  group = resize_group,
  callback = function()
    vim.cmd([[tabdo wincmd =]])
  end,
})
