" .vimrc
" Author: Nadeem Shabir
" Source: https://github.com/kiyanwang/dotfiles/.vimrc
" Installed plugins:
" - Emmet.vim
" - PIV
" - ag.vim
" - ctrlp.vim
" - gist-vim
" - nerdcommenter
" - nerdtree
" - node
" - syntastic
" - tabular
" - tagbar
" - ultisnips
" - vim-abolish
" - vim-airline
" - vim-easymotion
" - vim-fugitive
" - vim-gitgutter
" - vim-puppet
" - vim-qargs
" - vim-snippets
" - vim-surround
" - vim-tmux-navigator
" - webapi-vim (needed by gist-vim)
"" --

filetype off
execute pathogen#infect()
filetype indent plugin on
set nocompatible

set t_Co=256
colorscheme solarized
set background=dark
syntax on

set wildmenu
set encoding=utf-8
set autoindent
set showmode
set hidden
set visualbell
set ttyfast
set backspace=indent,eol,start
set number
set relativenumber
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set mat=2
set title
set cursorline
set scrolloff=5
set mouse=a
set ruler
set laststatus=2
set linebreak

set nobackup
set nowb
set noswapfile

set nofoldenable

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set clipboard=unnamed
if $TMUX == ''
  set clipboard+=unnamed
endif
set pastetoggle=<F2>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" move vertically by visual line
nnoremap j gj
nnoremap k gk

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au FileType puppet setlocal isk+=:
au BufReadPost *.eyaml set syntax=yaml

let g:ag_prg="ag --vimgrep"

let g:NERDTreeShowHidden=1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:DisableAutoPHPFolding = 1
let g:DisablePHPFolds = 1

let g:EasyMotion_do_mapping = 0 " Disable default mappings
" let g:SuperTabDefaultCompletionType = "context"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-l>"

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_show_hidden = 1

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_puppet_puppetlint_args = "--no-80chars-check"

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

nmap <F8> :TagbarToggle<CR>
nnoremap tn :TagbarOpen fj<CR>
map <C-n> :NERDTreeToggle<CR>

let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>. :bn<CR>  " next buffer
nnoremap <leader>, :bp<CR>  " previous buffer
nnoremap <leader>ev :e $MYVIMRC<CR>  " quick edit .vimrc
nnoremap <leader>sv :so $MYVIMRC<CR>  " reload .vimrc
