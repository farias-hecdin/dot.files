--[[
  ██╗███╗   ██╗██╗████████╗  ██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝  ██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║     ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║     ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║ ██╗ ███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝ ╚═╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝
--]]

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Core
require("USER.options")
require("USER.lazy")
require("USER.keymaps")
require("USER.autocmd")
require("USER.usercmd")
