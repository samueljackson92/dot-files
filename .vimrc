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
" Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'airblade/vim-gitgutter'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'majutsushi/tagbar'
Plugin 'milkypostman/vim-togglelist'
Plugin 'bronson/vim-visual-star-search'
Plugin 'rhysd/vim-clang-format'
Plugin 'tpope/vim-eunuch'
Plugin 'tell-k/vim-autopep8'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'fisadev/vim-isort'
Plugin 'mileszs/ack.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tell-k/vim-autoflake'
Plugin 'andviro/flake8-vim'
Plugin 'brookhong/cscope.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" colorscheme
Plugin 'sjl/badwolf'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ctrl+p Plugin Settings
" ------------------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|nxs|md5|ui)$',
  \ }

let g:ctrlp_cache_dir = "$HOME/.cache/ctrlp/"
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

"
" YouCompleteMe options
"

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 0 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

let g:ycm_confirm_extra_conf = 0

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

" Vim Airline
" ------------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Key remapping
" ------------------------------------------------------------------------------
" toggle block comments command
noremap <leader>/ :Commentary<cr>


" remap for tag search
noremap <leader>. :CtrlPBufTag<CR>
noremap <c-b> :CtrlPBuffer<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" remap for tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" CtrlP Config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Swapping between header and source
map <F5> :call CurtineIncSw()<CR>

" Integrate with Clang tooling
function! ClangCheckImpl(cmd)
    if &autowrite | wall | endif
    echo "Running " . a:cmd . " ..."
    let l:output = system(a:cmd)
    cexpr l:output
    cwindow
    let w:quickfix_title = a:cmd
    if v:shell_error != 0
        cc
    endif
    let g:clang_check_last_cmd = a:cmd
endfunction

function! ClangCheck()
    let l:filename = expand('%')
    if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
        call ClangCheckImpl("clang-check -p ." . l:filename)
    elseif exists("g:clang_check_last_cmd")
        call ClangCheckImpl(g:clang_check_last_cmd)
    else
        echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
    endif
endfunction

function! ClangTidyImpl(cmd)
    if &autowrite | wall | endif
    echo "Running " . a:cmd . " ..."
    let l:output = system(a:cmd)
    cexpr l:output
    cwindow
    let w:quickfix_title = a:cmd
    if v:shell_error != 0
        cc
    endif
    let g:clang_tidy_last_cmd = a:cmd
endfunction

function! ClangTidy()
    let l:filename = expand('%')
    if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
        call ClangTidyImpl("clang-tidy -p . -checks=\"-*,performance-for-range-copy,performance-unnecessary-copy-initialization,modernize-use-override,modernize-use-nullptr,modernize-loop-convert,modernize-use-bool-literals,modernize-deprecated-headers,misc-*,-misc-unused-parameters\" " . l:filename)
    elseif exists("g:clang_tidy_last_cmd")
        call ClangTidyImpl(g:clang_check_last_cmd)
    else
        echo "Can't detect file's compilation arguments and no previous clang-tidy invocation!"
    endif
endfunction

nmap <silent> <F6> :call ClangCheck()<CR><CR>
nmap <silent> <F7> :call ClangTidy()<CR><CR>
nmap <silent> <F8> :ClangFormat<CR>
vmap <silent> <F8> :ClangFormat<CR>

nmap <silent> <F3> :YcmCompleter FixIt<CR>

let g:clang_rename_path ='/usr/local/opt/llvm/bin/clang-rename'
noremap <leader>cr :pyf /usr/local/opt/llvm/share/clang/clang-rename.py<cr>

" Autopep8
" ------------------------------------------------------------------------------
let g:autopep8_disable_show_diff=1
let g:autopep8_ignore="E114,E115,E116,E121,E123,E126,E133,E2,E704,E722,E741,E743,W503,F403,F405,F999"
let g:autopep8_max_line_length=140
autocmd FileType python set equalprg=autopep8\ -

" Autopep8
" ------------------------------------------------------------------------------
noremap <leader>n :NERDTreeToggle<cr>

" iSort (Python Includes Sorting)
" ------------------------------------------------------------------------------
let g:vim_isort_map = '<C-i>'

" flake8-vim
" ------------------------------------------------------------------------------
let g:PyFlakeOnWrite = 0

" cscope.vim
" ------------------------------------------------------------------------------
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

" Generic editor settings
" ------------------------------------------------------------------------------
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set hlsearch
set cursorline
set number
set noswapfile
set t_Co=256
set statusline+=%F
set makeprg=make
set nocp
set bs=2

if $TMUX == ''
    set clipboard+=unnamed
endif

syntax on
colorscheme badwolf

set cul!
let loaded_matchparen = 1

autocmd BufWritePre *.py %s/\s\+$//e
autocmd FileType markdown setlocal spell
autocmd FileType rst setlocal spell
