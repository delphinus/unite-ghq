let s:save_cpo = &cpo
set cpo&vim

let s:source = {
      \ 'name': 'ghq',
      \ 'description': 'ghq lists',
      \ 'action_table': {},
      \ 'hooks': {},
      \ }

function unite#sources#ghq#define()
  return s:source
endfunction

function s:source.gather_candidates(args, context)
  let l:candidates = split(unite#util#system(g:unite_ghq_executable . ' list -p'), "\<NL>")
  let l:cwd = getcwd()
  for l:i in range(len(l:candidates))
    if l:candidates[l:i] !~# '^/'
      let l:candidates[l:i] = l:cwd . '/' . l:candidates[l:i]
    endif
  endfor
  return map(l:candidates, '{
        \ "word": v:val,
        \ "action__path": v:val,
        \ "kind": "directory",
        \ }')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
