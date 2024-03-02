# DeleteThis - add "skip_account_auth: true" option if authorization is not account specific
# DeleteThis - add "base_user_can_access: true" if action can be accessed by base user
test_web_auth :delete, :ChangePath, :ChangeFactory
test '#destroy' do
  set_account_set_user_and_sign_in
  ChangeResource = create(:ChangeFactory, ChangeFactoryOptions)
  ChangeResource_count = ChangeResourceClass.count
  delete ChangePath(account, ChangeResource)
  assert_response :success
  assert_equal ChangeResource_count - 1, ChangeResourceClass.count
  assert_raise(ActiveRecord::RecordNotFound) { ChangeResource.reload }
end

test '#destroy - invalid' do
  set_account_set_user_and_sign_in
  ChangeResource = create(:ChangeFactory, ChangeFactoryOptions)
  ChangeResource_count = ChangeResourceClass.count
  delete ChangePath(account, ChangeResource)
  assert_response 422
  assert_equal ChangeResource_count, ChangeResourceClass.count
  # assert no error
  ChangeResource.reload
end
