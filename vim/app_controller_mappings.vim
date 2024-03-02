" App Controllers Base for Template controller
nnoremap <silent> ,acbt :call CreateBaseFile(1, 0, 1)<return>/ChangeTopLevelDocumentation<return>cgnParent controller for ChangeDescription<esc>/class<return>A < ChangeInheritance<esc>/inner_followup<return>cgn<esc>:call IndentTemplate('controllers/base_parent.rb')<return>/ChangeDescription\\|DeleteThis\\|ChangeInheritance<return>
" App Controllers Base for Nested controller
nnoremap <silent> ,acbn :call CreateBaseFile(1, 0, 1)<return>/ChangeTopLevelDocumentation<return>cgnCollectionMemborOrChild controller for ChangeDescription<esc>/class<return>A < ChangeInheritance<esc>/inner_followup<return>cgn<esc>:call IndentTemplate('controllers/base_child.rb')<return>/ChangeDescription\\|DeleteThis\\|ChangeInheritance\\|CollectionMemborOrChild<return>
" App Controllers Base Broadcasts file
nnoremap <silent> ,acbb :call CreateBaseFile(0, 0, 0)<return>/ChangeTopLevelDocumentation<return>cgnBroadcasts for<esc><up>g_viwy<down>A <esc>pa controller<esc>

" App Controllers Create Broadcast
nnoremap <silent> ,accb :call IndentTemplate('controllers/actions/create_broadcast.rb')<return>/ChangeModelDisplay\\|ChangeModel\\|ChangeAbility\\|DeleteThis\\|ChangeControllerName\\|ChangeScope\\|ChangePermittedAttributes<return>
" App Controllers Update Broadcast
nnoremap <silent> ,acub :call IndentTemplate('controllers/actions/update_broadcast.rb')<return>/ChangeModelDisplay\\|ChangeModel\\|ChangeAbility\\|DeleteThis\\|ChangeControllerName\\|ChangeScope\\|ChangePermittedAttributes<return>
" App Controllers Update Turboframe
nnoremap <silent> ,acut :call IndentTemplate('controllers/actions/update_turboframe.rb')<return>/ChangeModelDisplay\\|ChangeModel\\|ChangeAbility\\|DeleteThis\\|ChangePath<return>
" App Controllers Destroy Broadcast
nnoremap <silent> ,acdb :call IndentTemplate('controllers/actions/destroy_broadcast.rb')<return>/ChangeModelDisplay\\|ChangeModel\\|ChangeAbility\\|DeleteThis\\|ChangeControllerName<return>

" App Controllers Broadcast Remove
nnoremap <silent> ,acbr :call IndentTemplate('controllers/broadcasts/remove.rb')<return>/DeleteThis\\|ChangeTarget\\|ChangeArgs\\|ChangeTemplate\\|ChangeResource\\|ChangeHmtlId<return>
" App Controllers Broadcast close Modal
nnoremap <silent> ,acbm :call IndentTemplate('controllers/broadcasts/close_modal.rb')<return>/DeleteThis\\|ChangeTarget\\|ChangeArgs\\|ChangeTemplate\\|ChangeResource\\|ChangeHmtlId\\|ChangePartialPath\\|ChangeControllerName\\|ChangeNewOrEdit<return>
" App Controllers Broadcast all other Actions
nnoremap <silent> ,acba :call IndentTemplate('controllers/broadcasts/actions.rb')<return>/DeleteThis\\|ChangeAction\\|ChangeTarget\\|ChangeArgs\\|ChangeTurboAction\\|ChangeTemplate\\|ChangeResource\\|ChangeHmtlId\\|ChangePartialPath<return>
