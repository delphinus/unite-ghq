let s:save_cpo = &cpo
set cpo&vim

function! unite#kinds#ghq#define()
  return s:kind
endfunction

let s:kind = {
      \ 'name': 'ghq',
      \ 'default_action': 'vimfiler',
      \ 'action_table': {},
      \ 'parents' : [],
      \}

let &cpo = s:save_cpo
unlet s:save_cpo
