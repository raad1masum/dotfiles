syntax on
filetype on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set rnu nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set mouse=a
set clipboard=unnamedplus
set ruler
set termguicolors 

highlight Comment ctermfg=green
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'vim-airline/vim-airline'
Plug 'gryf/pylint-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hugolgst/vimsence'
Plug 'raad1masum/vim-formatter'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'

call plug#end()

colorscheme onedark
"" colorscheme palenight
"" colorscheme jellybeans
set background=dark

let g:airline_theme='onedark'

let g:coc_disable_startup_warning = 1

map <C-l> <Esc><Esc>:Files<CR>
inoremap <C-l> <Esc><Esc>:BLines<CR>
map <C-g> <Esc><Esc>:BCommits<CR>

map <C-f> <Esc><Esc>:Format<CR>
