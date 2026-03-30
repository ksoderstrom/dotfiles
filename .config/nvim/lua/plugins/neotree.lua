return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,   -- show hidden files
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,          -- highlight the current file in the tree
        },
        use_libuv_file_watcher = true,  -- watch filesystem for external changes
      },
      window = {
        position = "left",
        width = 35,
      },
    })
  end,
}
