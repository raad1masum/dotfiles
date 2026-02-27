" Mirroring neovim config — no plugins
set nocompatible
syntax on
filetype plugin indent on
set encoding=utf-8

" Leader key (same as neovim: Space)
let mapleader = " "
let maplocalleader = "\\"
nnoremap <Space> <Nop>

" Colorscheme
set termguicolors
set background=dark
silent! colorscheme retrobox

" Line numbers
set number
set relativenumber

" Tabs & indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" Line wrapping
set nowrap

" File handling
set noswapfile
set nobackup
set nowritebackup
if !isdirectory($HOME . "/.vim/undodir")
    call mkdir($HOME . "/.vim/undodir", "p")
endif
set undodir=~/.vim/undodir
set undofile

" Search
set nohlsearch
set incsearch
set ignorecase
set smartcase

" UI
set scrolloff=8
set signcolumn=yes
set mouse=a
set clipboard=unnamedplus
set hidden
set noerrorbells
set visualbell
set t_vb=
set backspace=indent,eol,start
set laststatus=2
set showcmd
set showmode
set wildmenu
set wildmode=longest:full,full
set updatetime=300
set ttimeoutlen=50
set isfname+=@-@

" Statusline (mimics lualine with gruvbox theme)
function! GitBranch()
    let l:branch = system("git -C " . shellescape(expand('%:p:h')) . " rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    return strlen(l:branch) > 0 ? l:branch : ''
endfunction

augroup statusline_git
    autocmd!
    autocmd BufEnter,FocusGained,BufWritePost * let b:git_branch = GitBranch()
augroup END

function! StatuslineGit()
    let l:branch = get(b:, 'git_branch', '')
    return strlen(l:branch) > 0 ? '  ' . l:branch . ' ' : ''
endfunction

set statusline=
set statusline+=%#DiffAdd#
set statusline+=\ %{toupper(mode())}\
set statusline+=%#DiffChange#
set statusline+=%{StatuslineGit()}
set statusline+=%#StatusLine#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=%y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %l:%c
set statusline+=\ %p%%\

" Keymaps — matching neovim init.lua
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>q <cmd>qa<cr>
nnoremap <leader>Q <cmd>qa!<cr>
nnoremap <leader>s <cmd>wqa<cr>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Netrw file explorer (mimics oil.nvim)
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1
nnoremap - <cmd>Explore<cr>

" Buffer navigation (best-effort telescope replacements)
nnoremap <leader>fb <cmd>ls<cr>:b<space>
nnoremap <leader>fr <cmd>browse oldfiles<cr>
nnoremap <leader>fh <cmd>help<space>
nnoremap <leader>ff :find<space>

" Set path for :find to search recursively
set path+=**

" Built-in completion (mimics nvim-cmp behavior)
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,menuone,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <C-Space> <C-x><C-o>
