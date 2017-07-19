" --------------------------------------------------------------------------------------------
" Vundle Config
" --------------------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" --------------------------------------------------------------------------------------------
" Custom Config
" --------------------------------------------------------------------------------------------
syntax on

colorscheme desert
set nu

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" wildcard tab menu
set wildchar=<Tab> wildmenu wildmode=full

" Set syntax & filetype for epics
augroup epics
    autocmd!
    autocmd BufNewFile,BufRead *.db,*.template,*.substitutions,*.proto   set syntax=epics
    autocmd BufNewFile,BufRead *.db,*.template,*.substitutions,*.proto   set filetype=epics
    autocmd FileType epics setlocal commentstring=#\ %s
augroup END

" Set syntax & filetype for OpenGenie
augroup genie
    autocmd!
    autocmd BufNewFile,BufRead *.gcl set syntax=genie
    autocmd BufNewFile,BufRead *.gcl set filetype=genie
    autocmd FileType genie setlocal commentstring=#\ %s
augroup END

" Fix backspace on windows
set backspace=2
set backspace=indent,eol,start

" Open a 'Open File' browser window
command! Bo browse confirm e

" Remap keys
" --------------------------------------------------------------------------------------------
let mapleader = "#"
" paste from global insert after
nmap <Leader>p "+gp         
" paste from global insert before
nmap <Leader>P "+gP         
vmap x "_d
