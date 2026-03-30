return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
  },
  keys = {
    { "<leader>tt", function() require("neotest").run.run() end,                    desc = "Run nearest test" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,  desc = "Run file tests" },
    { "<leader>ts", function() require("neotest").summary.toggle() end,             desc = "Test summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test output" },
    { "<leader>tS", function() require("neotest").run.stop() end,                   desc = "Stop tests" },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest"),
        require("neotest-vitest"),
      },
    })
  end,
}
