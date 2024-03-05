# DeleteThis - add "skip_account_auth: true" option if authorization is not account specific
# DeleteThis - add "base_user_can_access: true" if action can be accessed by base user
test_web_auth :get, :ChangePath, :ChangeFactory
test '#index' do
  set_account_set_user_and_sign_in
  ChnageInstance = create(:ChangeFactory, ChangeFactoryOptions)
  get ChangePath(account)
  assert_response :success
  assert_template :index
  assert_equal 1, assigns(:ChangeControllerInstance).count
  assert assigns(:ChangeControllerInstance).pluck(:id).include?(ChangeInstance.id)
end
