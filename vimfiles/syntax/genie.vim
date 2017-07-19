" Vim syntax file
" Language: OpenGenie
" Maintainer: Samuel Jackson

if exists("b:current_syntax")
  finish
endif

syn keyword keywords NOT OR RETURN AND ALIAS
syn keyword functions SLEEP PRINTEN EXITIF INQUIRE DEFINED BEGIN END ABS AS_STRING
syn keyword blocks PROCEDURE IF ENDIF ENDPROCEDURE LOOP ENDLOOP FROM TO ELSE ELSEIF CASE IS ENDCASE
syn keyword typemod LOCAL GLOBAL QUALIFIERS RESULT PARAMETERS
syn keyword type REAL INTEGER

syn region str start='"' end='"'
syn match comment "#.*$"

syn match number '\d\+'

" Floating point number with decimal no E or e 
syn match number '\d\+\.\d*'
" Floating point like number with E and no decimal point (+,-)
syn match number '\d[[:digit:]]*[eE][\-+]\=\d\+'
" Floating point like number with E and decimal point (+,-)
syn match number '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

" Match words, this prevents highlighting of variables like val1, val_1 etc.
syn match word '[A-Za-z_]\+\d\+'

hi link keywords Title
hi link functions Function
hi link number Constant
hi link blocks Keyword
hi link typemod Identifier
hi link comment Comment
hi link str Constant
hi link word Normal
