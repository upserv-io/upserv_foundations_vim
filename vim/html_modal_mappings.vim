" Html Modal FOrm
nnoremap <silent> ,hmfo :call IndentTemplate('views/modals/form_modal.html.erb')<return>/ChangeModalId\\|ChangeModel\\|ChangeSubControllerNameOrRemoveThis\\|ChangeActionOrDescription\\|ChangeHeader\\|ChangeSubTitle\\|ChangePath\\|ChangeHtmlMethod\\|ChangeSubmitToAddForNewOrSaveForUpdate\\|DeleteThis<return>
" Html Modal DEstroy
nnoremap <silent> ,hmde :call IndentTemplate('views/modals/destroy_modal.html.erb')<return>/ChangeModelDisplay\\|ChangeSubTitle\\|ChangeModel\\|ChangeSubControllerNameOrRemoveThis\\|ChangePath\\|ChangeSubmitToAddForNewOrSaveForUpdate<return>
" Html Modal INfo
nnoremap <silent> ,hmin :call IndentTemplate('views/modals/info_modal.html.erb')<return>/ChangeModel\\|ChangeSubControllerNameOrRemoveThis\\|ChangeActionOrDescription\\|ChangeHeader\\|ChangeSubTitle\\|ChangeInfo<return>

" Html Modal Icon trigger Static
nnoremap <silent> ,hmis a<%# DeleteThis - use ,heil to see list of available icons %><return><%= content_tag 'I', nil, class: 'link no-underline fa-solid fa-pen-to-square', data: { target_modal: "ChangeModalId" } %><esc>/DeleteThis\\|ChangeModalId<return>
" Html Modal Icon trigger Javascrtip dynamic
nnoremap <silent> ,hmij a<%# DeleteThis - use ,heil to see list of available icons %><return><i class="link no-underline fa-solid fa-pen-to-square" <%= ChangeHelperMethod %>></i><esc>/DeleteThis\\|ChangeHelperMethod<return>
" Html Modal Icon trigger Destroy
nnoremap <silent> ,hmid a<i class="link no-underline link-danger fa-solid fa-trash-can" data-target-modal="ChangeModalId"></i><esc>/ChangeModalId<return>
" Html Modal Button trigger Static
nnoremap <silent> ,hmbs a<%= content_tag 'BUTTON', 'ChangeAction', class: 'btn', type: 'button', data: { target_modal: "ChangeModalId" } %><esc>/ChangeAction\\|ChangeModalId<return>
" Html Modal Button trigger Javascrtip dynamic
nnoremap <silent> ,hmbj a<button type="button" class="btn" <%= ChangeHelperMethod %>>ChangeAction</button><esc>/ChangeHelperMethod\\|ChangeAction<return>
" Html Modal Button trigger Destroy
nnoremap <silent> ,hmbd a<button type="button" class="btn btn-danger" data-target-modal="ChangeModalId">Delete ChangeModelDisplay</button><esc>/ChangeModelDisplay\\|ChangeSubControllerNameOrRemoveThis\\|ChangeModel<return>
" Html Modal Link trigger Static
nnoremap <silent> ,hmls a<a class="link" data-target-modal="ChangeModalId">ChangeAction</a><esc>/ChangeModalId\\|ChangeAction<return>
" Html Modal Link trigger Javascrtip dynamic
nnoremap <silent> ,hmlj a<a class="link" <%= ChangeHelperMethod %>>ChangeAction</a><esc>/ChangeHelperMethod\\|ChangeAction<return>
" Html Modal Link trigger Destroy
nnoremap <silent> ,hmld a<a class="link link-danger" data-target-modal="ChangeModalId">Delete ChangeModelDisplay</a><esc>/ChangeModelDisplay\\|ChangeModalId<return>
