1. clone repo
2. Add to vimrc (decide which to include):
```
" path to upserv cusotomizations (adjust as needed)
let g:path_to_upserv_foundations_vim = '~/.upserv_foundations_vim/'
"" include all 
"execute 'source' g:path_to_upserv_foundations_vim . 'vim/manifest.vim'
"" include only autocommands and settings
"execute 'source' g:path_to_upserv_foundations_vim . 'vim/autocommands_and_settings.vim'
"" include only vim mappings (non-comma, non-space, shared)
"execute 'source' g:path_to_upserv_foundations_vim . 'vim/vim_mappings.vim'
"" include only vim / 'space' mappings
"execute 'source' g:path_to_upserv_foundations_vim . 'vim/space_mappings.vim'
"" include only language specific / Rails / 'comma' mappings
"execute 'source' g:path_to_upserv_foundations_vim . 'vim/comma_mappings.vim'
```
