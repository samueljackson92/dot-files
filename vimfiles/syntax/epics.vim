" Vim syntax file
" Language: EPICS
" Maintainer: Samuel Jackson

if exists("b:current_syntax")
  finish
endif

syn keyword keywords record field info pattern file 
syn keyword records aai aao ai ao aSub bi bo calc calcout compress dfanout event fanout histogram longin longout mbbi mbbiDirect mbbo mbboDirect permissive sel seq state stringin stringout subArray sub waveform motor transform

syn match macro '\$([A-Z0-9_]\+)'
syn region str start='"' end='"' contains=macro
syn region block start="{" end="}" fold transparent contains=macro, str, keywords, comment
syn region brackets start="(" end=")" fold transparent contains=macro, str, keywords, records
syn match comment "#.*$"

hi link keywords Keyword
hi link records Type
hi link marco PreProc
hi link str Constant
hi link comment Comment
