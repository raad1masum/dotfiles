syntax enable 
filetype on

set number relativenumber 
set tabstop=1
set shiftwidth=5
set autoindent
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
set spell
set clipboard=unnamed
set paste

highlight Comment ctermfg=green

set laststatus=2

if !has('gui_running')
     set t_Co=256
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'neoclide/coc.nvim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ParamagicDev/vim-medic_chalk'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter'
Plugin 'dense-analysis/ale'

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
               \ 'coc-prettier', 
               \ 'coc-json', 
               \ 'coc-python', 
               \ 'coc-html', 
               \ 'coc-css', 
               \ 'coc-cmake', 
               \ 'coc-java', 
               \ ]

let g:ale_fix_on_save = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile

colorscheme medic_chalk
set background=dark

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python>
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

nmap <C-n> :NERDTreeToggle<CR>

nmap <C-/> <plug>NERDCommenterToggle

inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
