return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<leader>ff",       function() require("fzf-lua").files() end,                  desc = "Find files" },
    { "<leader>fg",       function() require("fzf-lua").live_grep({ fzf_opts = { ['--disabled'] = false } }) end, desc = "Fuzzy grep" },
    { "<leader>fG",       function() require("fzf-lua").live_grep() end,              desc = "Live grep (regex)" },
    { "<leader>fb",       function() require("fzf-lua").buffers() end,                desc = "Buffers" },
    { "<leader>fh",       function() require("fzf-lua").help_tags() end,              desc = "Help tags" },
    { "<leader>fr",       function() require("fzf-lua").oldfiles() end,               desc = "Recent files" },
    { "<leader>fw",       function() require("fzf-lua").grep_cword() end,             desc = "Grep word under cursor" },
    { "<leader>fd",       function() require("fzf-lua").diagnostics_workspace() end,  desc = "Diagnostics" },
    { "<leader>fs",       function() require("fzf-lua").lsp_document_symbols() end,   desc = "Document symbols" },
    { "<leader>fS",       function() require("fzf-lua").lsp_workspace_symbols() end,  desc = "Workspace symbols" },
    { "<leader><leader>", function() require("fzf-lua").buffers() end,                desc = "Quick buffer switch" },
  },
  config = function()
    require("fzf-lua").setup({
      file_ignore_patterns = { "node_modules", ".git/" },
      files = {
        hidden = true,
      },
    })
  end,
}
