" quit
nnoremap <silent> <space>q :q<return>
nnoremap <silent> <space>Q :wa!<return>:only<return>:q<return>
" vim command
nnoremap <silent> <space>; :
" visual mode
nnoremap <silent> <space>v <C-v>
" comment in normal mode (in visual mode you just press # or /)
nnoremap <silent> <space># I# <esc>
vnoremap <silent> <space># I# <esc>
nnoremap <silent> <space>/ I// <esc>
vnoremap <silent> <space>/ I// <esc>
" replace quipte types
nnoremap <silent> <space>' /"\\|`<return>cgn'<esc>N.:noh<return>
nnoremap <silent> <space>" /'\\|`<return>cgn"<esc>N.:noh<return>
nnoremap <silent> <space>` /'\\|"<return>cgn"<esc>N.:noh<return>
