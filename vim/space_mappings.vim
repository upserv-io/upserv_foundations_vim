" Check if the variable is not defined before setting it
if !exists("g:path_to_upserv_foundations_vim")
  let g:path_to_upserv_foundations_vim = '~/.upserv_foundations_vim/'
endif
execute 'source' g:path_to_upserv_foundations_vim . 'vim/shared_functions.vim'
" Vim / 'space' mappings
execute 'source' g:path_to_upserv_foundations_vim . 'vim/single_space_mappings.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/git_mappings.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/file_copy_and_paste_mappings.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/file_simple_mappings.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/file_find_mappings.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/file_create_mappings.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/file_edit_mappings.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/file_edit_mapping_functions.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/buffer_management_mappings.vim'
execute 'source' g:path_to_upserv_foundations_vim . 'vim/window_management_mappings.vim'
