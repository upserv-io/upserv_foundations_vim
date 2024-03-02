test '#ChangeMethod' do
  # DeleteThis - NOTE: do not call .deliver_now or .deliver_later
  mail = ChangeThisMailer.ChangeMethod
  # DeleteThis - REMEMBER: do not test things that could easily change
  # and / or are not important. The items below are simply examples. You
  # do not need to include all of them
  assert_match 'ChangeSubject', mail.subject
  assert_equal ['ChangeMailTo'], mail.to
  # DeleteThis - use this if from the default
  assert_equal [default_mail_from], mail.from
  # DeleteThis - use this if not from the default
  assert_equal ['ChangeMailFrom'], mail.from
  assert_match 'ChangeSomeContent', mail.body.encoded
end
