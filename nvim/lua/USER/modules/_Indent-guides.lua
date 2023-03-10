return {
  {
    'lucastavaresa/simpleIndentGuides.nvim',
    config = function()
      vim.opt.list = true -- enable in all buffers
      require("simpleIndentGuides").setup("โ", "ยท") -- "โ"
    end
  },
  {
    "echasnovski/mini.indentscope",
    config = function()
      require('mini.indentscope').setup {
        draw = {
          animation = require('mini.indentscope').gen_animation.none(),
        },
        options = {
          border = 'both',
        },
        symbol = "โ"
      }
    end
  },
}
