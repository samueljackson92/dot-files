colorscheme monokai
set nu
set tabstop=2
set shiftwidth=2
set expandtab

if $TERM == "xterm-256color"
  set t_Co=256
endif

" Vundle config settings from here on in
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
filetype plugin indent on     " required!

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

" key bindings
" use dmenu to fuzzy search for files in a git repo
map <c-t> :call DmenuOpen("tabe")<cr>
map <c-f> :call DmenuOpen("e")<cr>

" Block indent/unindent
map > >gv
map < <gv
