return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- update all installed parsers when the plugin updates
  config = function()
    require("nvim-treesitter").setup({
      -- Parsers to always have installed
      ensure_installed = {
        "typescript", "tsx", "javascript",
        "lua",
        "json",
        "html", "css",
        "markdown", "markdown_inline",  -- markdown_inline for inline code/math
        "bash",
        "yaml", "toml",
        "vim", "vimdoc",  -- for editing vimscript and Neovim help files
        "regex",          -- useful for highlighting regex inside other languages
      },
      auto_install = true,  -- auto-install a parser when opening an unrecognised filetype

      highlight = {
        enable = true,  -- use treesitter for syntax highlighting instead of regex
      },

      indent = {
        enable = true,  -- use treesitter for = indentation (smarter than built-in)
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection   = "<CR>",   -- start selection at cursor node
          node_incremental = "<CR>",   -- expand selection to next node
          scope_incremental = false,
          node_decremental = "<bs>",   -- shrink selection back
        },
      },
    })
  end,
}
