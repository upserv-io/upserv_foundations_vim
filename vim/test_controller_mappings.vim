" Tests Controller BAse
nnoremap <silent> ,tcba :call CreateBaseFile(1, 1, 1)<return>/outer_followup<return>cgnrequire 'test_helper'<esc>o<esc>/class<return>A < ActionDispatch::IntegrationTest<esc>/ChangeTopLevelDocumentation<return><down>^wviwy/ChangeTopLevelDocumentation<return>viwpbiTest for <esc>0/Test<return>ncgn<esc>/inner_followup<return>:call IndentTemplate('test/controllers/base.rb')<return>/DeleteThis<return>

" Tests Controller Web Show
nnoremap <silent> ,tcsh :call IndentTemplate('test/controllers/actions/show_html.rb')<return>/DeleteThis\\|ChangePath\\|ChangeFactoryOptions\\|ChangeFactory\\|ChangeResource<return>
" Test Controllers Update Turboframe
nnoremap <silent> ,tcut :call IndentTemplate('test/controllers/actions/update_turboframe.rb')<return>/DeleteThis\\|ChangePath\\|ChangeFactoryOptions\\|ChangeFactory\\|ChangeResource\\|ChangeParam\\|ChangeValue\\|ChangeMethod<return>
" Test Controllers Update Broadcast
nnoremap <silent> ,tcub :call IndentTemplate('test/controllers/actions/update_broadcast.rb')<return>/DeleteThis\\|ChangePath\\|ChangeFactoryOptions\\|ChangeFactory\\|ChangeResource\\|ChangeParam\\|ChangeValue\\|ChangeMethod<return>
" Test Controllers Destroy Broadcast
nnoremap <silent> ,tcdb :call IndentTemplate('test/controllers/actions/destroy_broadcast.rb')<return>/DeleteThis\\|ChangePath\\|ChangeFactoryOptions\\|ChangeFactory\\|ChangeResourceClass\\|ChangeResource<return>
