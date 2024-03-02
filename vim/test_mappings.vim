" Tests Assert Enqueued Emails
nnoremap <silent> ,taee aassert_equal ChangeCount, enqueued_emails('ChangeMailerAndEmail').size<esc>/ChangeCount\\|ChangeMailerAndEmail<return>
" Tests Assert Encueued Jobs
nnoremap <silent> ,taej aassert_equal 1, enqueued_jobs.length<esc>oassert_equal ChangeJobClass, enqueued_jobs.first[:job]<esc>/ChangeJobClass<return>
