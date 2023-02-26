return {
  {
    -- "lewis6991/gitsigns.nvim",
    dir = "~/.config/nvim/src/plugins/" .. "__gitsigns-nvim",
    keys = { "<localleader>" },
    -- event = "InsertLeave",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = '' },
          change       = { text = '' },
          delete       = { text = '' },
          topdelete    = { text = '' },
          changedelete = { text = '' },
          untracked    = { text = '' },
        },
      })
    end
  },
}
