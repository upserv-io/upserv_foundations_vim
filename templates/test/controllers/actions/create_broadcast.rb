# DeleteThis - add "skip_account_auth: true" option if authorization is not account specific
# DeleteThis - add "base_user_can_access: true" if action can be accessed by base user
test_web_auth :post, :ChangePath, factory: :ChangeFactory
test '#create' do
  set_account_set_user_and_sign_in
  count = ChangeModel.count
  post ChangePath(account),
       params: { ChangeParam: { ChangeParam: ChangeParam } }
  assert_response :success
  assert_equal count + 1, ChangeModel.count
  ChangeInstance = ChangeModel.last
  assert_equal ChangeValue, ChangeInstance.ChangeMethod
end

test '#create - invalid' do
  set_account_set_user_and_sign_in
  count = ChangeModel.count
  post ChangePath(account),
       params: { ChangeParam: { ChangeParam: ChangeParam } }
  assert_response 422
  assert_equal count, ChangeModel.count
end
