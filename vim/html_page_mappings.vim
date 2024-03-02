" Html Page
nnoremap <silent> ,hpag :call IndentTemplate('views/pages/page.html.erb')<return>/DeleteThis\\|ChangeTopBarNav\\|ChangeTitle\\|ChangeSubTitle\\|ChangeActionButtons<return>
" Html Pages header (include page searches)
nnoremap <silent> ,hphe :call IndentTemplate('views/pages/page_header.html.erb')<return>/DeleteThis\\|ChangeTopBarNav\\|ChangeTitle\\|ChangeSubTitle\\|ChangeActionButtons<return>
" Html Page Title Container (include page and page header searches)
nnoremap <silent> ,hptc :call IndentTemplate('views/pages/page_title_container.html.erb')<return>/DeleteThis\\|ChangeTopBarNav\\|ChangeTitle\\|ChangeSubTitle\\|ChangeActionButtons<return>
" Html Pages Full Height body columns
nnoremap <silent> ,hpfh :call IndentTemplate('views/pages/full_height.html.erb')<return>/DeleteThis\\|ChangeSubTitle\\|ChangeTopBarNav\\|ChangeWidth<return>
" Html Pages TAbs
nnoremap <silent> ,hpta :call IndentTemplate('views/pages/tabs.html.erb')<return>/DeleteThis\\|ChangeText\\|ChangeIcon\\|ChangePath\\|ChangeMarginLeft\\|ChangeLogic<return>
