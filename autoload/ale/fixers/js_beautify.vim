" Author: farhanmustar <farhanmustar@gmail.com>
" Description: Fix javascript file with js-beautify.

call ale#Set('javascript_js_beautify_executable', 'js-beautify')
call ale#Set('javascript_js_beautify_use_global', get(g:, 'ale_use_global_executables', 0))
call ale#Set('javascript_js_beautify_options', '')

function! ale#fixers#js_beautify#GetExecutable(buffer) abort
    return ale#path#FindExecutable(a:buffer, 'javascript_js_beautify', [
    \   'node_modules/js-beautify/js/bin/js-beautify.js',
    \   'node_modules/.bin/js-beautify',
    \])
endfunction

function! ale#fixers#js_beautify#Fix(buffer) abort
    let l:options = ale#Var(a:buffer, 'javascript_js_beautify_options')

    return {
    \   'command': ale#Escape(ale#fixers#js_beautify#GetExecutable(a:buffer))
    \       . ' ' . l:options
    \       . ' -',
    \}
endfunction
