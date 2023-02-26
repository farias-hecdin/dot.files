local map = vim.keymap.set
local wk = require("which-key")

-- Keymaps generales
-- ================================================== --
-- :later 10s
-- Modos
-- * normal = "n",
-- * insert = "i",
-- * visual = "v",
-- * visual_block = "x",
-- * term = "t",
-- * command #= "c",

-- @Scroll
map("n", "<leader>ce", ":set scrolloff=9<cr>", {desc="Scroll Off"})
map("n", "<leader>cd", ":set scrolloff=1<cr>", {desc="Scroll On"})


-- @Oldfiles
map("n", "<leader>o", ":browse oldfiles<cr>", {desc="Old files"})


-- @Terminal
map("t", "<C-x>", "<C-\\><C-N>",       {desc="Terminal: exit mode"})
map('n', '<leader>T', ':terminal<CR>', {desc="Terminal"})


-- @Wrap
map("n", "<leader>wd", ":set nowrap<cr>", {desc="Wrap: Off"})
map("n", "<leader>we", ":set wrap<cr>",   {desc="Wrap: On"})


-- @Return normal mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")


-- @Fzf-lua
map('n', '<leader>Fo', ':FzfLua<cr>', {desc="Fzf: Open"})

map("n", '<leader>Ff', ':FzfLua files cwd=~/',            {desc="Fzf: ~/"})
map("n", '<leader>F1', ':FzfLua files cwd=~/.config',     {desc="Fzf: .config"})
map("n", '<leader>F2', ':FzfLua files cwd=~/m--obsidian', {desc="Fzf: obsidian"})


-- @Markdown
map('v', '<C-b>', ":lua require('markdowny').bold()<cr>",   {desc="Md: Bold",})
map('v', '<C-i>', ":lua require('markdowny').italic()<cr>", {desc="Md: Italic"})
map('v', '<C-l>', ":lua require('markdowny').link()<cr>",   {desc="Md: Link"})

map('n', '<leader>Mm', ":MarkdownHeaders<cr>", {desc="Md: Map"})


-- @Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", ":", ":<c-g>u")
map("i", "?", "?<c-g>u")
map("i", "=", "=<c-g>u")


-- @Delete safely
map({"n", "x"}, "x", '"_x')


-- @Cut, Copy and Paste
map("v", "<C-x>", ":!termux-clipboard-set<CR>") -- “Ctrl-x” to cut
map("v", "<C-c>", ":w !termux-clipboard-set<CR>") -- “Ctrl-c” to copy
map("v", "<C-v>", ":read !termux-clipboard-get<CR>") -- “Ctrl+p” to paste


-- @Save, quit and exit
map("n", "<leader>fz",  ":wq<CR>", {desc="Save/quit"})

map("n", "<leader>fw",  ":w<CR>",  {desc="Save"})
map("n", "<leader>f!w", ":w!<CR>", {desc="Save: forced"})

map("n", "<leader>fq",  ":q<CR>",  {desc="Quit"})
map("n", "<leader>f!q", ":q!<CR>", {desc="Quit: forced"})

map("n", "<leader>f@",  ":qa<CR>",  {desc="Exit"})
map("n", "<leader>f!@", ":qa!<CR>", {desc="Exit: forced"})


-- @Save in insert mode
-- map({"i", "v", "n", "s"}, "<C-s>", "<cmd>w<cr><esc>", {desc="Save: now"})


-- @Select
map("n", "<leader>ma", ":keepjumps normal! ggVG<CR>", {desc="Select all"})
map("v", "<leader>ma", "ggVG<CR>",                    {desc="Select all"})

map("v", "<leader>m1", "/d#<cr>", {desc="Select to: #"})


-- @Buffers
map("n", "<leader>bN", ":enew<cr>", {desc="Buffer: new"})
map("n", "<C-Right>",  ":bn<CR>",   {desc="Buffer: next"})
map("n", "<C-Left>",   ":bp<CR>",   {desc="Buffer: previous"})
map("n", "<leader>bn", ":bn<CR>",   {desc="Buffer: next"})
map("n", "<leader>bp", ":bp<CR>",   {desc="Buffer: previous"})
map("n", "<leader>ba", ":ls<CR>",   {desc="Buffer: all"})
map("n", "<leader>bx", ":bd<CR>",   {desc="Buffer: delete"})
map("n", "<leader>bl", ":BufferManager", {desc="Buffer: list"})


-- @Refresh
map("n", "<leader>%", ":source %<CR>", {desc="Refresh: Neovim"})


-- @Numbers
map("n", "<leader>ni", "<C-a>", {desc="Number: increase"})
map("n", "<leader>nd", "<C-x>", {desc="Number: decrease"})


