# DeleteThis - add "skip_account_auth: true" option if authorization is not account specific
# DeleteThis - add "base_user_can_access: true" if action can be accessed by base user
test_web_auth :get, :ChangePath, :ChangeFactory
test '#show' do
  set_account_set_user_and_sign_in
  ChangeResource = create(:ChangeFactory, ChangeFactoryOptions)
  get ChangePath(account, ChangeResource)
  assert_response :success
  assert_template :show
end
