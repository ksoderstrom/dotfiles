return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",  -- compile the C fzf sorter for much faster fuzzy matching
    },
  },
  keys = {
    { "<leader>ff",        "<cmd>Telescope find_files<CR>",           desc = "Find files" },
    { "<leader>fg",        "<cmd>Telescope live_grep<CR>",            desc = "Live grep" },
    { "<leader>fb",        "<cmd>Telescope buffers<CR>",              desc = "Buffers" },
    { "<leader>fh",        "<cmd>Telescope help_tags<CR>",            desc = "Help tags" },
    { "<leader>fr",        "<cmd>Telescope oldfiles<CR>",             desc = "Recent files" },
    { "<leader>fw",        "<cmd>Telescope grep_string<CR>",          desc = "Grep word under cursor" },
    { "<leader>fd",        "<cmd>Telescope diagnostics<CR>",          desc = "Diagnostics" },
    { "<leader>fs",        "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
    { "<leader>fS",        "<cmd>Telescope lsp_workspace_symbols<CR>",desc = "Workspace symbols" },
    { "<leader><leader>",  "<cmd>Telescope buffers<CR>",              desc = "Quick buffer switch" },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        -- Skip these paths when searching — they're rarely what you want
        file_ignore_patterns = { "node_modules", ".git/" },
      },
      pickers = {
        find_files = {
          hidden = true,  -- include dotfiles in file search
        },
      },
    })

    -- Use the compiled fzf sorter instead of the default Lua sorter
    telescope.load_extension("fzf")
  end,
}
