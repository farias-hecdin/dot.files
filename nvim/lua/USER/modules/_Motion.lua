return {
  {
    -- "echasnovski/mini.jump2d",
    dir = "~/.config/nvim/src/plugins/" .. "__mini-jump2d",
    keys = { "," },
    config = function()
      require("mini.jump2d").setup({
        labels = 'abcdefghijklmnopqrstuvwxyz123456789',
        mappings = {
          start_jumping = ',',
        },
      })
    end
  },
}
