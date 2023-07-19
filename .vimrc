set expandtab
set tabstop=4
set shiftwidth=4
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'psf/black'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'numirias/semshi'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
