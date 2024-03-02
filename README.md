clone repo to dotfile in home directory
```
git clone git@github.com:upserv-io/upserv_foundations_vim.git ~/.upserv_foundations_vim
```
Add language specific mappiings to vimrc:
```
" Include upserv_foundations_vim language specific comma mappings
so ~/.upserv_foundations_vim/vim/comma_mappings.vim

```
alternatively include all vim mappings 
```
" Include all upserv_foundations_vim mappings 
so ~/.upserv_foundations_vim/vim/manifest.vim
```
Or select vim mappings manually
```
" Include upserv_foundations_vim autocommands and settings
so ~/.upserv_foundations_vim/vim/autocommands_and_settings.vim
" Include upserv_foundations_vim vim mappings (non-comma, non-space, shared)
so ~/.upserv_foundations_vim/vim/vim_mappings.vim
" Include upserv_foundations_vim vim / 'space' mappings
so ~/.upserv_foundations_vim/vim/space_mappings.vim
" Include upserv_foundations_vim language specific / Rails / 'comma' mappings
so ~/.upserv_foundations_vim/vim/comma_mappings.vim
```
If necessary, you can customize the location. Ex

`$ git clone git@github.com:upserv-io/upserv_foundations_vim.git ~/some/other/directory`

vim RC:
```
" NOTE: make sure to end with "/"
let g:path_to_upserv_foundations_vim = '~/some/other/directory/' 
execute 'source' g:path_to_upserv_foundations_vim . 'vim/comma_mappings.vim'

```
Test if the mapping work
