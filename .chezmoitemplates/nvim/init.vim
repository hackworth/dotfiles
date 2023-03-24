" :map ,t :w\|!ruby %<cr>
" ,c<space> - toggle comments
 ":W - sudo write
 "ctrl-n - nerd tree
 ":PlugInstall :PlugUpdate :PlugClean
" :StripWhitespace
" :CocInstall coc-python

" set Vim-specific sequences for RGB colors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"set background=dark
set termguicolors
"set t_Co=16
set updatetime=50
set backspace=indent,eol,start

set number relativenumber
" Sets how many lines of history VIM has to remember
set history=500
set signcolumn=yes

set hidden
set scrolloff=8
set nohlsearch

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
"au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Always show the status line
set laststatus=2

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

let g:polyglot_disabled = ['powershell', 'hashivim/vim-terraform']

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
"Plug 'easymotion/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'

Plug 'lifepillar/vim-solarized8'
Plug 'overcache/NeoSolarized'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'

Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/vim-easy-align'
Plug 'nanotee/zoxide.vim'
Plug 'sbdchd/neoformat'

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jvgrootveld/telescope-zoxide'
Plug 'cljoly/telescope-repo.nvim'

Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'phaazon/hop.nvim'

Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'AckslD/nvim-neoclip.lua'

Plug 'pprovost/vim-ps1'
Plug 'hashivim/vim-terraform'

Plug 'mbbill/undotree'

call plug#end()

"nnoremap <C-p> :Files<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
map <leader>/ <plug>NERDCommenterToggle<CR>
"nmap <leader>gd <Plug>(coc-definition)
"nmap <leader>gr <Plug>(coc-references)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

let g:sonokai_style = 'maia'
let g:sonokai_better_performance = 1
"colorscheme gruvbox
colorscheme gruvbox

set background=dark
let g:everforest_background = 'hard'
"colorscheme everforest
"colorscheme tokyonight
"colorscheme gruvbox8


let g:airline#extensions#tabline#enabled = 1

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"inoremap <silent><expr> <Tab>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<Tab>" :
      "\ coc#refresh()

" Go to previous line on file open
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"zz" | endif
endif

nnoremap <Leader>2 :set number! relativenumber!<CR>:call ToggleSignColumn()<CR>

" Toggle signcolumn. Works only on vim>=8.0 or NeoVim
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=yes
        let b:signcolumn_on=1
    endif
endfunction

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" System clipboard on macOS
set clipboard=unnamed

"lua require('init')

let g:rooter_cd_cmd = 'lcd' " change root per buffer

set completeopt=menu,menuone,noselect

set pumheight=30 " Max number of autocomplete items

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fc :Telescope colorscheme<cr>
nnoremap <leader>ws :ToggleWhitespace<cr>
nnoremap <leader>u :UndotreeToggle<CR>
