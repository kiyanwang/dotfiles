" .vimrc
" Author: Nadeem Shabir
" Source: https://github.com/kiyanwang/dotfiles/.vimrc
" Installed plugins:
" - Emmet.vim
" - PIV
" - ag.vim
" - ansible-vim
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
" - vim-gitv
" - vim-puppet
" - vim-qargs
" - vim-simple-todos
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
set wildignore+=.git\*,.hg\*,.svn\*
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
set foldcolumn=1
set nofoldenable

" default ident to 4 spaces
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
" javascript 2 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

set iskeyword=-,:,@,48-57,_,192-255

set clipboard=unnamed
if $TMUX == ''
  set clipboard+=unnamed
endif
set pastetoggle=<F2>

" For powerline font in MacVim
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

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
au BufNewFile,BufRead *.yaml set filetype=yaml.ansible

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

" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

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

" integration with the boxes utility
" ( installed via port install boxes )
vmap ,mc !boxes -d shell -s 80 -a c<CR>
nmap ,mc !!boxes -d shell -s 80 -a c <CR>
vmap ,xc !boxes -d shell -r<CR>
nmap ,xc !!boxes -d shell -r<CR>

" switch to previously opened buffer and close the one we just
" switched away from (does the equivelant of :bd but without destroying
" my split window)
nmap <leader>bd :b#<bar>bd#<CR>

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>. :bn<CR>  " next buffer
nnoremap <leader>, :bp<CR>  " previous buffer
nnoremap <leader>ev :e $MYVIMRC<CR>  " quick edit .vimrc
nnoremap <leader>sv :so $MYVIMRC<CR>  " reload .vimrc
" fugitive mappings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>

" set working directory to current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" remove all trailing whitespace from the file
nnoremap ,ws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
