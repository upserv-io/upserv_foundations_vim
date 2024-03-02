execute 'source' g:path_to_upserv_foundations_vim . 'vim/shared_functions.vim'
" Check if the variable is not defined before setting it
if !exists("g:path_to_upserv_foundations_vim")
  let g:path_to_upserv_foundations_vim = '~/.upserv_foundations_vim/'
endif
" Vim mappings (non-comma, non-space, shared)
execute 'source' g:path_to_upserv_foundations_vim . 'vim/insert_mode_mappings.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/visual_and_normal_mode_mappings.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/terminal_mappings.vim'
