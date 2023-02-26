return {
  {
    -- "echasnovski/mini.cursorword",
    dir = "~/.config/nvim/src/plugins/" .. "__mini-cursorword",
    event = "InsertEnter",
    config = function()
      require("mini.cursorword").setup()
    end
  },
  {
    -- "echasnovski/mini.pairs",
    dir = "~/.config/nvim/src/plugins/" .. "__mini-pairs",
    keys = { "<localleader>" },
    -- event = "InsertEnter",
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
    -- "Wansmer/treesj",
    dir = "~/.config/nvim/src/plugins/" .. "__treesj",
    event = "InsertEnter",
    config = function()
      require("treesj").setup()
    end
  },
  {
    -- "echasnovski/mini.comment",
    -- commit = "c963f8a0f20944a54d649f432e166896de9e927e",
    dir = "~/.config/nvim/src/plugins/" .. "__mini-comment",
    keys = {{ "gc", mode="v" }},
    config = function()
      require("mini.comment").setup({
        -- Module mappings. Use `""` (empty string) to disable one.
        mappings = {
          -- Toggle comment (like `gcip` - comment inner paragraph) for both
          -- Normal and Visual modes
          comment = "gc",

          -- Toggle comment on current line
          comment_line = "gC",

          -- Define "comment" textobject (like `dgc` - delete whole comment block)
          textobject = "gc",
        },
      })
    end
  },
}
