local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local uv = vim.uv or vim.loop

local function refresh_git_ui()
  local gs = package.loaded.gitsigns
  if gs then gs.refresh() end
  pcall(vim.cmd, "silent! diffupdate")
end

local function maybe_checktime(bufnr)
  if vim.fn.mode() == "c" then return end
  pcall(vim.cmd, "silent! checktime " .. bufnr)
end

local function start_pi_changed_files_watcher()
  local channel_id = vim.env.PI_CHANNEL_ID
  if not channel_id or channel_id == "" or not uv then return end

  local root = vim.fn.getcwd()
  local pi_dir = root .. "/.pi"
  local event_file = pi_dir .. "/.pi-changed-files." .. channel_id .. ".log"
  local event_name = vim.fn.fnamemodify(event_file, ":t")

  vim.fn.mkdir(pi_dir, "p")

  local state = {
    offset = 0,
    timer = uv.new_timer(),
    watcher = uv.new_fs_event(),
  }

  local function process_event_file()
    if vim.fn.filereadable(event_file) ~= 1 then
      state.offset = 0
      return
    end

    local lines = vim.fn.readfile(event_file)
    local content = table.concat(lines, "\n")
    if #lines > 0 then content = content .. "\n" end

    if #content < state.offset then
      state.offset = 0
    end

    local new_content = content:sub(state.offset + 1)
    state.offset = #content
    if new_content == "" then return end

    local changed = {}
    for line in new_content:gmatch("[^\n]+") do
      local rel_path = line:match("^(.-)\t%d+$")
      if rel_path and rel_path ~= "" then
        changed[vim.fn.fnamemodify(root .. "/" .. rel_path, ":p")] = true
      end
    end

    if next(changed) == nil then return end

    local refreshed = false
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buftype == "" then
        local name = vim.api.nvim_buf_get_name(bufnr)
        if name ~= "" and changed[vim.fn.fnamemodify(name, ":p")] then
          maybe_checktime(bufnr)
          refreshed = true
        end
      end
    end

    if refreshed then refresh_git_ui() end
  end

  local function schedule_process()
    state.timer:stop()
    state.timer:start(100, 0, function()
      vim.schedule(process_event_file)
    end)
  end

  state.watcher:start(pi_dir, {}, function(err, filename)
    if err then return end
    if filename == nil or filename == event_name then
      schedule_process()
    end
  end)

  autocmd("VimLeavePre", {
    group = augroup("PiChangedFilesWatcherCleanup", { clear = true }),
    callback = function()
      if state.timer then
        state.timer:stop()
        state.timer:close()
      end
      if state.watcher then
        state.watcher:stop()
        state.watcher:close()
      end
    end,
  })

  schedule_process()
end

-- Auto-reload files changed outside of Neovim (e.g. by pi)
local reload_group = augroup("AutoReload", { clear = true })
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
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
  callback = refresh_git_ui,
})

start_pi_changed_files_watcher()

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
