" File Delete 
nnoremap <silent> <space>fd :call FileDelete()<return>
function! FileDelete()
  let current_file = expand('%')
  let confirmation = input("Delete file at: " . current_file . "\"? (y/n): ") 
  if confirmation == 'y'
    call delete(expand('%')) | bdelete!
  endif
endfunction

" File Move
nnoremap <silent> <space>fm :call FileMove()<return>
function! FileMove()
  wa
  let current_file = expand('%')
  let new_file = input("Move \"" . current_file . "\" to: ", current_file) 
  if new_file == ''
    execute "normal! :echo"
    echo "Move cancelled"
  elseif current_file == new_file
    execute "normal! :echo"
  elseif filereadable(new_file)
    execute "normal! :echo"
    echo "\nFile already exists at \"" . new_file '". Please try a different destination path.'
  else
    execute "e " . new_file
    normal aa
    w
    execute "! mv " . current_file . ' ' . new_file
    execute "bd " . current_file
    wa
  endif 
endfunction

" File Rename
nnoremap <silent> <space>fr :call FileRename()<return>
function! FileRename()
  wa
  let current_file = expand('%')
  let current_path = expand('%:h')
  let current_file_name = expand('%:t')
  let new_file_name = input("Rename \"" . current_file_name . "\" to: ", current_file_name) 
  if new_file_name == ''
    execute "normal! :echo"
    echo "Rename cancelled"
  elseif current_file_name == new_file_name
    execute "normal! :echo"
  elseif filereadable(current_path . "/" . new_file_name)
    execute "normal! :echo"
    echo "\nFile already exists at \"" . current_path . "/" . new_file_name '". Please try a different name.'
  else
    execute "e " . current_path . "/" . new_file_name
    normal aa
    w
    execute "! mv " . current_file . ' ' . current_path . "/" . new_file_name
    execute "bd " . current_file
    wa
  endif 
endfunction

" File Save (all)
nnoremap <silent> <space>fs :wa<return>

" File eXplore
nnoremap <silent> <space>fx :wa<return>:let g:came_from_buf_num = bufnr()<return>:Explore<return>
nnoremap <silent> <space>fX :wa<return>:Explore .git/..<return>
