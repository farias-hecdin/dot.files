-- Editor options
local opt = vim.opt

-- vim.o.formatoptions = "jcroqlnt"
-- vim.o.shortmess = "filnxtToOFWIcC"
vim.o.foldmethod = 'syntax'
vim.o.foldlevel = 99

opt.sidescroll = 45
opt.scrolloff = 9 -- determines the number of context lines you would like to see above and below the cursor.

opt.autoindent = true -- copy indent from current line when starting new one
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.breakindent = true -- Conserva la indentación de las líneas que sólo son visibles cuando wrap es true.
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.completeopt = "menuone,noselect"
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true -- highlight the current cursor line
opt.expandtab = true -- convert tabs to spaces
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hidden = true -- hide files in the background instead of closing them
opt.hlsearch = false -- enable search highlighting
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case when searching
opt.inccommand = "nosplit"
opt.iskeyword:append("-") -- consider string-string as whole word
opt.joinspaces = false
opt.lazyredraw = true  -- faster scrolling
opt.list = true
opt.linebreak = true -- avoid wrapping a line in the middle of a word
opt.mouse = "a" -- enable mouse for scrolling and resizing
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.pumblend = 10
opt.pumheight = 15 -- pop up menu height
opt.relativenumber = true -- show relative line numbers
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.showbreak = "++ "
opt.showmode = false -- dont show mode since we have a statusline
opt.showtabline = 2
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 999 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.title = true -- set the title of window to the value of the titlestring
opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
opt.undofile = true -- enable persistent undo
opt.undolevels = 10000
opt.updatetime = 200 -- save swap file and trigger CursorHold
opt.wildmode = "longest:full,full"
opt.wrap = false  -- disable line wrapping
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited


-- Disabling built in plugins
-- local disabled_built_ins = {
--   "2html_plugin",
--   "getscript",
--   "getscriptPlugin",
--   "gzip",
--   "logipat",
--   "matchit",
--   "matchparen",
--   "netrw",
--   "netrwFileHandlers",
--   "netrwPlugin",
--   "netrwSettings",
--   "rrhelper",
--   "spellfile_plugin",
--   "tar",
--   "tarPlugin",
--   "tohtml",
--   "tutor",
--   "vimball",
--   "vimballPlugin",
--   "zip",
--   "zipPlugin",
-- }
--
-- for _, plugin in pairs(disabled_built_ins) do
--   vim.g["loaded_" .. plugin] = 1
-- end
