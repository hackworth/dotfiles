require('telescope').load_extension('zoxide')
require('telescope').load_extension('repo')

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('neoclip')
require('neoclip').setup()

require('hop').setup()
require("nvim-autopairs").setup {}

require('keymap')

require('lualine').setup()

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()
