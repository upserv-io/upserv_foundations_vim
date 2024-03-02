" Html Show Inline Wrapper - same as Html Input Inline Wrapper
map <silent> ,hsiw ,hiiw
" Html Show Default
nnoremap <silent> ,hsho :call IndentTemplate('views/forms/show_group.html.erb')<return>/DeleteThis\\|ChangeLabel\\|ChangeValue<return>
" Html Show Default Custom
nnoremap <silent> ,hshc :call IndentTemplate('views/forms/show_group_custom.html.erb')<return>/DeleteThis\\|ChangeLabel<return>
