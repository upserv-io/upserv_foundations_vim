" File Create PArtial
nnoremap <silent> <space>fcpa :call FileCreatePartial()<return>
function! FileCreatePartial()
  let directory = expand('%:h')
  let new_file = input("Create new partial (prefix of \"_\" and extention of \".html.erb\" will be added automatically): ")
  execute ':e ' . directory . '/_' . new_file . '.html.erb'
endfunction

