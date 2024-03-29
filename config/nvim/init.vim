syntax on
filetype indent plugin on

set backspace=indent,eol,start
set hidden
set noerrorbells
set belloff=all
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
setlocal colorcolumn=80
set list!
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

highlight Comment ctermfg=green cterm=italic gui=italic
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'

call plug#end()

colorscheme palenight
set background=dark

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'monokai_pro',
      \ }

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

let g:coc_disable_startup_warning = 1

map <C-l> <Esc><Esc>:Files<CR>
inoremap <C-l> <Esc><Esc>:BLines<CR>
map <C-g> <Esc><Esc>:BCommits<CR>

map <C-m> <plug>NERDCommenterToggle

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
