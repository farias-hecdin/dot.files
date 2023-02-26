return {
  {
    dir = "~/.config/nvim/src/plugins/" .. "__cmp-buffer",
    event = "InsertEnter"
  },
  {
    dir = "~/.config/nvim/src/plugins/" .. "__cmp-nvim-lsp",
    event = "InsertEnter"
  },
  {
    dir = "~/.config/nvim/src/plugins/" .. "__cmp-path",
    event = "InsertEnter"
  },
  {
    dir = "~/.config/nvim/src/plugins/" .. "__cmp_luasnip",
    event = "InsertEnter"
  },
  {
    dir = "~/.config/nvim/src/plugins/" .. "__cmp-cmdline",
    keys = { ":" }
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    keys = { ":" },
    dependencies = {
      -- "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          documentation = {
            border = "rounded",
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
          },
          completion = {
            border = "rounded",
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
          }
        },
        mapping = cmp.mapping.preset.insert({
          ["<Up>"]      = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}), -- previous suggestion
          ["<Down>"]    = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}), -- next suggestion
          ["<C-p>"]     = cmp.mapping.select_prev_item(),
          ["<C-n>"]     = cmp.mapping.select_next_item(),
          ["<C-u>"]     = cmp.mapping.scroll_docs(-4), -- scrolling documentation
          ["<C-f>"]     = cmp.mapping.scroll_docs(4),
          ["<C-e>"]     = cmp.mapping.abort(), -- close completion window
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<Esc>"]     = cmp.mapping.close(), -- close cmp
          ["<CR>"]      = cmp.mapping.confirm({ select = false }),
          ["<Tab>"]     = cmp.mapping(function(fallback)
            local col = vim.fn.col(".") - 1
            if cmp.visible() then
              cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
              fallback()
            else
              cmp.complete()
            end
          end, {"i", "s"}),
        }),

        -- sources for autocompletion
        sources = cmp.config.sources({
          {
            name = "path", -- For file system paths
            keyword_length = 2,
            max_item_count = 2,
            priority = 50,
          },
          {
            name = "nvim_lsp", -- For lsp
            keyword_length = 2,
            max_item_count = 3,
            priority = 60,
          },
          {
            name = "buffer", -- For text within current buffer
            keyword_length = 2,
            max_item_count = 3,
            priority = 100,
          },
          {
            name = "luasnip", -- For luasnip users
            keyword_length = 3,
            max_item_count = 2,
            priority = 80,
          },
        }),
        -- configure icons
        formatting = {
          fields = {"menu","abbr", "kind"},
          format = function(entry, item)
            local menu_icon = {
              buffer   = " ",
              cmdline  = " ",
              luasnip  = " ",
              nvim_lsp = " ",
              path     = " ",
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {{
            name = "path"
          }},
          {{
            name = "cmdline",
            option = { ignore_cmds = {"Man", "!"} }
          }}
        )
      })
      vim.opt.completeopt = {"menu", "menuone", "noselect"}
    end
  },
}
