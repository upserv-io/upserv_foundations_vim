" Html Card Inline Wrapper
nnoremap <silent> ,hciw :call IndentTemplate('views/pages/inline_card_wrapper.html.erb')<return>/DeleteThis\\|ChangeMinPx<return>
" Html Card
nnoremap <silent> ,hcar :call IndentTemplate('views/pages/card_base.html.erb')<return>/DeleteThis\\|ChangeTitle\\|ChangeSubTitle<return>
" Html Card Header (include card searches)
nnoremap <silent> ,hche :call IndentTemplate('views/pages/card_header.html.erb')<return>/DeleteThis\\|ChangeTitle\\|ChangeSubTitle\\|ChangeActionButtons<return>
" Html Card Table
nnoremap <silent> ,hcta :call IndentTemplate('views/pages/card_table.html.erb')<return>/DeleteThis\\|ChangeTitle\\|ChangeSubTitle\\|ChangeActionButtons\\|ChangePathHelperArgOrArrayOfArgs\\|ChangePathHelper\\|ChangePlaceholder\\|ChangeWidth\\|ChangeColumnHeader\\|ChangeResources\\|ChangeResource\\|ChangeTableDataContents<return>
" Html Card Table header (include card table searches)
nnoremap <silent> ,hcth :call IndentTemplate('views/pages/card_table_header.html.erb')<return>/DeleteThis\\|ChangeTitle\\|ChangeSubTitle\\|ChangeActionButtons\\|ChangePathHelperArgOrArrayOfArgs\\|ChangePathHelper\\|ChangePlaceholder\\|ChangeWidth\\|ChangeColumnHeader\\|ChangeResources\\|ChangeResource\\|ChangeTableDataContents<return>
" Html Card Title Container (include card, card header and card table searches)
nnoremap <silent> ,hctc :call IndentTemplate('views/pages/card_title_container.html.erb')<return>/DeleteThis\\|ChangeTitle\\|ChangeSubTitle\\|ChangeActionButtons\\|ChangePathHelperArgOrArrayOfArgs\\|ChangePathHelper\\|ChangePlaceholder\\|ChangeWidth\\|ChangeColumnHeader\\|ChangeResources\\|ChangeResource\\|ChangeTableDataContents<return>
