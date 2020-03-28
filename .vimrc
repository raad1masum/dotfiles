syntax enable 
filetype on

behave xterm

set number relativenumber 
set tabstop=2
set autoindent
set smartindent
set expandtab
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

colorscheme slate
set background=dark

highlight Comment ctermfg=gray

set laststatus=2

if !has('gui_running')
          set t_Co=256
          endif

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
