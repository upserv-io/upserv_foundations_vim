" Tests Model BAse
nnoremap <silent> ,tmba :call CreateBaseFile(1, 1, 1)<return>/outer_followup<return>cgnrequire 'test_helper'<esc>o<esc>/class<return>A < ActiveSupport::TestCase<esc>/ChangeTopLevelDocumentation<return><down>^wviwy/ChangeTopLevelDocumentation<return>viwpbiTest for <esc>0/Test<return>ncgn model<esc>:call IndentTemplateFrom('inner_followup', 'test/models/base.rb')<return>/DeleteThis\\|ChangeModel<return>

" Tests Model SErvices
nnoremap <silent> ,tmse :call CreateBaseFile(1, 1, 1)<return>/outer_followup<return>cgnrequire 'test_helper'<esc>o<esc>/class<return>A < ActiveSupport::TestCase<esc>/ChangeTopLevelDocumentation<return><down>^wviwy/ChangeTopLevelDocumentation<return>viwpbiTest for <esc>0/Test<return>ncgn<esc>:call IndentTemplateFrom('inner_followup', 'test/models/services.rb')<return>/DeleteThis\\|ChangeMethod<return>
