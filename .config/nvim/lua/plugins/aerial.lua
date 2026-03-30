return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>cs", "<cmd>AerialToggle<CR>", desc = "Symbol outline" },
  },
  config = function()
    require("aerial").setup({
      backends = { "treesitter", "lsp" },
      layout = {
        width = 35,
        default_direction = "right",
      },
      attach_mode = "global",
      show_guides = true,
    })
  end,
}
