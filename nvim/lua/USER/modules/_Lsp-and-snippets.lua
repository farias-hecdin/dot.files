return {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      -- Load vs-code like snippets from plugins (e.g. friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load(
        -- { paths = { "./src/snippets" } }
      )
    end
  },
  {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require('lspconfig')
    local configs = require('lspconfig/configs')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.emmet_ls.setup({
      -- on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'vue', 'css', 'sass', 'scss' },
      init_options = {
        html = {
          options = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            ["bem.enabled"] = true,
          },
        },
      }
    })
  end
},
}
