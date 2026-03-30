return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>gD", "<cmd>DiffviewOpen<CR>",        desc = "Diffview open" },
    { "<leader>gx", "<cmd>DiffviewClose<CR>",       desc = "Diffview close" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "File history" },
  },
  config = function()
    require("diffview").setup()
  end,
}
