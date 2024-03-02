" App Job BAse
nnoremap <silent> ,ajba :call CreateBaseFile(1, 0, 1)<return>/ChangeTopLevelDocumentation<return>cgnJob for ChangeDescription<esc>/class<return>A < ApplicationJob<esc>/inner_followup<return>cgn<esc>:call IndentTemplate('jobs/base.rb')<return>/ChangeDescription\\|default\\|DeleteThis<return>
