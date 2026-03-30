return {
  {
    "neovim/nvim-lspconfig", -- still needed for server definitions (cmd, filetypes, root_dir)
    dependencies = {
      "williamboman/mason.nvim",           -- installs LSP servers, linters, formatters
      "williamboman/mason-lspconfig.nvim", -- bridges mason with lspconfig auto-setup
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls",      -- TypeScript / JavaScript
          "lua_ls",     -- Lua (with Neovim globals awareness)
          "jsonls",     -- JSON with schema support
          "html",
          "cssls",      -- CSS / SCSS / Less
          "tailwindcss",
          "eslint",     -- ESLint as an LSP (fix-on-save capable)
        },
        automatic_installation = true,
      })

      -- Advertise nvim-cmp completion capabilities to all servers
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- lua_ls needs extra config to understand the Neovim runtime
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.enable({ "ts_ls", "lua_ls", "jsonls", "html", "cssls", "tailwindcss", "eslint" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
          end

          map("n", "gd",  vim.lsp.buf.definition,      "Go to definition")
          map("n", "gD",  vim.lsp.buf.declaration,     "Go to declaration")
          map("n", "gr",  vim.lsp.buf.references,      "Go to references")
          map("n", "gi",  vim.lsp.buf.implementation,  "Go to implementation")
          map("n", "gy",  vim.lsp.buf.type_definition, "Go to type definition")
          map("n", "K",   vim.lsp.buf.hover,           "Hover documentation")

          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>cr", vim.lsp.buf.rename,      "Rename symbol")
          map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")

          -- öd/äd = [d/]d via the Swedish ö→[ ä→] remaps
          map("n", "öd", vim.diagnostic.goto_prev,   "Previous diagnostic")
          map("n", "äd", vim.diagnostic.goto_next,   "Next diagnostic")
          map("n", "<leader>cd", vim.diagnostic.open_float, "Show diagnostic float")

          map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
        end,
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false, -- don't update diagnostics while typing
        severity_sort = true,
      })
    end,
  },
}
