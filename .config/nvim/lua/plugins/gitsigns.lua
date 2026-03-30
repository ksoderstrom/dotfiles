return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
        end

        -- Navigate hunks (ä/ö = Swedish ] / [ remaps)
        map("n", "äc", gs.next_hunk, "Next hunk")
        map("n", "öc", gs.prev_hunk, "Prev hunk")

        -- Stage / unstage individual hunks without leaving Neovim
        map("n", "<leader>gs", gs.stage_hunk,       "Stage hunk")
        map("n", "<leader>gr", gs.reset_hunk,       "Reset hunk")
        map("n", "<leader>gS", gs.stage_buffer,     "Stage entire buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk,  "Undo stage hunk")

        -- Inspect changes
        map("n", "<leader>gp", gs.preview_hunk,  "Preview hunk inline")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line (full)")
        map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle inline blame")
        map("n", "<leader>gd", gs.diffthis, "Diff against index")
      end,
    })
  end,
}
