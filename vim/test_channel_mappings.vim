" Tests Channel BAse
nnoremap <silent> ,tCba :call CreateBaseFile(1, 1, 1)<return>/outer_followup<return>cgnrequire 'test_helper'<esc>o<esc>/class<return>A < ActionCable::Channel::TestCase<esc>/ChangeTopLevelDocumentation<return><down>^wviwy/ChangeTopLevelDocumentation<return>viwpbiTest for <esc>0/Test<return>ncgn<esc>/inner_followup<return>cgn<esc>:call IndentTemplate('test/channels/base.rb')<return>/DeleteThis\\|ChangeResource\\|ChangeFactory\\|ChangeFactoryOptions\\|ChangeParam1\\|ChangeParam2\\|ChangeAttribute\\|ChangeValue<return>
" Tests Channel ACtion
nnoremap <silent> ,tCac :call IndentTemplate('test/channels/action.rb')<return>:call TestsChannelAction()<return>
function! TestsChannelAction()
  let name = expand('%')
  let name = split(name, '/channels/')[1]
  let name = substitute(name, '_test.rb', '', '')
  execute "normal! /channel_name\<return>cgn" . name
endfunction
