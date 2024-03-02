" open terminal (base)
nnoremap <silent> <space>te :call ToggleTerminalInWindow(0, 1)<return>
nnoremap <silent> <space>tE :call ToggleTerminalInWindow(0, 0)<return>
" open terminal console
nnoremap <silent> <space>tc :call ToggleTerminalInWindow(1, 1)<return>
nnoremap <silent> <space>tC :call ToggleTerminalInWindow(1, 0)<return>
" open terminal server
nnoremap <silent> <space>ts :call ToggleTerminalInWindow(2, 1)<return>
nnoremap <silent> <space>tS :call ToggleTerminalInWindow(2, 0)<return>
" open terminal server debugger
nnoremap <silent> <space>td :call ToggleTerminalInWindow(3, 1)<return>
nnoremap <silent> <space>tD :call ToggleTerminalInWindow(3, 0)<return>
" open terminal test
nnoremap <silent> <space>tt :call ToggleTerminalInWindow(4, 1)<return>
nnoremap <silent> <space>tT :call ToggleTerminalInWindow(4, 0)<return>

" Terminal mode mappings
" make <esc> work as expected (ie send to normal mode)
tnoremap <Esc> <C-\><C-n>
