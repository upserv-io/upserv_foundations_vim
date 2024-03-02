" Misc. Reload Source
nnoremap <silent> <space>mrs :so ~/.vimrc<return>:echo "Source reloaded"<return>
" Misc. DD but combine to previous line instead of delete line  (I<tab>
" makes sure there is at least something on the line because viwx on empty
" line deletes entire line and then grabs following line)
nnoremap <silent> <space>mdd I<tab><esc>0viwxi<backspace><esc><right>
" Misc. Dd but combine to Forward line instead of delete line
nnoremap <silent> <space>mdf $<down>I<tab><esc>0viwxi<backspace><esc><right>
" Misc. Df but add <return> between each line
nnoremap <silent> <space>mdr $<down>I<tab><esc>0viwxi<backspace><esc><right>i<lt>return><esc>
" Misc. Dd but with space
nnoremap <silent> <space>mds I<tab><esc>0viwxi<backspace><space><esc><right>
" normal Vim visual mode u and U change case but I've disabled it
" so that u and U are undo / redo like normal mode. But if you want
" to up or down case, do this
vnoremap <silent> <space>mdc u
vnoremap <silent> <space>muc U
