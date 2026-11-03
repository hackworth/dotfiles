vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.history = 500
vim.opt.signcolumn = "yes"
vim.opt.hidden = true
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.autoread = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.errorbells = false
vim.opt.visualbell = false
-- opt.t_vb = ""
vim.opt.tm = 500
vim.opt.encoding = "utf8"
vim.opt.ffs = { "unix", "dos", "mac" }
vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.lbr = true
vim.opt.tw = 500
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true
vim.opt.laststatus = 2
-- opt.nowrap = false
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamed"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
