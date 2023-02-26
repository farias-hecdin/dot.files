return {
  "VonHeikemen/lsp-zero.nvim",
  event = "InsertEnter",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Mason
    require('mason').setup()
    require("mason.settings").set({
      ui = {
        border = "rounded"
      }
    })

    local lsp = require("lsp-zero")
    lsp.preset("recommended") -- recommended / lsp-compe / lsp-only / manual-setup
    lsp.set_preferences({
      suggest_lsp_servers = false
    })
    -- list of LSP server (https://langserver.org/#arbitraryExecutionFootnote)
    lsp.ensure_installed({
      -- "tsserver",    -- Javascript/Typescript
      -- "phpactor",    -- PHP
      -- "pyright",     -- Python
      -- "sumneko_lua", -- Lua
    })
    lsp.nvim_workspace()
    lsp.setup()
  end

  -- Reserve space for diagnostic icons
  vim.opt.signcolumn = "yes"
}
