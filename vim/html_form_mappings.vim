" Html Form BAse
nnoremap <silent> ,hfba a<%= form_with model: ChangeModel, url: ChangePath(account, ChangeModel), method: :ChangeHtmlMethod do \|f\| %><return><%# DeleteThis - insert hidden fields here if necessary %><return><%# DeleteThis - insert form groups and files (or fields for if necessary) %><return><% end %><esc>/ChangeModel\\|ChangePath\\|ChangeHtmlMethod\\|DeleteThis<return>









" Html Form Submit buttons Turboframe
nnoremap <silent> ,hfst :call IndentTemplate('views/forms/submit_buttons_turboframe.html.erb')<return>/ChangeSubmitToAddForNewOrSaveForUpdate\\|ChangePath\\|ChangeModel<return>
" Html Form Submit buttons Html (ie non-turboframe)
nnoremap <silent> ,hfsh :call IndentTemplate('views/forms/submit_buttons_html.html.erb')<return>/ChangeSubmitToAddForNewOrSaveForUpdate<return>
" Html Form Submit buttons modal
nnoremap <silent> ,hfsm :call IndentTemplate('views/forms/submit_buttons_modal.html.erb')<return>/ChangeSubmitToAddForNewOrSaveForUpdate<return>

" Html Form Group No label
nnoremap <silent> ,hfgn :call IndentTemplate('views/forms/groups_no_label.html.erb')<return>/DeleteThis\\|ChangeAttribute<return>
" Html Form Group Top label
nnoremap <silent> ,hfgt :call IndentTemplate('views/forms/groups_top_label.html.erb')<return>/ChangeLabelDisplay\\|ChangeLabel\\|DeleteThis\\|ChangeAttribute<return>
" Html Form Group left label for Checkboxes  
nnoremap <silent> ,hfgc :call IndentTemplate('views/forms/groups_left_label_for_checkboxes.html.erb')<return>/ChangeLabelDisplay\\|ChangeLabel\\|DeleteThis\\|ChangeAttributeDisplay\\|ChangeAttribute\\|ChangeOrRemove<return>
" Html Form Group left label for Checkboxes with display toggle
nnoremap <silent> ,hfgC :call IndentTemplate('views/forms/groups_left_label_for_checkboxes_display_toggle.html.erb')<return>/ChangeLabelDisplay\\|ChangeLabel\\|DeleteThis\\|ChangeAttributeDisplay\\|ChangeAttribute\\|ChangeOrRemove\\|ChangeShowClass\\|ChangeLogicForChecked\\|ChangeLogicForUnChecked\\|ChangeHideClass\\|ChangeParentShowClass\\|ChangeNestedShowClass<return>
" Html Form Group left label for Radio buttons  
nnoremap <silent> ,hfgr :call IndentTemplate('views/forms/groups_left_label_for_radio_buttons.html.erb')<return>/ChangeLabelDisplay\\|ChangeLabel\\|DeleteThis\\|ChangeDisplay\\|ChangeAttribute\\|ChangeOrRemove\\|ChangeValue<return>
" Html Form Group left label for Radio buttons with display toggle
nnoremap <silent> ,hfgR :call IndentTemplate('views/forms/groups_left_label_for_radio_buttons_display_toggle.html.erb')<return>/ChangeLabelDisplay\\|ChangeLabel\\|DeleteThis\\|ChangeDisplay\\|ChangeAttribute\\|ChangeOrRemove\\|ChangeValue\\|ChangeShowClass\\|ChangeLogicForChecked\\|ChangeLogicForUnChecked\\|ChangeDefaultDisplayWhenNotHidden\\|ChangeParentShowClass\\|ChangeNestedShowClass<return>
" Html Form Group Left label
nnoremap <silent> ,hfg1 :call IndentTemplate('views/forms/groups_left_label.html.erb')<return>/ChangeLabelDisplay\\|ChangeLabel\\|DeleteThis\\|ChangeAttribute<return>
map <silent> ,hfgl ,hfg1

" Html Form Group left label 2
nnoremap <silent> ,hfg2 :call IndentTemplate('views/forms/groups_left_label2.html.erb')<return>/ChangeLabelDisplay\\|ChangeLabel\\|DeleteThis\\|ChangeAttribute<return>
" Html Form Group left label 3
nnoremap <silent> ,hfg3 :call IndentTemplate('views/forms/groups_left_label3.html.erb')<return>/ChangeLabelDisplay\\|ChangeLabel\\|DeleteThis\\|ChangeAttribute<return>
" Html Form Group left label 4
nnoremap <silent> ,hfg4 :call IndentTemplate('views/forms/groups_left_label4.html.erb')<return>/ChangeLabelDisplay\\|ChangeLabel\\|DeleteThis\\|ChangeAttribute<return>


" Html Show Group No label
nnoremap <silent> ,hsgn :call IndentTemplate('views/forms/show_group_no_label.html.erb')<return>/ChangeDisplay\\|DeleteThis<return>
" Html Show Group Top label
nnoremap <silent> ,hsgt :call IndentTemplate('views/forms/show_group_top_label.html.erb')<return>/ChangeLabelDisplay\\|ChangeDisplay<return>
" Html Show Group Left label
nnoremap <silent> ,hsgl :call IndentTemplate('views/forms/show_group_left_label.html.erb')<return>/ChangeLabelDisplay\\|ChangeDisplay\\|DeleteThis<return>