-- @Tab
map("n", "<leader>tc", ":tabnew<CR>",   {desc="Tabs: new"})
map("n", "<leader>tn", ":tabn<CR>",     {desc="Tabs: next"})
map("n", "<leader>tp", ":tabp<CR>",     {desc="Tabs: previous"})
map("n", "<leader>tx", ":tabclose<CR>", {desc="Tabs: close"})


-- @File explorer
map("n", "<leader>eo", ":NnnExplorer %:p:h<CR>", {desc="Explorer: open"})
map("n", "<leader>ef", ":NnnPicker<CR>",         {desc="Explorer: float"})


-- @Clear search with <esc>
map({"n"}, "<esc>", "<cmd>noh<cr><esc>", {desc="Escape and clear hlsearch"})


-- @Lowercase and uppercase
map("v", "<leader>lu", "U<CR>",  {desc="Letter: uppercase"})
map("v", "<leader>ll", "u<CR>",  {desc="Letter: lowercase"})

map("n", "<leader>lu", "gU<CR>", {desc="Letter: uppercase"})
map("n", "<leader>ll", "gu<CR>", {desc="Letter: lowercase"})

map("n", "<leader>lr", "g~~<CR>", {desc="Letter: reverse"})


-- @Tabulator
map("v", "<leader>.h", "<gv", {desc="Tab: left"})
map("v", "<leader>.l", ">gv", {desc="Tab: Right"})


-- @Move Lines
map("n", "<leader>.j", ":m .+1<CR>==",     {desc="Move: –"})
map("n", "<leader>.k", ":m .-2<CR>==",     {desc="Move: +"})
map("v", "<leader>.j", ":m '>+1<CR>gv=gv", {desc="Move: –"})
map("v", "<leader>.k", ":m '<-2<CR>gv=gv", {desc="Move: +"})


-- @Resize window
map("n", "<leader>sl", ":resize +10<CR>", {desc="Window: V-"})
map("n", "<leader>sh", ":resize -10<CR>", {desc="Window: V+"})
map("n", "<leader>sj", ":vertical resize -10<CR>", {desc="Window: H+"})
map("n", "<leader>sk", ":vertical resize +10<CR>", {desc="Window: H- "})
map("n", "<leader>se", "<C-w>=", {desc="Window: ="})


-- @Split
map("n", "<leader>sH", "<C-w>v",     {desc="Split: horizontal"})
map("n", "<leader>sV", "<C-w>s",     {desc="Split: vertical"})
map("n", "<leader>sx", ":close<CR>", {desc="Split: close"})
map("n", "<leader>sw", ":lua require('nvim-window').pick()<CR>", {desc="Split: check"})
map("n", "<C-s>", ":lua require('nvim-window').pick()<CR>", {desc="Split: check"})


-- vim.keymap.set({'n', 't'}, '<C-i>', '<CMD>NavigatorLeft<CR>')
-- vim.keymap.set({'n', 't'}, '<C-d>', '<CMD>NavigatorRight<CR>')
-- vim.keymap.set({'n', 't'}, '<C-a>', '<CMD>NavigatorUp<CR>')
-- vim.keymap.set({'n', 't'}, '<C-d>', '<CMD>NavigatorDown<CR>')
-- vim.keymap.set({'n', 't'}, '<C-p>', '<CMD>NavigatorPrevious<CR>')


-- @Easier pasting
map("v", "p", '"_dP',  {desc="Paste"}) -- Paste over currently selected text without yanking it
map("n", "p", "gp",     {desc="Paste"})
map("n", "<leader>pk", ":pu!<cr>", {desc="Paste: above"})
map("n", "<leader>pj", ":pu<cr>",  {desc="Paste: below"})


-- @Duplicate lines
map("x", "<leader>d", "y<cmd>:pu<cr>", {desc="Duplicate line"})


-- @Better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j' ", {expr=true, silent=true})
map("n", "k", "v:count == 0 ? 'gk' : 'k' ", {expr=true, silent=true})
map("v", "j", "v:count == 0 ? 'gj' : 'j' ", {expr=true, silent=true})
map("v", "k", "v:count == 0 ? 'gk' : 'k' ", {expr=true, silent=true})


-- @Lazy
map("n", "<leader>L", ":Lazy<CR>", {desc="Lazy"})


-- @Which_key
map("n", "<leader>W", ":checkhealth which_key<CR>", {desc="Which key"})


-- @Cmp
map("n", "<leader>Cd", ":lua require('cmp').setup.buffer {enabled = false}<CR>", {desc="Cmp: disable"})
map("n", "<leader>Ce", ":lua require('cmp').setup.buffer {enabled = true}<CR>",  {desc="Cmp: enabled"})


-- @URL handling (https://sbulav.github.io/vim/neovim-opening-urls)
map('n', 'gx', ':call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>', {desc="Open: link"})


-- Which-key
-- ================================================== --

--local key_N = {}

wk.register({
   ["<leader>f"] = { name = "+file" },
--   ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
--   ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--   ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
})

