return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup()

    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>c", group = "Code" },
      { "<leader>s", group = "Split" },
      { "<leader>b", group = "Buffer" },
      { "<leader>x", group = "Diagnostics" },
      { "<leader>t", group = "Test" },
    })
  end,
}
