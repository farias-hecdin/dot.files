return {
  {
    -- "echasnovski/mini.tabline",
    -- commit = "c963f8a0f20944a54d649f432e166896de9e927e",
    dir = "~/.config/nvim/src/plugins/" .. "__mini-tabline",
    config = function()
      require("mini.tabline").setup()
    end
  },
  {
    -- "echasnovski/mini.starter",
    dir = "~/.config/nvim/src/plugins/" .. "__mini-starter",
    config = function()
      local W = require("USER.widgets")
      local starter = require('mini.starter')

      starter.setup({
        evaluate_single = true,
        items = {
          starter.sections.builtin_actions(),
          starter.sections.recent_files(5, true),
          starter.sections.recent_files(9, false),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.indexing('section', { 'Builtin actions' }),
          starter.gen_hook.padding(8, 1),
        },
        header = W.app_date(),
        footer = " ",
      })
    end
  },
  {
    -- "tamton-aquib/staline.nvim",
    -- commit = "69b5520694852cc28ef592c3da283d9119ea3b29",
    dir = "~/.config/nvim/src/plugins/" .. "__staline-nvim",
    config = function()
      require("staline").setup({
        defaults = {
          expand_null_ls = false, -- This expands out all the null-ls sources to be shown
          full_path = false,
          line_column = " %l/%L•%c  %p%%", -- `:h stl` to see all flags.
          fg = "#000000", -- Foreground text color.
          bg = "none", -- Default background is transparent.
          inactive_color = "#303030",
          inactive_bgcolor = "#303030",
          true_colors = true, -- true lsp colors.
          font_active = "none", -- "bold", "italic", "bold,italic", etc
          mod_symbol = "  ",
          lsp_client_symbol = " ",
          branch_symbol = " ",
          cool_symbol = " ", -- Change this to override default OS icon.
          null_ls_symbol = "" -- A symbol to indicate that a source is coming from null-ls
        },
        mode_colors = {
          R = "#E57373",
          -- S = "",
          V = "#40C4FF",
          c = "#FFFFFF",
          i = "#FFFF00",
          -- ic = "",
          n = "#2BBB4F",
          r = "#F44336",
          -- s = "",
          t = "#FFA000",
          v = "#0091EA", -- etc..
        },
        mode_icons = {
          R  = "R",
          S  = "S",
          V  = "V",
          V  = "V-B",
          c  = "C",
          i  = "I",
          ic = "I-C",
          n  = "N",
          r  = "r",
          s  = "s",
          t  = "T",
          v  = "V", -- etc..
        },
        sections = {
          left  = {"-mode","file_size", "counter", "%m", "branch"},
          mid   = {"-line_column"},
          right = {"lsp_name", " ", "diagnostics", "lazy","-clock"}
        },
        lsp_symbols = {
          Error = " ",
          Info = " ",
          Warn = " ",
          Hint = ""
        },
        special_table = {
          help = { 'Help', ' ' },
        }
      })
    end
  }
}
