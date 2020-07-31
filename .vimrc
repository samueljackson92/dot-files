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
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'cjrh/vim-conda'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
Plugin 'vim-syntastic/syntastic'
Plugin 'craigemery/vim-autotag'
Plugin 'gabesoft/vim-ags'

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

" set map leader key
let mapleader="."

nnoremap <leader>/ :CtrlPTag<cr>

" set files to auto reload on edit
set autoread

" Trim trailing whitespace in the following file types
autocmd FileType python,haskell,c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

" Set options for Markdown
autocmd FileType markdown setlocal textwidth=80 spell

" NERDTree
map <leader>n :NERDTreeToggle<CR>

let g:conda_startup_msg_suppress = 1
"tabs to spaces (size 4)
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

let g:jedi#popup_on_dot = 0

"Synatstic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_python_exec = '/home/lhs18285/miniconda3/bin/python'
let g:syntastic_python_pyflakes_exe = '/home/lhs18285/miniconda3/bin/python3 -m pyflakes'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'python']
let g:syntastic_python_flake8_post_args='--ignore=E501,E128,E225'
