return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",  -- v2 is a full rewrite with a cleaner API
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local map = vim.keymap.set
    -- Mark the current file so you can jump back to it by number
    map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
    -- Open the quick menu to see and reorder marked files
    map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

    -- Direct jumps to the first four marked files
    map("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
    map("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
    map("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
    map("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
  end,
}
