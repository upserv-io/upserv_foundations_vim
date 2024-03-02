" Tests Mailer BAse
nnoremap <silent> ,tMba :call CreateBaseFile(1, 1, 1)<return>/outer_followup<return>cgnrequire 'test_helper'<esc>o<esc>/class<return>A < ActionMailer::TestCase<esc>/ChangeTopLevelDocumentation<return><down>^wviwy/ChangeTopLevelDocumentation<return>viwpbiTest for <esc>0/Test<return>ncgn<esc>:call IndentTemplateFrom('inner_followup', 'test/mailers/base.rb')<return>/DeleteThis<return>
" Tests Mailer Test Base
nnoremap <silent> ,tMtb :call IndentTemplate('test/mailers/test_base.rb')<return>/ChangeMethod\\|ChangeThisMailer\\|DeleteThis\\|ChangeSubject\\|ChangeMailTo\\|ChangeMailFrom\\|ChangeSomeContent<return>
