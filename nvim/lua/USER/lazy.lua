-- LAZY EVENTS
-- * "InsertEnter", (load a plugin when entering Insert mode)
-- * "TextChangedI", (After a change was made to the text in the current buffer in Insert mode)
-- * "InsertLeave", (Just after leaving Insert mode)
-- * "BufEnter *.lua",
-- * "VeryLazy", (load later)


-- LAZY INSTALLATION
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)


-- Plugin setup
require("lazy").setup("USER.modules", {
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
    version = "*",
  },
  checker = {
    enabled = false, -- automatically check for plugin updates
  },
  concurrency = 1, ---@type number limit the maximum amount of concurrent tasks. Default [nil]
  git = {
    timeout = 999, -- kill processes that take more than X minutes
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.9, height = 0.9 },
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = 'rounded',
    --border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
    icons = {
      cmd = "- ",
      event = "- ",
      ft = "- ",
      keys = "- ",
      plugin = "- ",
      start = "- ",
    }
  },
  performance = {
    rtp = {
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "matchparen",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "rrhelper",
        "spellfile_plugin",
        "tar",
        "tarPlugin",
        "tohtml",
        "tutor",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },
})
