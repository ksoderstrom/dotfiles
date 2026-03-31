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
      default_component_configs = {
        indent = {
          indent_size = 1,
        },
        container = {
          enable_character_fade = false,
        },
      },
      renderers = {
        directory = {
          { "indent" },
          { "icon" },
          { "current_filter" },
          { "container", content = {
            { "name", zindex = 10 },
            { "clipboard", zindex = 10 },
            { "diagnostics", zindex = 20, align = "right", hide_when_expanded = true },
            { "git_status", zindex = 20, align = "right", hide_when_expanded = true },
          }},
        },
        file = {
          { "indent" },
          { "icon" },
          { "container", content = {
            { "name", zindex = 10 },
            { "clipboard", zindex = 10 },
            { "bufnr", zindex = 10 },
            { "modified", zindex = 20, align = "right" },
            { "diagnostics", zindex = 20, align = "right" },
            { "git_status", zindex = 20, align = "right" },
          }},
        },
      },
      filesystem = {
        group_empty_dirs = true,
        scan_mode = "deep",
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },
      window = {
        position = "left",
        width = 35,
      },
    })
  end,
}
