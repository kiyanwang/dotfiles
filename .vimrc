" .vimrc
" Author: Nadeem Shabir 
" Source: https://github.com/kiyanwang/dotfiles/.vimrc

filetype off
execute pathogen#infect()
filetype indent plugin on
set nocompatible

set t_Co=256
colorscheme solarized
set background=dark
syntax on

set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set backspace=indent,eol,start

set number
set hlsearch
set incsearch
set ts=4
set ignorecase
set smartcase
set title
set cursorline
set scrolloff=5
set paste
set mouse=a
set ruler

