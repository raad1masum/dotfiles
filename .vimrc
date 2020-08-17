syntax on
filetype plugin on

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

highlight Comment ctermfg=green cterm=italic gui=italic
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'itchyny/lightline.vim'
Plug 'gryf/pylint-vim'
Plug 'hugolgst/vimsence'
Plug 'raad1masum/vim-formatter'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'

call plug#end()

""colorscheme onedark
"" colorscheme palenight
colorscheme monokai_pro
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

map <C-f> <Esc><Esc>:Format<CR>

map <C-m> <plug>NERDCommenterToggle

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
