return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",           -- LSP completion source
    "hrsh7th/cmp-buffer",             -- words from open buffers
    "hrsh7th/cmp-path",               -- filesystem paths
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",       -- LuaSnip as a cmp source
    "rafamadriz/friendly-snippets",   -- large collection of pre-made snippets
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Load the VSCode-style snippets from friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        -- LuaSnip handles snippet expansion
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),  -- next completion item
        ["<C-p>"] = cmp.mapping.select_prev_item(),  -- prev completion item
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),     -- scroll docs up
        ["<C-f>"] = cmp.mapping.scroll_docs(4),      -- scroll docs down
        ["<CR>"]  = cmp.mapping.confirm({ select = true }), -- confirm (select first if none highlighted)
        ["<C-e>"] = cmp.mapping.abort(),             -- close completion menu

        -- Tab: expand snippet or move to next placeholder, else select next item
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Shift-Tab: move to previous snippet placeholder or select prev item
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      -- Source priority: LSP first, then snippets, buffer words, paths
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
