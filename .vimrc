" .vimrc
" Author: Nadeem Shabir
" Source: https://github.com/kiyanwang/dotfiles/.vimrc
" Installed plugins:
" - ctrlp.vim
" - nerdtree
" - tabular
" - vim-airline
" - vim-fugitive
" - vim-gitgutter
" - vim-puppet
" - Emmett.vim
" - snipmate + vim-snippets
" - PIV, Php 5.3
"" --

filetype off
execute pathogen#infect()
filetype indent plugin on
set nocompatible

set t_Co=256
colorscheme solarized
set background=dark
syntax on

set encoding=utf-8
set autoindent
set showmode
set hidden
set visualbell
set ttyfast
set backspace=indent,eol,start
set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set mat=2
set title
set cursorline
set scrolloff=5
" set paste
set mouse=a
set ruler
set laststatus=2

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:DisableAutoPHPFolding = 1

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
"
" " Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map <C-n> :NERDTreeToggle<CR>
