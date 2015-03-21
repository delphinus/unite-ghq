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
  let candidates = split(unite#util#system('ghq list -p'), "\<NL>")
  return map(candidates, '{
        \ "word": v:val,
        \ "action__path": v:val,
        \ "kind": "directory",
        \ }')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
