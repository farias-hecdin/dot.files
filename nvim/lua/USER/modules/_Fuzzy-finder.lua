return {
  {
    -- "ibhagwan/fzf-lua",
    dir = "~/.config/nvim/src/plugins/" .. "__fzf-lua",
    keys = {{ "<leader>F", mode="n" }},
    config = function()
      local actions = require "fzf-lua.actions"
      require('fzf-lua').setup({
        winopts = {
          height = 0.95,
          width = 0.95,
          preview = {
            layout = "horizontal"
          }
        }
      })
    end
  }
}
