return {
  -- vim-tmux-navigator: seamless <C-h/j/k/l> movement across Neovim splits and tmux panes
  -- Requires the matching plugin in ~/.tmux.conf
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,  -- must load eagerly so it can intercept C-h/j/k/l from the start
  },

  -- Lualine: fast, configurable statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "gruvbox" },
      })
    end,
  },

  -- nvim-autopairs: auto-close brackets, quotes, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({ check_ts = true })  -- use treesitter to avoid pairing in strings/comments

      -- When accepting a function completion, automatically add the closing paren
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- indent-blankline: visual indent guides and current scope highlight
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    main = "ibl",  -- v3 uses the "ibl" module name
    config = function()
      require("ibl").setup({
        scope = { enabled = true },
      })
    end,
  },
}
