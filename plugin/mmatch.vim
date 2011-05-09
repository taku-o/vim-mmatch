" mmatch.vim:
" Load Once:
if &cp || exists("g:loaded_mmatch")
    finish
endif
let g:loaded_mmatch = 1
let s:keepcpo = &cpo
set cpo&vim
" ---------------------------------------------------------------------

let s:patterns = []

function! SearchMMatch(word)
    call add(s:patterns, a:word)

    let l:ps = []
    for l:p in s:patterns
        let l:p = '.*' . l:p . '.*'
        call add(l:ps, l:p)
    endfor

    let @/ = @_
    let @/ = join(l:ps, '\&')
endfunction

function! ClearMMatch()
    let s:patterns = []
    let @/ = @_
endfunction

" command
command! -nargs=1 S call SearchMMatch(<f-args>)
command! SC call ClearMMatch()

" ---------------------------------------------------------------------
let &cpo= s:keepcpo
unlet s:keepcpo

