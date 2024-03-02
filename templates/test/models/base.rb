include FactoryBot::Syntax::Methods

test '#valid?' do
  assert build(:ChangeModel).valid?
end

test '#destroy' do
  ChangeModel = create(:ChangeModel)
  # insert test to do what you expect
  # example: raise an error if you it's protected
  # success if not protected
  # children destroyed if children
  # children nil if nilable reference
  # etc.
  ChangeModel.destroy
  assert_raise(ActiveRecord::RecordNotFound) { ChangeModel.reload }
end

# DeleteThis - we typically do not test:
#   constants
#   attributes
#   associations (see note on destroy though...)
#   scopes
#   anything in the private section (should be tested by testing association)
# we typically do test:
#   single valid
#   destroy (this will take into account dependent destroy on has_many / has_one)
#   basically everyhting else

####---- Class Methods ----####

####---- Callbacks ----####

####---- Validations & DB Constraints ----####

####---- Services ----####

####---- Instance Methods ----####
