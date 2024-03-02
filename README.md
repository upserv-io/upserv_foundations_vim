1. clone repo to dotfile in home directory
```
git clone git@github.com:upserv-io/upserv_foundations_vim.git ~/.upserv_foundations_vim
```
2. Add main mappiings to vimrc:
```
" Path to upserv cusotomizations (adjust as needed)
let g:path_to_upserv_foundations_vim = '~/.upserv_foundations_vim/'
" Include only language specific / Rails / 'comma' mappings
execute 'source' g:path_to_upserv_foundations_vim . 'vim/comma_mappings.vim'

```
3. alternatively include all vim mappings 
```
" Path to upserv cusotomizations (adjust as needed)
let g:path_to_upserv_foundations_vim = '~/.upserv_foundations_vim/'
" Include all upserv_foundations_vim mappings 
execute 'source' g:path_to_upserv_foundations_vim . 'vim/manifest.vim'
```
4. Or select vim mappings manually
```
" Path to upserv cusotomizations (adjust as needed)
let g:path_to_upserv_foundations_vim = '~/.upserv_foundations_vim/'
" Include autocommands and settings
execute 'source' g:path_to_upserv_foundations_vim . 'vim/autocommands_and_settings.vim'
" Include vim mappings (non-comma, non-space, shared)
execute 'source' g:path_to_upserv_foundations_vim . 'vim/vim_mappings.vim'
" Include vim / 'space' mappings
execute 'source' g:path_to_upserv_foundations_vim . 'vim/space_mappings.vim'
" Include language specific / Rails / 'comma' mappings
execute 'source' g:path_to_upserv_foundations_vim . 'vim/comma_mappings.vim'
```
