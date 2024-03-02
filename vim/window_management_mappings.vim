" tab through windows
nnoremap <silent> <S-tab> :call GoToNextWindow(0)<return><esc>
nnoremap <silent> <tab> :call GoToNextWindow(1)<return><esc>
" Window Split window go down
nnoremap <silent> <space>ws :sp<return>:call GoToNextWindow(1)<return>:set wrap<return><C-W>=
" Window Split stay up
nnoremap <silent> <space>wS :sp<return>:set wrap<return><C-W>=
" Window split Vertically go right
nnoremap <silent> <space>wv :call WindowSplitVerdically()<return>
" Window split Vertically stay left
nnoremap <silent> <space>wV :call WindowSplitVerdically()<return><C-w>W
" Window equalize sizes
nnoremap <silent> <space>we <C-W>=
" window move
nnoremap <silent> <space>wj <C-w>H
nnoremap <silent> <space>wk <C-w>J
nnoremap <silent> <space>wl <C-w>K
nnoremap <silent> <space>w; <C-w>L
" Window Close
nnoremap <silent> <space>wc :close<return>:call ClearBuffers()<return><C-W>=
" Windo Delete (alias for window close)
nmap <silent> <space>wd <space>wc
" Window Maximize (close all others)
nnoremap <silent> <space>wm :only<return>:wa<return>:call ClearBuffers()<return>

" functions
function GoToNextWindow(direction)
  let window_count = winnr('$')
  let current_window = winnr()
  if a:direction == 1
    if current_window < window_count
      let target_window = current_window + 1
    else 
      let target_window = 1
    endif
  else
    if current_window == 1
      let target_window = window_count
    else 
      let target_window = current_window - 1
    endif
  endif
  execute "normal! " . target_window . "\<C-w>\<C-w>"
endfunction
