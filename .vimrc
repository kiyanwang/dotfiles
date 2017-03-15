" .vimrc
" Author: Nadeem Shabir
" Source: https://github.com/kiyanwang/dotfiles/.vimrc
" Installed plugins: see bootstraph.sh which needs to be run
"    at the moment this uses Pathogen, will probably change
"    this some point

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" how many lines of history VIM should remember
set history=500

" turn of filetype while i load pathogen then
" reactivate it
filetype off
execute pathogen#infect()
filetype indent plugin on

" nocompatible should be a noop but better safe than sorry
set nocompatible

" set me leader to be comma
let mapleader=","
let g:mapleader=","

" i prefer this for saving, faster than typing :w
nmap <leader>w :w!<cr>

" Hide, dont close buffers
set hidden

" Set how the backspace key should work
set backspace=indent,eol,start

" Set the title of the vim window to the open file
set title

" Enable mouse support
set mouse=a

" Show a status line on all windows
set laststatus=2

" added to control keywords was having problems with puppet
set iskeyword=-,:,@,48-57,_,192-255

" Use f2 to toggle paste mode
set pastetoggle=<F2>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface tweaks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable 256 color support
set t_Co=256

" use solarized dark theme
colorscheme solarized8_dark
set background=dark

" Always use powerline font in MacVim
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" enable syntax highlighting
syntax on

" Fixes syntax highlighting issues, its a little slower
" this way but more accurate, i can live with that
autocmd BufEnter * :syntax sync fromstart

" Turn on the wildmenu
set wildmenu

" Ignore vcs files
set wildignore+=.git\*,.hg\*,.svn\*

" use utf-8 file encodings
set encoding=utf-8

" Always have 5 lines of context before/after the current line
set scrolloff=5

" Always show the current position
set ruler

" Highligh the current line
set cursorline

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Make it easier navigate search results and highlight as you type
set incsearch

" Dont redraw when executing macros (for performance)
set lazyredraw

" Show matching brackets when cursor is over one
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Turn off annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Add a bit of extra margin to the left
set foldcolumn=1
set nofoldenable

" Show the current command im typing
set showcmd

" Show the current mode im in (normal, visual, insert etc.)
set showmode

" indicates a fast terminal connection improves redraw performance
set ttyfast

" Display linenumbers but use relative numbering
set number
set relativenumber

" Make my vim clipboard work with TMUX
set clipboard=unnamed
if $TMUX == ''
  set clipboard+=unnamed
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indents
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically indent new lines
set autoindent

" default ident to 2 spaces
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" javascript 2 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" php 4 spaces
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab

" Linebreak on 80 chars
set linebreak
set textwidth=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I prefer to turn backups off since everything is in git
set nobackup
set nowb
set noswapfile

" Dont ask me if I want to load changed files. Answer is always yes
set autoread

" Set up standard file types and encodings
set fileencodings=utf-8,iso-8859-1
set fileformats=unix,mac,dos

" Explicitly associated extensions with filetypes
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au FileType puppet setlocal isk+=:
au BufReadPost *.eyaml set syntax=yaml
au BufNewFile,BufRead *.yaml set filetype=yaml.ansible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map jj to the ESC key
inoremap jj <ESC>

" in tmux navigate naturally btw vim and tmux windows/panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" shortcut for moving btw open buffers
nnoremap <leader>. :bn<CR>  " next buffer
nnoremap <leader>, :bp<CR>  " previous buffer

" switch to previously opened buffer and close the one we just
" switched away from (does the equivelant of :bd but without destroying
" my split window)
nmap <leader>bd :b#<bar>bd#<CR>

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

let g:EasyMotion_do_mapping = 0 " Disable default mappings
" " Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" AIRLINE STATUS LINE
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" SILVER SEARCHER
let g:ag_prg="ag --vimgrep"

" CTRL-P
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
" make sure ctrlp uses silver searcher (much much faster)
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore=".git" -g ""'

" NERDTREE
" Make sure NERDTree lists hidden files
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['.git']
" Use ctrl-n to activate nerdtree
map <C-n> :NERDTreeToggle<CR>

" Turn off PHP Folding
let g:DisableAutoPHPFolding = 1
let g:DisablePHPFolds = 1

" ULTISNIPS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-l>"

" SYNTASTIC
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_puppet_puppetlint_args = "--no-80chars-check"

" MULTIPLE CURSORS
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" TASK-WARRIOR
let g:task_rc_override='rc.defaultwidth=160 rc.defaultheight=0'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Mappings / Shortcuts etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" integration with the boxes utility
" ( installed via port install boxes )
vmap ,mc !boxes -d shell -s 80 -a c<CR>
nmap ,mc !!boxes -d shell -s 80 -a c <CR>
vmap ,xc !boxes -d shell -r<CR>
nmap ,xc !!boxes -d shell -r<CR>

" stop highlighting a search
nnoremap <leader><space> :nohlsearch<CR>

" Quick edit .vimrc
nnoremap <leader>ev :e $MYVIMRC<CR>  " quick edit .vimrc

" Reload .vimrc
nnoremap <leader>sv :so $MYVIMRC<CR>  " reload .vimrc

" Toggles GUNDO view
nnoremap <leader>gt :GundoToggle<CR> " toggles Gundo

" fugitive mappings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gbrowse<CR>

" Toggle the tagbar view
nnoremap <leader>tt :TagbarToggle<CR>

" set working directory to current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" remove all trailing whitespace from the file
nnoremap ,ws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" closes all buffers that aren't currently visible in
" window/split/tab
nnoremap <leader>bc :call CloseAllHiddenBuffers()<CR>

" search devdocs for term under cursor
nmap <leader>kk <Plug>(devdocs-under-cursor)

" Move a line of text using ALT+[jk]
" or a selected block of text
" in OSX cant map the ALT key so used this
" workaround: http://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Appends current date to the open buffer
function! Today()
  let today = strftime("%A %d\/%m\/%Y")
  exe "normal a". today
endfunction
command! Today :call Today()

func! s:buf_compare(b1, b2) abort
  let b1_visible = -1 == index(tabpagebuflist(), a:b1)
  let b2_visible = -1 == index(tabpagebuflist(), a:b2)
  "prefer loaded and NON-visible buffers
  if bufloaded(a:b1)
    if bufloaded(a:b2)
      return b2_visible ? !b1_visible : -1
    endif
    return 0
  endif
  return !bufloaded(a:b2) ? 0 : 1
endf

" Close all buffers that aren't currently being
" displayed in a window/split/tab
function! CloseAllHiddenBuffers()
  " list of *all* buffer numbers including hidden ones
  let l:buffers = filter(range(1, bufnr('$')),
              \ 'buflisted(v:val)
              \  && ("" ==# getbufvar(v:val, "&buftype") || "help" ==# getbufvar(v:val, "&buftype"))
              \ ')
  call sort(l:buffers, '<sid>buf_compare')
  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction
