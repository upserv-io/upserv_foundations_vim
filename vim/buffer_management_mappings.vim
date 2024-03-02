" scroll through terminal buffers
noremap <silent> <S-C-left> :call GoToNextTer(0)<return>
noremap <silent> <S-C-right> :call GoToNextTer(1)<return>
noremap <silent> <S-C-k> :call GoToNextTer(0)<return>
noremap <silent> <S-C-l> :call GoToNextTer(1)<return>
" scroll through non terminal buffers
noremap <silent> <C-left> :call GoToNextBuf(0)<return>
noremap <silent> <C-right> :call GoToNextBuf(1)<return>
noremap <silent> <C-k> :call GoToNextBuf(0)<return>
noremap <silent> <C-l> :call GoToNextBuf(1)<return>
" Buffer Delete
nnoremap <space>bd :call ClearBuffer()<return>
nnoremap <space>bD :bd!<return>
" Buffer Clear
nnoremap <space>bc :call ClearBuffers()<return>
nnoremap <space>bC :%bd!\|e#\|bd#<return>
" Buffer Terminal 
nnoremap <space>bt :call OpenTerminal()<return>
nnoremap <space>bT :ter<return>

" functions
function! NextBuf(adj)
  let l:blist = map(filter(copy(getbufinfo()), 'v:val.listed == 1'), 'v:val.bufnr')
  let l:len = len(l:blist)
  let cbuf = bufnr()
  let cpos = index(l:blist, cbuf)
  let ncount = cpos + a:adj
  while ncount > l:len
    let ncount = ncount - l:len
  endwhile
  while ncount <= 0
    let ncount = ncount + l:len
  endwhile
  if ncount == l:len
    let nbuf = l:blist[0]
  else
    let nbuf = l:blist[ncount]
  endif
  return nbuf
endfunction

function! OpenTerminal()
  let l:blist = map(filter(copy(getbufinfo()), 'v:val.listed == 1'), 'v:val.bufnr')
  for l:item in l:blist
    if getbufvar(l:item, '&buftype') == 'terminal'
      execute ':buf' l:item
      return

    endif
  endfor
  execute ':ter'
endfunction
