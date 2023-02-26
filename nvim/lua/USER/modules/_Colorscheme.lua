return {
  { -- https://github.com/navarasu/onedark.nvim
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker",
        code_style = {
          -- functions = "italic"
        },
        colors = {
          bg0    = "#000000",
          bg1    = "#000000",
          blue   = "#cb9dee",
          purple = "#a454e2",
        },
        highlights = {
          Comment                     = { fg="#007272" },
          ["@comment"]                = { fg="#007272" },
          MiniIndentscopeSymbol       = { fg="#777777" },
          Whitespace                  = { fg="#333333" }, -- SimpleIndentGuide
          TreesitterContextLineNumber = { bg="#0a3161" },
          TreesitterContext           = { bg="#061d3a" },
          CursorLineNr                = { fg="#2BBB4F" },
          CursorLine                  = { bg="#181c20" },
          MiniTablineCurrent          = { fg="#000000", bg="#2BBB4F", fmt="NONE" },
          MiniTablineFill             = { fg="#000000", bg="#000000", fmt="NONE" },
          MiniTablineHidden           = { fg="#bbbbbb", bg="#000000", fmt="NONE" },
          MiniTablineModifiedCurrent  = { fg="#000000", bg="#fff000", fmt="NONE" },
          MiniTablineModifiedHidden   = { fg="#000000", bg="#888888", fmt="NONE" },
          MiniTablineModifiedVisible  = { fg="#000000", bg="#fff77f", fmt="NONE" },
          MiniTablineTabpagesection   = { fg="#ffffff", bg="#000000", fmt="NONE" },
          MiniTablineVisible          = { fg="#000000", bg="#19702f", fmt="NONE" },
          MiniJump2dSpot              = { fg="#fff000", fmt="NONE" },
        }
      })
      vim.cmd([[colorscheme onedark]])
    end
  }
}
