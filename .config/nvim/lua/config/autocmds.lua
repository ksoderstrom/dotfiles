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

-- Hash-based undo filenames for long paths (avoids 255-byte filename limit)
local undo_group = augroup("HashedUndo", { clear = true })
local undo_dir = vim.fn.stdpath("state") .. "/undo/"

local function needs_hash(buf)
  local path = vim.api.nvim_buf_get_name(buf)
  return path ~= "" and (#path > 240 or path:match("^diffview://"))
end

local function hashed_undo_path(buf)
  return undo_dir .. vim.fn.sha256(vim.api.nvim_buf_get_name(buf))
end

autocmd("BufRead", {
  group = undo_group,
  callback = function(args)
    if not needs_hash(args.buf) then return end
    vim.bo[args.buf].undofile = false
    local path = hashed_undo_path(args.buf)
    if vim.fn.filereadable(path) == 1 then
      pcall(vim.cmd, "silent rundo " .. vim.fn.fnameescape(path))
    end
  end,
})

autocmd("BufWritePost", {
  group = undo_group,
  callback = function(args)
    if not needs_hash(args.buf) then return end
    pcall(vim.cmd, "silent wundo " .. vim.fn.fnameescape(hashed_undo_path(args.buf)))
  end,
})
