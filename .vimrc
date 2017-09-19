set nocompatible              
filetype off

" Vundle Config
" ------------------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" insert Vundle plugins here
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'airblade/vim-gitgutter'
Plugin 'jeaye/color_coded'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'milkypostman/vim-togglelist'

" colorscheme
Plugin 'sjl/badwolf'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" YCM Settings
" -----------------------------------------------------------------------------
let g:ycm_confirm_extra_conf = 0

" Syntastic Plugin Settings
" ------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["flake8"]

" ctrl+p Plugin Settings
" ------------------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }

let g:ctrlp_cache_dir = "$HOME/.cache/ctrlp/"

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Key remapping
" ------------------------------------------------------------------------------
" toggle block comments command
noremap <leader>/ :Commentary<cr>

" YCM key remaps for navigation
noremap <leader>1 :YcmCompleter GoToDeclaration<CR>
noremap <leader>2 :YcmCompleter GoToDefinition<CR>
noremap <leader>j :YcmCompleter GoTo<CR>

" remap for tag search
noremap <leader>. :CtrlPBufTag<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" remap for tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" CtrlP Config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Swapping between header and source
map <F5> :call CurtineIncSw()<CR>

" Generic editor settings
" ------------------------------------------------------------------------------
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set hlsearch
set cursorline
set number
set noswapfile
set t_Co=256
set statusline+=%F
set makeprg=ninja

if $TMUX == ''
    set clipboard+=unnamed
endif

syntax on
colorscheme badwolf
