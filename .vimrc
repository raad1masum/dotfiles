syntax enable 
filetype on

set number relativenumber 
set tabstop=1
set shiftwidth=5
set autoindent
set smartindent
set expandtab smarttab
set softtabstop=4
set cursorline
set showcmd  
set wildmenu
set showmatch
set mouse=a
set incsearch
set hlsearch
set visualbell
set ttyfast
set ruler
set title
set spell
set clipboard=unnamed

highlight Comment ctermfg=gray

set laststatus=2

if !has('gui_running')
          set t_Co=256
          endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'neoclide/coc.nvim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ParamagicDev/vim-medic_chalk'

call vundle#end()
filetype plugin indent on

let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

let g:coc_global_extensions = [
  \ 'coc-git',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-python', 
  \ 'coc-html', 
  \ 'coc-css', 
  \ 'coc-cmake', 
  \ 'coc-java', 
  \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

colorscheme medic_chalk
set background=dark

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
