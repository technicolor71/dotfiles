"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Powerline_symbols = 'fancy'

execute pathogen#infect()

syntax enable 
set background=dark

colorscheme solarized

"========== General Config ===========
set nocompatible
set laststatus=2
set encoding=utf8
try
	lang en_US
catch
endtry
set history=50
set number
set ruler

set ffs=unix,dos,mac
set incsearch ignorecase smartcase hlsearch
set noerrorbells visualbell t_vb=

"======== Indentation ===========
filetype on
filetype plugin on

set autoread
set softtabstop=2
set expandtab
set shiftwidth=2

"========== Turn off swap files ==============
set noswapfile
set nobackup
set nowb
