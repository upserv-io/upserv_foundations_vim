# DeleteThis - add "skip_account_auth: true" option if authorization is not account specific
# DeleteThis - add "base_user_can_access: true" if action can be accessed by base user
test_web_auth :patch, :ChangePath, :ChangeFactory
test '#update' do
  set_account_set_user_and_sign_in
  ChangeResource = create(:ChangeFactory, ChangeFactoryOptions)
  patch ChangePath(account, ChangeResource),
        params: { ChangeParam: { ChangeParam: ChangeParam } }
  assert_response :success
  assert_equal ChangeValue, ChangeResource.reload.ChangeMethod
  assert_equal ChangeValue, ChangeResource.ChangeMethod
end

test '#update - invalid' do
  set_account_set_user_and_sign_in
  ChangeResource = create(:ChangeFactory, ChangeFactoryOptions)
  patch ChangePath(account, ChangeResource),
        params: { ChangeParam: { ChangeParam: ChangeParam } }
  assert_response 422
  assert_equal ChangeValue, ChangeResource.reload.ChangeMethod
  assert_equal ChangeValue, ChangeResource.ChangeMethod
end
