nnoremap <silent> ,aaa awhat up parnnssss

" App Channels Base
nnoremap <silent> ,aCba :call CreateBaseFile(1, 0, 1)<return>/ChangeTopLevelDocumentation<return>cgnChannel for ChangeDescription<esc>/class<return>A < ApplicationCable::Channel<esc>/inner_followup<return>cgn<esc>:call IndentTemplate('channels/base.rb')<return>:call AppChannelsBase()<return>
function! AppChannelsBase()
  let name = expand('%')
  let name = split(name, '.rb')[0]
  let name = split(name, '/channels/')[1]
  execute "normal! /some_channel\<return>cgn" . name
endfunction

" App Channels BroadCast
nnoremap <silent> ,aCbc :call IndentTemplate('channels/broadcast.rb')<return>/ChangeStream\\|ChangeData\\|ChangeValue\\|ChangeOrRemove<return>
