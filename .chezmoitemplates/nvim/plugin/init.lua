require('telescope').load_extension('zoxide')
require('telescope').load_extension('repo')

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('neoclip')
require('neoclip').setup()

require('hop').setup()

require('keymap')

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
