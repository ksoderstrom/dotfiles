return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    local flash = require("flash")
    flash.setup()

    local map = vim.keymap.set
    map({ "n", "v", "o" }, "gs", function() flash.jump() end, { desc = "Flash jump" })
    map({ "n", "v", "o" }, "gS", function() flash.treesitter() end, { desc = "Flash treesitter" })
  end,
}
