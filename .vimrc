""""""""""""""""""""""
" Start of Vundle config
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" End of Vundle config
""""""""""""""""""""""

set t_Co=256
colorscheme wombat
syntax on
set encoding=utf-8
set nu
set clipboard=unnamed
set splitbelow
set splitright
set laststatus=2
set bs=2

"CtrlP extension
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

noremap <Leader>/ :Commentary

"tabs to spaces (size 4)
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" set map leader key
let mapleader=","

" set files to auto reload on edit
set autoread

" Trim trailing whitespace in the following file types
autocmd FileType python,haskell,c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

" YCM Settings
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
highlight PmenuSel ctermfg=15 ctermbg=4 guifg=#ffffff guibg=#444444

" NERDTree
let mapleader = "\\"
map <leader>n :NERDTreeToggle<CR>
