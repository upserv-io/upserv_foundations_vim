include FactoryBot::Syntax::Methods

test 'subscribes' do
  current_user =  create(:core_user)
  stub_connection(current_user:)
  ChangeResource = create(:ChangeFactory, ChangeFactoryOptions)
  subscribe ChangeParam1: ChangeResource.ChangeAttribute, ChangeParam2: ChangeValue
  assert subscription.confirmed?
end

# DeleteThis - add action tests (,tCac)
