# Overview
A bunch of vim mappings that help working with Rails apps

Most mappings are either "comma" or "space" followed 4 keystrokes

ex. ,acbt (App Controllers Base Template) - creates a base controller file

ex. <space>feco (File Edit COntroller) - opens the corresponding controller file (based on the current window) in a new window (meaning if you are on a view and press <space>feco it will open the controller file for that view)
# Get started
Clone repo to dotfile in home directory:
```
git clone git@github.com:upserv-io/upserv_foundations_vim.git ~/.upserv_foundations_vim
```
Add language specific and general vim mappings to vimrc:
```
" Include upserv_foundations_vim language specific comma mappings and vim general space mappings
so ~/.upserv_foundations_vim/vim/prerequisites.vim
so ~/.upserv_foundations_vim/vim/comma_mappings.vim
so ~/.upserv_foundations_vim/vim/space_mappings.vim
```
Test if the mappings work: [Docs](https://docs.google.com/document/d/1uyoPw_LIjcsbw_QvuuX9uQ2OYkEvPnCtWa6CIOnQpyI)
# Alternative options
Alternatively include all vim mappings:
```
" Include all upserv_foundations_vim mappings 
so ~/.upserv_foundations_vim/vim/prerequisites.vim
so ~/.upserv_foundations_vim/vim/manifest.vim
```
Or select vim mappings manually:
```
" Include selected upserv_foundations_vim mappings
so ~/.upserv_foundations_vim/vim/prerequisites.vim
so ~/.upserv_foundations_vim/vim/vim_mappings.vim
so ~/.upserv_foundations_vim/vim/space_mappings_simple.vim
so ~/.upserv_foundations_vim/vim/space_mappings.vim
so ~/.upserv_foundations_vim/vim/comma_mappings.vim
```
# Customize location of clone
If necessary, you can customize the location.
Terminal:

```
$ git clone git@github.com:upserv-io/upserv_foundations_vim.git ~/some/other/directory
```

vimrc:
```
" NOTE: make sure to end with "/"
let g:path_to_upserv_foundations_vim = '~/some/other/directory/' 
execute 'source' g:path_to_upserv_foundations_vim . 'vim/comma_mappings.vim'

```
