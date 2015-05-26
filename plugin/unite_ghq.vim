" vim:foldmethod=marker:foldenable:
scriptencoding utf-8

" Load once {{{
if get(g:, 'loaded_open_github_link', 0) || &cp
  finish
endif
let g:loaded_open_github_link = 1
" }}}
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

if !exists('g:unite_ghq_executable')
  let g:unite_ghq_executable = 'ghq'
endif

" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}

