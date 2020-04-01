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
set clipboard=unnamed

colorscheme slate
set background=dark

highlight Comment ctermfg=gray

set laststatus=2

if !has('gui_running')
          set t_Co=256
          endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

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

inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
